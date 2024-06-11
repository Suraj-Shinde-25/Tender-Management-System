<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="java.sql.*, java.lang.Integer,com.hit.beans.FeedbackBean,com.hit.utility.DBUtil,java.util.List,java.util.ArrayList,com.hit.dao.FeedbackDaoImpl,com.hit.dao.FeedbackDao, javax.servlet.annotation.WebServlet" errorPage="errorpage.jsp"%>
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
    th,tr{
    	height:50px;
    	border:2px black solid;
    	
    }
   
    td{
    	min-width:145px;
    	border: 2px dashed black;
    }
 table{
    	text-align:center;
    	border-radius:10px;
		border:1px red solid;
		text-align:center;
		background-color: cyan;
		margin:20px;
		color:blue;
		font-style:normal;
		font-size: 15.5px;
		padding:20px;
		cellpadding:10;
		cellspacing:10;
    }
    tr:hover{
    	background-color: #DEBEE1;
    	color:black;
    } 
    textarea:hover{
    	background-color:#DEBEE1;
    	color:black;
    }
    button:hover{
    	background-color:red;
    	color:white;
    	font-size:bold;
    }
    </style>
  </head>
<body>


	<%
		String user = (String)session.getAttribute("user");
		String uname = (String)session.getAttribute("username");
		String pword = (String)session.getAttribute("password");
		
		if(!user.equalsIgnoreCase("admin") || uname.equals("") || pword.equals("")){
			
			response.sendRedirect("loginFailed.jsp");
			
		}
	
	%>


	<!-- Including the header of the page  -->
	
	<jsp:include page="header.jsp"></jsp:include>
	
	<jsp:include page="adminMenu.jsp"></jsp:include>
	
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
      
          
   <div class="col-md-8">
    <!-- <div class="marquee" style="border:2px black hidden; background-color:white">
        <h4 style="background-color:black; margin-top:-1.8px; margin-bottom:1px;padding: 5px; text-align: center;color:red;font-weight:bold">
        &nbsp; <span id="pagetitle">Admin Account</span></h4>pagetitle id is given here
        <div class="marquee-content" style="align:center; padding-top:200px;min-height:750px;background-color:cyan">
     		 -->
    <!-- <table style="background-color:white">		
     		<tr style="color:white; font-size:22px; font-weight:bold;background-color:#26b0b0">
     		 <td style="border: 2px solid black; padding: 5px;">Feedback Id</td>
     		 <td style="border: 2px solid black; padding: 5px;">Vendor Id</td>
     		 <td style="border: 2px solid black; padding: 5px;">Vendor Email</td> 
     		 <td style="border: 2px solid black; padding: 5px;">feedback Title </td> 
     		 <td style="border: 2px solid black; padding: 5px;"> Feedback Description</td> </tr>  --> 
     		<div style="background-color: #26b0b0; padding:3px 0px; ;text-align: center; font-style: bold; width: 900px; margin-left: 30px; margin-top: 10px ">
     			<h1>List of Feedback</h1>
     		</div>
     		<%
     			FeedbackDao dao = new FeedbackDaoImpl();
     			List<FeedbackBean> feedbackList = dao.viewAllNotice();
     			
     			for(FeedbackBean notice : feedbackList){
     				
     				int feedbackId = notice.getFeedbackId();
     				String vendorId = notice.getVendorId();
     				String vendorEmail = notice.getVendorEmail();
     				String feedTitle = notice.getFeedTitle();     				
     				String feedDesc = notice.getFeedDesc();
     				
     				%>
     				
     
     	<!-- 	<tr> 
     			<td style="border: 2px solid black; padding: 2px;"><%=feedbackId %></td> 
	     		<td style="border: 2px solid black; padding: 10px;"><%=vendorId %></td> 
	     		<td style="border: 2px solid black; padding: 5px;"><%=vendorEmail %></td> 
	     		<td style="border: 2px solid black; padding: 10px;"><%=feedTitle %></td> 
	     		<td cols="70" style="border: 2px solid black; padding: 10px;"><%=feedDesc %></td>
	     	</tr> -->
     		
     		<div style="display: flex; flex-direction: column; background-color: white; color: black; margin: 30px;
     		 padding: 15px; border-radius: 0px; border: 2px solid #26b0b0;">
     			<div style="display: flex; flex-direction: row; ">
     				<h3 style="color: #d90429; margin-left: 10px;">Feedback Id :  </h3>
     				<h3 style="margin-left: 20px"><%=feedbackId %></h3>
     			</div>
     			<div style="display: flex; flex-direction: row;">
     				<h3 style="color: #d90429; margin-left: 10px;">Vendor Id :  </h3>
     				<h3 style="margin-left: 20px"><%=vendorId %></h3>
     			</div>
     			<div style="display: flex; flex-direction: row;">
     				<h3 style="color: #d90429; margin-left: 10px;">Vendor Email :  </h3>
     				<h3 style="margin-left: 20px"><%=vendorEmail %></h3>
     			</div>
     			<div style="display: flex; flex-direction: row;">
     				<h3 style="color: #d90429; margin-left: 10px;">Feedback Title :  </h3>
     				<h3 style="margin-left: 20px"><%=feedTitle %></h3>
     			</div>
     			<div style="display: flex; flex-direction: row;">
     				<h3 style="color: #d90429; margin-left: 10px;">Feedback Description :  </h3>
     				<h3 style="margin-left: 20px"><%=feedDesc %></h3>
     			</div>
     		</div>
     		
     
 <% } %>
 <!--    </table>	
     		
      </div>
     </div> -->
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
