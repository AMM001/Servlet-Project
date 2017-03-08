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
@WebServlet(name = "GetOrderHistoryServlet", urlPatterns = {"/GetOrderHistoryServlet"})
public class GetOrderHistoryServlet extends HttpServlet {

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
        
        ///////////// 1. Get All user info from the request
        int userid = Integer.parseInt( request.getParameter("userId") );
        String username = request.getParameter("userName") ;
        HttpSession session = request.getSession(true);
        
        System.out.println("com.tnaneen.servletproject.GetOrderHistoryServlet.processRequest()>> " + userid+" # " + username);
        
        ///////////// 2. Use userID to get user's order history
        DatabaseHandler databaseHandler = new DatabaseHandler();
        ArrayList<OrderItem> items =   databaseHandler.getOrders(userid);
        
        System.out.println("com.tnaneen.servletproject.GetOrderHistoryServlet.processRequest()>> Ordered Items are : " + items.size());
        
          if (items.size() != 0)
          {
               ////--------------------------------------------------
        int currentID =  items.get(0).getOrderId();
        int counter = 0;
        ArrayList<OrderItem> singleOrder = new ArrayList<>();
        
        for (int i=0; i<items.size(); i++)
        {
            System.out.println("||>"+i+" || "+currentID +" ||| "+ items.get(i).getOrderId()+" ||");
            if (currentID == items.get(i).getOrderId())
            {
            System.out.println("|if|>"+i+" || "+currentID +" ||| "+ items.get(i).getOrderId()+" ||");
                singleOrder.add(items.get(i));
             
            System.out.println("|if|>"+i+" || "+currentID +" ||| "+ items.get(i).getOrderId()+" ||");
            }
            else
            {
                session.setAttribute("Order#"+counter, singleOrder);
                System.out.println("?????"+currentID+"?????? " + singleOrder.toString());
                counter++;
                currentID = items.get(i).getOrderId();
                singleOrder = new ArrayList<>();
                singleOrder.add(items.get(i));
            System.out.println("|else|>"+i+" || "+currentID +" ||| "+ items.get(i).getOrderId()+" ||");
            }
          
        }
         
        session.setAttribute("Order#"+counter, singleOrder);
        
        session.setAttribute("NumOfOrders", counter+1);
        
        ////-------------------------------------------------------
        ///////////// 3. put the history on session
         
         session.setAttribute("orderHistory", items);
         
        ///////////// 4. redirect to userDetails JSP
        response.sendRedirect("orderHistory.jsp?username="+username);
       
          
          }else{
          session.setAttribute("NumOfOrders", 0);
               response.sendRedirect("orderHistory.jsp?username="+username);
          
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
