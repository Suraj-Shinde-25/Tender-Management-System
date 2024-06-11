package com.hit.srv;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.hit.beans.VendorBean;
import com.hit.dao.FeedbackDao;
import com.hit.dao.FeedbackDaoImpl;

/**
 * Servlet implementation class AddFeedbackSrv
 */
@WebServlet("/AddFeedbackSrv")
public class AddFeedbackSrv extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddFeedbackSrv() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		HttpSession session = request.getSession();
		String user = (String)session.getAttribute("user");
		String uname = (String)session.getAttribute("username");
		String pword = (String)session.getAttribute("password");
		
		if(!user.equalsIgnoreCase("user") || uname.equals("") || pword.equals("")){
			
			response.sendRedirect("loginFailed.jsp");
			
		}
		
		VendorBean vendor = (VendorBean)session.getAttribute("vendordata");
		
		String vendorId = vendor.getId().toString();
		String vendorEmail = vendor.getEmail().toString();
		String feedTitle = request.getParameter("feedtitle");
		String feedDesc = request.getParameter("feeddesc");
		
		FeedbackDao dao = new FeedbackDaoImpl();
		
		String status = dao.addFeedback(vendorId, vendorEmail, feedTitle, feedDesc);
		PrintWriter pw = response.getWriter();
		RequestDispatcher rd = request.getRequestDispatcher("feedback.jsp");
		rd.include(request, response);
		pw.print("<script>document.getElementById('show').innerHTML='"+status+"'</script>");
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
