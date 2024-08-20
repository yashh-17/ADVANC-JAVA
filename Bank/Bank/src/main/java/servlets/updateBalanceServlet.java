package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;

import helper.FactoryProvider;
import Bank.Bank;
@WebServlet("/updateBalanceServlet")
public class updateBalanceServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException{
			String StrAc = request.getParameter("Account_number");
			long Account_number = Long.valueOf(StrAc);
			String StrAmount = request.getParameter("amount");
			Double Amount = Double.valueOf(StrAmount);
			String Type = request.getParameter("type");
			Session session = FactoryProvider.getFactory().openSession();
			try {
	            session.beginTransaction();

	            if (Type.equalsIgnoreCase("withdraw")) {
	            	Bank account = session.get(Bank.class, Account_number);
	                if (account.getBalance() >= Amount) {
	                    account.setBalance(account.getBalance() - Amount);
	                    session.merge(account);
	                } else {
	                    response.sendRedirect("Limit.jsp");
	                    return;
	                }
	            } else {
	            	Bank account = session.get(Bank.class, Account_number);
	                account.setBalance(account.getBalance() + Amount);
	                session.merge(account);
	            }

	            session.getTransaction().commit();
	            // Set the success message as a request attribute
	            request.setAttribute("successMessage", "Balance updated successfully");
	        } catch (Exception e) {
	            session.getTransaction().rollback();
	            // Set the error message as a request attribute
	            request.setAttribute("errorMessage", "An error occurred while updating the balance");
	        } finally {
	            session.close();
	        }
	        // Forward the request to the JSP page
	        RequestDispatcher rd = request.getRequestDispatcher("complete.jsp");
	        rd.forward(request, response);
		}
}
