package action;

import org.hibernate.Session;
import org.hibernate.Transaction;
import helper.FactoryProvider;
import com.opensymphony.xwork2.ActionSupport;
import cms.User;

public class loginAction extends ActionSupport{
	private String username;
	private String password;
	private User user;
	
	public String post() {
		Session session = FactoryProvider.getFactory().openSession();
		Transaction tx = null;

		try {
			tx = session.beginTransaction();

			// Fetch the existing book from the database using ISBN
			User existingUser = session.get(User.class, username);

			if (existingUser != null && existingUser.getPassword().equals(password)) {
				tx.commit();
				addActionMessage("Login successfully!");
				return SUCCESS;
			} else {
				addActionError("user with " + username + " not found.");
				return ERROR;
			}
		} catch (Exception e) {
			if (tx != null && tx.isActive()) {
				tx.rollback();
			}
			addActionError("Error updating book: " + e.getMessage());
			return ERROR;
		} finally {
			session.close();
		}
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
}
