<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="java.sql.*, com.hit.utility.DBUtil, javax.servlet.annotation.WebServlet" errorPage="errorpage.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
  <head>
    <link rel="shortcut icon" type="image/png" href="images/Banner_Hit.png">
    <!--link rel="shortcut icon" type="image/ico" href="images/hit_fevicon.ico"-->
	
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tender Management System</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/annimate.css">
    <link href="css/font-awesome.min.css" type="text/css" rel="stylesheet">
    <link href="css/SpryTabbedPanels.css" type="text/css" rel="stylesheet">
    <!--link rel="stylesheet" href="css/styles.css"-->
    <link href="https://fonts.googleapis.com/css?family=Black+Ops+One" rel="stylesheet">
    <link href="css/bootstrap-dropdownhover.min.css">
    <link rel="stylesheet" href="css/style2.css">
    <style>
	.tab{
	border-radius:1px;
		border:1px black solid;
		background-color: #FFE5CC;
		margin-left: 25%;
		width:450px;
		color:green;
		font-weight: bold;
		font-style:normal;
		text-align:center;
		font-size: 20px;
		margin-bottom:10px;
		padding:20px;
	}
    </style>
  </head>
<body>
	<!-- Including the header of the page  -->
	
	<jsp:include page="loginHeader.jsp"></jsp:include>
	
	<jsp:include page="menu.jsp"></jsp:include>
	
	<jsp:include page="slider.jsp"></jsp:include> <!--A green color line between header and body part-->
 
     <div class="container-fluid">
     
     	<div class="notice">
        <div class="col-md-3"style="margin-left:2%">
     		<% Connection con = DBUtil.provideConnection(); %>
     		
     		<jsp:include page="notice.jsp"></jsp:include><br>
     		
          <!-- Next marquee starting-->
          <jsp:include page="approved.jsp"></jsp:include><br>
          
        </div>  <!-- End of col-md-3-->
      </div> <!-- End of notice class-->
      
      <!-- Next part of same container-fluid in which galary or other information will be shown-->
      
      <%-- <jsp:include page="login.jsp"></jsp:include> --%>
      
   <div class="col-md-8">
    <div class="marquee" style="border:2px black hidden; background-color:white; padding-top:0px;">
        <h4 style="background-color:#26b0b0; margin-top:-1.8px; margin-bottom:1px;padding: 10px; text-align: center;color:white;font-weight:bold">
        &nbsp; <span id="pagetitle">Account Login</span></h4><!-- pagetitle id is given here -->
        <div class="marquee-content" style="align:center; padding-top:80px;min-height:750px;background-color:white">
      
      <table class="tab" style="color:blue;margin-bottom:50px;background-color:white; padding:25px;">
	
			<!-- <tr>
				<td id="show"></td>
			</tr> -->
	</table>
      
      
      
      <table class="tab hd brown">
		<tr>
			<td style="color:brown; padding: 10px">USER LOGIN</td>
		</tr>
	</table>

	<table class="tab hd blue" style="color: #212529;" border="0px" cellpadding="10" cellspacing="10">
		
		<tr>
			<td>
				<form action="LoginSrv" method="post" style="margin: 20px">
				<br>
					Username: &nbsp; <input type="text" placeholder="Enter Email or VendorId" name="username" required="required" style="color:black;font-size:19px; height: 35px"><br/><br/>
					Password: &nbsp; <input type="password" name="password" required="required" style="color:black;font-size:19px; height: 35px"><br/><br/>
					<input type="submit" value="Login As Vendor" name="user" class="btn btn-primary" >&nbsp; &nbsp; &nbsp; &nbsp;
					<input type="submit" value="Login As Admin" name="user" class="btn btn-primary"><br/><br/>
				</form>
			</td>
			
		</tr>  
	</table>
      </div>
     </div>
     </div>
      
      
    </div> <!-- End of container-fluid-->
	
	
	<!-- <div class="container" style="height:300px">
	ucomment this if you want to add some space in the lower part of page
	</div> -->



<!-- Now from here the footer section starts-->
                      
<!-- Including the footer of the page -->
    
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
