<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="java.sql.*,java.lang.Integer,java.lang.String, com.hit.beans.TenderStatusBean,com.hit.utility.DBUtil,java.util.List,com.hit.dao.TenderDaoImpl,com.hit.dao.TenderDao, javax.servlet.annotation.WebServlet" errorPage="errorpage.jsp"%>
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
    button:hover{
    	background-color:red;
    	color:white;
    }
    </style>
  </head>
<body>


	<%
		String user = (String)session.getAttribute("user");
		String uname = (String)session.getAttribute("username");
		String pword = (String)session.getAttribute("password");
		
		if(user==null || !user.equalsIgnoreCase("admin") || uname.equals("") || pword.equals("")){
			
			response.sendRedirect("loginFailed.jsp");
			
		}
	
	%>


	<!-- Including the header of the page  -->
	
	<jsp:include page="header.jsp"></jsp:include>
	
	<jsp:include page="adminMenu.jsp"></jsp:include>
	
	<jsp:include page="slider.jsp"></jsp:include> <!--A green color line between header and body part-->
 
     <div class="container-fluid">
     
     	 <div class="notice">
        <div class="col-md-3"style="margin-left:2%"> -->
     		<% Connection con = DBUtil.provideConnection(); %>
     		
     		 <jsp:include page="notice.jsp"></jsp:include><br>
     		
          <!-- Next marquee starting-->
          <jsp:include page="approved.jsp"></jsp:include><br> 
          
        </div>  <!-- End of col-md-3-->
      </div> <!-- End of notice class-->
      
      
      <!-- Next part of same container-fluid in which galary or other information will be shown-->
      
          
   <div class="col-md-8">
    
     <table style="border-radius:10px; border-color: #26b0b0; margin-left: 15%"  >
			<tr>
				<td id="show" style="margin-left:350px; min-width:640px; border: 2px solid #26b0b0; background-color:white;min-height:0px;color:black; font-size: 20px">All Assigned Tenders List</td>
			</tr>
	</table>
    
    
     <table style="background-color:white; margin-left:15%;  color: #003049">		
     		<tr style="color:white; font-size:18px; font-weight:bold;background-color:#26b0b0"> 
	     		<td style="padding: 5px; border: 2px solid black">Tender Id</td> 
	     		<td style="padding: 5px 25px; border: 2px solid black">Vendor Id </td> 
     			<td style="padding: 5px 25px;  border: 2px solid black"> Application Id </td> 
     			<td style="padding: 5px; border: 2px solid black">Status</td> </tr>
     		<%
     			TenderDao dao = new TenderDaoImpl();
     			List<TenderStatusBean> statusList = dao.getAllAssignedTenders();
     			
     			for(TenderStatusBean status : statusList){
     				
     				%>
     				
     
     		<tr> <td style="padding: 5px 15px; border: 2px solid black"><a href="viewTenderBidsForm.jsp?tid=<%=status.getTendorId()%>"><%=status.getTendorId() %></a></td> 
     				<td style="padding: 5px 15px; border: 2px solid black"><a href="adminViewVendorDetail.jsp?vid=<%= status.getVendorId() %>"><%=status.getVendorId() %></a></td> 
     				<td style="padding: 5px; border: 2px solid black"><%=status.getBidderId() %></td> 
     				<td style="padding: 5px; border: 2px solid black"><%=status.getStatus() %></td> 
     		</tr>
     		
     		
     
 <% } %>
    </table>	
     		
      <!-- </div>
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
