<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<base href="${BaseContext }">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>视频列表 -视频管理</title>
<link href="<c:url value="/css/bootstrap.min.css" />" rel="stylesheet">
<script src="<c:url value="/js/bootstrap.min.js" />"></script>

</head>
<body>

	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar" aria-expanded="false"
					aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">视频管理系统</a>
			</div>
			<div id="navbar" class="collapse navbar-collapse">
				<ul class="nav navbar-nav">
					<li class="active" ><a href="#">视频管理</a></li>
					<li><a href="#about">主讲人管理</a></li>
					<li><a href="#contact">课程管理</a></li>
				</ul>
			</div>
			<!--/.nav-collapse -->
		</div>
	</nav>

	<div class="container">
		<div class="jumbotron">
			<h2>编辑视频 - 视频管理</h2>
		</div>

		<form class="form-horizontal" action="<c:url value="/video/update.do" />"
			method="post" enctype="multipart/form-data">
			<div class="form-group">
				<label for="videoTitle" class="col-sm-2 control-label">视频标题</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" name="title"
						id="videoTitle" placeholder="视频标题"  value="${videoId.title }">
				</div>
			</div>

			<div class="form-group">
				<label for="speakerName" class="col-sm-2 control-label">主讲人</label>
				<div class="col-sm-10">
					<select name="speakerId">
						<c:forEach items="${speakers }" var="speaker">
							<option value="${speaker.id}" ${speaker.id == videoId.speakerId?'selected':'' }>
							${speaker.speakerName }
							</option>
							<p>speak=${speaker.id}  video=${videoId.speakerId}</p>
						</c:forEach>
					</select>
				</div>
			</div>

			<div class="form-group">
				<label for="courseTitle" class="col-sm-2 control-label">所属课程</label>
				<div class="col-sm-10">
					<select name="courseId">
						<c:forEach items="${courses }" var="course">
							<option value="${course.id  }" ${course.id == videoId.courseId?'selected':''}>
							${course.courseTitle }
							</option>
						</c:forEach>
					</select>
				</div>
			</div>

			<div class="form-group">
				<label for="playTime" class="col-sm-2 control-label">视频时长</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" name="time"
						id="playTime" placeholder="视频时长" value="${videoId.time }">
				</div>
			</div>
			<div class="form-group">
				<label for="imageUrl" class="col-sm-2 control-label">封面图片</label>
				<div class="col-sm-10">
					<input type="file" class="form-control" name="files" id="imageUrl">
					<input type="hidden" name="imgUrl" value="${videoId.imageUrl }">
					<img style="width: 100px; height: 100px;" alt="图片找不到了" src="/upload/${videoId.imageUrl }">
				</div>
			</div>

			<div class="form-group">
				<label for="videoUrl" class="col-sm-2 control-label">上传视频</label>
				<div class="col-sm-10">
					<input type="file" class="form-control" name="files" value="${videoId.videoUrl }" >
					<input type="hidden" name="videoUrl" value="${videoId.videoUrl }">
					<video style="width: 50%; height: 20%;" src="/upload/${videoId.videoUrl }" controls="controls"></video>
				</div>
			</div>

			<div class="form-group">
				<label for="playNum" class="col-sm-2 control-label">播放次数</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" name="playNum" id="playNum"
						placeholder="播放次数" value="${videoId.playNum }" />
				</div>
			</div>
			<input type="hidden" name="id" value="${videoId.id }">
			<div class="form-group">
				<label for="videoDescription" class="col-sm-2 control-label">简介</label>
				<div class="col-sm-10">
					<textarea class="form-control" name="videoDescription"
						id="videoDescription" rows="3"></textarea>
				</div>
			</div>

			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="submit" class="btn  btn-primary">保存</button>
					<a href="admin/vidoe/index.action" class="btn btn-default">返回列表</a>
				</div>
			</div>
		</form>

	</div>


</body>
</html>