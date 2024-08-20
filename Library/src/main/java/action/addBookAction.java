package action;

import org.hibernate.Session;
import org.hibernate.Transaction;

import helper.FactoryProvider;
import com.opensymphony.xwork2.ActionSupport;
import model.Book;

public class addBookAction extends ActionSupport {
    private Book book = new Book();

    public String post() {
        Session session = FactoryProvider.getFactory().openSession();
        Transaction tx = null;

        try {
            tx = session.beginTransaction();
            session.persist(book);
            tx.commit();
            addActionMessage("Book added successfully!");
            return SUCCESS;
        } catch (Exception e) {
            // Rollback the transaction in case of an exception
            if (tx != null && tx.isActive()) {
                tx.rollback();
            }
            // Handle any exceptions that occur during the book addition process
            addActionError("Error adding book: " + e.getMessage());
            return ERROR;
        } finally {
            // Close the Hibernate session
            session.close();
        }
    }

    public Book getBook() {
        return book;
    }

    public void setBook(Book book) {
        this.book = book;
    }
}

