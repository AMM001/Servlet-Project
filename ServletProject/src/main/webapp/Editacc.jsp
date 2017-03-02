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
    <form class="form-signin">   
			<center>
		<img class="img-circle" src="img/edit-.jpg"  style="width:128px;height:128px;">
			</center>
        <h2 class="form-signin-heading">Hi ${sessionScope.user.getEmail()}</h2>
	  
      <input type="text" class="form-control" name="fullName" placeholder="Fullname" required="" autofocus="" />
	  
      <input type="text" class="form-control" name="userName" placeholder="userName" required="" autofocus="" />
	  
      <input type="text" class="form-control" name="Address" placeholder=" Address" required="" autofocus="" />
	  
      <input type="password" class="form-control" name="password" placeholder="Password" required=""/>      
    
      <button class="btn btn-lg btn-primary btn-block" type="submit">Save</button>   
    </form>
  </div>
  
  
</body>
</html>
