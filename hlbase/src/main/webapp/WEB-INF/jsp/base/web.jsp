<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8" />
<title>会议搜索</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap/css/bootstrap.min.css">
<script src="${pageContext.request.contextPath}/static/js/jquery-1.8.0.min.js"></script>
<script src="${pageContext.request.contextPath}/static/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="javascript:;"><img alt="珊瑚移动" src="${pageContext.request.contextPath}/static/img/logo3.png">
				<p class="text-center">微信上墙后台</p> </a></li>
	</ul>
	<div class="text-center">
		<form class="form-search" action="javascript:searchfun()">
			<input type="text" id="meetname" class="input-xlarge search-query" placeholder="请输入您的会议完整名称">
			<a href="javascript:searchfun()" class="btn btn-primary"><i class="icon-search icon-white"></i>搜索</a>
		</form>
	</div>
	<div id="div_meet" class="text-center" style="border: 0px solid #ccc;width: 400px;height: 80px;margin: 0 auto;">
		<!-- <h4 class="text-left">会议名称</h4>
		<div class="text-right">
			<a href="#" class="btn btn-success">签到墙</a>
			<a href="#" class="btn btn-info">互动墙</a>
			<a href="#" class="btn btn-danger">抽奖墙</a>
		</div> -->
	</div>
	<div class="alert alert-info" style="position: absolute;top: 90%;margin: 0 auto">
  		推荐使用 谷歌浏览器 以获得更好的使用体验
	</div>
<script type="text/javascript">
	function searchfun(){
		if($('#meetname').val()!=''){
			$.ajax({
				url:'${pageContext.request.contextPath}/base/web/search',
				type:'post',
				data:{meetname:$('#meetname').val()},
				dataType:'json',
				success:function(data){
					var hml = '<h4 class="text-left">无法匹配该会议</h4>';
					if(data.title){
						hml = '<h4 class="text-left">'+data.title+'</h4>'
						hml += '<div class="text-right">'
						hml += '<a href="${pageContext.request.contextPath}/base/web/talkwall/'+data.id+'"  target="_blank" class="btn btn-success" style="margin-left:8px"><i class="icon-map-marker icon-white"></i>签到墙</a>';
						hml += '<a href="${pageContext.request.contextPath}/base/web/talkwall/'+data.id+'" target="_blank" class="btn btn-info" style="margin-left:8px"><i class="icon-thumbs-up icon-white"></i>互动墙</a>';
						hml += '<a href="${pageContext.request.contextPath}/base/web/lotterywall/'+data.id+'/0" target="_blank" class="btn btn-danger" style="margin-left:8px"><i class="icon-briefcase icon-white"></i>抽奖墙</a>';
						hml += '</div>';
					}
					$('#div_meet').html(hml)
				}
				
			})
		}
	}
</script>
</body>
</html>
