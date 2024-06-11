<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="java.sql.*, com.hit.utility.DBUtil, javax.servlet.annotation.WebServlet, com.hit.beans.VendorBean " errorPage="errorpage.jsp"%>
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
  </head>
<body>

	<%
		String user = (String)session.getAttribute("user");
		String uname = (String)session.getAttribute("username");
		String pword = (String)session.getAttribute("password");
		
		if(!user.equalsIgnoreCase("user") || uname.equals("") || pword.equals("")){
			
			response.sendRedirect("loginFailed.jsp");
			
		}
	
	%>
	
	<!-- Including the header of the page  -->
	
	<jsp:include page="header.jsp"></jsp:include>
	
	<jsp:include page="vendorMenu.jsp"></jsp:include>
	
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
      <%
	
		VendorBean vendor = (VendorBean)session.getAttribute("vendordata");
	
		%>
          
          <div class="col-md-8" style="padding-left: 100px">
    <!-- <div class="marquee" style="border:2px black hidden; background-color:white">
        <h4 style="background-color:black; margin-top:-1.8px; margin-bottom:1px;padding: 5px; text-align: center;color:red;font-weight:bold">
        &nbsp; <span id="pagetitle">Tender Creation</span></h4>pagetitle id is given here
        <div  class="marquee-content" style="align:center; padding-top:5px;min-height:750px;background-color:cyan">
      --> 

     	<table style="border-radius:10px; margin-bottom: 30px; width: 800px" >
			<tr >
				<td id="show" style="padding: 8px; background-color: white; min-width:640px; height:40px;color:black; border: 2px solid #26b0b0; text-align: center;font-size: 20px;">Enter Feedback Below</td>
			</tr>
		</table>
            


	<form action="AddFeedbackSrv" method="post" style="width: 500px">
		<table style="background-color:white; width: 800px; height: 500px; font-size: 20px">
			<th colspan="2" style="background-color: #26b0b0; border: 2px solid black; text-align: center; font-size: 22px">Feedback</th>
			<tr>
				<td style="color: #003049; border: 2px solid black; padding: 5px 20px;"> Id  : </td>
				<td style="border: 2px solid black; padding: 5px 20px;"><%= vendor.getId()%></td>
			</tr>
			<tr>
				<td style="color:#003049; border: 2px solid black; padding: 5px 20px;"> Email  : </td>
				<td style="border: 2px solid black; padding: 5px 20px;"><%= vendor.getEmail()%></td>
			</tr>
			<tr>
				<td style="color:#003049; border: 2px solid black; padding: 5px 20px;"> Feedback Title  : </td>
				<td style="border: 2px solid black; padding: 5px 20px;"><input type="text" name="feedtitle" required="required" style="height: 35px; width: 430px"></td>
			</tr>
		   	<tr>
		   		<td style="color:#003049; border: 2px solid black; padding: 5px 20px;">Feedback Descripton   : </td>
		   		<td style="border: 2px solid black; padding: 5px 20px;"> <textarea rows="4" cols="40" style="font-size:15px; width: 430px; height: 150px" name="feeddesc" required="required"></textarea></td>
		   	</tr>
					
			<tr>
				<td colspan="2" align="center" value="Launch" style="border: 2px solid black;">
				<input type="submit" class="btn btn-primary" style="height: 40px; width: 200px; margin: 8px;" value="Submit" name="user"></td>
			</tr>
			
		</table>
	</form>
	
      <!-- </div>
     </div> -->
     </div>
          
<!--           
   <div class="col-md-8">
    <div class="marquee" style="border:2px black hidden; background-color:white">
        <h4 style="background-color:#26b0b0; margin-top:-1.8px; margin-bottom:1px;padding: 15px; text-align: center;color:black;font-weight:bold">
        &nbsp; <span id="pagetitle">VENDOR ACCOUNT</span></h4>        
        
        <div class="marquee-content" style="align:center; padding-top:200px;min-height:750px;background-color:white">
     		<h1><center>Hey <%= vendor.getName()%>! Welcome to Our Tender Management system</center></h1>
     		<h2><center>Here You can manage your tenders,view tenders and bid for tenders according to their deadline and base price</center></h2>
     	
     
      </div>
     </div>
     </div>  -->
      
      
      
      
     <a><h1></h1></a>
      
    </div> <!-- End of container-fluid-->
	
	
	<!-- <div class="container" style="height:300px">
	ucomment this if you want to add some space in the lower part of page
	</div> -->



<!-- Now from here the footer section starts-->
                      
<!-- Including the footer of the page -->
    
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
