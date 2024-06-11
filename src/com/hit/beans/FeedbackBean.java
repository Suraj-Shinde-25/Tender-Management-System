package com.hit.beans;

import java.io.Serializable;


public class FeedbackBean implements Serializable{
	private static final long serialVersionUID = 1L;

	public int feedbackId;
	
	public String vendorId;
	public String vendorEmail;
	public String feedTitle;
	
	public String feedDesc;

	public int getFeedbackId() {
		return feedbackId;
	}

	public void setFeedbackId(int feedbackId) {
		this.feedbackId = feedbackId;
	}

	public String getVendorId() {
		return vendorId;
	}

	public void setVendorId(String vendorId) {
		this.vendorId = vendorId;
	}

	public String getVendorEmail() {
		return vendorEmail;
	}

	public void setVendorEmail(String vendorEmail) {
		this.vendorEmail = vendorEmail;
	}

	public String getFeedTitle() {
		return feedTitle;
	}

	public void setFeedTitle(String feedTitle) {
		this.feedTitle = feedTitle;
	}

	public String getFeedDesc() {
		return feedDesc;
	}

	public void setFeedDesc(String feedDesc) {
		this.feedDesc = feedDesc;
	}
	
	
	public FeedbackBean(int feedbackId, String vendorId, String vendorEmail, String feedTitle, String feedDesc) {
		super();
		this.feedbackId = feedbackId;
		this.vendorId = vendorId;
		this.vendorEmail = vendorEmail;
		this.feedTitle = feedTitle;
		this.feedDesc = feedDesc;
	}

	public FeedbackBean() {
		super();
	}
}