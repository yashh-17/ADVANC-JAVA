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

import Bank.Bank;

import helper.FactoryProvider;

@WebServlet("/deleteAcountServlet")
public class deleteAcountServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
    	String StrAc = request.getParameter("Account_number");
    	long Account_number = Long.valueOf(StrAc);
    	
        Session session = FactoryProvider.getFactory().openSession();
        try {
            // Begin a transaction
            session.beginTransaction();

            // Retrieve the employee with the given ID from the database
            Bank b = session.get(Bank.class, Account_number);

            // Delete the employee if found
            if (b != null) {
                session.remove(b);
            } else {
            	response.setContentType("text/html");
        		PrintWriter out = response.getWriter();
            	out.println("<h1 style='text-align:center;'>Account Not Found</h1>");
        		out.println("<h1 style='text-align:center;'><a href='details.jsp'>Accounts Details</a></h1>");
            }

            // Commit the transaction
            session.getTransaction().commit();
        } finally {
            session.close();
        }

        // Redirect to a success page or a list of employees
        response.sendRedirect("Closed.jsp");
    }
}

