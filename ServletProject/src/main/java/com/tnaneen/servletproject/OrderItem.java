/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tnaneen.servletproject;

import java.io.Serializable;
import java.sql.Date;

/**
 *
 * @author mohamed
 */
public class OrderItem implements Serializable{
    
    int userId;
    int orderId;
    int prodId;
    Date orderDate;
    String prodName;
    int prodQuantity;
    int prodPrice;

    public OrderItem()
    {}
    
    public OrderItem(int userId, int orderId, int prodId, Date orderDate, String prodName, int prodQuantity, int prodPrice) {
        this.userId = userId;
        this.orderId = orderId;
        this.prodId = prodId;
        this.orderDate = orderDate;
        this.prodName = prodName;
        this.prodQuantity = prodQuantity;
        this.prodPrice = prodPrice;
    }

    
    
    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getProdId() {
        return prodId;
    }

    public void setProdId(int prodId) {
        this.prodId = prodId;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public String getProdName() {
        return prodName;
    }

    public void setProdName(String prodName) {
        this.prodName = prodName;
    }

    public int getProdQuantity() {
        return prodQuantity;
    }

    public void setProdQuantity(int prodQuantity) {
        this.prodQuantity = prodQuantity;
    }

    public int getProdPrice() {
        return prodPrice;
    }

    public void setProdPrice(int prodPrice) {
        this.prodPrice = prodPrice;
    }
    
    
    
}
