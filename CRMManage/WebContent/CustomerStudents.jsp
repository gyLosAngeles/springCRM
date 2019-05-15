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
		shezhidongtai();
		chaXun();
	})
<<<<<<< HEAD
<<<<<<< HEAD
=======
	/* 查询全部信息 */
>>>>>>> 9567ad619fb3533a7205f8dffdfb0892e0ae3dec
=======
>>>>>>> parent of e951112... 1
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
<<<<<<< HEAD
<<<<<<< HEAD
	function formattercaozuo(value,row,index){
		return "<a href='javascript:void(0)' onclick='updateStudent("+index+")'>编辑</a>|<a href='javascript:void(0)' onclick='genzongStu("+index+")'>跟踪</a>|<a href='javascript:void(0)' onclick='chaKanStu("+index+")'>查看</a>"
	}
=======
	
	function formattercaozuo(value,row,index){
		return "<a href='javascript:void(0)' onclick='updateStudent("+index+")'>编辑</a>|<a href='javascript:void(0)' onclick='genzongStu("+index+")'>跟踪</a>|<a href='javascript:void(0)' onclick='chaKanStu("+index+")'>查看</a>"
	}
	/* 格式化数据表格 */
>>>>>>> 9567ad619fb3533a7205f8dffdfb0892e0ae3dec
=======
	function formattercaozuo(value,row,index){
		return "<a href='javascript:void(0)' onclick='updateStudent("+index+")'>编辑</a>|<a href='javascript:void(0)' onclick='genzongStu("+index+")'>跟踪</a>|<a href='javascript:void(0)' onclick='chaKanStu("+index+")'>查看</a>"
	}
