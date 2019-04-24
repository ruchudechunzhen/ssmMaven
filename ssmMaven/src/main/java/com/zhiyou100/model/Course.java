package com.zhiyou100.model;

import java.util.List;

public class Course {
	private int id;
	private String courseTitle;
	private String couserDesc;
	private int subjectId;
	private List<Video> videos;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCourseTitle() {
		return courseTitle;
	}
	public void setCourseTitle(String courseTitle) {
		this.courseTitle = courseTitle;
	}
	
	public String getCouserDesc() {
		return couserDesc;
	}
	public void setCouserDesc(String couserDesc) {
		this.couserDesc = couserDesc;
	}
	public int getSubjectId() {
		return subjectId;
	}
	public void setSubjectId(int subjectId) {
		this.subjectId = subjectId;
	}
	public List<Video> getVideos() {
		return videos;
	}
	public void setVideos(List<Video> videos) {
		this.videos = videos;
	}
	@Override
	public String toString() {
		return "Course [id=" + id + ", courseTitle=" + courseTitle + ", couserDesc=" + couserDesc + ", subjectId="
				+ subjectId + ", videos=" + videos + "]";
	}
	
	
	
}
