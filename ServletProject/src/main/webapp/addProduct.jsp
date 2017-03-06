
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <title>Add Products</title>

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
        <link rel="stylesheet" href="logInStyle.css">

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
        </style>


    </head>
    <body>

        <!--admin MUST be signed in-->
        <!--check if it's admin and show (page not available) if it's not-->

        <div class="header-area">
            <div class="container">
                <div class="row">
                    <div class="col-md-8">
                        <div class="user-menu">
                            <ul>
                                <li><a href="Editacc.jsp"><i class="fa fa-user"></i>My Account</a></li>
                                <li><a href="logoutServlet"><i class="fa fa-user"></i> Log out</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div> <!-- End header area -->

        <!--with Log in-->
        <div class="site-branding-area">
            <div class="container">
                <div class="row">
                    <div class="col-sm-6">
                        <div class="logo">
                            <h1><a href="adminHome.html"><img src="img/logo.png"></a></h1>
                        </div>
                    </div>						
                </div>
            </div>
        </div> <!-- End site branding area -->


        <div class="product-big-title-area">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="product-bit-title text-center">
                            <h1>Add New Products</h1>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="wrapper">
            <div style="text-align: center;">

            </div>
            <form class="form-signin" method="post" action="addProductServlet">   

                <center><label>Image</label></center>
                <input type="file" name="prodImage" accept="image/*" class="form-control">

                <center><label>Name</label></center>
                <input type="text" class="form-control" name="prodName" placeholder="Name" required="" autofocus="" />

                <center><label>Price</label></center>
                <input type="text" class="form-control" name="prodPrice" placeholder="Price" required=""/>   

                <center><label>Description</label></center>
                <input type="text" class="form-control" name="prodDesc" placeholder="Description" required="" autofocus="" />

                <!--TODO: specify a name attribute-->
                <center><label >Category</label>
                    <div class="dropdown">
                        <select name="category" >
                            <option value="mobiles">Mobiles</option>
                            <option value="laptops">Laptops</option>
                            <option value="gaming">Gaming</option>
                            <option value="headphones">Headphones</option>
                        </select>
                    </div></center>
                <br><br>


                <br><br>

                <button class="btn btn-lg btn-primary btn-block" type="submit">Add</button> 
                <button class="btn btn-lg btn-primary btn-block">Cancel</button> 
            </form>
        </div>



        <div class="maincontent-area">
            <div class="zigzag-bottom"></div>
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="latest-product">
                            <h2 class="section-title">Mobiles</h2>
                            <div class="product-carousel">
                                <c:forEach items="${sessionScope.mobilesList}" var="mobile">
                                    <div class="single-product">
                                        <div class="product-f-image">
                                            <img src="img/${mobile.getImage()}" alt="">
                                            <div class="product-hover">
                                                <a href="editProduct.jsp" class="add-to-cart-link"><i class="fa fa-pencil-square-o"></i> Edit</a>
                                                <a href="ProductDetails.jsp?productId=${mobile.getId()}&productName=${mobile.getName()}&productDesc=${mobile.getDescription()}&productPrice=${mobile.getPrice()}&productQuantity=${mobile.getAvailable()}&productImage=${mobile.getImage()}" class="view-details-link"><i class="fa fa-link"></i> See details</a>
                                            </div>
                                        </div>

                                        <h2><a href="">${mobile.getName()}</a></h2>

                                        <div class="product-carousel-price">
                                            <ins>$${mobile.getPrice()}</ins> <del>$100</del>
                                        </div> 
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div> <!-- End main content area -->

        <div class="maincontent-area">
            <div class="zigzag-bottom"></div>
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="latest-product">
                            <h2 class="section-title">Laptops</h2>
                            <div class="product-carousel">
                                <c:forEach items="${sessionScope.laptopsList}" var="mobile">
                                    <div class="single-product">
                                        <div class="product-f-image">
                                            <img src="img/${mobile.getImage()}" alt="">
                                            <div class="product-hover">
                                                <a href="editProduct.jsp" class="add-to-cart-link"><i class="fa fa-pencil-square-o"></i> Edit</a>
                                                <a href="ProductDetails.jsp?productId=${mobile.getId()}&productName=${mobile.getName()}&productDesc=${mobile.getDescription()}&productPrice=${mobile.getPrice()}&productQuantity=${mobile.getAvailable()}&productImage=${mobile.getImage()}" class="view-details-link"><i class="fa fa-link"></i> See details</a>
                                            </div>
                                        </div>

                                        <h2><a href="">${mobile.getName()}</a></h2>

                                        <div class="product-carousel-price">
                                            <ins>$${mobile.getPrice()}</ins> <del>$100</del>
                                        </div> 
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div> <!-- End main content area -->


        <div class="maincontent-area">
            <div class="zigzag-bottom"></div>
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="latest-product">
                            <h2 class="section-title">Gaming</h2>
                            <div class="product-carousel">
                                <c:forEach items="${sessionScope.gamingList}" var="mobile">
                                    <div class="single-product">
                                        <div class="product-f-image">
                                            <img src="img/${mobile.getImage()}" alt="">
                                            <div class="product-hover">
                                                <a href="editProduct.jsp" class="add-to-cart-link"><i class="fa fa-pencil-square-o"></i> Edit</a>
                                                <a href="ProductDetails.jsp?productId=${mobile.getId()}&productName=${mobile.getName()}&productDesc=${mobile.getDescription()}&productPrice=${mobile.getPrice()}&productQuantity=${mobile.getAvailable()}&productImage=${mobile.getImage()}" class="view-details-link"><i class="fa fa-link"></i> See details</a>
                                            </div>
                                        </div>

                                        <h2><a href="">${mobile.getName()}</a></h2>

                                        <div class="product-carousel-price">
                                            <ins>$${mobile.getPrice()}</ins> <del>$100</del>
                                        </div> 
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div> <!-- End main content area -->




        <div class="maincontent-area">



            <div class="maincontent-area">
                <div class="zigzag-bottom"></div>
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="latest-product">
                                <h2 class="section-title">Headphones</h2>
                                <div class="product-carousel">
                                    <c:forEach items="${sessionScope.headphonesList}" var="mobile">
                                        <div class="single-product">
                                            <div class="product-f-image">
                                                <img src="img/${mobile.getImage()}" alt="">
                                                <div class="product-hover">
                                                    <a href="editProduct.jsp" class="add-to-cart-link"><i class="fa fa-pencil-square-o"></i> Edit</a>
                                                    <a href="ProductDetails.jsp?productId=${mobile.getId()}&productName=${mobile.getName()}&productDesc=${mobile.getDescription()}&productPrice=${mobile.getPrice()}&productQuantity=${mobile.getAvailable()}&productImage=${mobile.getImage()}" class="view-details-link"><i class="fa fa-link"></i> See details</a>
                                                </div>
                                            </div>

                                            <h2><a href="">${mobile.getName()}</a></h2>

                                            <div class="product-carousel-price">
                                                <ins>$${mobile.getPrice()}</ins> <del>$100</del>
                                            </div> 
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div> <!-- End main content area -->
        </div>

        <div class="footer-bottom-area">
            <div class="container">
                <div class="row">
                    <div class="col-md-8">
                        <div class="copyright">
                            <p>&copy; Coded with ♥. </p>
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
