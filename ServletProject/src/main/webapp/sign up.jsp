<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html >
    <head>
        <meta charset="UTF-8">
        <title>Log in</title>


        <link rel='stylesheet prefetch' href='http://netdna.bootstrapcdn.com/bootstrap/3.0.2/css/bootstrap.min.css'>

        <link rel="stylesheet" href="css/logInStyle.css">
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
        <c:if test="${param.cantsign==true}" >
            <div class="alert">
                <span class="closebtn" onclick="this.parentElement.style.display = 'none';">&times;</span> 
                <strong>Sorry!</strong> User already exists! 
            </div>
        </c:if>
        <div class="wrapper">
            <form class="form-signin" method="post" action="registerServlet">       
                <h2 class="form-signin-heading">welcome</h2>

                <input type="text" class="form-control" name="email" placeholder="Email Address" required="" autofocus="" />

                <input type="text" class="form-control" name="userName" placeholder="userName" required="" autofocus="" />

                <input type="text" class="form-control" name="Address" placeholder=" Address" required="" autofocus="" />

                <input type="password" class="form-control" name="password" placeholder="Password" required=""/>  
                <!--
                <input type="date" class="form-control" name="birthday" placeholder=" autofocus="" />
                -->
                <button class="btn btn-lg btn-primary btn-block" type="submit">sign up</button>   
            </form>
        </div>


    </body>
</html>
