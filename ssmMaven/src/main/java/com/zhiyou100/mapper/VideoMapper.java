package com.zhiyou100.mapper;

import java.util.List;

import com.zhiyou100.model.Course;
import com.zhiyou100.model.SearchVideo;
import com.zhiyou100.model.Speaker;
import com.zhiyou100.model.Video;

public interface VideoMapper {
	// 查询所有video 模糊查询
	List<Video> videoList(SearchVideo searchVideo);
	// 查询讲师
	List<Speaker> findSpeaker();
	// 查询course
	List<Course> findCourse();
	// 添加video
	void addVideo(Video video);
	// 编辑video回显
	Video updateVideo(int id);
	// 编辑video并保存
	void updateVideoMax(Video video);
	//批量删除
	void deleteBatchVideo(int[] checkId);
	// 删除video
	void deleteVideo(int id);
}