>>>>>>> parent of e951112... 1
	function formatterrizhi(value,row,index){
		return '<button onclick="rizhiStu('+index+')">日志</button>';
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
	function formatteryx(value,row,index) {
		return value==0? '无效':'有效';
	} 
	function formattertf(value,row,index) {
		return value==0? '未退费':'已退费';
	} 
	function formattersm(value,row,index) {
		return value==0? '未上门':'已上门';
	} 
<<<<<<< HEAD
<<<<<<< HEAD
=======
	/* 获取当前行数据填充进修改表单 */
>>>>>>> 9567ad619fb3533a7205f8dffdfb0892e0ae3dec
=======
>>>>>>> parent of e951112... 1
	function updateStudent(index){
		var row = $('#dg').datagrid("getRows")[index];
		console.log(row)
		$("#Update_isValid").combobox('setValue',row.isValid);
		$("#Update_isInClass").combobox('setValue',row.isInClass); 
		$("#Update_isHome").combobox('setValue',row.isHome); 
		$("#Update_isreturnvist").combobox('setValue',row.isReturnVist); 
		$("#Update_ispay").combobox('setValue',row.isPay); 
		$("#Update_isReturnMoney").combobox('setValue',row.isReturnMoney); 
		$("#frmStu").form("load",row);
		$('#updateStu').dialog('open');
		}
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> parent of e951112... 1
	function updateStu(){
		var ispay=$("#Update_ispay").combobox('getValue')=="已缴费"?"1":"0";
		var isvalid=$("#Update_isValid").combobox('getValue')=="有效"?"1":"0";
		var isHome=$("#Update_isHome").combobox('getValue')=="已上门"?"1":"0";
		var isreturnvist=$("#Update_isreturnvist").combobox('getValue')=="已回访"?"1":"0";
		var isReturnMoney=$("#Update_isReturnMoney").combobox('getValue')=="已退费"?"1":"0";
		var isInClass=$("#Update_isInClass").combobox('getValue')=="已进班"?"1":"0";
<<<<<<< HEAD
=======
	/* 修改 */
	function updateStu(){
		$("#Update_ispay").combobox('getValue')=="已缴费"?"1":"0";
		$("#Update_isValid").combobox('getValue')=="有效"?"1":"0";
		$("#Update_isHome").combobox('getValue')=="已上门"?"1":"0";
		$("#Update_isreturnvist").combobox('getValue')=="已回访"?"1":"0";
		$("#Update_isReturnMoney").combobox('getValue')=="已退费"?"1":"0";
		$("#Update_isInClass").combobox('getValue')=="已进班"?"1":"0";
>>>>>>> 9567ad619fb3533a7205f8dffdfb0892e0ae3dec
=======
>>>>>>> parent of e951112... 1
		$.post("UpdateStu",{
			id:$("#Update_id").val(),
			name:$("#Update_name").val(),
			learnForward:$("#Update_learnForward").val(),
			lostValid:$("#Update_lostValid").val(),
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> parent of e951112... 1
			firstVisitTime:$("#Update_firstVisitTime").val(),
			homeTime:$("#Update_homeTime").val(),
			payTime:$("#Update_payTime").val(),
			preMoney:$("#Update_preMoney").val(),
			preMoneyTime:$("#Update_preMoneyTime").val(),
			money:$("#Update_money").val(),
			inClassTime:$("#Update_inClassTime").val(),
			inClassContent:$("#Update_inClassContent").val(),
			askerContent:$("#Update_askerContent").val(),
			ispay:$("#Update_ispay").combobox('getValue'),
			isvalid:$("#Update_isValid").combobox('getValue'),
			isHome:$("#Update_isHome").combobox('getValue'),
			isreturnvist:$("#Update_isreturnvist").combobox('getValue'),
<<<<<<< HEAD
=======
			firstVisitTime:$("#Update_firstVisitTime").datebox('getValue'),
			homeTime:$("#Update_homeTime").datebox('getValue'),
			payTime:$("#Update_payTime").datebox('getValue'),
			preMoney:$("#Update_preMoney").val(),
			preMoneyTime:$("#Update_preMoneyTime").datebox('getValue'),
			money:$("#Update_money").val(),
			inClassTime:$("#Update_inClassTime").datebox('getValue'),
			inClassContent:$("#Update_inClassContent").val(),
			askerContent:$("#Update_askerContent").val(),
			isPay:$("#Update_ispay").combobox('getValue'),
			isValid:$("#Update_isValid").combobox('getValue'),
			isHome:$("#Update_isHome").combobox('getValue'),
			isReturnVist:$("#Update_isreturnvist").combobox('getValue'),
>>>>>>> 9567ad619fb3533a7205f8dffdfb0892e0ae3dec
=======
>>>>>>> parent of e951112... 1
			isReturnMoney:$("#Update_isReturnMoney").combobox('getValue'),
			isInClass:$("#Update_isInClass").combobox('getValue')
			
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
	var indexRow=0;
	function genzongStu(index){
		indexRow = index;
		$('#addNetfollows').dialog('open');
	}
<<<<<<< HEAD
<<<<<<< HEAD
=======
	/* 查看日志 */
>>>>>>> 9567ad619fb3533a7205f8dffdfb0892e0ae3dec
=======
>>>>>>> parent of e951112... 1
	function rizhiStu(index){
		indexRow = index;
		var row = $('#dg').datagrid("getRows")[indexRow];
		$('#rizhi').dialog('open');
		$('#rz').datagrid({
			method:'post',
		    url:'selectNetfollows',
		    queryParams: {
		    		StudentId:row.id
		    }
		});  
	}
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> parent of e951112... 1
	
	function RiZhi(){
		$('#rz').datagrid({
			method:'post',
		    url:'selectNetfollows'
		});  
	}
<<<<<<< HEAD
=======
	/* 查看 */
	function chaKanStu(){
		
	}
	
	
	/* 添加 */
>>>>>>> 9567ad619fb3533a7205f8dffdfb0892e0ae3dec
=======
>>>>>>> parent of e951112... 1
	function insert(){
		var row = $('#dg').datagrid("getRows")[indexRow];
		var myDate = new Date();
		 $.post("insertNetfollows",{
				 Remarks:$("#add_Remarks").val(),
				 FollowTime:$("#add_FollowTime").datebox('getValue'),
				 NextFollowTime:$("#add_NextFollowTime").datebox('getValue'),
				 Content:$("#add_Content").val(),
				 FollowType:$("#add_FollowType").val(),
				 StudentName:row.name,
				 StudentId:row.id,
				 UserId:row.askerId,
<<<<<<< HEAD
<<<<<<< HEAD
=======
				 FollowState:'1',
>>>>>>> 9567ad619fb3533a7205f8dffdfb0892e0ae3dec
=======
>>>>>>> parent of e951112... 1
				 CreateTime:myDate.toLocaleDateString()
			 },function(res){
				if(res){
					alert("保存成功")
					chaXun();
				}else{
					alert("保存失败")
				}
				$('#addNetfollows').dialog('close');
<<<<<<< HEAD
<<<<<<< HEAD
=======
				$('#insertfrom').form('clear');
				location.reload();
>>>>>>> 9567ad619fb3533a7205f8dffdfb0892e0ae3dec
=======
>>>>>>> parent of e951112... 1
			 },"json")	 
		}
	
	
	
	/* 动态显示 */
	function shezhidongtai(){var createGridHeaderContextMenu=function(e,field){e.preventDefault();var grid=$(this);var headerContextMenu=this.headerContextMenu;if(!headerContextMenu){var tmenu=$('<div style="width:100px;"></div>').appendTo('body');
	var fields=grid.datagrid('getColumnFields');for(var i=0;i<fields.length;i++){var fildOption=grid.datagrid('getColumnOption',fields[i]);if(!fildOption.hidden){$('<div iconCls="icon-ok" field="'+fields[i]+'"/>').html(fildOption.title).appendTo(tmenu)}else{$('<div iconCls="icon-empty" field="'+fields[i]+'"/>').html(fildOption.title).appendTo(tmenu)}}headerContextMenu=this.headerContextMenu=tmenu.menu({onClick:function(item){var field=$(item.target).attr('field');if(item.iconCls=='icon-ok'){grid.datagrid('hideColumn',field);$(this).menu('setIcon',{target:item.target,iconCls:'icon-empty'})}else{grid.datagrid('showColumn',field);$(this).menu('setIcon',{target:item.target,iconCls:'icon-ok'})}}})}headerContextMenu.menu('show',{left:e.pageX,button:e.pageY})};$.fn.datagrid.defaults.onHeaderContextMenu=createGridHeaderContextMenu;$.fn.treegrid.defaults.onHeaderContextMenu=createGridHeaderContextMenu}
	
	</script>
</head>
<body>	
		<table id="dg">   
		    <thead>   
		        <tr>   
		            <th data-options="field:'id',width:80,checkbox:true">编码</th>   
		            <th data-options="field:'name',width:80">名称</th>   
		            <th data-options="field:'age',width:80">年龄</th>  
		            <th data-options="field:'sex',width:80">性别</th> 
		            <!-- <th data-options="field:'phone',width:80">手机号码</th> 
		            <th data-options="field:'sourceUrl',width:80">来源网站</th> 
		            <th data-options="field:'learnForward',width:80">课程方向</th>  
		            <th data-options="field:'askerId',width:80">咨询师编号</th>  
		            <th data-options="field:'qq',width:80">QQ</th>
		            <th data-options="field:'weiXin',width:80">微信</th>
		            <th data-options="field:'address',width:80">地址</th>
		            <th data-options="field:'stuStatus',width:80">客户状态</th> -->
		            <th data-options="field:'isValid',width:80,formatter:formatteryx">是否有效</th>
		            <th data-options="field:'isHome',width:80,formatter:formattersm">是否上门</th>
		            <th data-options="field:'isReturnMoney',width:80,formatter:formattertf">是否退费</th>
		            <th data-options="field:'ispay',width:80,formatter:formatterjf">是否缴费</th>  
		            <th data-options="field:'isreturnvist',width:80,formatter:formatterhf">是否回访</th>  
		            <th data-options="field:'isInClass',width:80,formatter:formattersfjb">是否进班</th>  
		            <th data-options="field:'inClassContent',width:80">创建备注</th>  
		            <th data-options="field:'createTime',width:150">创建时间</th>  
		            <th data-options="field:'stuStatus',width:100">客户状态</th>  
		            <th data-options="field:'sourceKeyWord',width:100">来源关键词</th>  
		            <th data-options="field:'firstVisitTime',width:150">创建时间</th>  
		            <th data-options="field:'caozuo',width:100,title:'操作',formatter:formattercaozuo"></th>
<<<<<<< HEAD
<<<<<<< HEAD
		            <th data-options="field:'rizhi',width:50,title:'操作',formatter:formatterrizhi"></th>
=======
		            <th data-options="field:'rizhi',width:50,title:'日志',formatter:formatterrizhi"></th>
>>>>>>> 9567ad619fb3533a7205f8dffdfb0892e0ae3dec
=======
		            <th data-options="field:'rizhi',width:50,title:'操作',formatter:formatterrizhi"></th>
>>>>>>> parent of e951112... 1
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
	




	<div id="updateStu" class="easyui-dialog" title="Basic Dialog" data-options="iconCls:'icon-save',closed:true" style="width:600px;height:400px;padding:10px;">
			<div style="padding:10px 60px 20px 60px">
				<form id="frmStu">   
				    <div id="productId">   
				        <label for="prodType">编号:</label>   
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
				    <label for="prodType">是否有效:</label>  
			    		<select style="width: 100px" id="Update_isValid" class="easyui-combobox">
			    		<option value="1">有效</option>
	    				<option value="0">无效</option>
			    		</select>
				    <div>   
				        <label for="prodType">无效原因:</label>   
				        <input class="easyui-textbox" type="text" id="Update_lostValid" name="lostValid" />
				    </div>
				    <label for="prodType">是否回访:</label>  
			    		<select id="Update_isreturnvist" style="width: 100px" class="easyui-combobox">
			    		<option value="1">已回访</option>
	    				<option value="0">未回访</option>
				    	</select>
				    <div>   
				        <label for="prodType">首访时间:</label>   
				        <input class="easyui-datebox" type="text" id="Update_firstVisitTime" name="firstVisitTime" />
				    </div>
				     <label for="prodType">是否上门:</label>  
			    		<select style="width: 100px" id="Update_isHome" class="easyui-combobox">
			    		<option value="1">已上门</option>
	    				<option value="0">未上门</option>
			    		</select>
				    <div>   
				        <label for="prodType">上门时间:</label>   
				        <input class="easyui-datebox" type="text" id="Update_homeTime" name="homeTime" />
				    </div>
				     <label for="prodType">是否缴费:</label>  
			    		<select id="Update_ispay" style="width: 100px" class="easyui-combobox">
			    		<option value="1">已缴费</option>
	    				<option value="0">未缴费</option>
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
				    <label for="prodType">是否退费:</label>  
			    		<select style="width: 100px" id="Update_isReturnMoney" class="easyui-combobox">
			    		<option value="1">已退费</option>
	    				<option value="0">未退费</option>
			    		</select>
				    <div>   
				        <label for="prodType">缴费金额:</label>   
				        <input class="easyui-textbox" type="text" id="Update_money" name="money" />
				    </div>
				    <label for="prodType">是否进班:</label>  
			    		<select style="width: 100px" id="Update_isInClass" class="easyui-combobox">
			    		<option value="1">已进班</option>
	    				<option value="0">未进班</option>
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
		
		
		
		<div id="addNetfollows" class="easyui-dialog" title="Basic Dialog" data-options="iconCls:'icon-save',closed:true" style="width:400px;height:200px;padding:10px;">
			<div style="padding:10px 60px 20px 60px">
				<form id="insertfrom">   
				     <div>   
				        <label for="prodType">回访时间:</label>   
				        <input class="easyui-datebox" type="text" id="add_FollowTime" name="add_FollowTime" data-options="required:true"/>
				    </div>
				    <div>  
				        <label for="prodType">回访情况:</label>   
				        <input class="easyui-textbox" type="text" id="add_Content" name="add_Content" data-options="required:true"/>
				    </div>
				    <div>   
				        <label for="prodType">跟踪方式:</label>   
				        <input class="easyui-textbox" type="text" id="add_FollowType" name="FollowType" data-options="required:true"/>
				    </div>
				    <div>   
				        <label for="prodType">下次跟踪时间:</label>   
				        <input class="easyui-datebox" type="text" id="add_NextFollowTime" name="add_NextFollowTime" data-options="required:true"/>
				    </div>
				 	<div>   
				        <label for="prodType">备注:</label>   
				        <input class="easyui-textbox" type="text" id="add_Remarks" name="add_Remarks" data-options="required:true"/>
				    </div>
				    <div style="text-align:center;padding:5px">
		    			<a href="javascript:void(0)" class="easyui-linkbutton" onclick="insert()">提交</a>
		    		</div>
				</form>
		    </div>
		</div>
		
		
		<div id="rizhi" class="easyui-dialog" title="My Dialog" style="width:800px;height:200px;"   
        data-options="iconCls:'icon-save',resizable:true,modal:true,closed:true">
		<table id="rz" style="width:750px;height:250px">   
	    	<thead>   
	        <tr>   
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> parent of e951112... 1
	            <th data-options="field:'followTime',width:100">编码</th>   
	            <th data-options="field:'content',width:100">名称</th>   
	            <th data-options="field:'followType',width:100">价格</th>   
	            <th data-options="field:'nextFollowTime',width:100">价格</th>   
	            <th data-options="field:'remarks',width:100">价格</th>   
<<<<<<< HEAD
=======
	            <th data-options="field:'followTime',width:150">回访时间</th>   
	            <th data-options="field:'content',width:150">回访情况</th>   
	            <th data-options="field:'followType',width:80">跟踪方式</th>   
	            <th data-options="field:'nextFollowTime',width:150">下次跟踪时间</th>   
	            <th data-options="field:'remarks',width:150">备注</th>   
>>>>>>> 9567ad619fb3533a7205f8dffdfb0892e0ae3dec
=======
>>>>>>> parent of e951112... 1
		     </tr>   
		    </thead>   
		</table>
		</div>
</body>
</html>