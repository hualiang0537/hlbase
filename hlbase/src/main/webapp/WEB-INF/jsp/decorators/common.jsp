<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes" />
<title><decorator:title /></title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/jqm-bootstrap/Bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/jquery.mobile-1.4.2.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/jqm-bootstrap/jquery.mobile.icons.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/js/mobiscroll-2.6.2/css/mobiscroll.custom-2.6.2.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/js/validator-0.7.0/jquery.validator.css">
<script src="${pageContext.request.contextPath}/static/js/jquery-1.8.0.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/jquery.mobile-1.4.2.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/mobiscroll-2.6.2/js/mobiscroll.custom-2.6.2.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/validator-0.7.0/jquery.validator.js"></script>
<script src="${pageContext.request.contextPath}/static/js/validator-0.7.0/local/zh_CN.js"></script>
<%-- <script src="${pageContext.request.contextPath}/static/js/My97DatePicker4.8b3/My97DatePicker/WdatePicker.js"></script> --%>

</head>
<body>
	<div data-role="page">
		<div role="main" class="ui-content">
			<decorator:body />
		</div>
		<!-- /content -->
	</div>
	<!-- /page -->
</body>
</html>
