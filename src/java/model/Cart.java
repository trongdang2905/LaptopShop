/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Timestamp;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

/**
 *
 * @author trong
 */
public class Cart {

    int cartID;
    Customer customer;
    Timestamp createdAt;
    Timestamp updateAt;
    double totalPrice;
    String status;
    List<Item> items;

    public Cart() {
        items = new ArrayList<>();
    }

    public Cart(int cartID, Customer customer, Timestamp createdAt, Timestamp updateAt, double totalPrice, String status) {
        this.cartID = cartID;
        this.customer = customer;
        this.createdAt = createdAt;
        this.updateAt = updateAt;
        this.totalPrice = totalPrice;
        this.status = status;
    }

    public Cart(int cartID, Customer customer, Timestamp createdAt, Timestamp updateAt, double totalPrice, String status, List<Item> items) {
        this.cartID = cartID;
        this.customer = customer;
        this.createdAt = createdAt;
        this.updateAt = updateAt;
        this.totalPrice = totalPrice;
        this.status = status;
        this.items = items;
    }

    public int getCartID() {
        return cartID;
    }

    public void setCartID(int cartID) {
        this.cartID = cartID;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }

    public Timestamp getUpdateAt() {
        return updateAt;
    }

    public void setUpdateAt(Timestamp updateAt) {
        this.updateAt = updateAt;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public List<Item> getItems() {
        return items;
    }

    public void setItems(List<Item> items) {
        this.items = items;
    }

    public int size() {
        return items.size();
    }

    public int getQuantityByID(int id) {
        return getItemsByID(id).getQuantity();
    }

    public Item getItemsByID(int id) {
        for (Item item : items) {
            if (item.getProduct().getProductID() == id) {
                return item;
            }
        }
        return null;
    }

    public void addToCart(Item t) {
        if (getItemsByID(t.getProduct().getProductID()) != null) {
            Item m = getItemsByID(t.getProduct().getProductID());
            m.setQuantity(m.getQuantity() + t.getQuantity());
        } else {
            items.add(t);
        }
    }

    public void removeItem(int id) {
        if (getItemsByID(id) != null) {
            items.remove(getItemsByID(id));
        }
    }

    public double getTotalAmount() {
        double sum = 0;
        for (Item item : items) {
            sum += item.getProduct().getPrice() * item.getQuantity();
        }
        return sum;
    }
    
    // Hàm này trả về giá đã định dạng
    public String getFormattedPrice() {
        NumberFormat formatter = NumberFormat.getInstance(new Locale("vi", "VN"));
        return formatter.format(getTotalAmount()) + "đ";
    }
}
