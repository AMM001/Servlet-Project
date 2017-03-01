<%-- 
    Document   : index
    Created on : Feb 28, 2017, 6:27:27 PM
    Author     : ehabm
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
   session.setAttribute("category", "mobiles");
%>
<jsp:forward page="getAllProductsServlet" ></jsp:forward>
