/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;

/**
 *
 * @author trong
 */
public class Employee {

    private int employeeID;
    private Account account;
    private String fullName;
    private String email;
    private String phone;
    private String department;
    private Date hireDate;
    private double salary;

    public Employee() {
    }

    public Employee(int employeeID, Account account, String fullName, String email, String phone, String department, Date hireDate, double salary) {
        this.employeeID = employeeID;
        this.account = account;
        this.fullName = fullName;
        this.email = email;
        this.phone = phone;
        this.department = department;
        this.hireDate = hireDate;
        this.salary = salary;
    }

    public int getEmployeeID() {
        return employeeID;
    }

    public void setEmployeeID(int employeeID) {
        this.employeeID = employeeID;
    }

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public Date getHireDate() {
        return hireDate;
    }

    public void setHireDate(Date hireDate) {
        this.hireDate = hireDate;
    }

    public double getSalary() {
        return salary;
    }

    public void setSalary(double salary) {
        this.salary = salary;
    }

    @Override
    public String toString() {
        return "Employee{" + "employeeID=" + employeeID + ", account=" + account + ", fullName=" + fullName + ", email=" + email + ", phone=" + phone + ", department=" + department + ", hireDate=" + hireDate + ", salary=" + salary + '}';
    }

}
