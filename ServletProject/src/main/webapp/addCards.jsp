<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <title>Add Cards</title>

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
                           <h1><a href="adminHome.jsp"><img src="img/logo.png"></a></h1>
                       </div>
                   </div>						
               </div>
           </div>
       </div> <!-- End site branding area -->
       
        <div class="wrapper">
            <div style="text-align: center;">
                <h3>Add New Cards</h3>
            </div>
            <form class="form-signin" method="post" action="CashCodeServlet">       
                <center><label>Card</label></center>
                <input type="text" class="form-control" name="code" placeholder="Card" required="" autofocus="" />
                
                <center><label>Value</label></center>
                <input type="text" class="form-control" name="cash" placeholder="Value" required=""/>   
                <br><br>
                
                <button class="btn btn-lg btn-primary btn-block" type="submit">Add</button> 
                <button class="btn btn-lg btn-primary btn-block">Cancel</button> 
            </form>
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
