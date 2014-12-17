<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">


<link rel="stylesheet" type="text/css"
	href="resource/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="resource/easyui/themes/icon.css">
<script type="text/javascript" src="resource/jquery/jquery.js"></script>
<script type="text/javascript"
	src="resource/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="resource/jquery/validate/jquery.metadata.js"></script>
<script type="text/javascript"
	src="resource/jquery/validate/jquery.validate.js"></script>
<script type="text/javascript"
	src="resource/jquery/validate/messages_cn.js"></script>
<script type="text/javascript"
	src="resource/jquery/validate/additional-methods.js"></script>

<!--  
<script type="text/javascript">
	$().ready(function() {
		$("#signupForm").validate();
	});
</script>
-->
<title>登录</title>
<script>
	$(document).ready(function() {
		$("#btn2").click(function() {
			$.post("defaul", {
				def : "post a message from the page"
			}, function(data) {
				$("#name").text("caonima");
				alert("Data: " + data + "\nStatus: " + data.status);

			});
		});
	});
</script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#btn1").click(function() {
			$.get("defaul1", function(data, status) {
			$("#name").val($(this).message);
				$.each(data, function(i,item) {
					$("#name").val($(this).message);
					$("#pass").val($(this).status);
				});
			});
		});
	});
</script>
</head>
<body>

	<div class="easyui-layout" align="center"
		style="width:400px;height:200px;background-color: #eeeeee;top: 200px;left:500px"
		id="win" title="Login">
		<p>
			帐号: <input id="name" type="text">
		</p>
		<p>
			密码: <input id="pass" type="text">
		</p>
		<button id="btn1">GET</button>
		<button id="btn2">POST</button>
	</div>

</body>
</html>
