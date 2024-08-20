package action;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.opensymphony.xwork2.ActionSupport;

import helper.FactoryProvider;
import model.Product;

public class addProductAction extends ActionSupport {
    private Product product;

    public String post() {
        Session session = FactoryProvider.getFactory().openSession();
        Transaction tx = null;

        try {
            tx = session.beginTransaction();
            session.persist(product);
            tx.commit();
            addActionMessage("Product added successfully!");
            return SUCCESS;
        } catch (Exception e) {
            if (tx != null && tx.isActive()) {
                tx.rollback();
            }
            addActionError("Error adding product: " + e.getMessage());
            return ERROR;
        } finally {
            session.close();
        }
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }
}
