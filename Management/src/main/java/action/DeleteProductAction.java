package action;

import org.hibernate.Session;
import org.hibernate.Transaction;

import model.Product;
import helper.FactoryProvider;
import com.opensymphony.xwork2.ActionSupport;

public class DeleteProductAction extends ActionSupport {
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

            // Load the existing product from the database using ID
            Product existingProduct = session.get(Product.class, id);

            if (existingProduct != null) {
                // Delete the product
                session.remove(existingProduct);

                tx.commit();
                addActionMessage("Product deleted successfully!");
                return SUCCESS;
            } else {
                addActionError("Product not found with ID: " + id);
                return ERROR;
            }
        } catch (Exception e) {
            if (tx != null && tx.isActive()) {
                tx.rollback();
            }
            addActionError("Error deleting product: " + e.getMessage());
            return ERROR;
        } finally {
            session.close();
        }
    }
}