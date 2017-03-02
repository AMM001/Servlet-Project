/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tnaneen.servletproject;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author mohamed
 */
@WebServlet(name = "BuyServlet", urlPatterns = {"/BuyServlet"})
public class BuyServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
          
            ////// 1. Check if user already have a cart - And containing items -
            
            ///////// a. have a cart
            
            ////////////// 2. check if each required product EXISTS with the corresponding QUANTITY
            
            /////////////////// a. all requested quantities are here!
            
            /////////////////////////// 3. Compute the TOTAL Payment
            
            /////////////////////////// 4. check if user's CREDIT can afford bill payment
            
            ///////////////////////////////// a. Yes Affords
            
            //////////////////////////////////////// 5. (a) Delete users CART from DB
            //////////////////////////////////////// 5. (b) Update SESSION cart products to BOUGHT 
            //////////////////////////////////////// 5. (c) Insert bought cart to users shopping HISTORY
            //////////////////////////////////////// 5. (d) Remove cart from the current SESSION
            //////////////////////////////////////// 5. (e) Update user's CASH CREDIT in SESSION
            //////////////////////////////////////// 5. (f) Update user's CASH CREDIT in Database
            //////////////////////////////////////// 5. (g) Update products' QUANTITY in DB and SESSION
            //////////////////////////////////////// 5. (h) Update products' AVAILABILITY in DB and SESSION
            
            //////////////////////////////////////// 6. redirect to HOME page "POSITIVE response"
            
            ///////////////////////////////// b. NO doesn't afford the payment, then redirect to home with NEGATIVE response
           
            /////////////////// b. SOME requested products are OUT OF STOCK
            
            /////// b. Do NOT have a cart, then redirect to home with NEGATIVE response
            
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
