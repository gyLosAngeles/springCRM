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
		if(ispay=="已缴费"){
			ispay='1';
		}
		if(ispay=="未缴费"){
			ispay='0';
		}
		var isvalid=$("#isvalid").combobox('getValue');
		if(isvalid=="--请选择--"){
			isvalid='';
		}
		if(isvalid=="有效"){
			isvalid='1';
		}
		if(isvalid=="无效"){
			isvalid='0';
		}
		var isreturnvist=$("#isreturnvist").combobox('getValue');
		if(isreturnvist=="--请选择--"){
			isreturnvist='';
		}
		if(isreturnvist=="已回访"){
			isreturnvist='1';
		}
		if(isreturnvist=="未回访"){
			isreturnvist='0';
		}
		$('#dg').datagrid({
			method:'post',
		    url:'selectStu',
		    pagination:true,
		    toolbar:'#tb',
		    queryParams:{
		    	Name:$("#name").val(),
				Phone:$("#phone").val(),
				IsPay:ispay,
				IsValid:isvalid,
				QQ:$("#qq").val(),
				IsReturnVist:isreturnvist,
				minCreateTime:$('#Stu_mincreatetime').datebox('getValue'),
				maxCreateTime:$('#Stu_maxcreatetime').datebox('getValue'),
				minHomeTime:$('#Stu_minhometime').datebox('getValue'),
				maxHomeTime:$('#Stu_maxhometime').datebox('getValue'),
				minFirstVisitTime:$('#Stu_minfirstvisittime').datebox('getValue'),
				maxFirstVisitTime:$('#Stu_maxfirstvisittime').datebox('getValue'),
				minPayTime:$('#Stu_minpaytime').datebox('getValue'),
				maxPayTime:$('#Stu_maxpaytime').datebox('getValue'),
				minInClassTime:$('#Stu_mininclasstime').datebox('getValue'),
				maxInClassTime:$('#Stu_maxinclasstime').datebox('getValue')
			}
		});  
	}
	function formattercaozuo(value,row,index){
		return "<a href='javascript:void(0)' onclick='updateStudent("+index+")'>编辑</a>|<a href='javascript:void(0)' onclick='deleteStu("+index+")'>删除</a>|<a href='javascript:void(0)' onclick='chaKanStu("+index+")'>查看</a>"
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
	
	function updateStudent(index){
		var row = $('#dg').datagrid("getRows")[index];
		$("#frmStu").form("load",row);
		$("#Update_isValid").combobox('setValue',row.isValid==1?"有效":"无效");
		$("#Update_isInClass").combobox('setValue',row.isInClass==1?"已进班":"未进班"); 
		$("#Update_isHome").combobox('setValue',row.isHome==1?"已上门":"未上门"); 
		$("#Update_isreturnvist").combobox('setValue',row.isreturnvist==1?"已回访":"未回访"); 
		$("#Update_ispay").combobox('setValue',row.isValid==1?"已缴费":"未缴费"); 
		$("#Update_isReturnMoney").combobox('setValue',row.isReturnMoney==1?"已退费":"未退费"); 
		$('#updateStu').dialog('open');
		}
	function updateStu(){
		var ispay=$("#Update_ispay").combobox('getValue')=="已缴费"?"1":"0";
		var isvalid=$("#Update_isValid").combobox('getValue')=="有效"?"1":"0";
		var isHome=$("#Update_isHome").combobox('getValue')=="已上门"?"1":"0";
		var isreturnvist=$("#Update_isreturnvist").combobox('getValue')=="已回访"?"1":"0";
		var isReturnMoney=$("#Update_isReturnMoney").combobox('getValue')=="已退费"?"1":"0";
		var isInClass=$("#Update_isInClass").combobox('getValue')=="已进班"?"1":"0";
		$.post("UpdateStu",{
			id:$("#Update_id").val(),
			name:$("#Update_name").val(),
			learnForward:$("#Update_learnForward").val(),
			lostValid:$("#Update_lostValid").val(),
			firstVisitTime:$("#Update_firstVisitTime").val(),
			homeTime:$("#Update_homeTime").val(),
			payTime:$("#Update_payTime").val(),
			preMoney:$("#Update_preMoney").val(),
			preMoneyTime:$("#Update_preMoneyTime").val(),
			money:$("#Update_money").val(),
			inClassTime:$("#Update_inClassTime").val(),
			inClassContent:$("#Update_inClassContent").val(),
			askerContent:$("#Update_askerContent").val(),
			ispay:ispay,
			isvalid:isvalid,
			isHome:isHome,
			isreturnvist:isreturnvist,
			isReturnMoney:isReturnMoney,
			isInClass:isInClass,
			
		},function(res){
			if(res>0){
				//修改成功
				$("#chaKan").datagrid("reload");
				$("#updateStu").dialog("close")
				$.messager.alert("提示","修改成功");
				chaXun();
			}else{
				//修改失败
				$.messager.alert("提示","修改失败");
			}
			
		},"json")
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
		            <th data-options="field:'weiXin',width:150">微信</th>
		            <th data-options="field:'address',width:80">地址</th>
		            <th data-options="field:'stuStatus',width:80">客户状态</th>
		            <th data-options="field:'ispay',width:80,formatter:formatterjf">是否缴费</th>  
		            <th data-options="field:'isreturnvist',width:80,formatter:formatterhf">是否回访</th>  
		            <th data-options="field:'isInClass',width:80,formatter:formattersfjb">是否进班</th>  
		            <th data-options="field:'inClassContent',width:80">创建备注</th>  
		            <th data-options="field:'createTime',width:150">创建时间</th>  
		            <th data-options="field:'stuStatus',width:100">客户状态</th>  
		            <th data-options="field:'sourceKeyWord',width:100">来源关键词</th>  
		            <th data-options="field:'firstVisitTime',width:150">创建时间</th>  
		            <th data-options="field:'caozuo',width:100,title:'操作',formatter:formattercaozuo"></th>
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
	    		<option >已缴费</option>
	    		<option >未缴费</option>
	    	</select>
			<label for="name">是否有效:</label>  
	    	<select id="isvalid" class="easyui-combobox">
	    		<option >--请选择--</option>
	    		<option >有效</option>
	    		<option >无效</option>
	    	</select>
			<label for="name">是否回访:</label>  
	    	<select id="isreturnvist" class="easyui-combobox">
	    		<option >--请选择--</option>
	    		<option >已回访</option>
	    		<option >未回访</option>
	    	</select>
			<label for="name">QQ:</label> 
			<input class="easyui-validatebox" type="text" id="qq"  />
			<br/><br/>
			<label for="name">创建时间:</label> 
				<input type="text" id="Stu_mincreatetime" class= "easyui-datebox" />--
				<input type="text" id="Stu_maxcreatetime" class= "easyui-datebox" />
			<label for="name">上门时间:</label> 
				<input type="text" id="Stu_minhometime" class= "easyui-datebox"/>--
				<input type="text" id="Stu_maxhometime" class= "easyui-datebox"/>
			<label for="name">首次回访时间:</label> 
				<input type="text" id="Stu_minfirstvisittime" class= "easyui-datebox" />--
				<input type="text" id="Stu_maxfirstvisittime" class= "easyui-datebox" />
			<br/><br/>
			<label for="name">缴费时间:</label> 
				<input type="text" id="Stu_minpaytime" class= "easyui-datebox" />--
				<input type="text" id="Stu_maxpaytime" class= "easyui-datebox" />
			<label for="name">进班时间:</label> 
				<input type="text" id="Stu_mininclasstime" class= "easyui-datebox" />--
				<input type="text" id="Stu_maxinclasstime" class= "easyui-datebox" />
			 <a href="javascript:void(0)" onclick="chaXun()"	class="easyui-linkbutton"	data-options="iconCls:'icon-search',plain:true">搜索</a>
			 <a href="javascript:void(0)" onclick="tianjiastu()"	class="easyui-linkbutton"	data-options="iconCls:'icon-add',plain:true">添加</a>
		</form>
	</div>
	




	<div id="updateStu" class="easyui-dialog" title="Basic Dialog" data-options="iconCls:'icon-save',closed:true" style="width:400px;height:200px;padding:10px;">
			<div style="padding:10px 60px 20px 60px">
				<form id="frmStu">   
				    <div id="productId">   
				        <label for="name">编号:</label>   
				        <input class="easyui-textbox" type="text" id="Update_id" readOnly="true" name="id" />   
				    </div>   
				    <div>   
				        <label for="prodName">姓名:</label>   
				        <input class="easyui-textbox" type="text" id="Update_name" name="name" />   
				    </div>
				     <div>   
				        <label for="prodType">课程方向:</label>   
				        <input class="easyui-textbox" type="text" id="Update_learnForward" name="learnForward" />
				    </div>
				    <label for="name">是否有效:</label>  
			    		<select style="width: 100px" id="Update_isValid" class="easyui-combobox">
			    		<option >有效</option>
	    				<option >无效</option>
			    		</select>
				    <div>   
				        <label for="prodType">无效原因:</label>   
				        <input class="easyui-textbox" type="text" id="Update_lostValid" name="lostValid" />
				    </div>
				    <label for="name">是否回访:</label>  
			    		<select id="Update_isreturnvist" style="width: 100px" class="easyui-combobox">
			    		<option >已回访</option>
	    				<option >未回访</option>
				    	</select>
				    <div>   
				        <label for="prodType">首访时间:</label>   
				        <input class="easyui-datebox" type="text" id="Update_firstVisitTime" name="firstVisitTime" />
				    </div>
				     <label for="name">是否上门:</label>  
			    		<select style="width: 100px" id="Update_isHome" class="easyui-combobox">
			    		<option >已上门</option>
	    				<option >未上门</option>
			    		</select>
				    <div>   
				        <label for="prodType">上门时间:</label>   
				        <input class="easyui-datebox" type="text" id="Update_homeTime" name="homeTime" />
				    </div>
				     <label for="name">是否缴费:</label>  
			    		<select id="Update_ispay" style="width: 100px" class="easyui-combobox">
			    		<option >已缴费</option>
	    				<option >未缴费</option>
				    	</select>
				    <div>   
				        <label for="prodType">缴费时间:</label>   
				        <input class="easyui-datebox" type="text" id="Update_payTime" name="payTime" />
				    </div>
				    <div>   
				        <label for="prodType">定金金额:</label>   
				        <input class="easyui-textbox" type="text" id="Update_preMoney" name="preMoney" />
				    </div>
				     <div>   
				        <label for="prodType">定金时间:</label>   
				        <input class="easyui-datebox" type="text" id="Update_preMoneyTime" name="preMoneyTime" />
				    </div>
				    <label for="name">是否退费:</label>  
			    		<select style="width: 100px" id="Update_isReturnMoney" class="easyui-combobox">
			    		<option >已退费</option>
	    				<option >未退费</option>
			    		</select>
				    <div>   
				        <label for="prodType">缴费金额:</label>   
				        <input class="easyui-textbox" type="text" id="Update_money" name="money" />
				    </div>
				    <label for="name">是否进班:</label>  
			    		<select style="width: 100px" id="Update_isInClass" class="easyui-combobox">
			    		<option >已进班</option>
	    				<option >未进班</option>
			    		</select>
				    <div>   
				        <label for="prodType">进班时间:</label>   
				        <input class="easyui-datebox" type="text" id="Update_inClassTime" name="inClassTime" />
				    </div>
				    <div>   
				        <label for="prodType">进班备注:</label>   
				        <input class="easyui-textbox" type="text" id="Update_inClassContent" name="inClassContent" />
				    </div>
				    <div>   
				        <label for="prodType">咨询师备注:</label>   
				        <input class="easyui-textbox" type="text" id="Update_askerContent" name="askerContent" />
				    </div>
				    <div style="text-align:center;padding:5px">
		    			<a href="javascript:void(0)" class="easyui-linkbutton" onclick="updateStu()">提交</a>
		    		</div>
		    		
				</form>
		    </div>
		</div>
</body>
</html>