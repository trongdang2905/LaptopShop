/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.Cart;
import model.Item;

/**
 *
 * @author trong
 */
public class CartDAO extends DBContext {

    public void addCart(Cart c) {
        String sqlInsertCart = "INSERT INTO [dbo].[Cart] "
                + "([CustomerID],[CreatedAt],[UpdatedAt],[TotalPrice],[Status]) "
                + "VALUES (?,?,?,?,?)";

        String sqlInsertItem = "INSERT INTO [dbo].[Items] "
                + "([CartID],[ProductID],[Quantity],[UnitPrice]) "
                + "VALUES (?,?,?,?)"; // nếu muốn lưu SubTotal thêm cột vào SQL

        try {
            PreparedStatement st = connection.prepareStatement(sqlInsertCart, Statement.RETURN_GENERATED_KEYS);
            st.setInt(1, c.getCustomer().getCustomerID());
            st.setTimestamp(2, c.getCreatedAt());
            st.setTimestamp(3, c.getUpdateAt());
            st.setDouble(4, c.getTotalAmount());
            st.setString(5, c.getStatus());

            st.executeUpdate();

            // Lấy ID vừa insert
            ResultSet rs = st.getGeneratedKeys();
            int cartId = 0;
            if (rs.next()) {
                cartId = rs.getInt(1);
            }

            // Thêm các Item
            List<Item> list = c.getItems();
            for (Item item : list) {
                PreparedStatement st2 = connection.prepareStatement(sqlInsertItem);
                st2.setInt(1, cartId);
                st2.setInt(2, item.getProduct().getProductID());
                st2.setInt(3, item.getQuantity());
                st2.setDouble(4, item.getUnitPrice());
                st2.executeUpdate();
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public Cart getCartByID(int id) {
        String sql = "select * from Cart";
        CustomerDAO cusDao = new CustomerDAO();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Cart cart = new Cart(rs.getInt(1), cusDao.getCustomerByID(rs.getInt(2)), rs.getTimestamp(3), rs.getTimestamp(4), rs.getDouble(5), rs.getString(6));
                return cart;
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public List<Item> getItemByCustomerID(int id) {
        List<Item> list = new ArrayList<>();
        String sql = "select i.ItemID, i.CartID, i.ProductID, i.Quantity, i.UnitPrice, i.Subtotal "
                + "from Items i "
                + "join Cart c on c.CartID = i.CartID "
                + "where c.CustomerID = ?";

        CartDAO cartDao = new CartDAO();
        ProductDAO proDao = new ProductDAO();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Item item = new Item(rs.getInt(1), cartDao.getCartByID(rs.getInt(2)), proDao.getProductByID(rs.getInt(3)), rs.getInt(4), rs.getDouble(5), rs.getDouble(6));
                list.add(item);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public void addItemToCart(int cartID, Item item) {
        String sqlCheck = "SELECT Quantity FROM Items WHERE CartID = ? AND ProductID = ?";
        String sqlUpdate = "UPDATE Items SET Quantity = Quantity + ?, Subtotal = UnitPrice * Quantity WHERE CartID = ? AND ProductID = ?";
        String sqlInsert = "INSERT INTO Items (CartID, ProductID, Quantity, UnitPrice, Subtotal) VALUES (?, ?, ?, ?, ?)";

        try {
            // 1. Kiểm tra xem sản phẩm đã tồn tại trong Cart chưa
            PreparedStatement stCheck = connection.prepareStatement(sqlCheck);
            stCheck.setInt(1, cartID);
            stCheck.setInt(2, item.getProduct().getProductID());
            ResultSet rs = stCheck.executeQuery();

            if (rs.next()) {
                // 2a. Nếu đã tồn tại → cập nhật quantity + subtotal
                int currentQty = rs.getInt("Quantity");
                PreparedStatement stUpdate = connection.prepareStatement(sqlUpdate);
                stUpdate.setInt(1, item.getQuantity()); // cộng thêm số lượng mới
                stUpdate.setInt(2, cartID);
                stUpdate.setInt(3, item.getProduct().getProductID());
                stUpdate.executeUpdate();
            } else {
                // 2b. Nếu chưa tồn tại → insert mới
                PreparedStatement stInsert = connection.prepareStatement(sqlInsert);
                stInsert.setInt(1, cartID);
                stInsert.setInt(2, item.getProduct().getProductID());
                stInsert.setInt(3, item.getQuantity());
                stInsert.setDouble(4, item.getUnitPrice());
                stInsert.setDouble(5, item.getQuantity() * item.getUnitPrice());
                stInsert.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        CartDAO c = new CartDAO();
        List<Item> l = c.getItemByCustomerID(1);
        for (Item item : l) {
            System.out.println(item);
        }
    }

}
