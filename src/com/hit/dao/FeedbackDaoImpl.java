package com.hit.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.hit.beans.FeedbackBean;
import com.hit.utility.DBUtil;

public class FeedbackDaoImpl implements FeedbackDao{

	@Override
	public String addFeedback(String vendorId, String vendorEmail, String feedTitle, String feedDesc) {
		String status = "Feedback Addition Failed";
		Connection con = DBUtil.provideConnection();
		PreparedStatement ps = null;
		try {
			ps = con.prepareStatement("insert into feedback(vendorId,vendorEmail,feedTitle,feedDesc) values(?,?,?,?)");
			
			ps.setString(1, vendorId);
			ps.setString(2, vendorEmail);
			ps.setString(3, feedTitle);
			ps.setString(4, feedDesc);
			
			int k = ps.executeUpdate();

			if(k>0){
				status = "Feedback Added Successfully";
				
			}
		} catch (Exception e) {
			status = "Error: " +e.getMessage();
			e.printStackTrace();
		} finally{
			DBUtil.closeConnection(con);
			
			DBUtil.closeConnection(ps);
		}
		return status;
	}

	@Override
	public List<FeedbackBean> viewAllNotice() {
		List<FeedbackBean> feedList = new ArrayList<FeedbackBean>();
		Connection con = DBUtil.provideConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			ps = con.prepareStatement("select * from feedback");
			
			rs = ps.executeQuery();
			
			while(rs.next()){
				
				FeedbackBean notice = new FeedbackBean();
				
				notice.setFeedbackId(rs.getInt("feedbackId"));
				notice.setVendorId(rs.getString("vendorId"));
				notice.setVendorEmail(rs.getString("vendorEmail"));				
				notice.setFeedTitle(rs.getString("feedTitle"));
				notice.setFeedDesc(rs.getString("feedDesc"));
				
				feedList.add(notice);
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		finally{
			
			DBUtil.closeConnection(con);
			
			DBUtil.closeConnection(rs);
			
			DBUtil.closeConnection(ps);
		}
		
		return feedList;
	}

	
}
