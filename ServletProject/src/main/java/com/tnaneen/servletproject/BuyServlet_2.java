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
 * @author mohamed
 */
@WebServlet(name = "BuyServlet_2", urlPatterns = {"/BuyServlet_2"})
public class BuyServlet_2 extends HttpServlet {

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
        
        
        ///////// 1. Get productId and productCategory from request
        int productID = Integer.parseInt( request.getParameter("productId") );
        String productCategory =  request.getParameter("productCategory") ;
                 
        ///////// 2. Remove from SESSION
        /////////////////  a. get CatList from session
        String listNameInSession = productCategory+"List";
        HttpSession currentSession = request.getSession();
        ArrayList<Product> list = (ArrayList<Product>) currentSession.getAttribute(listNameInSession);
        
        /////////////////   b. looooop to get target product
        Product selectedProduct = null;
        for(int i=0; i<list.size(); i++)
        {
            Product current = list.get(i);
            if (current.getId() == productID)
            {
                selectedProduct = current;
                break;
            }
        }
        
        //////////////////   c. remove it from SESSION
        list.remove(selectedProduct);
        currentSession.setAttribute(listNameInSession, list);
        
        ///////// 3. Remove from DB
         DatabaseHandler databaseHandler = new DatabaseHandler();
         databaseHandler.removeProduct(selectedProduct);
            
           
        ///////// 4. Redirect to blablabla
         response.sendRedirect("addProduct.jsp");
          
        
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
