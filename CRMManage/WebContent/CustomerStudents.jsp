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
		    pagination:true,
		    toolbar:tabfrm
		});  
	}
	</script>
</head>
<body>	
		<table id="dg">   
		    <thead>   
		        <tr>   
		            <th data-options="field:'id',width:80">编码</th>   
		            <th data-options="field:'name',width:80">名称</th>   
		            <th data-options="field:'age',width:80">年龄</th>  
		            <th data-options="field:'sex',width:80">性别</th> 
		            <th data-options="field:'phone',width:80">价格</th> 
		            <th data-options="field:'sourceUrl',width:80">来源网站</th> 
		            <th data-options="field:'learnForward',width:80">课程方向</th>  
		            <th data-options="field:'qq',width:80">QQ</th>
		            <th data-options="field:'address',width:80">地址</th>
		            <th data-options="field:'stuStatus',width:80">客户状态</th>  
		        </tr>   
		    </thead>   
		</table> 
		<div id="tb" align="center">
		<form id="tabfrm" class="easyui-form">
			
			<label for="name">名字:</label> 
			<input class="easyui-validatebox" type="text" id="name" />
			<label for="name">电话:</label> 
			<input class="easyui-validatebox" type="text" id="phone" />
			<label for="name">是否缴费:</label> 
			<input class="easyui-validatebox" type="text" id="ispay" />
			<label for="name">是否有效:</label> 
			<input class="easyui-validatebox" type="text" id="isvalid" />
			<label for="name">是否回访:</label> 
			<input class="easyui-validatebox" type="text" id="isreturnvist" />
			<label for="name">QQ:</label> 
			<input class="easyui-validatebox" type="text" id="qq"  />
			<br/><br/>
			<label for="name">创建时间:</label> 
			<input type="text" id="mincreatetime" class= "easyui-datebox" />--
			<input type="text" id="maxcreatetime" class= "easyui-datebox" />
			<label for="name">上门时间:</label> 
			<input type="text" id="minhometime" class= "easyui-datebox"/>--
			<input type="text" id="maxhometime" class= "easyui-datebox"/>
			<label for="name">首次回访时间:</label> 
			<input type="text" id="minfirstvisittime" class= "easyui-datebox" />--
			<input type="text" id="maxfirstvisittime" class= "easyui-datebox" />
			<br/><br/>
			<label for="name">缴费时间:</label> 
			<input type="text" id="minpaytime" class= "easyui-datebox" />--
			<input type="text" id="maxpaytime" class= "easyui-datebox" />
			<label for="name">进班时间:</label> 
			<input type="text" id="mininclasstime" class= "easyui-datebox" />--
			<input type="text" id="maxinclasstime" class= "easyui-datebox" />
			 <a href="javascript:void(0)" onclick="init()"	class="easyui-linkbutton"	data-options="iconCls:'icon-search',plain:true">搜索</a>
			 <a href="javascript:void(0)" onclick="tianjiastu()"	class="easyui-linkbutton"	data-options="iconCls:'icon-add',plain:true">添加</a>
		</form>
	</div>
		
</body>
</html>