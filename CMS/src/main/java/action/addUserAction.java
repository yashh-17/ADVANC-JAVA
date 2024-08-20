package action;

import org.hibernate.Session;
import org.hibernate.Transaction;

import helper.FactoryProvider;
import com.opensymphony.xwork2.ActionSupport;
import cms.User;
public class addUserAction extends ActionSupport{
	private User user = new User();
	
	public String post() {
		Session session = FactoryProvider.getFactory().openSession();
        Transaction tx = null;

        try {
            tx = session.beginTransaction();
            session.persist(user);
            tx.commit();
            addActionMessage("User added successfully!");
            return SUCCESS;
        } catch (Exception e) {
            // Rollback the transaction in case of an exception
            if (tx != null && tx.isActive()) {
                tx.rollback();
            }
            // Handle any exceptions that occur during the book addition process
            addActionError("Error adding User: " + e.getMessage());
            return ERROR;
        } finally {
            // Close the Hibernate session
            session.close();
        }
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
}
