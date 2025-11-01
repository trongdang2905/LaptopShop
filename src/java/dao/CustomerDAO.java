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
            st.setDate(5, a.getDate());
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

    
}
