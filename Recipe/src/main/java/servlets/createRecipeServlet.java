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
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import helper.FactoryProvider;
import recipe.Recipe;
@WebServlet("/createRecipeServlet")

public class createRecipeServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;

	public createRecipeServlet() {
		super();
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String strId = request.getParameter("recipeid");
		int id = Integer.valueOf(strId);
		String recipename = request.getParameter("recipename");
		String ingredients = request.getParameter("ingredients");
		String strLevel = request.getParameter("difficultylevel");
		int difficultylevel = Integer.valueOf(strLevel);
		
		Recipe r = new Recipe();
		r.setId(id);
		r.setRecipiename(recipename);
		r.setIngredients(ingredients);
		r.setDifficultylevel(difficultylevel);
		Session session = FactoryProvider.getFactory().openSession();
		Transaction tx = session.beginTransaction();
		session.persist(r);
		tx.commit();
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println("<h1 style='text-align:center;'>Recipe is added successfully</h1>");
		out.println("<h1 style='text-align:center;'><a href='listRecipe.jsp'>View all Recipes</a></h1>");
	}
}
