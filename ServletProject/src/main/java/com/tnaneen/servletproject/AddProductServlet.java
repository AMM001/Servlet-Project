/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tnaneen.servletproject;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletContext;
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
@WebServlet(name = "AddProductServlet", urlPatterns = {"/addProductServlet"})
public class AddProductServlet extends HttpServlet {

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

            String prodName = request.getParameter("prodName");
            //ServletContext context = request.getServletContext();
            //String prodImage = context.getRealPath("/img/" + request.getParameter("prodImage"));
            String prodImage = request.getParameter("prodImage");
            String prodPrice = request.getParameter("prodPrice");
            int prodQuantity = Integer.parseInt(request.getParameter("prodQuantity"));
            String prodDesc = request.getParameter("prodDesc");
            String prodCateg = request.getParameter("category");
           
            System.out.println("PATH: " + prodImage);
         
            Product prod = new Product();
            prod.setImage(prodImage);
            prod.setName(prodName);
            prod.setPrice(Integer.parseInt(prodPrice));
            prod.setDescription(prodDesc);
            prod.setCategory(prodCateg);
            prod.setAvailable(prodQuantity); //product added -> available
            
            ////////// get max id from db
            int prodId = new DatabaseHandler().getMaxId();
            prod.setId(prodId +1);
            System.out.println("zzzzzzzzzzzz "+ prodId);
            
            if(new DatabaseHandler().insertNewProduct(prod)){
                HttpSession s = request.getSession();
                ArrayList<Product> prods = (ArrayList<Product>) s.getAttribute(prod.getCategory() + "List");
                prods.add(prod);
                //TODO: check all redirects bta3t el admin
                response.sendRedirect("addProduct.jsp");
            }
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
