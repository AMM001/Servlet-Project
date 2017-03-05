/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tnaneen.servletproject;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author rocke
 */
@WebServlet(name = "GetAllAdminData", urlPatterns = {"/GetAllAdminData"})
public class GetAllAdminData extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
            HttpSession mySession = request.getSession(false);
            DatabaseHandler db = new DatabaseHandler();
            
            ArrayList<Product> mobiles = db.getAllProducts("mobiles");
            mySession.setAttribute("mobilesList", mobiles);
            
            ArrayList<Product> laptops = db.getAllProducts("laptops");
            mySession.setAttribute("laptopsList", laptops);
            
            ArrayList<Product> gaming = db.getAllProducts("gaming");
            mySession.setAttribute("gamingList", gaming);
            
            ArrayList<Product> headphones = db.getAllProducts("headphones");
            mySession.setAttribute("headphonesList", headphones);
            
            ArrayList<User> users = db.getAllUsers();
            mySession.setAttribute("usersList", users);
            
            ArrayList<CashCode> cash = db.getAllCash();
            mySession.setAttribute("cashList", cash);
            
            mySession.setAttribute("usersNum", users.size());
            mySession.setAttribute("productsNum", mobiles.size()+laptops.size()+gaming.size()+headphones.size());
            
            response.sendRedirect("adminHome.jsp");
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
