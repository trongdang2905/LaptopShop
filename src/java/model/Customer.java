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
public class Customer {

    private int customerID;
    private Account account;
    private String fullName;
    private String email;
    private String phone;
    private String address;
    private Date date;

    public Customer() {
    }

    public Customer(int customerID, Account account, String fullName, String email, String phone, String address, Date date) {
        this.customerID = customerID;
        this.account = account;
        this.fullName = fullName;
        this.email = email;
        this.phone = phone;
        this.address = address;
        this.date = date;
    }

    public int getCustomerID() {
        return customerID;
    }

    public void setCustomerID(int customerID) {
        this.customerID = customerID;
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

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    @Override
    public String toString() {
        return "Customer{" + "customerID=" + customerID + ", account=" + account + ", fullName=" + fullName + ", email=" + email + ", phone=" + phone + ", address=" + address + ", date=" + date + '}';
    }

}
