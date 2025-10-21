/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.util.ArrayList;
import java.util.List;
import model.Product;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author trong
 */
public class ProductDAO extends DBContext {

    public List<Product> getAllProduct() {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Product";
        CategoryDAO c = new CategoryDAO();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setProductID(rs.getInt(1));
                p.setName(rs.getString(2));
                p.setDescription(rs.getString(3));
                p.setPrice(rs.getDouble(4));
                p.setQuantityInStock(rs.getInt(5));
                p.setCategory(c.getCategoryByID(rs.getInt(6)));
                p.setImage(rs.getString(7));
                list.add(p);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public List<Product> getProductByCategoryID(int categoryID) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Product where CategoryID = ?";
        CategoryDAO c = new CategoryDAO();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, categoryID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setProductID(rs.getInt(1));
                p.setName(rs.getString(2));
                p.setDescription(rs.getString(3));
                p.setPrice(rs.getDouble(4));
                p.setQuantityInStock(rs.getInt(5));
                p.setCategory(c.getCategoryByID(rs.getInt(6)));
                p.setImage(rs.getString(7));
                list.add(p);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public List<Product> searchProductByName(String keyword) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM Product WHERE Name LIKE ?";
        CategoryDAO c = new CategoryDAO();
        try {

            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + keyword + "%");
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Product p = new Product();
                p.setProductID(rs.getInt(1));
                p.setName(rs.getString(2));
                p.setDescription(rs.getString(3));
                p.setPrice(rs.getDouble(4));
                p.setQuantityInStock(rs.getInt(5));
                p.setCategory(c.getCategoryByID(rs.getInt(6)));
                p.setImage(rs.getString(7));
                list.add(p);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public static void main(String[] args) {
        ProductDAO d = new ProductDAO();
        List<Product> list = d.getAllProduct();
        for (Product product : list) {
            System.out.println(product);
        }
    }
}
