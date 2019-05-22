<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
	<link rel="stylesheet" type="text/css" href="../js/easyui demo/easyui/1.3.4/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="../js/easyui demo/css/wu.css" />
	<link rel="stylesheet" type="text/css" href="../js/easyui demo/css/icon.css" />
	<script type="text/javascript" src="../js/easyui demo/js/jquery-1.8.0.min.js"></script>
	<script type="text/javascript" src="../js/easyui demo/easyui/1.3.4/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="../js/easyui demo/easyui/1.3.4/locale/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="datagrid-export.js"></script>
	<style type="text/css">
	 input {
		width:150px;
		height:25px;
		border-radius:50px;
		margin-bottom:10px;
		margin-top:10px;
		border:1px solid #ccc;
		background-color: transparent;
		text-align:center;
	}
</style>
	
	<script type="text/javascript">
	$(function(){
		shezhidongtai();
		chaXun();
		Dynamic();
	})
	/* 查询全部信息 */
	
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
		var minCreateTime=$('#Stu_mincreatetime').datebox('getValue');
		var maxCreateTime=$('#Stu_maxcreatetime').datebox('getValue');
		var minHomeTime=$('#Stu_minhometime').datebox('getValue');
		var maxHomeTime=$('#Stu_maxhometime').datebox('getValue');
		var minFirstVisitTime=$('#Stu_minfirstvisittime').datebox('getValue');
		var maxFirstVisitTime=$('#Stu_maxfirstvisittime').datebox('getValue');
		var minPayTime=$('#Stu_minpaytime').datebox('getValue');
		var maxPayTime=$('#Stu_maxpaytime').datebox('getValue');
		var minInClassTime=$('#Stu_mininclasstime').datebox('getValue');
		var maxInClassTime=$('#Stu_maxinclasstime').datebox('getValue');
		
		if(minCreateTime>maxCreateTime){
			alert("创建时间搜索区间错误")
		}else if(minHomeTime>maxHomeTime){
			alert("上门时间搜索区间错误")
		}else if(minFirstVisitTime>maxFirstVisitTime){
			alert("首次回访时间搜索区间错误")
		}else if(minPayTime>maxPayTime){
			alert("缴费时间搜索区间错误")
		}else if(minInClassTime>minInClassTime){
			alert("进班时间搜索区间错误")
		}else{
		$('#dg').datagrid({
			method:'post',
		    url:'../wl/selectStuAsker',
		    pagination:true,
		    toolbar:'#tb',
		    queryParams:{
		    	Name:$("#name").val(),
				Phone:$("#phone").val(),
				IsPay:ispay,
				IsValid:isvalid,
				QQ:$("#qq").val(),
				IsReturnVist:isreturnvist,
				ZiXunName:'${user.userName}',
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
	}
	
	function formattercaozuo(value,row,index){
		return "<a href='javascript:void(0)' onclick='updateStudent("+index+")'>编辑</a>|<a href='javascript:void(0)' onclick='genzongStu("+index+")'>跟踪</a>|<a href='javascript:void(0)' onclick='chaKanStuxq("+index+")'>查看</a>"
	}
	function formatterrizhi(value,row,index){
		return '<button onclick="rizhiStu('+index+')">日志</button>';
	}
	/* 格式化数据表格 */
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
	/* 获取当前行数据填充进修改表单 */
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
	/* 修改 */
	function updateStu(){
		$("#Update_ispay").combobox('getValue')=="已缴费"?"1":"0";
		$("#Update_isValid").combobox('getValue')=="有效"?"1":"0";
		$("#Update_isHome").combobox('getValue')=="已上门"?"1":"0";
		$("#Update_isreturnvist").combobox('getValue')=="已回访"?"1":"0";
		$("#Update_isReturnMoney").combobox('getValue')=="已退费"?"1":"0";
		$("#Update_isInClass").combobox('getValue')=="已进班"?"1":"0";
		$.post("../wl/UpdateStu",{
			id:$("#Update_id").val(),
			name:$("#Update_name").val(),
			learnForward:$("#Update_learnForward").val(),
			lostValid:$("#Update_lostValid").val(),
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
	/* 查看日志 */
	function rizhiStu(index){
		indexRow = index;
		var row = $('#dg').datagrid("getRows")[indexRow];
		$('#rizhi').dialog('open');
		$('#rz').datagrid({
			method:'post',
		    url:'../wl/selectNetfollowsID',
		    queryParams: {
		    		StudentId:row.id
		    }
		});  
	}
	/* 查看 */
	function chaKanStuxq(index){
		var row = $('#dg').datagrid("getRows")[index];
		console.log($("#chakan_isPay"));
		$("#chakan_isPay").val(row.isValid=="1"?"有效":"无效");
		$("#chakan_isValid").val(row.isValid=="1"?"有效":"无效");
		$("#chakan_isHome").val(row.isHome=="1"?"已上门":"已上门");
		$("#chakan_isReturnVist").val(row.isReturnVist=="1"?"已回访":"已回访");
		$("#chakan_isReturnMoney").val(row.isReturnMoney=="1"?"已退费":"已退费");
		$("#chakan_isInClass").val(row.isInClass=="1"?"已进班":"已进班");
		$("#frmChaKanStu").form("load",row);
		$('#chaKanStuxq').dialog('open');
	}
	
	
	/* 添加 */
	function insert(){
		var row = $('#dg').datagrid("getRows")[indexRow];
		var FollowTime=$("#add_FollowTime").datebox('getValue');
		var NextFollowTime=$("#add_NextFollowTime").datebox('getValue');
		if(FollowTime>NextFollowTime){
			alert("下次跟踪时间不能小于本次跟踪时间")
		}else if(FollowTime<row.createTime){
			alert("跟踪时间不能早于创建时间");
		}else{
		 $.post("../wl/insertNetfollows",{
				 Remarks:$("#add_Remarks").val(),
				 FollowTime:$("#add_FollowTime").datebox('getValue'),
				 NextFollowTime:$("#add_NextFollowTime").datebox('getValue'),
				 Content:$("#add_Content").val(),
				 FollowType:$("#add_FollowType").val(),
				 StudentName:row.name,
				 StudentId:row.id,
				 UserId:row.askerId,
				 FollowState:'1',
			 },function(res){
				if(res){
					alert("保存成功")
					chaXun();
				}else{
					alert("保存失败")
				}
				$('#addNetfollows').dialog('close');
				$('#insertfrom').form('clear');
				location.reload();
			 },"json")	 
		}
		}
	
	
	
	/* 动态显示 */
	function shezhidongtai(){var createGridHeaderContextMenu=function(e,field){e.preventDefault();var grid=$(this);var headerContextMenu=this.headerContextMenu;if(!headerContextMenu){var tmenu=$('<div style="width:100px;"></div>').appendTo('body');
	var fields=grid.datagrid('getColumnFields');for(var i=0;i<fields.length;i++){var fildOption=grid.datagrid('getColumnOption',fields[i]);if(!fildOption.hidden){$('<div iconCls="icon-ok" field="'+fields[i]+'"/>').html(fildOption.title).appendTo(tmenu)}else{$('<div iconCls="icon-empty" field="'+fields[i]+'"/>').html(fildOption.title).appendTo(tmenu)}}headerContextMenu=this.headerContextMenu=tmenu.menu({onClick:function(item){var field=$(item.target).attr('field');if(item.iconCls=='icon-ok'){grid.datagrid('hideColumn',field);$(this).menu('setIcon',{target:item.target,iconCls:'icon-empty'})}else{grid.datagrid('showColumn',field);$(this).menu('setIcon',{target:item.target,iconCls:'icon-ok'})}}})}headerContextMenu.menu('show',{left:e.pageX,button:e.pageY})};$.fn.datagrid.defaults.onHeaderContextMenu=createGridHeaderContextMenu;$.fn.treegrid.defaults.onHeaderContextMenu=createGridHeaderContextMenu}
	function formattertszt(value,row,index){
		return value==0? '未读':'已读';
	}
	function ts(){
		$('#tsdiv').dialog('open');
		 $('#tstable').datagrid({
				method:'post',
			    url:'../wl/selectPush',
			    toolbar:'#yjyd',
			    queryParams: {
			    	zxname:'${user.userName}'
			    }
			});  
		 $("from").from("load","../wl/selectPush");
		 }
 	var int=self.setInterval("Dynamic()",60000);
	function Dynamic(){
		 $.post("../wl/selectPush",{
			 zxname:'${user.userName}'
		 },function(data){
			 console.log(data);
			 for (var i = 0; i < data.length; i++) {
				if(data[i].isreader==0){
					$.messager.confirm('Confirm','您有未读消息?一分钟后会再次推送',function(r){
					});
				}
			}
		},"json")	 
	} 
	/* function formatteryd(value,row,index){
		return '<button onclick="updatepush('+index+')">已读</button>';
	} */
	function yjyd(){
		/* if(row.isreader>0){
			alert("该消息已经标为已读，请勿重复操作")
		}else{} */
		$.post("../wl/UpdatePush",{
    		isreader:'1'
    	},function(res){
			if(res){
				alert("全部标为已读");
				ts();
			}else{
		    	alert("失败");
		    }
    	})
		
	}
	
	</script>
</head>
<body>	
		<table id="dg" data-options="fitColumns:true,checkbox: true" >  
		<thead>
			<tr>
		            <th data-options="field:'ID',width:80,checkbox:true">编码</th>
		            <th data-options="field:'id',width:40">学生编号</th>      
		            <th data-options="field:'name',width:80">名称</th>   
		            <th data-options="field:'age',width:80">年龄</th>  
		            <th data-options="field:'sex',width:80">性别</th> 
		            <th data-options="field:'phone',width:80">手机号码</th> 
		            <th data-options="field:'sourceUrl',width:80">来源网站</th> 
		            <th data-options="field:'learnForward',width:80">课程方向</th>  
		            <th data-options="field:'askerId',width:80">咨询师编号</th>  
		            <th data-options="field:'qq',width:120">QQ</th>
		            <th data-options="field:'weiXin',width:120">微信</th>
		            <th data-options="field:'address',width:80">地址</th>
		            <th data-options="field:'stuStatus',width:80">客户状态</th>
		            <th data-options="field:'isValid',width:80,formatter:formatteryx">是否有效</th>
		            <th data-options="field:'isHome',width:80,formatter:formattersm">是否上门</th>
		            <th data-options="field:'isReturnMoney',width:80,formatter:formattertf">是否退费</th>
		            <th data-options="field:'isPay',width:80,formatter:formatterjf">是否缴费</th>  
		            <th data-options="field:'isReturnVist',width:80,formatter:formatterhf">是否回访</th>  
		            <th data-options="field:'isInClass',width:80,formatter:formattersfjb">是否进班</th>  
		            <th data-options="field:'inClassContent',width:80,hidden:true">创建备注</th>  
		            <th data-options="field:'createTime',width:150">创建时间</th>
		            <th data-options="field:'stuStatus',width:100">客户状态</th>  
		            <th data-options="field:'sourceKeyWord',width:100">来源关键词</th>  
		            <th data-options="field:'firstVisitTime',width:150">创建时间</th>  
		            <th data-options="field:'caozuo',width:100,title:'操作',formatter:formattercaozuo"></th>
		            <th data-options="field:'rizhi',width:50,title:'日志',formatter:formatterrizhi"></th>
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

			 <a href="javascript:void(0)" onclick="ts()"	class="easyui-linkbutton"	data-options="iconCls:'icon-save',plain:true">推送信息</a>
			<a href="javascript:void(0);" id="btnExport" class="easyui-linkbutton" iconCls='icon-print'>导出Excel</a>
		</form>
	</div>
	



	<!-- 修改 -->
	<div id="updateStu" class="easyui-dialog" title="编辑学生信息" data-options="iconCls:'icon-save',closed:true" style="width:700px;height:600px;padding:10px;">
			<div style="padding:10px 60px 20px 60px">
				<form id="frmStu">   
				    <div >   
				        <label >编号:</label>   
				        <input class="easyui-textbox" type="text" id="Update_id"  readOnly="true" name="id" />   
				        <label for="prodName">姓名:</label>   
				        <input class="easyui-textbox" type="text" id="Update_name" name="name" />   
				    </div>
				     <div>   
				        <label >课程方向:</label>   
				        <input class="easyui-textbox" type="text" id="Update_learnForward" name="learnForward" style="width:300px" />
				    </div>
				    <div>
				    <label >是否有效:</label>  
			    		<select style="width: 100px" id="Update_isValid" class="easyui-combobox">
			    		<option value="1">有效</option>
	    				<option value="0">无效</option>
			    		</select>
			    		<label >无效原因:</label>   
				        <input class="easyui-textbox" type="text" id="Update_lostValid" name="lostValid" />
			    	</div>
			    	<br/>
				    <div> 
				    <label >是否回访:</label>  
			    		<select id="Update_isreturnvist" style="width: 100px" class="easyui-combobox">
			    		<option value="1">已回访</option>
	    				<option value="0">未回访</option>
				    	</select>
				    	 <label >首访时间:</label>   
				        <input class="easyui-datebox" type="text" id="Update_firstVisitTime" name="firstVisitTime" />
				    </div>
				   <br/>
				    <div> 
				     <label >是否上门:</label>  
			    		<select style="width: 100px" id="Update_isHome" class="easyui-combobox">
			    		<option value="1">已上门</option>
	    				<option value="0">未上门</option>
			    		</select>
			    		 <label >上门时间:</label>   
				        <input class="easyui-datebox" type="text" id="Update_homeTime" name="homeTime" />
			    	</div>
				    <br/>
				    <div> 
				     <label >是否缴费:</label>  
			    		<select id="Update_ispay" style="width: 100px" class="easyui-combobox">
			    		<option value="1">已缴费</option>
	    				<option value="0">未缴费</option>
				    	</select>
				    	 <label >缴费时间:</label>   
				        <input class="easyui-datebox" type="text" id="Update_payTime" name="payTime" />
				    </div>
				    <br/>
				    <div>   
				        <label >定金金额:</label>   
				        <input class="easyui-textbox" type="text" id="Update_preMoney" name="preMoney" />
				        <label >定金时间:</label>   
				        <input class="easyui-datebox" type="text" id="Update_preMoneyTime" name="preMoneyTime" />
				    </div>
				    <div> 
				    <label >是否退费:</label>  
			    		<select style="width: 100px" id="Update_isReturnMoney" class="easyui-combobox">
			    		<option value="1">已退费</option>
	    				<option value="0">未退费</option>
			    		</select>
			    		 <label >缴费金额:</label>   
				        <input class="easyui-textbox" type="text" id="Update_money" name="money" />
			    		</div>
				    <div> 
				    <label >是否进班:</label>  
			    		<select style="width: 100px" id="Update_isInClass" class="easyui-combobox">
			    		<option value="1">已进班</option>
	    				<option value="0">未进班</option>
			    		</select>
			    		 <label >进班时间:</label>   
				        <input class="easyui-datebox" type="text" id="Update_inClassTime" name="inClassTime" />
			    	</div>
			    	<br/>
				    <div>   
				        <label >进班备注:</label>   
				        <input class="easyui-textbox" type="text" id="Update_inClassContent" name="inClassContent" />
				        <label >咨询师备注:</label>   
				        <input class="easyui-textbox" type="text" id="Update_askerContent" name="askerContent" />
				    </div>
				    <div style="text-align:center;padding:5px">
		    			<a href="javascript:void(0)" class="easyui-linkbutton"   onclick="updateStu()">提交</a>
		    		</div>
				</form>
		    </div>
		</div>
		
		
		<!-- 添加 -->
		<div id="addNetfollows" class="easyui-dialog" title="跟踪学生情况" data-options="iconCls:'icon-save',closed:true" style="width:400px;height:400px;padding:10px;">
			<div style="padding:10px 60px 20px 60px">
				<form id="insertfrom">   
				     <div>   
				        <label >回访时间:</label>   
				        <input class="easyui-datebox" type="text" id="add_FollowTime" name="add_FollowTime" data-options="required:true"/>
				    </div>
				    <div>  
				        <label >回访情况:</label>   
				        <input class="easyui-textbox" type="text" id="add_Content" name="add_Content" data-options="required:true"/>
				    </div>
				    <div>   
				        <label >跟踪方式:</label>   
				        <input class="easyui-textbox" type="text" id="add_FollowType" name="FollowType" data-options="required:true"/>
				    </div>
				    <div>   
				        <label>下次跟踪:</label>   
				        <input class="easyui-datebox" type="text" id="add_NextFollowTime" name="add_NextFollowTime" data-options="required:true"/>
				    </div>
				 	<div>   
				        <label>跟踪备注:</label>   
				        <input class="easyui-textbox" type="text" id="add_Remarks" name="add_Remarks" data-options="required:true"/>
				    </div>
				    <div style="text-align:center;padding:5px">
		    			<a href="javascript:void(0)" class="easyui-linkbutton" onclick="insert()">提交</a>
		    		</div>
				</form>
		    </div>
		</div>
		<!-- 查看对应学生的跟踪日志 -->
			<div id="rizhi" class="easyui-dialog" title="学生跟踪信息" style="width:800px;height:500px;"   
	        data-options="iconCls:'icon-save',resizable:true,modal:true,closed:true">
		<table id="rz">   
		    <thead>   
	        <tr>   
	            <th data-options="field:'followTime',width:150">回访时间</th>   
	            <th data-options="field:'content',width:150">回访情况</th>   
	            <th data-options="field:'followType',width:80">跟踪方式</th>   
	            <th data-options="field:'nextFollowTime',width:150">下次跟踪时间</th>   
	            <th data-options="field:'remarks',width:150">备注</th>   
		     </tr>   
		    </thead>   
		</table>
		</div>
		<!-- 推送信息 -->
		<div id="tsdiv" class="easyui-dialog" title="推送信息" style="width:800px;height:500px;"   
	        data-options="iconCls:'icon-save',resizable:true,modal:true,closed:true">
		<table id="tstable">   
		    <thead>   
	        <tr>   
	            <th data-options="field:'studentid',width:50">学生ID</th>   
	            <th data-options="field:'studentname',width:80">学生名字</th>   
	            <th data-options="field:'context',width:250">推送内容</th>   
	            <th data-options="field:'isreader',width:80,formatter:formattertszt">推送状态</th>   
	            <th data-options="field:'tstime',width:150">推送时间</th>   
	            <!-- <th data-options="field:'yd',width:80,formatter:formatteryd">操作</th> -->
		     </tr>   
		    </thead>   
		</table>
		</div>
		<!-- 一键标为已读 -->
		<div id="yjyd" align="center">
		<a href="javascript:void(0)" onclick="yjyd()"	class="easyui-linkbutton"	data-options="iconCls:'icon-save',plain:true">全部标为已读</a>
		</div>
		<!-- 查看学生详细信息 -->
		<div id="chaKanStuxq" class="easyui-dialog" title="查看学生详细信息" data-options="iconCls:'icon-save',closed:true" style="width:800px;height:600px;padding:10px;">
			<div style="padding:10px 60px 20px 60px">
				<form id="frmChaKanStu">   
					 <table >
  						<tr>  
				        <td><label>名称:</label></td>
				        <td><input class="easyui-textbox" type="text" readOnly="true" name="name" /></td>
				        <td><label >年龄:</label></td>
				        <td><input class="easyui-textbox" type="text"  readOnly="true" name="age" />   </td> 
				        </tr>
				        <tr>
				        <td><label >性别:</label>   </td> 
				        <td><input class="easyui-textbox" type="text"  readOnly="true" name="sex" />   </td> 
				        <td><label >电话:</label>   </td> 
				        <td><input class="easyui-textbox" type="text"  readOnly="true" name="phone" />  </td>  
				   </tr>
				        <tr>
				        <td><label >客户状态:</label>   </td> 
				        <td><input class="easyui-textbox" type="text"  readOnly="true" name="stuStatus" />   </td> 
				         <td><label >来源网站:</label>   </td> 
				        <td><input class="easyui-textbox" type="text"  readOnly="true" name="sourceUrl" />   </td> 
				    </tr>
				        <tr>  
				        <td><label >学员关注:</label>   </td> 
				        <td><input class="easyui-textbox" type="text"  readOnly="true" name="perState" /> </td>   
				        <td><label >来源部门:</label>   </td> 
				        <td><input class="easyui-textbox" type="text"  readOnly="true" name="msgSource" />   </td> 
				    </tr>
				        <tr> 
				        <td><label >来源关键词:</label>   </td> 
				        <td><input class="easyui-textbox" type="text"  readOnly="true" name="sourceKeyWord" />   </td> 
				        <td><label >地址:</label>   </td> 
				        <td><input class="easyui-textbox" type="text"  readOnly="true" name="address" />   </td> 
				   </tr>
				        <tr>  
				        <td><label >编号:</label>   </td> 
				        <td><input class="easyui-textbox" type="text"  readOnly="true" name="netPusherId" />   </td> 
				         <td><label >qq:</label>   </td> 
				        <td><input class="easyui-textbox" type="text"  readOnly="true" name="qq" />   </td> 
				    </tr>
				        <tr>  
				        <td><label >微信:</label>   </td> 
				        <td><input class="easyui-textbox" type="text"  readOnly="true" name="weiXin" />   </td> 
				        <td><label >内容:</label>   </td> 
				        <td><input class="easyui-textbox" type="text"  readOnly="true" name="content" />   </td> 
				    </tr>
				        <tr>   
				        <td><label >课程方向:</label>   </td> 
				        <td><input class="easyui-textbox" type="text"  readOnly="true" name="learnForward" />   </td> 
				        <td><label >是否有效:</label>   </td> 
				        <td><input  type="text" id="chakan_isValid"  name="isValid" />   </td> 
				   </tr>
				        <tr>
				        <td><label >记录:</label>   </td> 
				        <td><input class="easyui-textbox" type="text"  readOnly="true" name="record" />   </td> 
				        <td><label >是否回访:</label>   
				        <td><input class="easyui-textbox" type="text"  id="chakan_isReturnVist" readOnly="true" name="isReturnVist" />
				    </tr>
				        <tr>  
				        <td><label >首访时间:</label>   
				        <td><input class="easyui-textbox" type="text"  readOnly="true" name="firstVisitTime" />   
				         <td><label >是否上门:</label>   
				        <td><input class="easyui-textbox" type="text" id="chakan_isHome" readOnly="true" name="isHome" />   
				    </tr>
				        <tr>   
				        <td><label >上门时间:</label>   
				       <td> <input class="easyui-textbox" type="text"  readOnly="true" name="homeTime" />   </td>
				        <td><label >无效原因:</label>   
				        <td><input class="easyui-textbox" type="text"  readOnly="true" name="lostValid" /></td>
				    </tr>
				        <tr> 
				        <td><label >是否缴费:</label> </td> 
				        <td><input  class="easyui-textbox" type="text" id="chakan_isPay"   name="isPay" />   
				        <td><label >缴费时间:</label>   </td> 
				        <td><input class="easyui-textbox" type="text"  readOnly="true" name="payTime" />   </td> 
				    </tr>
				        <tr>  
				        <td><label >金额:</label>   </td> 
				        <td><input class="easyui-textbox" type="text"  readOnly="true" name="money" />   </td> 
				        <td><label >是否退费:</label>   </td> 
				        <td><input class="easyui-textbox" type="text" id="chakan_isReturnMoney" readOnly="true" name="isReturnMoney" />   </td> 
				   </tr>
				        <tr> 
				       <td> <label >是否进班:</label>   </td> 
				       <td> <input class="easyui-textbox" type="text" id="chakan_isInClass" readOnly="true" name="isInClass" />   </td> 
				       <td> <label >进班时间:</label>   </td> 
				       <td> <input class="easyui-textbox" type="text"  readOnly="true" name="inClassTime" />   </td> 
				   </tr>
				        <tr>   
				        <td><label >进班备注:</label>   </td> 
				        <td><input class="easyui-textbox" type="text"  readOnly="true" name="inClassContent" />   </td> 
				         <td><label >咨询师备注:</label>   </td> 
				        <td><input class="easyui-textbox" type="text"  readOnly="true" name="askerContent" />   </td> 
				    </tr>
				        <tr>  
				        <td><label >咨询师:</label>   </td> 
				        <td><input class="easyui-textbox" type="text"  readOnly="true" name="ziXunName" />   </td> 
				          <td><label >退费原因:</label>   
				        <td><input class="easyui-textbox" type="text"  readOnly="true" name="returnMoneyReason" />   </td> 
				   </tr>
				        <tr>  
				        <td><label >定金金额:</label></td> 
				        <td><input class="easyui-textbox" type="text"  readOnly="true" name="preMoney" />   </td> 
				    </tr> 
				</table>
				</form>
				</div>
		</div>
		</body>
</html>
<script type="text/javascript">
function JSONToCSVConvertor(JSONData, ReportTitle, ShowLabel) {
	//如果jsondata不是对象，那么json.parse将分析对象中的json字符串。
	var arrData = typeof JSONData != 'object' ? JSON.parse(JSONData) : JSONData;
	var CSV = '';

	//在第一行拼接标题
	CSV += ReportTitle + '\r\n\n';

	//产生数据标头
	if (ShowLabel) {
		var row = "";
		//此循环将从数组的第一个索引中提取标签
		for ( var index in arrData[0]) {

			//现在将每个值转换为字符串和逗号分隔
			row += index + ',';
		}

		row = row.slice(0, -1);

		//添加带换行符的标签行
		CSV += row + '\r\n';
	}

	//第一个循环是提取每一行
	for (var i = 0; i < arrData.length; i++) {
		var row = "";

		//2nd loop will extract each column and convert it in string comma-seprated
		for ( var index in arrData[i]) {
			row += '"' + arrData[i][index] + '",';
		}

		row.slice(0, row.length - 1);

		//add a line break after each row
		CSV += row + '\r\n';
	}

	if (CSV == '') {
		alert("Invalid data");
		return;
	}

	//Generate a file name
	var fileName = "我的学生_";
	//this will remove the blank-spaces from the title and replace it with an underscore
	fileName += ReportTitle.replace(/ /g, "_");

	//Initialize file format you want csv or xls
	//var uri = 'data:text/csv;charset=utf-8,' + escape(CSV);
	var uri = 'data:text/csv;charset=utf-8,\ufeff' + encodeURI(CSV);

	// Now the little tricky part.
	// you can use either>> window.open(uri);
	// but this will not work in some browsers
	// or you will not get the correct file extension    

	//this trick will generate a temp <a /> tag
	var link = document.createElement("a");
	link.href = uri;

	//set the visibility hidden so it will not effect on your web-layout
	link.style = "visibility:hidden";
	link.download = fileName + ".csv";

	//this part will append the anchor tag and remove it after automatic click
	document.body.appendChild(link);
	link.click();
	document.body.removeChild(link);
}

$("#btnExport").click(function() {
	var data = JSON.stringify($('#dg').datagrid('getData').rows);
	if (data == '')
		return;

	JSONToCSVConvertor(data, "数据信息", true);
});
</script>