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
	
	var ws = null;
	if (WebSocket) {
		ws = new WebSocket(
				"ws://localhost:8080/CRMManage/chat/${user.userName}");
	} else {
		alert("浏览器不支持WebSocket!");
	}
	ws.onopen = function() {
	}
	ws.onclose = function() {
	}
	//接受服务器端发送的消息
	ws.onmessage = function(event) {
		//alert(event.data);
		var text=$("#span").html();
		text++;
		$("#span").html(text);
	}
	$(function() {
		tsxs();
		shezhidongtai();
		chaXun();

	})
	/* 查询全部信息 */
	
	function chaXun(){
		var ispay=$("#ispay").combobox('getValue');if(ispay=="--请选择--"){ispay='';}if(ispay=="已缴费"){ispay='1';}if(ispay=="未缴费"){ispay='0';}var isvalid=$("#isvalid").combobox('getValue');if(isvalid=="--请选择--"){isvalid='';}if(isvalid=="有效"){isvalid='1';}if(isvalid=="无效"){isvalid='0';}var isreturnvist=$("#isreturnvist").combobox('getValue');if(isreturnvist=="--请选择--"){isreturnvist='';}if(isreturnvist=="已回访"){isreturnvist='1';}if(isreturnvist=="未回访"){
		isreturnvist='0';}var minCreateTime=$('#Stu_mincreatetime').datebox('getValue');var maxCreateTime=$('#Stu_maxcreatetime').datebox('getValue');var minHomeTime=$('#Stu_minhometime').datebox('getValue');var maxHomeTime=$('#Stu_maxhometime').datebox('getValue');var minFirstVisitTime=$('#Stu_minfirstvisittime').datebox('getValue');var maxFirstVisitTime=$('#Stu_maxfirstvisittime').datebox('getValue');var minPayTime=$('#Stu_minpaytime').datebox('getValue');var maxPayTime=$('#Stu_maxpaytime').datebox('getValue');var minInClassTime=$('#Stu_mininclasstime').datebox('getValue');var maxInClassTime=$('#Stu_maxinclasstime').datebox('getValue');
		
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
		    onDblClickCell:function(index,field,value){
		    	chaKanStuxq(index)
			},
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
	
	
	/* 格式化数据表格 */
	function formattercaozuo(value,row,index){
		return "<a href='javascript:void(0)' onclick='updateStudent("+index+")'>编辑</a>|<a href='javascript:void(0)' onclick='genzongStu("+index+")'>跟踪</a>|<a href='javascript:void(0)' onclick='chaKanStuxq("+index+")'>查看</a>"
	}
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
			learnForward:$("#Update_learnForward").datebox('getValue'),
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
	/* 查看全部信息 */
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
	
	
	/* 跟踪 */
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
				 UserId:'${user.userId}',
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
	function ts() {
		$('#tsdiv').dialog('open');
		$('#tstable').datagrid({
			method : 'post',
			url : '../wl/selectPush',
			toolbar : '#yjyd',
			onDblClickRow:function(index, row){
				var dat= $('#tstable').datagrid("getData");
				/* alert(dat.rows[index].studentid); */
				$.ajax({
					url:'../wl/UpdatePush',
					method:'post',
					data:{
						isreader : '1',
						id:dat.rows[index].id
					},
					datType:'json',
					success:function(res){
						var text=$("#span").html();
						text--;
						$("#span").html(text);
						$("#chaKantsdivf").form("load", dat.rows[index]);
						$("#isreaderwxx").textbox("setValue","已读");
						/* dat.rows[index].isreader=="1" ? $("#isreaderwxx").textbox("setValue","已读") :null; */
						$('#chaKantsdiv').dialog('open');
						$("#tstable").datagrid("reload");
						
					}
				})
			},
			queryParams : {
				zxname : '${user.userName}'
			}
			
		});
		$("from").from("load", "../wl/selectPush");
	}
	function tsxs(){
		 $.ajax({
				url:"../wl/selectcountPush",
				type:"post",
				dataType:"json",
				success:function(data){
					if(data>=0){
						$("#span").html(data);
					}
				}
			}) 
	}
 	/* var ss=self.setInterval("Dynamic()",60000); */
 	/* setInterval(function() {
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
 	}, 10000); */
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
		            <th data-options="field:'ID',checkbox:true">编码</th>
		            <th data-options="field:'id'">学生编号</th>      
		            <th data-options="field:'name'">名称</th>   
		            <th data-options="field:'age'">年龄</th>  
		            <th data-options="field:'sex'">性别</th> 
		            <th data-options="field:'phone',hidden:true">手机号码</th> 
		            <th data-options="field:'sourceUrl'">来源网站</th> 
		            <th data-options="field:'learnForward'">课程方向</th>  
		            <th data-options="field:'askerId',hidden:true">咨询师编号</th>  
		            <th data-options="field:'qq'">QQ</th>
		            <th data-options="field:'weiXin',hidden:true">微信</th>
		            <th data-options="field:'address'">地址</th>
		            <th data-options="field:'stuStatus',hidden:true">客户状态</th>
		            <th data-options="field:'isValid',formatter:formatteryx">是否有效</th>
		            <th data-options="field:'isHome',formatter:formattersm">是否上门</th>
		            <th data-options="field:'isReturnMoney',formatter:formattertf">是否退费</th>
		            <th data-options="field:'isPay',formatter:formatterjf">是否缴费</th>  
		            <th data-options="field:'isReturnVist',formatter:formatterhf">是否回访</th>  
		            <th data-options="field:'isInClass',formatter:formattersfjb">是否进班</th>  
		            <th data-options="field:'inClassTime'">进班时间</th>
		            <th data-options="field:'inClassContent',hidden:true">创建备注</th>  
		            <th data-options="field:'createTime',hidden:true">创建时间</th>
		            <th data-options="field:'stuStatus',hidden:true">客户状态</th>  
		            <th data-options="field:'sourceKeyWord',hidden:true">来源关键词</th>  
		            <th data-options="field:'firstVisitTime',hidden:true">首访时间</th>  
		            <th data-options="field:'caozuo',title:'操作',formatter:formattercaozuo"></th>
		            <th data-options="field:'rizhi',title:'日志',formatter:formatterrizhi"></th>
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
				<input type="text" id="Stu_mincreatetime" editable="false" class= "easyui-datebox"  />--
				<input type="text" id="Stu_maxcreatetime" editable="false" class= "easyui-datebox" />
			<label for="name">上门时间:</label> 
				<input type="text" id="Stu_minhometime" editable="false" class= "easyui-datebox"/>--
				<input type="text" id="Stu_maxhometime" editable="false" class= "easyui-datebox"/>
			<label for="name">首次回访时间:</label> 
				<input type="text" id="Stu_minfirstvisittime" editable="false" class= "easyui-datebox" />--
				<input type="text" id="Stu_maxfirstvisittime" editable="false" class= "easyui-datebox" />
			<br/><br/>
			<label for="name">缴费时间:</label> 
				<input type="text" id="Stu_minpaytime" editable="false" class= "easyui-datebox" />--
				<input type="text" id="Stu_maxpaytime" editable="false" class= "easyui-datebox" />
			<label for="name">进班时间:</label> 
				<input type="text" id="Stu_mininclasstime" editable="false" class= "easyui-datebox" />--
				<input type="text" id="Stu_maxinclasstime" editable="false" class= "easyui-datebox" />
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
				        <select style="width: 300px" id="Update_learnForward" editable="false" name="learnForward" class="easyui-combobox">
			    		<option >软件开发</option>
	    				<option >网络营销</option>
	    				<option >.NET</option>
	    				<option >Java</option>
			    		</select>
				    </div>
				    <div>
				    <label >是否有效:</label>  
			    		<select style="width: 100px" id="Update_isValid" editable="false" class="easyui-combobox">
			    		<option value="1">有效</option>
	    				<option value="0">无效</option>
			    		</select>
			    		<label >无效原因:</label>   
				        <input class="easyui-textbox" type="text" id="Update_lostValid" name="lostValid" />
			    	</div>
			    	<br/>
				    <div> 
				    <label >是否回访:</label>  
			    		<select id="Update_isreturnvist" editable="false" style="width:100px" class="easyui-combobox">
			    		<option value="1">已回访</option>
	    				<option value="0">未回访</option>
				    	</select>
				    	 <label >首访时间:</label>   
				        <input class="easyui-datebox" type="text"  id="Update_firstVisitTime" name="firstVisitTime" />
				    </div>
				   <br/>
				    <div> 
				     <label >是否上门:</label>  
			    		<select style="width: 100px" editable="false" id="Update_isHome" class="easyui-combobox">
			    		<option value="1">已上门</option>
	    				<option value="0">未上门</option>
			    		</select>
			    		 <label >上门时间:</label>   
				        <input class="easyui-datebox" type="text" editable="false" id="Update_homeTime" name="homeTime" />
			    	</div>
				    <br/>
				    <div> 
				     <label >是否缴费:</label>  
			    		<select id="Update_ispay" editable="false" style="width: 100px" class="easyui-combobox">
			    		<option value="1">已缴费</option>
	    				<option value="0">未缴费</option>
				    	</select>
				    	 <label >缴费时间:</label>   
				        <input class="easyui-datebox" type="text" editable="false" id="Update_payTime" name="payTime" />
				    </div>
				    <br/>
				    <div>   
				        <label >定金金额:</label>   
				        <input class="easyui-textbox" type="text" id="Update_preMoney" name="preMoney" />
				        <label >定金时间:</label>   
				        <input class="easyui-datebox" type="text" editable="false" id="Update_preMoneyTime" name="preMoneyTime" />
				    </div>
				    <div> 
				    <label >是否退费:</label>  
			    		<select style="width: 100px" editable="false" id="Update_isReturnMoney" class="easyui-combobox">
			    		<option value="1">已退费</option>
	    				<option value="0">未退费</option>
			    		</select>
			    		 <label >缴费金额:</label>   
				        <input class="easyui-textbox" type="text" id="Update_money" name="money" />
			    		</div>
				    <div> 
				    <label >是否进班:</label>  
			    		<select style="width: 100px" editable="false" id="Update_isInClass" class="easyui-combobox">
			    		<option value="1">已进班</option>
	    				<option value="0">未进班</option>
			    		</select>
			    		 <label >进班时间:</label>   
				        <input class="easyui-datebox" type="text" editable="false" id="Update_inClassTime" name="inClassTime" />
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
				        <input class="easyui-datebox" type="text" editable="false" id="add_FollowTime" name="add_FollowTime" data-options="required:true"/>
				    </div>
				    <div>  
				        <label >回访情况:</label>   
				        <input class="easyui-textbox" type="text"  id="add_Content" name="add_Content" data-options="required:true"/>
				    </div>
				    <div>   
				        <label >跟踪方式:</label>   
				        <input class="easyui-textbox" type="text" id="add_FollowType" name="FollowType" data-options="required:true"/>
				    </div>
				    <div>   
				        <label>下次跟踪:</label>   
				        <input class="easyui-datebox" type="text" editable="false" id="add_NextFollowTime" name="add_NextFollowTime" data-options="required:true"/>
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
	            <th data-options="field:'followTime'">回访时间</th>   
	            <th data-options="field:'content'">回访情况</th>   
	            <th data-options="field:'followType'">跟踪方式</th>   
	            <th data-options="field:'nextFollowTime'">下次跟踪时间</th>   
	            <th data-options="field:'remarks'">备注</th>   
		     </tr>   
		    </thead>   
		</table>
		</div>
		<!-- 推送信息 -->
		<div id="tsdiv" class="easyui-dialog" title="推送信息"
		style="width: 200px; height: 500px;"
		data-options="iconCls:'icon-save',resizable:true,modal:true,closed:true">
		<table id="tstable">
			<thead>
				<tr>
				  <th data-options="field:'id',hidden:true">ID</th>
					<th data-options="field:'studentid',hidden:true">学生ID</th>
					<th data-options="field:'studentname'">学生名字</th>
					<th data-options="field:'context',hidden:true">推送内容</th>
					<th data-options="field:'isreader',formatter:formattertszt">推送状态</th>
					<th data-options="field:'tstime',hidden:true">推送时间</th>
					<!-- <th data-options="field:'yd',formatter:formatteryd">操作</th> -->
				</tr>
			</thead>
		</table>
		<div id="yjyd" align="center">
			<a href="javascript:void(0)" onclick="yjyd()"
				class="easyui-linkbutton"
				data-options="iconCls:'icon-save',plain:true">全部标为已读</a>
		</div>
	</div>
	<!-- 查看推送信息 -->
	
	<div id="chaKantsdiv" class="easyui-dialog" title="查看学推送详细信息"
		data-options="iconCls:'icon-save',closed:true"
		style="width: 800px; height: 600px; padding: 10px;">
		<form id="chaKantsdivf">
		<table>
		<tr>
		<td><label>学生姓名:</label></td>
		<td><input class="easyui-textbox" type="text" readOnly="true" name="studentname" /></td>
		<td><label>推送时间:</label></td>
		<td><input class="easyui-textbox" type="text" readOnly="true" name="tstime" /></td>
		</tr>
		<tr>
		<td><label>推送内容:</label></td>
		<td><input class="easyui-textbox" type="text" readOnly="true" name="context" /></td>
		<td><label>推送状态:</label></td>
		<td><input class="easyui-textbox" type="text" readOnly="true" id="isreaderwxx" name="isreader" /></td>
		
		
		</tr>
		</table>
		
		</form>
		</div>
		<!-- 一键标为已读 -->
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
				        <td><input  type="text" id="chakan_isValid" style="width:150px" name="isValid" />   </td> 
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