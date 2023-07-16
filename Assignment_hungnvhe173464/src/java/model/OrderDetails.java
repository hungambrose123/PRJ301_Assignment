/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Warspite
 */
public class OrderDetails {
    private int total;
    private String email;
    private int phoneNum;
    private String customerAddress;
    private int accountId;

    public OrderDetails(){}

    public OrderDetails(int total, String email, int phoneNum, String customerAddress, int accountId) {
        this.total = total;
        this.email = email;
        this.phoneNum = phoneNum;
        this.customerAddress = customerAddress;
        this.accountId = accountId;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getPhoneNum() {
        return phoneNum;
    }

    public void setPhoneNum(int phoneNum) {
        this.phoneNum = phoneNum;
    }

    public String getCustomerAddress() {
        return customerAddress;
    }

    public void setCustomerAddress(String customerAddress) {
        this.customerAddress = customerAddress;
    }

    public int getAccountId() {
        return accountId;
    }

    public void setAccountId(int accountId) {
        this.accountId = accountId;
    }
    
    
    
}
