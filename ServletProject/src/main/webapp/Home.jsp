<%@page import="com.tnaneen.servletproject.Product"%>
<%@page import="java.util.ArrayList"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
        <title>Techno Home </title>

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
<<<<<<< HEAD
            
=======
>>>>>>> 8ec28309c3d33bb1197b5b83c9cf0e5fd524c113
            .alert {
                padding: 20px;
                background-color: #f44336;
                color: white;
            }
<<<<<<< HEAD
            
            .success{
                background-color: #00ff00;
            }
=======
>>>>>>> 8ec28309c3d33bb1197b5b83c9cf0e5fd524c113

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
        <c:if test="${param.notlogged==true}" >
            <div class="alert">
                <span class="closebtn" onclick="this.parentElement.style.display = 'none';">&times;</span> 
                <strong>Sorry!</strong> Wrong Email or Password 
            </div>
        </c:if>
        <c:if test="${param.cartlog==true}" >
            <div class="alert">
                <span class="closebtn" onclick="this.parentElement.style.display = 'none';">&times;</span> 
                <strong>Sorry!</strong> you have to log in first 
            </div>
        </c:if>
        <c:if test="${param.cantsign==true}" >
            <div class="alert">
                <span class="closebtn" onclick="this.parentElement.style.display = 'none';">&times;</span> 
                <strong>Sorry!</strong> User already exists! 
            </div>
        </c:if>
        <!--no login-->
        <c:choose>
            <c:when test="${sessionScope.user==null}">
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
                                        <li><a href="" data-toggle="modal" data-target="#logIn"><i class="fa fa-user"></i> Login</a></li>
                                        <li><a href="" data-toggle="modal" data-target="#signUp"><i class="fa fa-user"></i> Sign up</a></li>

                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div> <!-- End header area -->
            </c:when>
            <c:otherwise>
                <!--with log in -->
                
                <!--check whether recharge = true or false-->
                <c:if test="${param.recharged != null}">
                    <c:choose>
                        <c:when test="${param.recharged == true}">
                            <div class="alert success">
                                <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span> 
                                <strong>Recharged Successfully!</strong> Your Balance is updated :)                  
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="alert">
                                <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span> 
                                <strong>Invalid Code!</strong> Please re-enter the code correctly.
                            </div>
                        </c:otherwise>
                    </c:choose>
                </c:if>

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
            </c:otherwise>
        </c:choose>




        <!--No Login-->
        <c:choose>

            <c:when test="${sessionScope.user==null}">

                <div class="site-branding-area">
                    <div class="container">
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="logo">
                                    <h1><a href="Home.jsp"><img src="img/logo.png"></a></h1>
                                </div>
                            </div>								
                        </div>
                    </div>
                </div> <!-- End site branding area -->
            </c:when>


            <c:otherwise>
                <!--with Log in-->
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
                                    <a href="cart.jsp">Cash - <span class="cart-amunt">$${sessionScope.user.getCreditLimit()}</span> <i class="fa fa-shopping-cart"></i></a>
                                </div>
                            </div>			
                        </div>
                    </div>
                </div> <!-- End site branding area -->
            </c:otherwise>
        </c:choose>


        <!--NoLogIn-->
        <c:choose>
            <c:when test="${sessionScope.user==null}">
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
                                    <li class="active"><a href="Home.jsp">Home</a></li>
                                    <!--
                                     <li><a href="#">Category</a></li>
                                    -->
                                    <div class="dropdown">
                                        <button class="dropbtn">Categories</button>
                                        <div class="dropdown-content">
                                            <a href="getAllProductsServlet?category=mobiles">Mobile phone</a>
                                            <a href="getAllProductsServlet?category=laptops">Laptops</a>
                                            <a href="getAllProductsServlet?category=gaming">Gaming</a>
                                            <a href="getAllProductsServlet?category=headphones">headphones</a>
                                        </div>

                                    </div>
                                    <div class="dropdown">
                                        <button class="dropbtn">Prices</button>
                                        <div class="dropdown-content">
                                            <a href="SearchServlet?minPrice=1000&maxPrice=6000">1000-6000</a>
                                            <a href="SearchServlet?minPrice=6000&maxPrice=12000">6000-12000</a>
                                            <a href="SearchServlet?minPrice=12000&maxPrice=18000">12000-18000</a>
                                            <a href="SearchServlet?minPrice=18000&maxPrice=24000">18000-24000</a>
                                        </div>
                                    </div>

                                    <!--
           <li><a href="checkout.html">Checkout</a></li>
          <li><a href="single-product.html">Single product</a></li>
                                   <li><a href="shop.html">Shop page</a></li>
 
           <li><a href="cart.html">Cart</a></li>					   
           <li><a href="#">Others</a></li>
           <li><a href="#">Contact</a></li>
                                    -->
                                </ul>
                            </div>  
                        </div>
                    </div>
                </div> <!-- End mainmenu area -->

            </c:when>

            <c:otherwise>
                <!--Login-->

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
                                    <li class="active"><a href="Home.jsp">Home</a></li>

                                    <div class="dropdown">
                                        <button class="dropbtn">Categories</button>
                                        <div class="dropdown-content">
                                            <a href="getAllProductsServlet?category=mobiles">Mobile phone</a>
                                            <a href="getAllProductsServlet?category=laptops">Laptops</a>
                                            <a href="getAllProductsServlet?category=gaming">Gaming</a>
                                            <a href="getAllProductsServlet?category=headphones">headphones</a>
                                        </div>
                                    </div>
                                    <div class="dropdown">
                                        <button class="dropbtn">Prices</button>
                                        <div class="dropdown-content">
                                            <a href="SearchServlet?minPrice=1000&maxPrice=6000">1000-6000</a>
                                            <a href="SearchServlet?minPrice=6000&maxPrice=12000">6000-12000</a>
                                            <a href="SearchServlet?minPrice=12000&maxPrice=18000">12000-18000</a>
                                            <a href="SearchServlet?minPrice=18000&maxPrice=24000">18000-24000</a>
                                        </div>
                                    </div>
                                    <li ><a href="cart.jsp">MyCart</a></li>		
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
            </c:otherwise>
        </c:choose>




        <div class="slider-area">
            <!-- Slider -->
            <div class="block-slider block-slider4">
                <ul class="" id="bxslider-home4">
                    <li>
                        <img src="img/h4-slide.png" alt="Slide">
                        <div class="caption-group">
                            <h2 class="caption title">
                                <span class="primary"> <strong>Mobile Phones</strong></span>
                            </h2>

                            <!--
                            <a class="caption button-radius" href="#"><span class="icon"></span>Shop now</a>
                            -->
                        </div>
                    </li>
                    <li><img src="img/h4-slide2.png" alt="Slide">
                        <div class="caption-group">
                            <h2 class="caption title">
                                <span class="primary"> <strong>GAMING</strong></span>
                            </h2>

                            <!--
                            <a class="caption button-radius" href="#"><span class="icon"></span>Shop now</a>
                            -->
                        </div>
                    </li>
                    <li><img src="img/h4-slide3.png" alt="Slide">
                        <div class="caption-group">
                            <h2 class="caption title">
                                <span class="primary"> <strong>Laptops</strong></span>
                            </h2>

                            <!--
                            <a class="caption button-radius" href="#"><span class="icon"></span>Shop now</a>
                            -->
                        </div>
                    </li>
                    <li><img src="img/h4-slide4.png" alt="Slide">
                        <div class="caption-group">
                            <h2 class="caption title">
                                <span class="primary"><strong>HeadPhones</strong></span>
                            </h2>

                            <!--
                            <a class="caption button-radius" href="#"><span class="icon"></span>Shop now</a>
                            -->
                        </div>
                    </li>
                </ul>
            </div>
            <!-- ./Slider -->
        </div> <!-- End slider area -->

        <div class="promo-area">
            <div class="zigzag-bottom"></div>
            <div class="container">
                <div class="row">
                    <div class="col-md-3 col-sm-6">
                        <div class="single-promo promo1">
                            <i class="fa fa-refresh"></i>
                            <p>30 Days return</p>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-6">
                        <div class="single-promo promo2">
                            <i class="fa fa-truck"></i>
                            <p>Free shipping</p>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-6">
                        <div class="single-promo promo3">
                            <i class="fa fa-lock"></i>
                            <p>Secure payments</p>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-6">
                        <div class="single-promo promo4">
                            <i class="fa fa-gift"></i>
                            <p>New products</p>
                        </div>
                    </div>
                </div>
            </div>
        </div> <!-- End promo area -->




        <div class="brands-area">
            <div class="zigzag-bottom"></div>
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="brand-wrapper">
                            <div class="brand-list">
                                <img src="img/brand1.png" alt="">
                                <img src="img/brand2.png" alt="">
                                <img src="img/brand3.png" alt="">
                                <img src="img/brand4.png" alt="">
                                <img src="img/brand5.png" alt="">
                                <img src="img/brand6.png" alt="">
                                <img src="img/brand1.png" alt="">
                                <img src="img/brand2.png" alt="">                            
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div> <!-- End brands area -->

        <div class="maincontent-area">
            <div class="zigzag-bottom"></div>
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="latest-product">
                            <h2 class="section-title">${sessionScope.category}</h2>


                            <c:choose >

                                <c:when test="${sessionScope.filteredProducts.size()==0 }"  >
                                    <center> <h1 style="color:red" >Sorry, No Results match your search criteria !</h1> </center>
                                    </c:when>
                                    <c:when test="${sessionScope.products.size()==0 }"  >
                                    <center> <h1 style="color:red" >Sorry, No Products found !</h1></center>
                                    </c:when>

                                <c:otherwise>
                                    <div class="product-carousel">
                                        <c:choose>
                                            <c:when test="${sessionScope.filteredProducts==null}" >
                                                <% System.out.println("7amada fash5"); %>
                                                <c:forEach items="${sessionScope.products}" var="product">
                                                    <div class="single-product">
                                                        <div class="product-f-image">
                                                            <img src="img/${product.getImage()}" alt="">
                                                            <div class="product-hover">
                                                                <a href="CheckIfLoggedIn?selectedProduct=${product.getId()}&productName=${product.getName()}&productPrice=${product.getPrice()}&productImage=${product.getImage()}" class="add-to-cart-link"><i class="fa fa-shopping-cart"></i> Add to cart</a>
                                                                <a href="singleProduct.jsp?productName=${product.getName()}&productDesc=${product.getDescription()}&productPrice=${product.getPrice()}&productQuantity=${product.getAvailable()}&productImage=${product.getImage()}" class="view-details-link"><i class="fa fa-link"></i> See details</a>
                                                            </div>
                                                        </div>

                                                        <h2><a href="singleProduct.jsp?productName=${product.getName()}&productDesc=${product.getDescription()}&productPrice=${product.getPrice()}&productQuantity=${product.getAvailable()}&productImage=${product.getImage()}">${product.getName()}</a></h2>

                                                        <div class="product-carousel-price">
                                                            <ins>$${product.getPrice()}</ins> <del>$${product.getPrice() + 100 + Math.floor( Math.random()*400 )}</del>
                                                        </div> 
                                                    </div>
                                                </c:forEach>
                                            </c:when>
                                            <c:otherwise>
                                                <% System.out.println("7amada fash5 tenen" + ((ArrayList<Product>) session.getAttribute("filteredProducts")).size()); %>
                                                <c:forEach items="${sessionScope.filteredProducts}" var="product">

                                                    <div class="single-product">
                                                        <div class="product-f-image">
                                                            <img src="img/${product.getImage()}" alt="">
                                                            <div class="product-hover">
                                                                <a href="CheckIfLoggedIn?selectedProduct=${product.getId()}&productName=${product.getName()}&productPrice=${product.getPrice()}&productImage=${product.getImage()}" class="add-to-cart-link"><i class="fa fa-shopping-cart"></i> Add to cart</a>
                                                                <a href="singleProduct.jsp?productName=${product.getName()}&productDesc=${product.getDescription()}&productPrice=${product.getPrice()}&productQuantity=${product.getAvailable()}&productImage=${product.getImage()}" class="view-details-link"><i class="fa fa-link"></i> See details</a>
                                                            </div>
                                                        </div>

                                                        <h2><a href="singleProduct.jsp?productName=${product.getName()}&productDesc=${product.getDescription()}&productPrice=${product.getPrice()}&productQuantity=${product.getAvailable()}&productImage=${product.getImage()}">${product.getName()}</a></h2>

                                                        <div class="product-carousel-price">
                                                            <ins>$${product.getPrice()}</ins> <del>$${product.getPrice() + 100 + Math.floor( Math.random()*400 )}</del>
                                                        </div> 
                                                    </div>
                                                </c:forEach> 
                                                <% session.removeAttribute("filteredProducts");%>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </c:otherwise>
                            </c:choose>

                        </div>
                    </div>
                </div>
            </div>
        </div> <!-- End main content area -->
        <!-- Modal -->
        <div id="logIn" class="modal fade" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-body">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <div class="wrapper">
                            <form class="form-signin" method="post" action="loginServlet">       
                                <h2 class="form-signin-heading">welcome back </h2>
                                <input style="font-size: 10px;" type="email" class="form-control" name="email" placeholder="Email Address" required="" autofocus="" />
                                <input   style="font-size: 10px;" type="password" class="form-control" name="password" placeholder="Password" required=""/>      
                                <br>
                                <center> 
                                    <button style="width:100px;" class="btn btn-lg btn-primary" type="submit">Login</button>  
                                    <button style="width:100px;" class="btn btn-lg btn-danger" data-dismiss="modal">CLOSE</button>
                                </center>
                            </form>
                        </div>
                    </div>

                </div>

            </div>
        </div>
        <!-- sign up Modal -->
        <div id="signUp" class="modal fade" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-body">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <div class="wrapper">
                            <form class="form-signin" method="post" action="registerServlet">       
                                <h2 class="form-signin-heading">welcome</h2>
                                <label>Email</label>     
                                <input type="email" style="font-size: 10px;" class="form-control" name="email" required="" autofocus="" />
                                <label>USERNAME</label>    
                                <input type="text" style="font-size: 10px;" class="form-control" name="userName" required="" autofocus="" />
                                <label>ADDRESS</label>    
                                <input type="text" style="font-size: 10px;" class="form-control" name="Address" required="" autofocus="" />
                                <label>PASSWORD</label>    
                                <input type="password"  style="font-size: 10px;" class="form-control" name="password" required=""/>  
                                <label>JOB</label>   
                                <input type="text"  style="font-size: 10px;" class="form-control" name="job" required=""/>  
                                <label>GENDER</label>    
                                <div class="radio">
                                    <label><input type="radio" name="male" checked>Male</label>
                                    <label><input type="radio" name="female" >Female</label>
                                </div>
                                <!--
                                <input type="date" class="form-control" name="birthday" placeholder=" autofocus="" />
                                -->
                                <button style="width:100px;" class="btn btn-lg btn-success" type="submit">SIGN UP</button>   
                                <button style="width:100px;" class="btn btn-lg btn-danger" data-dismiss="modal">CLOSE</button>
                            </form>
                        </div>
                    </div>

                </div>

            </div>
        </div>
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
                        <p><./> with Love </p>
                    </div>
                </div>
                
                <div class="col-md-4">
                    <div class="footer-card-icon">
                        <i class="fa fa-cc-discover"></i>
                        <i class="fa fa-cc-mastercard"></i>
                        <i class="fa fa-cc-paypal"></i>
                        <i class="fa fa-cc-visa"></i>
                    </div>
                </div>
            </div>
        </div>
    </div> <!-- End footer bottom area -->
        
        
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

        <!-- Slider -->
        <script type="text/javascript" src="js/bxslider.min.js"></script>
        <script type="text/javascript" src="js/script.slider.js"></script>
    </body>
</html>
