package action;

import org.hibernate.Session;
import org.hibernate.Transaction;
import com.opensymphony.xwork2.ActionSupport;
import model.Task;
import helper.FactoryProvider;

public class UpdateTaskAction extends ActionSupport {
    private int id;
    private Task task;

    public String post() {
        Session session = FactoryProvider.getFactory().openSession();
        Transaction tx = null;

        try {
            tx = session.beginTransaction();

            // Fetch the existing task from the database using ID
            Task existingTask = session.get(Task.class, id);

            if (existingTask != null) {
                // Update the task details
                existingTask.setName(task.getName());
                existingTask.setDescription(task.getDescription());
                existingTask.setDueDate(task.getDueDate());
                existingTask.setPriority(task.getPriority());

                // Save the changes
                session.merge(existingTask);

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

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Task getTask() {
        return task;
    }

    public void setTask(Task task) {
        this.task = task;
    }
}
