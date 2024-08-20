package action;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.opensymphony.xwork2.ActionSupport;
import model.Product;
import helper.FactoryProvider;

public class UpdateProductAction extends ActionSupport {
    private int id;
    private Product product;

    public String post() {
        Session session = FactoryProvider.getFactory().openSession();
        Transaction tx = null;

        try {
            tx = session.beginTransaction();

            // Fetch the existing product from the database using ID
            Product existingProduct = session.get(Product.class, id);

            if (existingProduct != null) {
                // Update the product details
                existingProduct.setName(product.getName());
                existingProduct.setDescription(product.getDescription());
                existingProduct.setPrice(product.getPrice());
                existingProduct.setStockQuantity(product.getStockQuantity());
                existingProduct.setCategory(product.getCategory());
                existingProduct.setManufacturer(product.getManufacturer());
                existingProduct.setManufactureDate(product.getManufactureDate());

                // Save the changes
                session.merge(existingProduct);

                tx.commit();
                addActionMessage("Product updated successfully!");
                return SUCCESS;
            } else {
                addActionError("Product with ID " + id + " not found.");
                return ERROR;
            }
        } catch (Exception e) {
            if (tx != null && tx.isActive()) {
                tx.rollback();
            }
            addActionError("Error updating product: " + e.getMessage());
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

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }
}
