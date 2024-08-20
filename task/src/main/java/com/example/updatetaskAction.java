package com.example;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.opensymphony.xwork2.ActionSupport;
import com.example.task; // Assuming the class name is Task with an uppercase 'T'

public class updatetaskAction extends ActionSupport {
    private int id;
    private task task;

    // Getters and setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public task getTask() {
        return task;
    }

    public void setTask(task task) {
        this.task = task;
    }

    public String post() {
        Session session = FactoryProvider.getFactory().openSession();
        Transaction tx = null;

        try {
            tx = session.beginTransaction();

            // Fetch the existing task from the database using ID
            task existingTask = session.get(task.class, id);

            if (existingTask != null) {
                // Update the task details
                existingTask.setTaskname(task.getTaskname());
                existingTask.setDescription(task.getDescription());
                existingTask.setDate(task.getDate());
                existingTask.setPrioritylevel(task.getPrioritylevel());

                // Save the changes
                session.update(existingTask);

                tx.commit();
                addActionMessage("Task updated successfully!");
                return SUCCESS;
            } else {
                addActionError("Task with ID " + id + " not found.");
                return ERROR;
            }
        } catch (Exception e) {
            if (tx != null && tx.isActive()) {
                tx.rollback();
            }
            addActionError("Error updating task: " + e.getMessage());
            return ERROR;
        } finally {
            session.close();
        }
    }
}
