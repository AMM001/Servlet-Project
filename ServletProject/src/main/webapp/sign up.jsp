<!DOCTYPE html>
<html >
<head>
  <meta charset="UTF-8">
  <title>Log in</title>
  
  
  <link rel='stylesheet prefetch' href='http://netdna.bootstrapcdn.com/bootstrap/3.0.2/css/bootstrap.min.css'>

      <link rel="stylesheet" href="css/logInStyle.css">

  
</head>

<body>
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
