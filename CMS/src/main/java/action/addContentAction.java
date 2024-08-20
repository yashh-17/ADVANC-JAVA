package action;

import org.hibernate.Session;
import org.hibernate.Transaction;

import helper.FactoryProvider;
import com.opensymphony.xwork2.ActionSupport;
import cms.Content;

public class addContentAction extends ActionSupport{
	private Content content = new Content();
	
	public String post() {
		Session session = FactoryProvider.getFactory().openSession();
        Transaction tx = null;

        try {
            tx = session.beginTransaction();
            session.persist(content);
            tx.commit();
            addActionMessage("Content added successfully!");
            return SUCCESS;
        } catch (Exception e) {
            // Rollback the transaction in case of an exception
            if (tx != null && tx.isActive()) {
                tx.rollback();
            }
            // Handle any exceptions that occur during the book addition process
            addActionError("Content adding User: " + e.getMessage());
            return ERROR;
        } finally {
            // Close the Hibernate session
            session.close();
        }
	}

	public Content getContent() {
		return content;
	}

	public void setContent(Content content) {
		this.content = content;
	}

	
	
}