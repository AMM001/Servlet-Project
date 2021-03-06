<%@page import="com.tnaneen.servletproject.CartItem"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!--
        ustora by freshdesignweb.com
        Twitter: https://twitter.com/freshdesignweb
        URL: https://www.freshdesignweb.com/ustora/
-->
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Cart Page - Ustora Demo</title>

        <!-- Google Fonts -->
        <link href='http://fonts.googleapis.com/css?family=Titillium+Web:400,200,300,700,600' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Roboto+Condensed:400,700,300' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Raleway:400,100' rel='stylesheet' type='text/css'>

        <!-- Bootstrap -->
        <link rel="stylesheet" href="css/bootstrap.min.css">

        <!-- Font Awesome -->
        <link rel="stylesheet" href="css/font-awesome.min.css">

        <!-- Custom CSS -->
        <link rel="stylesheet" href="css/owl.carousel.css">
        <link rel="stylesheet" href="style.css">
        <link rel="stylesheet" href="css/responsive.css">

        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->



        <style>
            .dropbtn {
                background-color: #F7FDF9;
                color: black;
                padding: 16px;
                font-size: 16px;
                border: none;
                cursor: pointer;
            }

            .dropdown {
                position: relative;
                display: inline-block;
            }

            .dropdown-content {
                display: none;
                position: absolute;
                background-color: #f9f9f9;
                min-width: 160px;
                box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
                z-index: 1;
            }

            .dropdown-content a {
                color: black;
                padding: 12px 16px;
                text-decoration: none;
                display: block;
            }

            .dropdown-content a:hover {background-color: #5A87CA}

            .dropdown:hover .dropdown-content {
                display: block;
            }

            .dropdown:hover .dropbtn {
                background-color: #5A87CA;
            }
            .alert {
                padding: 20px;
                background-color: #f44336;
                color: white;
            }

            .closebtn {
                margin-left: 15px;
                color: white;
                font-weight: bold;
                float: right;
                font-size: 22px;
                line-height: 20px;
                cursor: pointer;
                transition: 0.3s;
            }

            .closebtn:hover {
                color: black;
            }
        </style>
    </head>
    <body>
        <div class="header-area">
            <div class="container">
                <div class="row">
                    <div class="col-md-8">
                        <div class="user-menu">
                            <ul>
                                <!--
    <li><a href="#"><i class="fa fa-user"></i> My Account</a></li>
    <li><a href="cart.html"><i class="fa fa-user"></i> My Cart</a></li>
    <li><a href="checkout.html"><i class="fa fa-user"></i> Checkout</a></li>
                                -->
                                <li><a href="Editacc.jsp"><i class="fa fa-user"></i>My Account</a></li>

                                <li><a href="" data-toggle="modal" data-target="#charge"><i class="fa fa-money"></i> Recharge</a></li>    


                            </ul>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="header-right">
                            <ul class="list-unstyled list-inline">

                                <li><a href="logoutServlet"><i class="fa fa-user"></i> Log out</a></li>

                            </ul>
                        </div>
                    </div>

                </div>
            </div>
        </div> <!-- End header area -->



        <div class="site-branding-area">
            <div class="container">
                <div class="row">
                    <div class="col-sm-6">
                        <div class="logo">
                            <h1><a href="Home.jsp"><img src="img/logo.png"></a></h1>
                        </div>
                    </div>			
                    <div class="col-sm-6">
                        <div class="shopping-item">
                            <a href="cart.html">Cash - <span class="cart-amunt">$${sessionScope.user.getCreditLimit()}</span> <i class="fa fa-shopping-cart"></i></a>
                        </div>
                    </div>			
                </div>
            </div>
        </div> <!-- End site branding area -->



        <div class="mainmenu-area">
            <div class="container">
                <div class="row">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                    </div> 
                    <div class="navbar-collapse collapse">
                        <ul class="nav navbar-nav">
                            <li ><a href="Home.jsp">Home</a></li>


                            <li class="active"><a href="cart.html">MyCart</a></li>		
                            <!--
   <li><a href="checkout.html">Checkout</a></li>
  <li><a href="single-product.html">Single product</a></li>
                           <li><a href="shop.html">Shop page</a></li>

                      
   <li><a href="#">Others</a></li>
   <li><a href="#">Contact</a></li>
                            -->
                        </ul>
                    </div>  
                </div>
            </div>
        </div> <!-- End mainmenu area -->




        <div class="product-big-title-area">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="product-bit-title text-center">
                            <h2>Shopping Cart</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div> <!-- End Page title area -->


        <div class="single-product-area">
            <div class="zigzag-bottom"></div>
            <div class="container">
                <div class="row">

                    <center>
                    <div class="col-md-8">
                        <div class="product-content-right">
                            <div class="woocommerce">
                                <form method="post" action="BuyServlet">
                                    <table cellspacing="0" class="shop_table cart">
                                        <thead>
                                            <tr>
                                                <th class="product-thumbnail">Product Image</th>
                                                <th class="product-name">Product Name</th>
                                                <th class="product-price">Product Price</th>
                                                <th class="product-quantity">Quantity</th>
                                                <th class="product-subtotal">Sub-Total</th>
                                                <th class="product-remove">Remove</th>

                                            </tr>
                                        </thead>
                                        <%
                                            int total = 0;
                                            ArrayList<CartItem> items = (ArrayList<CartItem>) session.getAttribute("MyShoppingCart");
                                            int counter = 0;
                                        %>
                                        <c:forEach items="${sessionScope.MyShoppingCart}" var="cartItem" >
                                            <%--<% total+=Integer.parseInt(request.getParameter("productPrice")); %>--%>
                                            <tr class="cart_item">

                                                <td class="product-thumbnail">
                                                    <a href=""><img width="145" height="145" alt="poster_1_up" class="shop_thumbnail" src="img/${cartItem.getProductImage()}"></a>
                                                </td>

                                                <td class="product-name">
                                                    <a href="">${cartItem.getProductName()}</a> 
                                                </td>

                                                <td class="product-price">
                                                    <span class="amount">$${cartItem.getProductPrice()}</span> 
                                                </td>

                                                <td class="product-quantity">
                                                    <div class="quantity buttons_added">

                                                        <span class="amount">${cartItem.getQuantity()}</span> 
                                                    </div>
                                                </td>

                                                <td class="product-subtotal">
                                                    <span class="amount">$${cartItem.getProductPrice()*cartItem.getQuantity()}</span> 
                                                </td>
                                                <td class="product-remove">
                                                    <a title="Remove this item" class="remove" href="RemoveProduct?removeId=${cartItem.getProductId()}">remove</a> 
                                                </td>

                                            </tr>
                                            <%
                                                total += items.get(counter).getQuantity() * items.get(counter).getProductPrice();
                                                counter++;

                                            %>
                                        </c:forEach>
                                        <tr>
                                            <td class="product-subtotal" colspan="4">
                                                <span class="amount">Total</span> 
                                            </td>
                                            <td class="product-subtotal" colspan="2">
                                                <span class="amount"><%= "$"+total%></span> 
                                            </td>

                                        </tr>
                                        <c:if test="${sessionScope.MyShoppingCart.size()>0}" >
                                            <tr>
                                                <td class="actions" colspan="6">

                                                    <%--  <input type="submit" value="Save" name="save" class="button"> --%>

                                                    <input type="submit" value="Buy" name="buy" class="checkout-button button alt wc-forward">
                                                </td>
                                            </tr>
                                        </c:if>

                                    </table>
                                </form>
                                <c:if test="${param.outOfStock==true}" >

                                    <c:forEach items="${sessionScope.outOfStockProducts}" var="item">
                                        <div class="alert">
                                            <span class="closebtn" onclick="this.parentElement.style.display = 'none';">&times;</span> 
                                            <strong>Sorry!</strong> ${item.getProductName()} out of stock by ${item.getQuantity()} 
                                        </div>

                                    </c:forEach>
                                    <% session.removeAttribute("outOfStock");%>
                                </c:if>
                                <c:if test="${param.notEnoughMoney==true}" >
                                    <div class="alert">
                                        <span class="closebtn" onclick="this.parentElement.style.display = 'none';">&times;</span> 
                                        <strong>Sorry!</strong> You don't have enough money
                                    </div>
                                </c:if>
                                
                            </div>                        
                        </div>                    
                    </div>
                    </center>
                </div>
            </div>
        </div>



        <div class="footer-top-area">
            <div class="zigzag-bottom"></div>
            <div class="container">
                <div class="row">
                    <div class="col-md-3 col-sm-6">
                        <div class="footer-about-us">
                            <h2>Techno<span>home </span></h2>
                            <p>Home of Technology </p>
                            <div class="footer-social">
                                <a href="#" target="_blank"><i class="fa fa-facebook"></i></a>
                                <a href="#" target="_blank"><i class="fa fa-twitter"></i></a>
                                <a href="#" target="_blank"><i class="fa fa-youtube"></i></a>
                                <a href="#" target="_blank"><i class="fa fa-linkedin"></i></a>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-3 col-sm-6">
                        <div class="footer-menu">
                            <h2 class="footer-wid-title">User Navigation </h2>
                            <ul>
                                <li><a href="Home.jsp">Home</a></li>

                            </ul>                        
                        </div>
                    </div>




                </div>
            </div>
        </div> <!-- End footer top area -->





        <div class="footer-bottom-area">
            <div class="container">
                <div class="row">
                    <div class="col-md-8">
                        <div class="copyright">
                            <p> <./>with Love. </p>
                        </div>
                    </div>


                </div>
            </div>
        </div> <!-- End footer bottom area -->
        <!-- charge Modal -->
        <div id="charge" class="modal fade" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-body">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <div class="form-signin form-inline">
                            <form method="post" action="RechargeCreditServlet">
                                <input type="password"  name="RechargingCode" placeholder="Code" required=""/>

                                <input type="submit" value="charge" name="charge" class="button">
                            </form>

                        </div>

                    </div>

                </div>

            </div>
        </div>

        <!-- Latest jQuery form server -->
        <script src="https://code.jquery.com/jquery.min.js"></script>

        <!-- Bootstrap JS form CDN -->
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

        <!-- jQuery sticky menu -->
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/jquery.sticky.js"></script>

        <!-- jQuery easing -->
        <script src="js/jquery.easing.1.3.min.js"></script>

        <!-- Main Script -->
        <script src="js/main.js"></script>
    </body>
</html>