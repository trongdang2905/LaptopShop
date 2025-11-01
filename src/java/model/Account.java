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
public class Account {

    private int accountID;
    private String userName;
    private String passWord;
    private int roleID;
    private boolean isActive;
    private Date date;

    public Account() {
    }

    public Account(int accountID, String userName, String passWord, int roleID, boolean isActive, Date date) {
        this.accountID = accountID;
        this.userName = userName;
        this.passWord = passWord;
        this.roleID = roleID;
        this.isActive = isActive;
        this.date = date;
    }

    public int getAccountID() {
        return accountID;
    }

    public void setAccountID(int accountID) {
        this.accountID = accountID;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassWord() {
        return passWord;
    }

    public void setPassWord(String passWord) {
        this.passWord = passWord;
    }

    public int getRoleID() {
        return roleID;
    }

    public void setRoleID(int roleID) {
        this.roleID = roleID;
    }

    public boolean isIsActive() {
        return isActive;
    }

    public void setIsActive(boolean isActive) {
        this.isActive = isActive;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    @Override
    public String toString() {
        return "Account{" + "accountID=" + accountID + ", userName=" + userName + ", passWord=" + passWord + ", roleID=" + roleID + ", isActive=" + isActive + ", date=" + date + '}';
    }

}
