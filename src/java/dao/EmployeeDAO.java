/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import model.Employee;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.Account;

/**
 *
 * @author trong
 */
public class EmployeeDAO extends DBContext {

    public void addCustomer(Employee e, Account a) {
        String insertAccount = "INSERT INTO [dbo].[Account] "
                + "([Username], [Password], [RoleID], [IsActive], [CreatedDate]) "
                + "VALUES (?, ?, ?, ?, ?)";
        String insertEmployee
                = "INSERT INTO [dbo].[Employee] "
                + "([AccountID], [FullName], [Email], [Phone], [Department], [HireDate], [Salary]) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?)";

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
            PreparedStatement st2 = connection.prepareStatement(insertEmployee);
            st2.setInt(1, accountID);
            st2.setString(2, e.getFullName());
            st2.setString(3, e.getEmail());
            st2.setString(4, e.getPhone());
            st2.setString(5, e.getDepartment());
            st2.setDate(6, e.getHireDate());
            st2.setDouble(7, e.getSalary());
            st2.executeUpdate();
        } catch (SQLException ex) {
        }
    }

    public Employee getEmployeeByEmail(String email) {
        String sql = "select * from Employee where Email = ?";
        AccountDAO dao = new AccountDAO();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Employee employee = new Employee(rs.getInt(1),
                        dao.getAccountByEmail(email),
                        rs.getString(3),
                        email,
                        rs.getString(5),
                        rs.getString(6),
                        rs.getDate(7),
                        rs.getDouble(8));
                return employee;
            }
        } catch (SQLException e) {
        }
        return null;
    }
}
