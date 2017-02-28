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
@WebServlet(name = "CheckIfLoggedIn", urlPatterns = {"/CheckIfLoggedIn"})
public class CheckIfLoggedIn extends HttpServlet {

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
       
        
        /////////// 1. get your session Obj
         HttpSession currentSession = request.getSession();
         
        ////////// 2. check if Session have a user loggedin
        ///////////// A. if user is Logged in 
       
        User user = (User) currentSession.getAttribute("currentUser");
        if (user != null)
        {
            ArrayList<CartItem> shoppingCart = (ArrayList<CartItem>) currentSession.getAttribute("MyShoppingCart");
        
            int productID = Integer.parseInt( request.getParameter("selectedProduct") );
              
            if (shoppingCart != null)
            {
            //////////////////////// a. chack if he have a cart "NOT-NULL"
              ///////////////////////// 1. check if this product is already in cart
                
                CartItem selectedProduct = null;
                
                for (int i=0; i<shoppingCart.size(); i++)
                {
                    if (shoppingCart.get(i).getProductId()== productID)
                    {
                        selectedProduct = shoppingCart.get(i);
                        break;
                    }
                
                }
                
                ///////////////////////// YES
                if (selectedProduct != null)
                {
                    ///////// remove it from cart
                    shoppingCart.remove(selectedProduct);
                    
                    //////// increase quantity
                    selectedProduct.setQuantity(  selectedProduct.getQuantity()+1  );
                    
                    /////// add modified quantity to list
                    shoppingCart.add(selectedProduct);
                    
                    //////// Remove session cartlist and add the updated one
                    currentSession.removeAttribute("MyShoppingCart");
                    currentSession.setAttribute("MyShoppingCart", shoppingCart);
                    
                }
                ///////////////////////// NO its the first time to add this product to cart
                else{
                    ////// 1. create cartItem Obj
                    CartItem item = new CartItem(user.getId(), selectedProduct.getProductId(), 1, 0);
                    
                    ///// 2. add it to shppingList
                    shoppingCart.add(item);
                    
                    ////// 3. Remove session cartlist and add the updated one
                    currentSession.removeAttribute("MyShoppingCart");
                    currentSession.setAttribute("MyShoppingCart", shoppingCart);
                    
                }
                
                
            }
        
            //////////////////////// b.  if he  don't have a cart    CREATE it
            else{
                    ////// 1. create a shopping cart 
                    ArrayList<CartItem> newShoppingCart = new ArrayList<>();
                    
                    ////  2. append new item 
                    CartItem item = new CartItem(user.getId(),productID, 1, 0);
                    newShoppingCart.add(item);
                    
                    ////// 3. set shopping cart into SESSION
                    currentSession.setAttribute("MyShoppingCart", newShoppingCart);
                
            }
             
            ///////// go to homepage
            response.sendRedirect("index.jsp");
               
        }
        /////////////-----------------------------------------------------------
        
        ///////////// B. if user is NOT logged in
        else{ 
            ////////////// then redirect to Login and append FLAG & PRODUCT_ID to the request
        
            int productID = Integer.parseInt( request.getParameter("selectedProduct") );
            response.sendRedirect("logIn.jsp?addingToCart="+ 1 +"&productId=" + productID);
            
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
