/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import dao.ProductDAO;
import java.text.NumberFormat;
import java.util.List;
import java.util.Locale;

/**
 *
 * @author trong
 */
public class Product {

    private int productID;
    private String name;
    private String description;
    private double price;
    private int quantityInStock;
    private Category category;
    private List<String> image;

    public Product() {
    }

    public Product(int productID, String name, String description, double price, int quantityInStock, Category category, List<String> image) {
        this.productID = productID;
        this.name = name;
        this.description = description;
        this.price = price;
        this.quantityInStock = quantityInStock;
        this.category = category;
        this.image = image;
    }

    

    // Hàm này trả về giá đã định dạng
    public String getFormattedPrice() {
        NumberFormat formatter = NumberFormat.getInstance(new Locale("vi", "VN"));
        return formatter.format(price) + "đ";
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantityInStock() {
        return quantityInStock;
    }

    public void setQuantityInStock(int quantityInStock) {
        this.quantityInStock = quantityInStock;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public List<String> getImageToCreate() {
        return image;
    }

    public void setImageToCreate(List<String> image) {
        this.image = image;
    }

    @Override
    public String toString() {
        return "Product{" + "productID=" + productID + ", name=" + name + ", description=" + description + ", price=" + price + ", quantityInStock=" + quantityInStock + ", category=" + category + ", image=" + image + '}';
    }

    public List<String> getImage() {
        ProductDAO dao = new ProductDAO();
        image = dao.getImageByProductID(productID);
        return image;
    }

}
