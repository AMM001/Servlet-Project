


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
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
                            <h2>Users</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div> <!-- End Page title area -->

        <div class="col-md-8">
            <div class="product-content-right">
                <div class="woocommerce">

                    <table cellspacing="0" class="shop_table cart">
                        <thead>
                            <tr>

                                <th class="product-thumbnail">Image</th>
                                <th class="product-name">UserName</th>
                                <th class="product-price">Email</th>

                            </tr>
                        </thead>
                        <c:forEach items="${sessionScope.usersList}" var="client" >
                            <tr class="cart_item">

                                <td class="product-thumbnail">
                                    <a href=""><img width="145" height="145" alt="poster_1_up" class="shop_thumbnail" src="img/default-avatar.png"></a>
                                </td>

                                <td class="user-name">
                                    <span class="amount">${client.getUserName()}</span> 
                                </td>

                                <td class="user-name">
                                    <span class="amount">${client.getEmail()}</span> 
                                </td>

                            </tr>
                        </c:forEach>

                    </table>

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
