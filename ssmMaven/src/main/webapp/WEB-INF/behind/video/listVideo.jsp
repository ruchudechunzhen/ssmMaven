<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">

<!--表示使用IE最新的渲染模式进行解析-->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!--
    	兼容一些移动设备，会根据屏幕的大小缩放
    	width=device-width  表示宽度是设备的宽度（很多手机的宽度都是980px）
    	initial-scale=1  初始化缩放级别   1-5
    	minimum-scale=1  maximum-scale=5
    	user-scalable=no  禁止缩放
    -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>视频列表管理</title>

<!-- Bootstrap -->
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->

<!-- 如果IE版本小于9，加载以下js,解决低版本兼容问题 -->
<!--[if lt IE 9]>
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->


<!--
    	引入网络的jquery  ,如果想换成自己的，导入即可
    	网站优化：建议将你网站的css\js等代码，放置在互联网公共平台上维护，比如：七牛
    -->
<script src="${pageContext.request.contextPath}/js/jquery-1.12.4.min.js"></script>

<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/confirm.js"></script>
<style type="text/css">
th {
	text-align: center;
}
</style>

</head>
<body>


	<nav class="navbar-inverse">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">

				<a class="navbar-brand" href="${pageContext.request.contextPath}/video/videoList.action">视频管理系统</a>
			</div>

			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-9">
				<ul class="nav navbar-nav">
					<li class="active"><a href="${pageContext.request.contextPath}/video/videoList.action">视频管理</a></li>
					<li><a href="${pageContext.request.contextPath}/showSpeakerList.action">主讲人管理</a></li>
					<li><a href="${pageContext.request.contextPath}/showCourseList.action">课程管理</a></li>


				</ul>
				<p class="navbar-text navbar-right">
					<span>${sessionScope.userName}</span> <i class="glyphicon glyphicon-log-in"
						aria-hidden="true"></i>&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/login.jsp"
						class="navbar-link">退出</a>
				</p>
			</div>
			


		</div>
		
	</nav>

	<div class="jumbotron" style="padding-top: 15px;padding-bottom: 15px;">
		<div class="container">
			<h2>视频管理</h2>
		</div>
	</div>


	<div class="container">

		<div class="row">
			<div class="col-md-2">
				<a class="btn btn-primary" href="<c:url value="/video/add.do" />">添加</a>

				<button id="btn" class="btn btn-primary" type="button" onclick="deleteBatchFun()">
					批量删除 <span class="badge" id="delNum">0</span>
				</button>
			</div>
			<div class="col-md-4"></div>
			<div class="col-md-8">
				<!-- 查询相关组件 -->
				<form id="searchForm" class="navbar-form navbar-right" action="<c:url value="/video/list.do" />" >
					<input type="text"  class="form-control" name="searchCourse" value="${searchVideo.searchCourse }"  placeholder="专辑标题">
					<div class="btn-group">
						<input type="text"  class="form-control" name="searchSpeaker" value="${searchVideo.searchSpeaker }"  placeholder="主讲人">
					</div>
					<div class="btn-group">
						<input type="text"  class="form-control" name="searchTitle" value="${searchVideo.searchTitle }" placeholder="课程名称">
					</div>
					<button type="submit" class="btn btn-info dropdown-toggle">查询</button>
					<input type="hidden" id="pageNowInput" name="pageNo" value="">
				</form>

			</div>

		</div>
	</div>

	<div class="container" style="margin-top: 20px;">
		<form action="<c:url value="/video/deleteBatch.do" />" method="post" id="deleteBatchFormId">
			<table class="table table-bordered table-hover"
				style="text-align: center;table-layout:fixed">
				<thead>
					<tr class="active">
						<th style="width:3%"><input id="checkedAll" type="checkbox" onclick="selectAll()"
							id="checkAllId"  /></th>
						<th style="width:5%">序号</th>
						<th style="width:15%">名称</th>
						<th style="width:12%;">专辑标题</th>
						<th style="width:12%;">专辑介绍</th>
						<th style="width:5%">讲师</th>
						<th style="width:5%">时长</th>
						<th style="width:5%">播放次数</th>
						<th style="width:5%">编辑</th>
						<th style="width:5%">删除</th>
					</tr>
					<c:forEach items="${videos }" var="video">
						<tr class="active">
							<th style="width:3%"><input type="checkbox" name="checkId" value="${video.id }"
							 class = "checkedEveryone" onclick="deleteNum()" /></th>
						<th style="width:5%">${video.id }</th>
						<th style="width:15%">${video.title }</th>
						<th style="width:12%;">${video.course.courseTitle }</th>
						<th style="width:12%;">${video.course.couserDesc }</th>
						<th style="width:5%">${video.speaker.speakerName }</th>
						<th style="width:5%">${video.time }:</th>
						<th style="width:5%">${video.playNum }</th>
						<th style="width:5%"><a class="glyphicon glyphicon-pencil" href="<c:url value="/video/update.do?id=${video.id }" />"></a></th>
						<th style="width:5%"><a class="glyphicon glyphicon-trash" href="<c:url value="/video/deleteVideo.do?id=${video.id }" />"></a></th>
						</tr>
					</c:forEach>
				</thead>
				<tbody>
					
				</tbody>
			</table>
						          			
			<div style="position: absolute; left: 1200px;  ">
				<nav aria-label="Page navigation">
				  <ul class="pagination">
				  	<li>
				      <a href="#" onclick="goPage(${page.pageNum-1 })"  aria-label="Previous">
				        <span aria-hidden="true">&laquo;</span>
				      </a>
				    </li>
				    <c:forEach begin="1" end="${page.pages }" var="i">
				    	<li class="${page.pageNum == i?'active':'' }">
				    		<a href="#" onclick="goPage(${i})" >${i}</a>
				    	</li>
				    </c:forEach>
				    <li>
				      <a href="#" onclick="goPage(${page.pageNum+1})" aria-label="Next">
				        <span aria-hidden="true">&raquo;</span>
				      </a>
				    </li>
				  </ul>
				</nav>
			</div>
		</form>
	</div>
	
	<script type="text/javascript">
	    // 全选
		var checkboxes = document.getElementsByName("checkId");
		function selectAll(){
		var checkedAll = document.getElementById("checkedAll");
			if(checkedAll.checked ){
				for (var i = 0; i < checkboxes.length; i++) {
					checkboxes[i].checked=true;
				}
			}else{
				for (var i = 0; i < checkboxes.length; i++) {
					checkboxes[i].checked=false;
				}
			}
			deleteNum();
		}
		// 计算有多少复选框选中
		function deleteNum(){
			var count = 0;
			for (var i = 0; i < checkboxes.length; i++) {
				if (checkboxes[i].checked) {
					count++;
				}
			}
			var span = document.getElementById("delNum");
			span.innerHTML = count;
		}
		// 批量删除绑定的点击事件
		function deleteBatchFun(){
		// 获得批量删除的表单对象
		var from = document.getElementById('deleteBatchFormId');
		// 提交该表单
		from.submit();  // 相当于在form点击提交按钮
	}
	
	</script>
	<script type="text/javascript">
		// 分页
		function goPage(pageNo){
			$("#pageNowInput").attr("value",pageNo);
			$("#searchForm").submit();
		}
	</script>
</body>
</html>



