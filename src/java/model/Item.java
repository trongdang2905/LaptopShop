/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.text.NumberFormat;
import java.util.Locale;

/**
 *
 * @author trong
 */
public class Item {

    int itemID;
    Cart cart;
    Product product;
    int quantity;
    double unitPrice;
    double subTotal;

    public Item() {
    }

    public Item(int itemID, Cart cart, Product product, int quantity, double unitPrice, double subTotal) {
        this.itemID = itemID;
        this.cart = cart;
        this.product = product;
        this.quantity = quantity;
        this.unitPrice = unitPrice;
        this.subTotal = subTotal;
    }
    
    public String getFormattedTotal() {
        NumberFormat formatter = NumberFormat.getInstance(new Locale("vi", "VN"));
        return formatter.format(getSubTotal()) + "đ";
    }
    
    
    public String getFormattedUnitPrice() {
        NumberFormat formatter = NumberFormat.getInstance(new Locale("vi", "VN"));
        return formatter.format(unitPrice) + "đ";
    }

    // Hàm này trả về giá đã định dạng
    public String getFormattedPrice() {
        NumberFormat formatter = NumberFormat.getInstance(new Locale("vi", "VN"));
        return formatter.format(subTotal) + "đ";
    }

    public int getItemID() {
        return itemID;
    }

    public void setItemID(int itemID) {
        this.itemID = itemID;
    }

    public Cart getCart() {
        return cart;
    }

    public void setCart(Cart cart) {
        this.cart = cart;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(double unitPrice) {
        this.unitPrice = unitPrice;
    }

    public double getSubTotal() {
        return unitPrice*quantity;
    }

    public void setSubTotal(double subTotal) {
        this.subTotal = subTotal;
    }

}
