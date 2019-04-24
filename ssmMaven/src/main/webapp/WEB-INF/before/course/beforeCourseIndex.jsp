<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<base href="${BaseContext}">
<meta name="viewport"
	content="initial-scale=1, maximum-scale=1, user-scalable=no">
<meta charset="utf-8">
<meta name="renderer" content="webkit">
<meta name="keywords"
	content="Web前端视频教程,大数据视频教程,HTML5视频教程,UI视频教程,PHP视频教程,java视频教程,python基础教程">
<meta name="description"
	content="智游教育在线课程视频,为您提供java,python,HTML5,UI,PHP,大数据等学科经典视频教程在线浏览学习,精细化知识点解析,深入浅出,想学不会都难,智游教育,学习成就梦想！">
    <link rel="stylesheet" href="<c:url value="/css/base.css" />">
	<link rel="stylesheet" href="<c:url value="/css/css.css" />">
<title>在线公开课-智游教育|java|大数据|HTML5|python|UI|PHP视频教程</title>
</head>

<body class="w100">
    <jsp:include page="../include/header.jsp"></jsp:include> 

	<div id="app">
		<!--banner图-->
		<div class="banner"
			style="background-image: url(<c:url value="/img/banner-1.jpg" /> )"></div>

		<!--面包屑导航-->
		<div class="container mian-nav" id="navDiv">公开课 /</div>
		<input type="hidden" id="" value="">
		<div class="classify">
			<div class="container" id="dataContainer">
				<div class="section">
					<c:forEach items="${subject.course }" var="course">
					<div class="classifyName">
						<p class="title title-first">专辑标题:${course.courseTitle }</p>
					</div>
					<div class="kcIntro">
						<p class="int">
							<span>课程介绍：${course.couserDesc }</span>
						</p>
					</div>
					<c:forEach items="${course.videos }" var="video">
						<ul>
							<li class="section-main" onclick="getVideo(${video.id})">
							<div class="thum" style="background-image: url(/upload/${video.imageUrl })"></div>
								<p>${video.title }</p>
								<div class="classify-v-info">
									<span class="count" title="观看次数">
									<img src="static/img/count.png" alt=""></span>
									<span class="duration" title="视频时长">
									<img src="static/img/player.png" alt=""></span>
								</div>
							</li>
						</ul>
					</c:forEach>
				</c:forEach>
			</div>
		</div>

		</div>
	</div>
	<%@include file="../include/footer.jsp"%> 

	 <%@include file="../include/script.html"%> 
<script src="<c:url value='/js/jquery-1.8.3.min.js' /> "></script>
	<script type="text/javascript">
		function getVideo(id){
			var subjectId=$('#subjectId').val();
			location.href='http://localhost:8080/ssmVideo/webVideo/videoShow.do?id='+id;
		}
	</script>


</body>

</html>