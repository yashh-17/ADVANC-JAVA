package com.example;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.example.task;
import com.example.FactoryProvider;
import com.opensymphony.xwork2.ActionSupport;

public class deletetaskAction extends ActionSupport{
	private int id;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String post() {
		Session session = FactoryProvider.getFactory().openSession();
		Transaction tx = null;

		try {
			tx = session.beginTransaction();

			// Load the existing task from the database using ID
			task existingtask = session.get(task.class, id);

			if (existingtask != null) {
				// Delete the task
				session.remove(existingtask);

				tx.commit();
				addActionMessage("task deleted successfully!");
				return SUCCESS;
			} else {
				addActionError("task not found with ID: " + id);
				return ERROR;
			}
		} catch (Exception e) {
			if (tx != null && tx.isActive()) {
				tx.rollback();
			}
			addActionError("Error deleting task: " + e.getMessage());
			return ERROR;
		} finally {
			session.close();
		}
	}

}
