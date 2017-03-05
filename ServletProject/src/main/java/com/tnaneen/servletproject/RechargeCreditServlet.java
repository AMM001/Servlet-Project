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
import javax.servlet.http.HttpSession;

/**
 *
 * @author mohamed
 */
@WebServlet(name = "RechargeCreditServlet", urlPatterns = {"/RechargeCreditServlet"})
public class RechargeCreditServlet extends HttpServlet {

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
          
        
            ////////////////// 1. get Recharging Code from Request
            String Code =  request.getParameter("RechargingCode");
            
            ////////////////// 2. get User's ID from Request
            HttpSession currentSession = request.getSession();
            User user = (User) currentSession.getAttribute("user");
        
            DatabaseHandler databaseHandler = new DatabaseHandler();
            
            ///////////////// 3. Verify code from DB
            double cash = databaseHandler.getCash(Code);
            
            ////////////////////// A. if Code is Corret
            if (cash != 0)
            {
                ///////////////////////////////1. Remove code from db
                  databaseHandler.removeCash(Code);
                  
                ///////////////////////////////2. Update users credit in DB
                System.out.println("----------"+user.getCreditLimit());
                   databaseHandler.addCredit(user.getEmail(), (int)cash+user.getCreditLimit());
                   System.out.println(">>>>>>>>>"+user.getCreditLimit());
                //////////////////////////////3. Update users credit in SESSION
                    user.setCreditLimit( user.getCreditLimit() + (int)cash );
                    currentSession.removeAttribute("user");
                    currentSession.setAttribute("user", user);
                
                ///////////////////////////////4.  Redirect to HomePage
            
                response.sendRedirect("Home.jsp");
            
            
            }
            /////////////////////// B. if Code is NOT correct
            else
            {
                ///////////////////////////////////// Redirect to Home with ERROR msg
                response.sendRedirect("Home.jsp");
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
