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
            HttpSession session = request.getSession(true);
            if (session.getAttribute("MyShoppingCart") !=null) {
                
                ArrayList<CartItem> myCart = (ArrayList<CartItem>) session.getAttribute("MyShoppingCart");
                ///////////////////////////// check if cart is EMPTY
                if ( ! myCart.isEmpty())
                {
                    ///////// a. have a cart
                    ////////////// 2. check if each required product EXISTS with the corresponding QUANTITY
                    /////////////////// 2-a Get requested products availability from Database
            
                    DatabaseHandler databaseHandler = new DatabaseHandler();
                    ArrayList<Product> productsAvailability = new ArrayList<>();
                    
                    for (int j=0; j<myCart.size(); j++)
                    {
                        Product p = databaseHandler.getProduct(  myCart.get(j).getProductId()   );
                        productsAvailability.add(p);
                    }
                    
                    ////////// get which is OUT of STOCK
                    
                    ArrayList<CartItem> outOfStockPs = new ArrayList<>();
                    
                    for (int j=0; j<myCart.size(); j++)
                    {
                        CartItem currentInCart = myCart.get(j);
                        Product currentInDb = productsAvailability.get(j);
                        if (currentInCart.getQuantity() > currentInDb.getAvailable() )
                        {
                            currentInCart.setQuantity(    currentInCart.getQuantity() - currentInDb.getAvailable()  );
                            outOfStockPs.add(currentInCart);
                        }
                    }
                    
                    
                    if ( outOfStockPs.isEmpty() )
                    {
                        /////////////////// 2-b. All requested quantities are here!
                        /////////////////////////// 3. Compute the TOTAL Payment
            
                        int totalPayment = 0;
                        for (int i=0; i<myCart.size(); i++)
                        {
                            CartItem cartItem = myCart.get(i);
                            Product product = productsAvailability.get(i);
                            
                            totalPayment += product.getPrice() * cartItem.getQuantity();
                            
                        }
                    /////////////////////////// 4. check if user's CREDIT can afford bill payment
                        User currentUser = (User) session.getAttribute("user");
                        
                        if (currentUser.getCreditLimit() >= totalPayment)
                        {
                            ///////////////////////////////// a. Yes Affords
                        
                            //////////////////////////////////////// 5. (a) Delete users CART from DB
                            for(int i=0; i<myCart.size(); i++)
                            {
                                databaseHandler.removeCartItem(myCart.get(i));
                            }
                            
                            //////////////////////////////////////// 5. (b) Update SESSION cart products to BOUGHT 
                            
                            ArrayList<CartItem> myNewCart = new ArrayList<>();
                            
                            for (int i=0; i<myCart.size();i++)
                            {
                                CartItem cartItem = myCart.get(i);
                                cartItem.setBought(1);
                                System.out.println("<><><><   "+ cartItem.getQuantity());
                                myNewCart.add(cartItem);
                            }

                            //////////////////////////////////////// 5. (c) Insert bought cart to users shopping HISTORY
                            for (int i=0; i<myNewCart.size(); i++)
                            {
                                databaseHandler.insertNewCartItem(myNewCart.get(i));
                            }
                            
                            //////////////////////////////////////// 5. (d) Remove cart from the current SESSION
                            session.removeAttribute("MyShoppingCart");
                            
                            //////////////////////////////////////// 5. (e) Update user's CASH CREDIT in SESSION
                            currentUser.setCreditLimit(  currentUser.getCreditLimit() -  totalPayment);
                            session.removeAttribute("user");
                            session.setAttribute("user", currentUser);
                            
                            //////////////////////////////////////// 5. (f) Update user's CASH CREDIT in Database
                            databaseHandler.updateUser(currentUser);
                            databaseHandler.addCredit(currentUser.getEmail(), currentUser.getCreditLimit());
                            System.out.println("user updated888888888");
                            //////////////////////////////////////// 5. (g) Update products' QUANTITY in DB and SESSION
                            
                            /// EHAB:: Home will be reloaded with new fresh product info :: EHAB
                            
                            //////////////////////////////////////// 5. (h) Update products' AVAILABILITY in DB and SESSION
            
                            for (int i=0; i<myCart.size(); i++)
                            {
                                Product productDB = productsAvailability.get(i);
                                CartItem cartItem = myCart.get(i);
                                int newQuantity = productDB.getAvailable() - cartItem.getQuantity();
                                
                                productDB.setAvailable(newQuantity);
                                
                                databaseHandler.updateProduct(productDB);
                                
                            }
                            
                        //////////////////////////////////////// 6. redirect to HOME page "POSITIVE response"
                            session.setAttribute("buyCompleted", true);
                        session.setAttribute("outOfStockProducts", outOfStockPs);
                        response.sendRedirect("cart.jsp?outOfStock=true");
                
                    }
                }
             else
                {   ///////////// cart exists but it is empty 
                   
                }
            
            }
            /////// b. Do NOT have a cart, then redirect to home with NEGATIVE response
            else{
            
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
                            System.out.println("ana hena da5el 3la index");
                            response.sendRedirect("index.jsp");
                        
                        }
                        ///////////////////////////////// b. NO doesn't afford the payment, then redirect to home with NEGATIVE response
                        else{
                            System.out.println("ana hena da5el 3la cart");
                               response.sendRedirect("cart.jsp?notEnoughMoney=true");
                        }
                    }
                    else
                    {
                        /////////////////// 2-c. SOME requested products are OUT OF STOCK
                        System.out.println("ana hena da5el 3la cart bs rewsh");
