package action;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.opensymphony.xwork2.ActionSupport;
import cms.Content;
import helper.FactoryProvider;

public class updateContentAction extends ActionSupport {
	private int id;
	private Content content;

	public String post() {
		Session session = FactoryProvider.getFactory().openSession();
		Transaction tx = null;

		try {
			tx = session.beginTransaction();

			// Fetch the existing book from the database using ISBN
			Content existingContent = session.get(Content.class, id);

			if (existingContent != null) {
				// Update the book details
				existingContent.setId(id);
				existingContent.setTitle(content.getTitle());
				existingContent.setContent(content.getContent());
				existingContent.setPublication_date(content.getPublication_date());
				existingContent.setAuthor_information(content.getAuthor_information());
				existingContent.setCategory(content.getCategory());

				// Save the changes
				session.merge(existingContent);

				tx.commit();
				addActionMessage("Content updated successfully!");
				return SUCCESS;
			} else {
				addActionError("Content with Id " + id + " not found.");
				return ERROR;
			}
		} catch (Exception e) {
			if (tx != null && tx.isActive()) {
				tx.rollback();
			}
			addActionError("Error updating Content: " + e.getMessage());
			return ERROR;
		} finally {
			session.close();
		}
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Content getContent() {
		return content;
	}

	public void setContent(Content content) {
		this.content = content;
	}



}
