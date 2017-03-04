<<<<<<< HEAD
<!DOCTYPE html>
<html >
<head>
  <meta charset="UTF-8">
  <title>Edit</title>
  
  
  <link rel='stylesheet prefetch' href='http://netdna.bootstrapcdn.com/bootstrap/3.0.2/css/bootstrap.min.css'>

      <link rel="stylesheet" href="css/logInStyle.css">

  
</head>

<body>
    <div class="wrapper">
    <form class="form-signin" method="post" action="EditAccServlet">   
			<center>
		<img class="img-circle" src="img/edit-.jpg"  style="width:128px;height:128px;">
			</center>
        <h2 class="form-signin-heading">Hi ${sessionScope.user.getEmail()}</h2>
	  
        <input type="text" class="form-control" name="userName" value="${sessionScope.user.getUserName()}" required="" autofocus="" />
	  
        <input type="text" class="form-control" name="address" value="${sessionScope.user.getAddress()}" required="" autofocus="" />
	  
        <input type="password" class="form-control" name="password" value="${sessionScope.user.getPassword()}" required=""/>      
    
      <button class="btn btn-lg btn-primary btn-block" type="submit">Save</button>   
    </form>
  </div>
  
  
</body>
</html>
