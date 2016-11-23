<%-- 
    Document   : profile.jsp
    Created on : 03.11.2016, 13:35:55
    Author     : Alisher
--%>


<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.logging.Level"%>
<%@page import="db.DB"%>
<%@page import="javax.servlet.http.HttpServletRequest;"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<!DOCTYPE html>
<html>
<title>Auction Page</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/profile.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
<style>
body,h1,h2,h3,h4,h5,h6 {font-family: "Raleway", sans-serif}
.w3-sidenav a,.w3-sidenav h4 {font-weight:bold}
</style>
<body class="w3-light-grey w3-content" style="max-width:1600px">

<!-- Sidenav/menu -->
<nav class="w3-sidenav w3-collapse w3-white w3-animate-left" style="z-index:3;width:300px;" id="mySidenav"><br>
  <div class="w3-container">
    <a href="#" onclick="w3_close()" class="w3-hide-large w3-right w3-jumbo w3-padding" title="close menu">
      <i class="fa fa-remove"></i>
    </a>
   
      <img src="upload_page.jsp" style="width:45%;" class="w3-round"><br><br>
      
    
      <h4 class="w3-padding-0"><b>PROFILE</b></h4>
    <p class="w3-text-grey"><%
        if(request.getParameter("link")==null){
            out.print(session.getAttribute("User"));
        }else{
            out.print(session.getAttribute(null));
        }
    %></p>
    
  </div>
  <a href=profile.jsp onclick="w3_close()" class="w3-padding w3-text-teal"><i class="fa fa-th-large fa-fw w3-margin-right"></i>AUCTION</a>
  <a href="basket_page.jsp" onclick="w3_close()" class="w3-padding"><i class="fa fa-user fa-fw w3-margin-right"></i>SHOPPING CART</a>
  <a href="#contact" onclick="w3_close()" class="w3-padding"><i class="fa fa-envelope fa-fw w3-margin-right"></i>CONTACT</a>
  <p class="w3-text-grey"><a href="index.html" name="link">Log out</a></p> 
  <div class="w3-section w3-padding-top w3-large">
    <a href="#" class="w3-hover-white w3-hover-text-indigo w3-show-inline-block"><i class="fa fa-facebook-official"></i></a>
    <a href="#" class="w3-hover-white w3-hover-text-red w3-show-inline-block"><i class="fa fa-pinterest-p"></i></a>
    <a href="#" class="w3-hover-white w3-hover-text-light-blue w3-show-inline-block"><i class="fa fa-twitter"></i></a>
    <a href="#" class="w3-hover-white w3-hover-text-grey w3-show-inline-block"><i class="fa fa-flickr"></i></a>
    <a href="#" class="w3-hover-white w3-hover-text-indigo w3-show-inline-block"><i class="fa fa-linkedin"></i></a>
  </div>
</nav>

<!-- Overlay effect when opening sidenav on small screens -->
<div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>

<!-- !PAGE CONTENT! -->
<div class="w3-main" style="margin-left:300px">

  <!-- Header -->
  <header class="w3-container" id="portfolio">
    <a href="#"><img src="/w3images/avatar_g2.jpg" style="width:65px;" class="w3-circle w3-right w3-margin w3-hide-large w3-hover-opacity"></a>
    <span class="w3-opennav w3-hide-large w3-xxlarge w3-hover-text-grey" onclick="w3_open()"><i class="fa fa-bars"></i></span>
    <h1><b>Online Auction</b></h1>
    <div class="w3-section w3-bottombar w3-padding-16">
      <span class="w3-margin-right">Filter:</span>
      <button class="w3-btn" name="ALL">ALL</button>
      <button class="w3-btn w3-white"><i class="fa fa-diamond w3-margin-right"></i>Design</button>
      <button class="w3-btn w3-white w3-hide-small"><i class="fa fa-photo w3-margin-right"></i>Photos</button>
      <button class="w3-btn w3-white w3-hide-small"><i class="fa fa-map-pin w3-margin-right"></i>Art</button>
    </div>
  </header>
  <style>
            input[type=text] {
                width: 96%;
                box-sizing: border-box;
                border: 2px solid #ccc;
                border-radius: 4px;
                font-size: 12px;
                margin-left: 20px;
                margin-right:20px;
                margin-bottom: 20px;
                height: 20px;
                
                background-color: white;
                background-image: url('searchicon.png');
                background-position: 10px 10px;
                background-repeat: no-repeat;
                padding: 12px 20px 12px 40px;
                -webkit-transition: width 0.4s ease-in-out;
                transition: width 0.4s ease-in-out;
            }

        </style>
  <form action="profile.jsp" method="post">
    <input type="text" name="search" placeholder="Search..">
  </form>
        
        <% 
       
            String search = request.getParameter("search");
            request.setAttribute("search", search);
            session.setAttribute("search",search);
            if(search!=null){
                
%>

<div class="w3-row-padding">      
    <%        
        Connection con=null;
        String name=null;
        PreparedStatement st=null;
        ResultSet rs=null;
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/base","root","qwerty");
            
            st=con.prepareStatement("SELECT *FROM AUCTION WHERE NAME=?");
            
                st.setString(1,request.getAttribute("search").toString());
                
                rs=st.executeQuery();
                while(rs.next())
                {
            %>
  <!-- First Photo Grid-->
  
    <div class="w3-third w3-container w3-margin-bottom">
      <img src="upload_image_auction.jsp"  style="width:100%; height:220px;" class="w3-hover-opacity">
      <div class="w3-container w3-white">
        <p><b><%out.print(rs.getString("NAME"));%></b></p>
        <p>Praesent tincidunt sed tellus ut rutrum. Sed vitae justo condimentum, porta lectus vitae, ultricies congue gravida diam non fringilla.</p>
      </div>
    </div>
  
  <%   }        
            
            
        } catch (Exception ex) {
            ex.printStackTrace();
        }%>
