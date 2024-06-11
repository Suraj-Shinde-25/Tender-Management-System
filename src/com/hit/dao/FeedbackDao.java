package com.hit.dao;

import java.util.List;

import com.hit.beans.FeedbackBean;

public interface FeedbackDao {
	
	public String addFeedback(String vendorId, String vendorEmail ,String feedTitle, String feedDesc );
	
	public List<FeedbackBean> viewAllNotice();
}
