/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.*;
import model.Order;
import model.OrderDetail;

/**
 *
 * @author trong
 */
public class OrderDAO extends DBContext {

    public void addOrder(Order order, OrderDetail orderDetail) {
        String insertOrder = "INSERT INTO [dbo].[Order] "
                + "(OrderDate, CustomerID, EmployeeID, TotalAmount) "
                + "VALUES (?, ?, ?, ?)";
        String insertOrderDetail = "INSERT INTO [dbo].[OrderDetail] "
                + "(OrderID, ProductID, Quantity, Price, Discount, Status, Note, Payment, AddressOrder) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try {
            PreparedStatement st = connection.prepareStatement(insertOrder, Statement.RETURN_GENERATED_KEYS);
            st.setTimestamp(1, order.getOrderDate());
            st.setInt(2, order.getCustomer().getCustomerID());
            st.setInt(3, order.getEmployee().getEmployeeID());
            st.setDouble(4, order.getTotalAmount());
            st.executeUpdate();
            ResultSet rs = st.getGeneratedKeys();
            int orderId = 0;
            if (rs.next()) {
                orderId = rs.getInt(1);
            }
            PreparedStatement st2 = connection.prepareStatement(insertOrderDetail);
            st2.setInt(1, orderId);
            st2.setInt(2, orderDetail.getProduct().getProductID());
            st2.setInt(3, orderDetail.getQuantity());
            st2.setDouble(4, orderDetail.getPrice());
            st2.setDouble(5, orderDetail.getDiscount());
            st2.setString(6, orderDetail.getStatus());
            st2.setString(7, orderDetail.getNote());
            st2.setString(8, orderDetail.getPayment());
            st2.setString(9, orderDetail.getAddress());
            st2.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
