/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tnaneen.servletproject;

/**
 *
 * @author bo
 */
public class CashCode {
    
    private String code;
    private int cash;
    
    public CashCode(){}
    
    public CashCode(String code,int amt){
       
        this.code=code;
        this.cash=amt; 
    }

    public String getCode() {
        return code;
    }

    public int getCash() {
        return cash;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public void setCash(int cash) {
        this.cash = cash;
    }  
}
