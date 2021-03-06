<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
	<link rel="stylesheet" type="text/css" href="../js/easyui/insdep.easyui.min.css">
<link rel="stylesheet" type="text/css" href="../js/easyui/icon.css">
<script type="text/javascript" src="../js/easyui/jquery.min.js"></script>
<script type="text/javascript" src="../js/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript"src="../js/easyui/insdep.extend.min.js"></script>
<script type="text/javascript"src="../js/easyui/locale/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript">
	/* 当访问页面时加载  */
	$(function (){
		rizhiStu();
	})
	function rizhiStu(){
		$('#rz').datagrid({
			method:'post',
		    url:'../wl/selectNetfollows',
		    toolbar:"#Logtoolbar",
		    pagination:true,
		    queryParams:{
		    	StudentName:$("#logn_studentname").val(),
		    	Content:$("#logn_content").val(),
		    	FollowTime:$("#logn_followtime").val(),
		    	NextFollowTime:$("log#n_nextfollowtime").val(),
		    	FollowType:$("#logn_followtype").val(),
		    	UserId:'${user.userId}',
			}
		});  
	}
	</script>
</head>
<body>
		<table id="rz">   
	    	<thead>   
	        <tr>
	        	<th data-options="field:'id',checkbox:true" >ID</th>
				<th data-options="field:'studentId'" sortable="true">学生编号</th>
				<th data-options="field:'studentName'">学生名字</th>
				<th data-options="field:'createTime'" sortable="true">创建时间</th>
	            <th data-options="field:'followTime',width:150">回访时间</th>   
	            <th data-options="field:'content',width:150">回访情况</th>   
	            <th data-options="field:'followType',width:80">跟踪方式</th>   
	            <th data-options="field:'nextFollowTime',width:150">下次跟踪时间</th>   
	            <th data-options="field:'remarks',width:150">备注</th>   
		     </tr>   
		    </thead>   
		</table>
		
		<div id="Logtoolbar" data-options="closed:true">
		<form id="Logtoolform" class="easyui-form">
			<label for="name">学生名称:</label>
			<input class="easyui-textbox" type="text" id="logn_studentname">
			
			<label for="name">回访情况:</label>
			<input class="easyui-textbox" type="text" id="logn_content">
			
			<label for="name">始跟时间:</label>
			<input class="easyui-datebox" editable="false" type="text" id="logn_followtime">
			
			<label for="name">束跟时间:</label>
			<input class="easyui-datebox" editable="false" type="text" id="logn_nextfollowtime">
			
			<label for="name">跟踪方式:</label>
			<input class="easyui-textbox" type="text" id="logn_followtype">
			
			
			<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="rizhiStu()">检索</a>
		</form>
	</div>
</body>
</html>