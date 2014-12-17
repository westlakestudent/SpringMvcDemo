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

<title>主页</title>

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


<script type="text/javascript">
	var url;
	function create() {
		$('#dlg').dialog('open').dialog('setTitle', '新建');
		$('#fm').form('clear');
		url = "save";
	}

	function edit() {
		var row = $('#dg').datagrid('getSelected');
		if (row) {
			$('#dlg').dialog('open').dialog('setTitle', '编辑');
			$('#fm').form('load', row);
			url = 'edit?id=' + row.id;
		}
	}

	function save() {
		$('#fm').form('submit', {
			url : url,
			onSubmit : function() {
				return $(this).form('validate');
			},
			success : function(data) {
				var data = eval('(' + data + ')');
				if (data.result) {
					$('#dlg').dialog('close'); // close the dialog
					$('#dg').datagrid('reload'); // reload the user data
				} else {
					$.messager.show({
						title : 'Error',
						msg : data.data
					});
				}
			}
		});

	}

	function del() {
		var row = $("#dg").datagrid('getSelected');
		if (row) {
			$.messager.confirm('Confirm', '确定要删除这个用户吗?', function(r) {
				if (r) {
					$.post('remove', {
						id : row.id
					}, function(result) {
						if (result.result) {
							$('#dg').datagrid('reload'); // reload the user data
						} else {
							$.messager.show({ // show error message
								title : 'Error',
								msg : result.data
							});
						}
					}, 'json');
				}
			});
		}
	}
</script>

<style type="text/css">
#fm {
	margin: 0;
	padding: 10px 30px;
}

.ftitle {
	font-size: 14px;
	font-weight: bold;
	color: #666;
	padding: 5px 0;
	margin-bottom: 10px;
	border-bottom: 1px solid #ccc;
}

.fitem {
	margin-bottom: 5px;
}

.fitem label {
	display: inline-block;
	width: 80px;
}
</style>
</head>

<body>
	<h2>CRUD</h2>

	<table id="dg" title="用户管理" class="easyui-datagrid"
		style="width:700px;height:auto" url="get_users" toolbar="#toolbar"
		pagination="true" rownumbers="true" fitColumns="true"
		singleSelect="true" striped="true" autoRowHeight="true"
		checkbox="true">
		<thead>
			<tr>
				<th field="id">ID</th>
				<th field="username" width="50">用户名</th>
				<th field="password" width="50">密码</th>
				<th field="email" width="50">邮箱</th>
				<th field="mark" width="50">备注</th>
			</tr>
		</thead>
	</table>
	<div id="toolbar">
		<a href="javascript:void(0)" class="easyui-linkbutton"
			iconCls="icon-add" plain="true" onclick="create()">新建</a> <a
			href="javascript:void(0)" class="easyui-linkbutton"
			iconCls="icon-edit" plain="true" onclick="edit()">编辑</a> <a
			href="javascript:void(0)" class="easyui-linkbutton"
			iconCls="icon-remove" plain="true" onclick="del()">删除</a>
	</div>

	<div id="dlg" class="easyui-dialog"
		style="width:400px;height:280px;padding:10px 20px" closed="true"
		buttons="#dlg-buttons">
		<div class="ftitle">用户信息</div>
		<form id="fm" method="post" novalidate>
			<div class="fitem">
				<label>用户名:</label> <input name="username"
					class="easyui-validatebox" required="true">
			</div>
			<div class="fitem">
				<label>密码:</label> <input name="password" class="easyui-validatebox"
					required="true">
			</div>
			<div class="fitem">
				<label>邮箱:</label> <input name="email" class="easyui-validatebox"
					validType="email">
			</div>
			<div class="fitem">
				<label>备注:</label> <input name="mark">
			</div>
		</form>
	</div>
	<div id="dlg-buttons">
		<a href="javascript:void(0)" class="easyui-linkbutton"
			iconCls="icon-ok" onclick="save()">保存</a> <a
			href="javascript:void(0)" class="easyui-linkbutton"
			iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')">取消</a>
	</div>

	<ul id="tt" class="easyui-tree" url="tree">
		<li>hey</li>
	</ul>
</body>
</html>