</div>


<%
            
        }else {%>
        <div class="w3-row-padding">      
    <%        
        Connection con=null;
        String name=null;
        PreparedStatement st=null;
        ResultSet rs=null;
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/base","root","qwerty");
            
            st=con.prepareStatement("SELECT *FROM AUCTION WHERE IDAUCTION=?");
            for(int i=1;i<=1;i++){
                st.setInt(1,i);
                
                rs=st.executeQuery();
                while(rs.next())
                {
            %>
  <!-- First Photo Grid-->
  
    <div class="w3-third w3-container w3-margin-bottom">
      
        <img src="default_page_auction_image.jsp"  style="width:100%; height:220px;" class="w3-hover-opacity">
      <div class="w3-container w3-white">
        <p><b><%out.print(rs.getString("NAME"));%></b></p>
        <p>Praesent tincidunt sed tellus ut rutrum. Sed vitae justo condimentum, porta lectus vitae, ultricies congue gravida diam non fringilla.</p>
      </div>
    </div>
  
  <%   }        
         }    
            
        } catch (Exception ex) {
            ex.printStackTrace();
        }}%>
</div>


     
  
  <!-- Pagination -->
  <div class="w3-center w3-padding-32">
    <ul class="w3-pagination">
      <li><a class="w3-black" href="#">1</a></li>
      <li><a class="w3-hover-black" href="#">2</a></li>
      <li><a class="w3-hover-black" href="#">3</a></li>
      <li><a class="w3-hover-black" href="#">4</a></li>
      <li><a class="w3-hover-black" href="#">»</a></li>
    </ul>
  </div>


  <!-- Footer -->
  <footer class="w3-container w3-padding-32 w3-dark-grey">
  <div class="w3-row-padding">
    <div class="w3-third">
      <h3>FOOTER</h3>
      <p>Praesent tincidunt sed tellus ut rutrum. Sed vitae justo condimentum, porta lectus vitae, ultricies congue gravida diam non fringilla.</p>
      <p>Powered by <a href="http://www.w3schools.com/w3css/default.asp" target="_blank">w3.css</a></p>
    </div>
  
    <div class="w3-third">
      <h3>BLOG POSTS</h3>
      <ul class="w3-ul w3-hoverable">
        <li class="w3-padding-16">
          <img src="/w3images/workshop.jpg" class="w3-left w3-margin-right" style="width:50px">
          <span class="w3-large">Lorem</span><br>
          <span>Sed mattis nunc</span>
        </li>
        <li class="w3-padding-16">
          <img src="/w3images/gondol.jpg" class="w3-left w3-margin-right" style="width:50px">
          <span class="w3-large">Ipsum</span><br>
          <span>Praes tinci sed</span>
        </li>
      </ul>
    </div>

    <div class="w3-third">
      <h3>POPULAR TAGS</h3>
      <p>
        <span class="w3-tag w3-black w3-margin-bottom">Travel</span> <span class="w3-tag w3-grey w3-small w3-margin-bottom">New York</span> <span class="w3-tag w3-grey w3-small w3-margin-bottom">London</span>
        <span class="w3-tag w3-grey w3-small w3-margin-bottom">IKEA</span> <span class="w3-tag w3-grey w3-small w3-margin-bottom">NORWAY</span> <span class="w3-tag w3-grey w3-small w3-margin-bottom">DIY</span>
        <span class="w3-tag w3-grey w3-small w3-margin-bottom">Ideas</span> <span class="w3-tag w3-grey w3-small w3-margin-bottom">Baby</span> <span class="w3-tag w3-grey w3-small w3-margin-bottom">Family</span>
        <span class="w3-tag w3-grey w3-small w3-margin-bottom">News</span> <span class="w3-tag w3-grey w3-small w3-margin-bottom">Clothing</span> <span class="w3-tag w3-grey w3-small w3-margin-bottom">Shopping</span>
        <span class="w3-tag w3-grey w3-small w3-margin-bottom">Sports</span> <span class="w3-tag w3-grey w3-small w3-margin-bottom">Games</span>
      </p>
    </div>

  </div>
  </footer>
  
  <div class="w3-black w3-center w3-padding-24">Powered by <a href="http://www.w3schools.com/w3css/default.asp" title="W3.CSS" target="_blank" class="w3-hover-opacity">w3.css</a></div>

<!-- End page content -->
</div>

<script>
// Script to open and close sidenav
function w3_open() {
    document.getElementById("mySidenav").style.display = "block";
    document.getElementById("myOverlay").style.display = "block";
}
 
function w3_close() {
    document.getElementById("mySidenav").style.display = "none";
    document.getElementById("myOverlay").style.display = "none";
}
</script>

</body>
</html>

