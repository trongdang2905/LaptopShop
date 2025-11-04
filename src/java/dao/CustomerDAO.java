/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import model.Customer;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.Account;

/**
 *
 * @author trong
 */
public class CustomerDAO extends DBContext {

    public void addCustomer(Customer c, Account a) {
        String insertAccount = "INSERT INTO [dbo].[Account] "
                + "([Username], [Password], [RoleID], [IsActive], [CreatedDate]) "
                + "VALUES (?, ?, ?, ?, ?)";
        String insertCustomer = "INSERT INTO [dbo].[Customer] "
                + "([AccountID], [FullName], [Email], [Phone], [Address], [DateOfBirth]) "
                + "VALUES (?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement st = connection.prepareStatement(insertAccount, Statement.RETURN_GENERATED_KEYS);
            st.setString(1, a.getUserName());
            st.setString(2, a.getPassWord());
            st.setInt(3, a.getRoleID());
            st.setBoolean(4, a.isIsActive());
            st.setTimestamp(5, a.getDate());
            st.executeUpdate();
            ResultSet rs = st.getGeneratedKeys();
            int accountID = 0;
            if (rs.next()) {
                accountID = rs.getInt(1);
            }
            PreparedStatement st2 = connection.prepareStatement(insertCustomer);
            st2.setInt(1, accountID);
            st2.setString(2, c.getFullName());
            st2.setString(3, c.getEmail());
            st2.setString(4, c.getPhone());
            st2.setString(5, c.getAddress());
            st2.setDate(6, c.getDate());
            st2.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public Customer getCustomerByEmail(String email) {
        String sql = "select * from Customer where Email = ?";
        AccountDAO dao = new AccountDAO();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Customer c = new Customer(rs.getInt(1), dao.getAccountByEmail(email), rs.getString(3), email, rs.getString(5), rs.getString(6), rs.getDate(7));
                return c;
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public Customer getCustomerByID(int customerID) {
        String sql = "select * from Customer where CustomerID = ?";
        AccountDAO dao = new AccountDAO();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, customerID);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Account account = dao.getAccountByEmail(rs.getString(4));
                Customer c = new Customer(rs.getInt(1), account, rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getDate(7));
                return c;
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public void updateCustomer(Customer c) {
        String sql = "UPDATE [dbo].[Customer] "
                + "SET [AccountID] = ?, "
                + "    [FullName] = ?, "
                + "    [Email] = ?, "
                + "    [Phone] = ?, "
                + "    [Address] = ?, "
                + "    [DateOfBirth] = ? "
                + "WHERE [Email] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, c.getAccount().getAccountID());
            st.setString(2, c.getFullName());
            st.setString(3, c.getEmail());
            st.setString(4, c.getPhone());
            st.setString(5, c.getAddress());
            st.setDate(6, c.getDate());
            st.setString(7, c.getEmail());
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    public static void main(String[] args) {
        CustomerDAO c = new CustomerDAO();
        Customer cc = c.getCustomerByID(1);
        System.out.println(cc);
    }

}
