package com.example;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.example.FactoryProvider;
import com.opensymphony.xwork2.ActionSupport;
import com.example.task;

public class addtaskAction extends ActionSupport {
    private task a = new task();

    public String post() {
        Session session = FactoryProvider.getFactory().openSession();
        Transaction tx = null;

        try {
            tx = session.beginTransaction();
            session.persist(a);
            tx.commit();
            addActionMessage("task added successfully!");
            return SUCCESS;
        } catch (Exception e) {
            // Rollback the transaction in case of an exception
            if (tx != null && tx.isActive()) {
                tx.rollback();
            }
            // Handle any exceptions that occur during the task addition process
            addActionError("Error adding task: " + e.getMessage());
            return ERROR;
        } finally {
            // Close the Hibernate session
            session.close();
        }
    }

	public task getA() {
		return a;
	}

	public void setA(task a) {
		this.a = a;
	}


}

