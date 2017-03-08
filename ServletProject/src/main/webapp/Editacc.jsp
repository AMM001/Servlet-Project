<%-- 
    Document   : newjsp
    Created on : Mar 8, 2017, 4:47:56 AM
    Author     : bo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
         <style>
div {
       margin-bottom: 130px;
    margin-right: 261px;
    margin-left: 580px;
}



#txtbox
    {
         font-size: 18pt;
    height: 35px;
    width: 362px;
    }
#h2
{
       /* margin-right: 42px; */
    margin-top: 224px;
    margin-left: 657px;
    /* text-align: right; */
    /* float: none; */
    /* position: relative; */
    display: inline-block;
        font-family: "comic sans Ms";
        color: #68990e;


    
    
}
#img
{
    margin-right: 50px;
    
    
}


.button_example{
border-color:#3A4C7D;border-width: 0px 0px 2px 0px;border-style: solid; -webkit-border-radius: 3px; -moz-border-radius: 3px;border-radius: 3px;font-size:12px;font-family:arial, helvetica, sans-serif; padding: 10px 10px 10px 10px; text-decoration:none; display:inline-block;text-shadow: -1px -1px 0 rgba(0,0,0,0.3);font-weight:bold; color: #FFFFFF;
 background-color: #a5b8da; background-image: -webkit-gradient(linear, left top, left bottom, from(#a5b8da), to(#7089b3));
 background-image: -webkit-linear-gradient(top, #a5b8da, #7089b3);
 background-image: -moz-linear-gradient(top, #a5b8da, #7089b3);
 background-image: -ms-linear-gradient(top, #a5b8da, #7089b3);
 background-image: -o-linear-gradient(top, #a5b8da, #7089b3);
 background-image: linear-gradient(to bottom, #a5b8da, #7089b3);filter:progid:DXImageTransform.Microsoft.gradient(GradientType=0,startColorstr=#a5b8da, endColorstr=#7089b3);
  width: 367px;
}

.button_example:hover{
 border-color:#3A4C7D;border-width: 0px 0px 2px 0px;border-style: solid;
 background-color: #819bcb; background-image: -webkit-gradient(linear, left top, left bottom, from(#819bcb), to(#536f9d));
 background-image: -webkit-linear-gradient(top, #819bcb, #536f9d);
 background-image: -moz-linear-gradient(top, #819bcb, #536f9d);
 background-image: -ms-linear-gradient(top, #819bcb, #536f9d);
 background-image: -o-linear-gradient(top, #819bcb, #536f9d);
 background-image: linear-gradient(to bottom, #819bcb, #536f9d);filter:progid:DXImageTransform.Microsoft.gradient(GradientType=0,startColorstr=#819bcb, endColorstr=#536f9d);

 
}
.label{
    font-family: comic new sans Ms;
}


</style></head>
    <body background="img/back.png">
        <img id="img" src="img/pro_pic.png" width="155" height="155" align="right">
        <h2 id="h2"  >Welcome ${sessionScope.user.getUserName()}</h2>
        
         <center>
         </center>
        <div>
            <form  method="post" action="EditAccServlet" margin="70px">   
               
                
                <label class="label" width="150" height="41">New User Name:<br></label><input id="txtbox" type="text" name="userName" value="${sessionScope.user.getUserName()}" required="" autofocus="" />
                 <br>

                 <label class="label" width="150" height="41">New Address:<br></label><input id="txtbox" type="text" name="address" value="${sessionScope.user.getAddress()}" required="" autofocus="" />
                 <br>

                 <label class="label" width="150" height="41">New Password:<br></label><input id="txtbox" type="password" name="password" value="${sessionScope.user.getPassword()}" required=""/>  
                 <br> <br>

                <button type="submit" class="button_example">Save</button>  
                <br><br>

            </form>
        </div>
    </body>
</html>
