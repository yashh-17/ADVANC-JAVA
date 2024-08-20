package action;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.query.Query;

import com.opensymphony.xwork2.ActionSupport;

import helper.FactoryProvider;
import model.Book;

public class searchBookAction extends ActionSupport {
    private String searchType;
    private String searchTerm;
    private List<Book> books;

    public String execute() {
        Session session = FactoryProvider.getFactory().openSession();

        try {
            session.beginTransaction();
            String hqlQuery = "from Book b where ";

            if ("genre".equalsIgnoreCase(searchType)) {
                hqlQuery += "lower(b.genre) like :searchTerm";
            } else if ("isbn".equalsIgnoreCase(searchType)) {
                hqlQuery += "b.isbn = :searchTerm";
            } else if ("title".equalsIgnoreCase(searchType)) {
                hqlQuery += "lower(b.title) like :searchTerm";
            } else if ("author".equalsIgnoreCase(searchType)) {
                hqlQuery += "lower(b.author) like :searchTerm";
            }

            Query<Book> query = session.createQuery(hqlQuery, Book.class);
            query.setParameter("searchTerm", "%" + searchTerm.toLowerCase() + "%");

            books = query.getResultList();
            System.out.println("Number of books found: " + books.size());
            session.getTransaction().commit();
            return SUCCESS;
        } catch (Exception e) {
            if (session.getTransaction() != null) {
                session.getTransaction().rollback();
            }
            e.printStackTrace();
            return ERROR;
        } finally {
            session.close();
        }
        
    }

    // Getter and Setter methods for searchType, searchTerm, and books

    public String getSearchType() {
        return searchType;
    }

    public void setSearchType(String searchType) {
        this.searchType = searchType;
    }

    public String getSearchTerm() {
        return searchTerm;
    }

    public void setSearchTerm(String searchTerm) {
        this.searchTerm = searchTerm;
    }

    public List<Book> getBooks() {
        return books;
    }

    public void setBooks(List<Book> books) {
        this.books = books;
    }
}
