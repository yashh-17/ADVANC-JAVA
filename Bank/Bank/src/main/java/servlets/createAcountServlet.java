package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import helper.FactoryProvider;
import Bank.Bank;

@WebServlet("/createAcountServlet")
public class createAcountServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public createAcountServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String Holder_name = request.getParameter("Holder_name");
        String StrBalance = request.getParameter("Balance");
        Double Balance = Double.valueOf(StrBalance);

        Bank b = new Bank();
        b.setHolder_name(Holder_name);
        b.setBalance(Balance);
        Session session = FactoryProvider.getFactory().openSession();
        Transaction tx = session.beginTransaction();
        session.persist(b);
        tx.commit();

        // Retrieve the account number after persisting
        long accountNumber = b.getAccount_number();

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.println("<h1 style='text-align:center;'>Account is Created successfully</h1>");
        out.println("<h1 style='text-align:center;'>Account Number: " + accountNumber + "</h1>");
        out.println("<h1 style='text-align:center;'><a href='details.jsp'>Account details</a></h1>");
    }
}
