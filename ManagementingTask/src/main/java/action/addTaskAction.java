package action;

import com.opensymphony.xwork2.ActionSupport;
import model.Task;
import org.hibernate.Session;
import org.hibernate.Transaction;
import helper.FactoryProvider;

public class addTaskAction extends ActionSupport {
    private Task task;

    public String post() { 
        Session session = FactoryProvider.getFactory().openSession();
        Transaction tx = null;

        try {
            tx = session.beginTransaction();
            session.persist(task);
            tx.commit();
            addActionMessage("Task added successfully!");
            return SUCCESS;
        } catch (Exception e) {
            if (tx != null && tx.isActive()) {
                tx.rollback();
            }
            addActionError("Error adding Task: " + e.getMessage());
            return ERROR;
        } finally {
            session.close();
        }
    }

    public Task getTask() {
        return task;
    }

    public void setTask(Task task) {
        this.task = task;
    }
}
