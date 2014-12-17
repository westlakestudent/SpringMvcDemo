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

<title>登录</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

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



<script type="text/javascript">
	function dologin() {
		var params = $('#loginForm').serializeArray();
		$.post("dologin", params, function(data) {
			if (data.result) {
				window.location.href = "main";
			} else {
				alert(data.data);

			}

		});

	}
</script>
</head>

<body style="background:#fafafa;">
	<form
		style="margin-top: 300px;margin-left: 440px;background-color: #D8D8EB;width: 600px"
		method="post" class="easyui-form" action="dologin" id="loginForm">
		<table align="center" cellpadding="5px">
			<caption style="line-height: 40px; font-size: 24px">登陆界面</caption>
			<tr>
				<td><span style="line-height: 24px">用户名：</span></td>
				<td><input name="username" class="easyui-textbox"
					data-options="iconCls:'icon-man'" style="width:300px; height:24px">
				</td>
			</tr>
			<tr>
				<td><span style="line-height: 24px">密码：</span></td>
				<td><input name="password" type="password"
					class="easyui-textbox" data-options="iconCls:'icon-lock'"
					style="width:300px;height:24px"></td>
			</tr>
			<tr>
				<td colspan="2"><a onclick="dologin()"
					href="javascript:void(0)" class="easyui-linkbutton"
					data-options="iconCls:'icon-ok', width:'100%'">登陆</a></td>
			</tr>
		</table>
	</form>
</body>
</html>
