package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import helper.FactoryProvider;
import recipe.Recipe;


@WebServlet("/updateRecipeServlet")
public class updateRecipeServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String strid = request.getParameter("recipeid");
		int recipeid = Integer.valueOf(strid);
		String ingredients = request.getParameter("ingredients");
		String strLevel = request.getParameter("difficultylevel");
		int difficultylevel = Integer.valueOf(strLevel);
        
        Session session = FactoryProvider.getFactory().openSession();

        try {
            session.beginTransaction();

            Recipe r = session.get(Recipe.class, recipeid);

            if (r != null) {
            	r.setIngredients(ingredients);
            	r.setDifficultylevel(difficultylevel);
                session.merge(r);
            } else {
            	response.setContentType("text/html");
        		PrintWriter out = response.getWriter();
            	out.println("<h1 style='text-align:center;'>Recipe Not Found</h1>");
        		out.println("<h1 style='text-align:center;'><a href='listRecipe.jsp'>View all Recipes</a></h1>");
            }

            session.getTransaction().commit();
        } finally {
            session.close();
        }

        response.sendRedirect("listRecipe.jsp");
    }
}

