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
		var ispay=$("#ispay").combobox('getValue');
		if(ispay=="--请选择--"){
			ispay='';
		}
		var isvalid=$("#isvalid").combobox('getValue');
		if(isvalid=="--请选择--"){
			isvalid='';
		}
		var isreturnvist=$("#isreturnvist").combobox('getValue');
		if(isreturnvist=="--请选择--"){
			isreturnvist='';
		}
		$('#dg').datagrid({
			method:'post',
		    url:'selectStu',
		    pagination:true,
		    toolbar:'#tb',
		    queryParams:{
		    	Name:$("#name").val(),
				Phone:$("#phone").val(),
				AskerId:$("#askerId").val(),
				IsPay:$("#isPay").val(),
				IsValid:$("#isValid").val(),
				QQ:$("#qq").val(),
				IsReturnVist:$("#isReturnVist").val()
			}
		});  
	}
	function formattercaozuo(value,row,index){
		return "<a href='javascript:void(0)' onclick='updateStudent("+index+")'>修改</a>   <a href='javascript:void(0)' onclick='deleteStu("+index+")'>删除</a>"
	}
	function formatterjf(value,row,index) {
		return value==0? '未缴费':'已缴费';
	} 
	function formatterhf(value,row,index) {
		return value==0? '未回访':'已回访';
	} 
	function formattersfjb(value,row,index) {
		return value==0? '未进班':'已进班';
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
		            <th data-options="field:'ispay',width:80,formatter:formatterjf">是否缴费</th>  
		            <th data-options="field:'isreturnvist',width:80,formatter:formatterhf">是否回访</th>  
		            <th data-options="field:'isInClass',width:80,formatter:formattersfjb">是否进班</th>  
		            <th data-options="field:'inClassContent',width:80">创建备注</th>  
		            <th data-options="field:'createTime',width:150">创建时间</th>  
		            <th data-options="field:'caozuo',width:60,title:'操作',formatter:formattercaozuo"></th>
		        </tr>   
		    </thead>   
		</table> 
		<div id="tb" align="center">
		<form id="tabfrm" class="easyui-form">
			
			<label for="name">名字:</label> 
			<input class="easyui-validatebox" type="text" id="name" />
			<label for="name">电话:</label> 
			<input class="easyui-validatebox" type="text" id="phone" />
			<label for="name">是否缴费::</label>  
	    	<select id="ispay" class="easyui-combobox">
	    		<option >--请选择--</option>
	    	</select>
			<label for="name">是否有效:</label>  
	    	<select id="isvalid" class="easyui-combobox">
	    		<option >--请选择--</option>
	    	</select>
			<label for="name">是否回访:</label>  
	    	<select id="isreturnvist" class="easyui-combobox">
	    		<option >--请选择--</option>
	    	</select>
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
			 <a href="javascript:void(0)" onclick="chaXun()"	class="easyui-linkbutton"	data-options="iconCls:'icon-search',plain:true">搜索</a>
			 <a href="javascript:void(0)" onclick="tianjiastu()"	class="easyui-linkbutton"	data-options="iconCls:'icon-add',plain:true">添加</a>
		</form>
	</div>
		
</body>
</html>