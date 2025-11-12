/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import model.MyOrder;
import model.Order;
import model.OrderDetail;
import model.Product;

/**
 *
 * @author trong
 */
public class OrderDAO extends DBContext {

    public void addOrder(Order order, List<OrderDetail> orderDetailList) {
        String insertOrder = "INSERT INTO [dbo].[Order] "
                + "(OrderDate, CustomerID, EmployeeID, TotalAmount) "
                + "VALUES (?, ?, ?, ?)";
        String insertOrderDetail = "INSERT INTO [dbo].[OrderDetail] "
                + "(OrderID, ProductID, Quantity, Price, Discount, Status, Note, Payment, AddressOrder) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

        Connection conn = null;
        PreparedStatement stOrder = null;
        PreparedStatement stDetail = null;
        ResultSet rs = null;

        try {
            conn = connection;
            conn.setAutoCommit(false);

            // Kiểm tra dữ liệu
            if (order.getCustomer() == null) {
                throw new SQLException("Customer is null");
            }

            // Insert Order
            stOrder = conn.prepareStatement(insertOrder, Statement.RETURN_GENERATED_KEYS);
            stOrder.setTimestamp(1, order.getOrderDate());
            stOrder.setInt(2, order.getCustomer().getCustomerID());
            stOrder.setNull(3, java.sql.Types.INTEGER); // nếu chưa có employee
            stOrder.setDouble(4, order.getTotalAmount());
            stOrder.executeUpdate();

            rs = stOrder.getGeneratedKeys();
            int orderId = 0;
            if (rs.next()) {
                orderId = rs.getInt(1);
            }

            // Insert OrderDetail
            stDetail = conn.prepareStatement(insertOrderDetail);
            for (OrderDetail od : orderDetailList) {
                stDetail.setInt(1, orderId);
                stDetail.setInt(2, od.getProduct().getProductID());
                stDetail.setInt(3, od.getQuantity());
                stDetail.setDouble(4, od.getPrice());
                stDetail.setDouble(5, od.getDiscount());
                stDetail.setString(6, od.getStatus());
                stDetail.setString(7, od.getNote());
                stDetail.setString(8, od.getPayment());
                stDetail.setString(9, od.getAddress());
                stDetail.addBatch();
            }
            stDetail.executeBatch();

            conn.commit();
            System.out.println("✅ Order inserted successfully. OrderID = " + orderId);

        } catch (SQLException e) {
            e.printStackTrace();
            try {
                if (conn != null) {
                    conn.rollback();
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (stOrder != null) {
                    stOrder.close();
                }
                if (stDetail != null) {
                    stDetail.close();
                }
                if (conn != null) {
                    conn.setAutoCommit(true);
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
    }

    public Order getOrderByOrderID(int id) {
        String sql = "select * from [Order] where OrderID = ?";
        CustomerDAO cusDao = new CustomerDAO();
        EmployeeDAO empDao = new EmployeeDAO();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Order order = new Order(rs.getInt(1), rs.getTimestamp(2), cusDao.getCustomerByID(rs.getInt(3)), empDao.getEmployeeByID(rs.getInt(4)), rs.getDouble(5));
                return order;
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public List<Product> getProductByOrderID(int orderID) {
        List<Product> list = new ArrayList<>();
        String sql = "select ProductID from OrderDetail where OrderID = ?";
        ProductDAO proDao = new ProductDAO();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, orderID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int productID = rs.getInt(1);
                Product product = proDao.getProductByID(productID);
                list.add(product);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public List<MyOrder> getAllOrderByCustomerID(int id) {
        Map<Integer, MyOrder> map = new LinkedHashMap<>();

        String sql = "SELECT od.OrderID, od.ProductID, od.Quantity, o.TotalAmount, od.Status, od.Payment "
                + "FROM OrderDetail od "
                + "JOIN [Order] o ON o.OrderID = od.OrderID "
                + "WHERE o.CustomerID = ?";

        OrderDAO ordDao = new OrderDAO();
        ProductDAO proDao = new ProductDAO();

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                int orderID = rs.getInt("OrderID");
                int productID = rs.getInt("ProductID");
                int quantity = rs.getInt("Quantity");
                double totalAmount = rs.getDouble("TotalAmount");
                String status = rs.getString("Status");
                String payment = rs.getString("Payment");

                // Lấy product từ ProductDAO
                Product product = proDao.getProductByID(productID);

                // Nếu order chưa có trong map => tạo mới MyOrder
                if (!map.containsKey(orderID)) {
                    MyOrder myOrder = new MyOrder();
                    myOrder.setOrder(ordDao.getOrderByOrderID(orderID));
                    myOrder.setProduct(new ArrayList<>()); // tạo list rỗng ban đầu
                    myOrder.setQuantity(quantity);
                    myOrder.setAmount(totalAmount);
                    myOrder.setStatus(status);
                    myOrder.setMethod(payment);
                    map.put(orderID, myOrder);
                }

                // Thêm product vào danh sách products của order tương ứng
                map.get(orderID).getProduct().add(product);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return new ArrayList<>(map.values());
    }

    public List<MyOrder> getAllOrder() {
        Map<Integer, MyOrder> map = new LinkedHashMap<>();

        String sql = "select od.OrderID, od.ProductID, od.Quantity, o.TotalAmount, od.Status, od.Payment\n"
                + "from OrderDetail od\n"
                + "join [Order] o on o.OrderID = od.OrderID\n";

        OrderDAO ordDao = new OrderDAO();
        ProductDAO proDao = new ProductDAO();

        try {
            PreparedStatement st = connection.prepareStatement(sql);

            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                int orderID = rs.getInt("OrderID");
                int productID = rs.getInt("ProductID");
                int quantity = rs.getInt("Quantity");
                double totalAmount = rs.getDouble("TotalAmount");
                String status = rs.getString("Status");
                String payment = rs.getString("Payment");

                // Lấy product từ ProductDAO
                Product product = proDao.getProductByID(productID);

                // Nếu order chưa có trong map => tạo mới MyOrder
                if (!map.containsKey(orderID)) {
                    MyOrder myOrder = new MyOrder();
                    myOrder.setOrder(ordDao.getOrderByOrderID(orderID));
                    myOrder.setProduct(new ArrayList<>()); // tạo list rỗng ban đầu
                    myOrder.setQuantity(quantity);
                    myOrder.setAmount(totalAmount);
                    myOrder.setStatus(status);
                    myOrder.setMethod(payment);
                    map.put(orderID, myOrder);
                }

                // Thêm product vào danh sách products của order tương ứng
                map.get(orderID).getProduct().add(product);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return new ArrayList<>(map.values());
    }

    public void updateStatusOrder(String status, int orderID) {
        String sql = "update OrderDetail\n"
                + "set Status = ?\n"
                + "where OrderID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, status);
            st.setInt(2, orderID);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public boolean updateOrderStatus(int orderId, String newStatus, String emailEmp, String date) {
        String updateOrder = "UPDATE [Order] SET EmployeeID = ? WHERE OrderID = ?";
        String updateOrderDetail = "UPDATE OrderDetail SET Status = ? WHERE OrderID = ?";

        EmployeeDAO empDao = new EmployeeDAO();
        Connection conn = null;
        PreparedStatement stOrder = null;
        PreparedStatement stDetail = null;

        try {
            conn = connection;
            conn.setAutoCommit(false); // bắt đầu transaction

            int empId = empDao.getEmployeeByEmail(emailEmp).getEmployeeID();

            // Cập nhật Order
            stOrder = conn.prepareStatement(updateOrder);
            stOrder.setInt(1, empId);
            stOrder.setInt(2, orderId);
            stOrder.executeUpdate();

            // Cập nhật OrderDetail
            stDetail = conn.prepareStatement(updateOrderDetail);
            stDetail.setString(1, newStatus);
            stDetail.setInt(2, orderId);
            stDetail.executeUpdate();

            conn.commit(); // commit transaction
            return true;

        } catch (SQLException e) {
            e.printStackTrace();
            try {
                if (conn != null) {
                    conn.rollback(); // rollback nếu lỗi
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
            return false;
        } finally {
            try {
                if (stOrder != null) {
                    stOrder.close();
                }
                if (stDetail != null) {
                    stDetail.close();
                }
                if (conn != null) {
                    conn.setAutoCommit(true);
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
    }

}
