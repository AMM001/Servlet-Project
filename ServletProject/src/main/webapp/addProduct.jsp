
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

        <!--with Log in-->
        <div class="site-branding-area">
            <div class="container">
                <div class="row">
                    <div class="col-sm-6">
                        <div class="logo">
                            <h1><a href="adminHome.jsp"><img src="img/logo.png"></a></h1>
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

        <br>
    <center>
        <button style="width:200px;" data-toggle="modal" data-target="#addProductModal" class="btn btn-lg btn-primary btn-block form-signin-heading">Add New Product</button>
    </center>

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
                                            <a href="editProduct.jsp?productCategory=${mobile.getCategory()}&productId=${mobile.getId()}&productName=${mobile.getName()}&productDesc=${mobile.getDescription()}&productPrice=${mobile.getPrice()}&productQuantity=${mobile.getAvailable()}&productImage=${mobile.getImage()}" class="add-to-cart-link"><i class="fa fa-pencil-square-o"></i> Edit</a>
                                            <a href="ProductDetails.jsp?productCategory=${mobile.getCategory()}&productId=${mobile.getId()}&productName=${mobile.getName()}&productDesc=${mobile.getDescription()}&productPrice=${mobile.getPrice()}&productQuantity=${mobile.getAvailable()}&productImage=${mobile.getImage()}" class="view-details-link"><i class="fa fa-link"></i> See details</a>
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
                                            <a href="editProduct.jsp?productCategory=${mobile.getCategory()}&productId=${mobile.getId()}&productName=${mobile.getName()}&productDesc=${mobile.getDescription()}&productPrice=${mobile.getPrice()}&productQuantity=${mobile.getAvailable()}&productImage=${mobile.getImage()}" class="add-to-cart-link"><i class="fa fa-pencil-square-o"></i> Edit</a>
                                            <a href="ProductDetails.jsp?productCategory=${mobile.getCategory()}&productId=${mobile.getId()}&productName=${mobile.getName()}&productDesc=${mobile.getDescription()}&productPrice=${mobile.getPrice()}&productQuantity=${mobile.getAvailable()}&productImage=${mobile.getImage()}" class="view-details-link"><i class="fa fa-link"></i> See details</a>
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
                                            <a href="editProduct.jsp?productCategory=${mobile.getCategory()}&productId=${mobile.getId()}&productName=${mobile.getName()}&productDesc=${mobile.getDescription()}&productPrice=${mobile.getPrice()}&productQuantity=${mobile.getAvailable()}&productImage=${mobile.getImage()}" class="add-to-cart-link"><i class="fa fa-pencil-square-o"></i> Edit</a>
                                            <a href="ProductDetails.jsp?productCategory=${mobile.getCategory()}&productId=${mobile.getId()}&productName=${mobile.getName()}&productDesc=${mobile.getDescription()}&productPrice=${mobile.getPrice()}&productQuantity=${mobile.getAvailable()}&productImage=${mobile.getImage()}" class="view-details-link"><i class="fa fa-link"></i> See details</a>
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
                                                <a href="editProduct.jsp?productCategory=${mobile.getCategory()}&productId=${mobile.getId()}&productName=${mobile.getName()}&productDesc=${mobile.getDescription()}&productPrice=${mobile.getPrice()}&productQuantity=${mobile.getAvailable()}&productImage=${mobile.getImage()}" class="add-to-cart-link"><i class="fa fa-pencil-square-o"></i> Edit</a>
                                                <a href="ProductDetails.jsp?productCategory=${mobile.getCategory()}&productId=${mobile.getId()}&productName=${mobile.getName()}&productDesc=${mobile.getDescription()}&productPrice=${mobile.getPrice()}&productQuantity=${mobile.getAvailable()}&productImage=${mobile.getImage()}" class="view-details-link"><i class="fa fa-link"></i> See details</a>
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
                            <li><a href="adminHome.jsp">Home</a></li>

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
                        <p><./> With Love </p>
                    </div>
                </div>


            </div>
        </div>
    </div> <!-- End footer bottom area -->


    <!--ADD PRODUCT MODAL---------------------------->
    <div id="addProductModal" class="modal fade" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Add Product</h4>
                </div>
                <div class="modal-body">
                    <div class="wrapper">
                        <div style="text-align: center;">

                        </div>
                        <form class="form-signin" method="post" action="addProductServlet">   

                            <label>Image</label>
                            <input type="file" name="prodImage" accept="image/*" class="form-control">

                            <label>Name</label>
                            <input type="text" class="form-control" name="prodName" placeholder="Name" required="" autofocus="" />

                            <label>Price</label>
                            <input type="number" class="form-control" name="prodPrice" placeholder="Price" required=""/>   

                            <label>Available Quantity</label>
                            <input type="number" size="4" class="form-control" name="prodQuantity" min="1" step="1">

                            <label>Description</label>
                            <input type="text" class="form-control" name="prodDesc" placeholder="Description" required="" autofocus="" />

                            <!--TODO: specify a name attribute-->
                            <label>Category</label>
                            <center>
                                <div class="dropdown form-control">
                                    <select name="category" >
                                        <option value="mobiles">Mobiles</option>
                                        <option value="laptops">Laptops</option>
                                        <option value="gaming">Gaming</option>
                                        <option value="headphones">Headphones</option>
                                    </select>
                                </div>
                            </center>
                            <br><br>

                            <button class="btn btn-lg btn-primary btn-block" type="submit">Add</button> 
                            <button class="btn btn-lg btn-primary btn-block"  data-dismiss="modal">Cancel</button> 
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

    <!-- Slider -->
    <script type="text/javascript" src="js/bxslider.min.js"></script>
    <script type="text/javascript" src="js/script.slider.js"></script>
</body>
</html>
