package com.zhiyou100.service.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zhiyou100.mapper.VideoMapper;
import com.zhiyou100.model.Course;
import com.zhiyou100.model.SearchVideo;
import com.zhiyou100.model.Speaker;
import com.zhiyou100.model.Video;
import com.zhiyou100.service.VideoService;

@Service
public class VideoServiceImpl implements VideoService {
	
	@Autowired
	VideoMapper videoMapper;
	
	// 查询所有video
	public List<Video> videoList(SearchVideo searchVideo) {
		List<Video> videos = videoMapper.videoList(searchVideo);
		return videos;
	}
	// 查询讲师
	public List<Speaker> findSpeaker() {
		List<Speaker> speakers =  videoMapper.findSpeaker();
		return speakers;
	}
	// 查询course
	public List<Course> findCourse() {
		List<Course> courses = videoMapper.findCourse();
		return courses;
	}
	// 添加video
	public void addVideo(Video video) {
		videoMapper.addVideo(video);
	}
	// 编辑video回显
	public Video updateVideo(int id) {
		Video video = videoMapper.updateVideo(id);
		return video;
	}
	// 编辑video并保存
	public void updateVideoMax(Video video) {
		videoMapper.updateVideoMax(video);
	}
	//批量删除
	public void deleteBatchVideo(int[] checkId) {
		videoMapper.deleteBatchVideo(checkId);
	}
	// 删除video
	public void deleteVideo(int id) {
		videoMapper.deleteVideo(id);
	}

}
