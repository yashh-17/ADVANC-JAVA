package action;

import com.opensymphony.xwork2.ActionSupport;
import org.hibernate.Session;
import org.hibernate.Transaction;
import helper.FactoryProvider;
import model.Task;

public class DeleteTaskAction extends ActionSupport {
    private int id;

    public void setId(int id) {
        this.id = id;
    }

    @Override
    public String execute() {
        Session session = FactoryProvider.getFactory().openSession();
        Transaction tx = null;

        try {
            tx = session.beginTransaction();

            // Load the existing task from the database using ID
            Task existingTask = session.get(Task.class, id);

            if (existingTask != null) {
                // Delete the task
                session.remove(existingTask);

                tx.commit();
                addActionMessage("Task deleted successfully!");
                return SUCCESS;
            } else {
                addActionError("Task not found with ID: " + id);
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
