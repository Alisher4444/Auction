<%-- 
    Document   : register
    Created on : 05.11.2016, 14:23:17
    Author     : Alisher
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration</title>  
        <link rel="stylesheet" href="css/style.css">
        <script type="text/javascript">
            document.getElementById("uploadBtn").onchange = function () {
            document.getElementById("uploadFile").value = this.value;
            };
        </script>
        
        
    </head>
    
    <body>
        <div class="container">

        <div id="login-form">
          <h3>Registration</h3>
          <fieldset>
            <form action="./reigsterServlet" method="post" enctype="multipart/form-data">
              <input type="email" required name="email" placeholder="Email"> 
              <input type="password" required name="password" placeholder="Password"> 
              <input type="text" required name="name" placeholder="Name"> 
              <input type="text" required name="surname" placeholder="Surname"> 
              <input type="file" id="uploadFile" class="upload" name="image">
                
              <input type="submit"  name="register" value="Registration">
              
              <footer class="clearfix">
                <p><span class="info">?</span><a href="#">Are you login</a></p>
              </footer>
            </form>
          </fieldset>
        </div> 

      </div>
    </body>
</html>
