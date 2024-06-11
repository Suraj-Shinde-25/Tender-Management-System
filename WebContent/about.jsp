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
          
   <div class="col-md-8">
    <div class="marquee" style="border:2px black hidden; background-color:white">
        <h3 style="background-color:#26b0b0; margin-top:-1.8px; margin-bottom:1px;padding: 15px; text-align: center;color:black;font-weight:bold">
        &nbsp; <span id="pagetitle">About Us</span></h3><!-- pagetitle id is given here -->
        <div class="marquee-content" style="align:center;min-height:750px;background-color:white; padding: 60px 90px; font-size: 18px; line-height: 0.9cm">
     		<p style="">Welcome to Tender Management System, your trusted partner in tender management solutions. At Tender Management System, we understand the critical importance of efficient and effective tender processes in today's competitive business landscape. Our mission is to simplify the tender management journey for businesses of all sizes, enabling them to focus on their core competencies while we handle the complexities of tendering</p>	
     	<h2><b>What We Do</b></h2>
     	<p>At Tender Management System, we provide a cutting-edge tender management platform designed to empower businesses to manage their tender processes with ease and confidence. Our platform offers a range of features including:</p>
     	<ul>
     		<li><b>Tender Creation:</b> Easily create, customize, and publish tenders tailored to your specific requirements.</li>
     		<li><b>Document Management:</b> Centralize all tender-related documents securely in one place for easy access and collaboration.</li>
     		<li><b>Bid Evaluation:</b> Streamline the bid evaluation process with automated scoring and evaluation tools.</li>
     		<li><b>Reporting and Analytics:</b> Gain valuable insights into your tendering process with comprehensive reporting and analytics.</li>
     	</ul>
      </div>
     </div>
     </div>
      
      
      
      
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
