package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import recipe.Recipe;

import helper.FactoryProvider;

@WebServlet("/deleteRecipeServlet")
public class deleteRecipeServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
    	int recipeid = Integer.parseInt(request.getParameter("id"));
    	
        Session session = FactoryProvider.getFactory().openSession();
        try {
            // Begin a transaction
            session.beginTransaction();

            // Retrieve the employee with the given ID from the database
            Recipe r = session.get(Recipe.class, recipeid);

            // Delete the employee if found
            if (r != null) {
                session.remove(r);
            } else {
            	response.setContentType("text/html");
        		PrintWriter out = response.getWriter();
            	out.println("<h1 style='text-align:center;'>Recipe Not Found</h1>");
        		out.println("<h1 style='text-align:center;'><a href='listRecipe.jsp'>View all Recipe</a></h1>");
            }

            // Commit the transaction
            session.getTransaction().commit();
        } finally {
            session.close();
        }

        // Redirect to a success page or a list of employees
        response.sendRedirect("listRecipe.jsp");
    }
}

