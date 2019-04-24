package com.zhiyou100.model;

public class SearchVideo {
	private String searchCourse;
	private String searchSpeaker;
	private String searchTitle;
	public String getSearchCourse() {
		return searchCourse;
	}
	public void setSearchCourse(String searchCourse) {
		this.searchCourse = searchCourse;
	}
	public String getSearchSpeaker() {
		return searchSpeaker;
	}
	public void setSearchSpeaker(String searchSpeaker) {
		this.searchSpeaker = searchSpeaker;
	}
	public String getSearchTitle() {
		return searchTitle;
	}
	public void setSearchTitle(String searchTitle) {
		this.searchTitle = searchTitle;
	}
	@Override
	public String toString() {
		return "SearchVideo [searchCourse=" + searchCourse + ", searchSpeaker=" + searchSpeaker + ", searchTitle="
				+ searchTitle + "]";
	}
	
	
	
}
