<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
	<link rel="stylesheet" type="text/css" href="js/easyui demo/easyui/1.3.4/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="js/easyui demo/css/wu.css" />
	<link rel="stylesheet" type="text/css" href="js/easyui demo/css/icon.css" />
	<script type="text/javascript" src="js/easyui demo/js/jquery-1.8.0.min.js"></script>
	<script type="text/javascript" src="js/easyui demo/easyui/1.3.4/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="js/easyui demo/easyui/1.3.4/locale/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript">
	 
	$(function(){
		chaXun();
	})
	function chaXun(){
		$('#dg').datagrid({
			method:'post',
		    url:'selectStu',
		    collapsible:true,
		    pagination:true,
		    toolbar:'#tb',
		    columns:[[
		        {field:'Id',title:'id',width:100},    
		        {field:'Name',title:'Name',width:100},    
		        {field:'sc',title:'修改商品',width:100,align:'right',formatter: function(value,row,index){
		        	return '<button onclick="updateStudent('+index+')">修改</button> <button onclick="delectStudent('+index+')">删除</button>';
		        }} 
		    ]]    
		});  
	}
	</script>
</head>
<body>
		<div id="tb">
			 名字<input class="easyui-textbox" type="text" name="sname" id="ssname" />
			<a href="javascript:chaXun()" class="easyui-linkbutton" data-options="plain:true" >搜索</a>
			<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" onclick="$('#aaa').dialog('open')"></a>
		</div>
		<table id="dg"></table>  
		
		
		
		<div id="dlg" class="easyui-dialog" title="Basic Dialog" data-options="iconCls:'icon-save',closed:true" style="width:400px;height:200px;padding:10px;">
			<div style="padding:10px 60px 20px 60px">
				<form id="ff">   
				    <div id="productId">   
				        <label for="name">sid:</label>   
				        <input class="easyui-textbox" type="text" id="sid" name="sid" data-options="required:true"/>   
				    </div>   
				    <div>   
				        <label for="prodName">sname:</label>   
				        <input class="easyui-textbox" type="text" id="sname" name="sname" data-options="required:true"/>   
				    </div>
				     <div>   
				        <label for="prodType">age:</label>   
				        <input class="easyui-textbox" type="text" id="age" name="age" data-options="required:true"/>
				    </div>
				    <div style="text-align:center;padding:5px">
		    			<a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()">提交</a>
		    		</div>
				</form>
		    </div>
		</div>
		<div id="aaa" class="easyui-dialog" title="Basic Dialog" data-options="iconCls:'icon-save',closed:true" style="width:400px;height:200px;padding:10px;">
			<div style="padding:10px 60px 20px 60px">
				<form id="aa">   
				    <div>   
				        <label for="sname">sname:</label>   
				        <input class="easyui-textbox" type="text" id="name" name="sname" data-options="required:true"/>   
				    </div>
				     <div>   
				        <label for="age">age:</label>   
				        <input class="easyui-textbox" type="text" id="sage" name="age" data-options="required:true"/>
				    </div>
				    <div style="text-align:center;padding:5px">
		    			<a href="javascript:void(0)" class="easyui-linkbutton" onclick="insert()">提交</a>
		    		</div>
				</form>
		    </div>
		</div>
</body>
</html>