<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../js/easyui/insdep.easyui.min.css">
<link rel="stylesheet" type="text/css" href="../js/easyui/icon.css">
<link rel="stylesheet" type="text/css" href="../js/easyui demo/easyui/1.3.4/demo/demo.css">
<script type="text/javascript" src="../js/easyui/jquery.min.js"></script>
<script type="text/javascript" src="../js/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript"src="../js/easyui/insdep.extend.min.js"></script>
<script type="text/javascript"src="../js/easyui/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">
var ws=null;
if(WebSocket){
	ws=new WebSocket("ws://localhost:8080/CRMManage/chat/${user.userName}");
}else{
	alert("浏览器不支持WebSocket!");
}
ws.onopen=function(){
}
ws.onclose=function(){
} 
var fieldArr=[];
$(function() {
	init();
	var jl= $("th[name='jingli']");
	for (var i = 0; i < jl.length; i++) {
		var st = $(jl[i]).attr("data-options");
		/* console.log(st) */
		fieldArr[i]=st.substring(st.indexOf("'")+1,st.indexOf(",")-1);//获取刚开始需要隐藏的列名
		/* console.log(arr[i])*/
	}
	var cbx = $("#hiddenColumn_form input[type='checkbox']").prop("checked", true);
	for (var i = 0; i < fieldArr.length; i++) {
		for (var j = 0; j < cbx.length; j++) {
			if(fieldArr[i]==cbx[j].value){
				$(cbx[j]).removeAttr("checked","checked");
			}
		}
	}
	if("${role}"=="1"){
		$('#cc').combobox({    
		    url:'/CRMManage/directorSelectAskers',    
		    valueField:'askerId',    
		    textField:'askerName'   
		});
		$('#automaticButton').switchbutton({
			onChange: function(checked){
				 $.ajax({
	                   url : '../directorUpdateAskersChangeState',
	                   dataType : 'json',
	                   type : 'post',
	                   data : {
	                	   changeState : checked==true? 1:2
	                   },
	                   success : function(data) {
	                     	if(data){
	                     		alert("开启成功");
	                     	}else{
	                     		alert("开启失败");
	                     	}
	                   },
	                   error : function(data) {
	                	   $.messager.show({
	                           title : '提示',
	                           msg : '开启失败',
	                       });
	                   }
	             }); 
			}
		});
	}
	$("#askerName1").combobox({    
	    url:'../wl/selectStudentsAkername?userName=${user.userName}',    
	    valueField:'ziXunName',    
	    textField:'ziXunName' ,
	    method:'post'
	});
});
function selects(numbers){
	$(numbers).combobox({    
	    url:'../wl/selectAskers',    
	    valueField:'askerId',    
	    textField:'askerName' ,
	    method:'post'
	});
}

/* 格式化表格 */
/* 是否有效 */
function isValidf(value,row,index){
	 var arr = $("#wlsdg").datagrid("getData");
	if(arr.rows[index].isValid==1){
		return "是";
	}else if(arr.rows[index].isValid==2){
		return "否";
	}
	else {
		return "待定";
	}
}
/*  是否回访*/
function isReturnVistf(value,row,index){
	 return value==1? '已回访':'未回访';
	}
/*  是否上门*/
function isHomef(value,row,index){
	 return value==1? '是':'否';
	}
/*  是否缴费*/
function isPayf(value,row,index){
	 return value==1? '已缴费':'未缴费';
	}
/*  是否退费*/
function isReturnMoneyf(value,row,index){
	 return value==1? '已退费':'未退费';
	}
/* 是否进班*/
function isInClassf(value,row,index){
	 return value==1? '已进班':'未进班';
	}
/* 是否删除 */
function isDelf(value,row,index){
	 return value==1? '是':'否';
	}
/* 是否报备 */
function isBaoBeif(value,row,index){
	 return value==1? '是':'否';
	}
	/*咨询师  */
function ziXunNamef(value,row,index){
	 return value=='' ? '未分配' : value;	
	}
function init(){
	$("#wlsdg").datagrid({
		url : "../wl/selectAllStudentsController",
		type:"post",
		pagination : true,
		toolbar:"#tool",
		checkOnSelect:false,
		selectOnCheck:false,
		onDblClickRow:function(index, row){
			ChaKan(index);
		},
		queryParams : {
			Name : $("#Name1").val(),
			Phone : $("#Phone1").val(),
			ziXunName : $("#askerName1").val(),
			QQ : $("#QQ1").val(),
			minCreateTime : $("#minCreateTime1").datebox("getValue"),
			maxCreateTime : $("#maxCreateTime2").datebox("getValue"),
			IsPay : $("#IsPay1").combobox("getValue"),
			IsValid : $("#IsValid1").combobox("getValue"),
			IsReturnVist : $("#IsReturnVist1").combobox("getValue"),
			userName:"${user.userName}"
		}
	});
}
/**
 * 添加
 */
function add(){
	$("#add").dialog("open");
}
 function addTijiao(){
	 if($("#name1").val()=="" || $("#name1").val()==null && $("#sex1").val()=="" || $("#sex1").val()==null  && $("#phone1").val()=="" || $("#phone1").val()==null&& $("#age1").val()=="" || $("#age1").val()==null){
		  alert("！性别，名子，年龄，电话不能为空，请完善");
		 return ;
	 }
	 if($("#name1").val()=="" || $("#name1").val()==null){
		  alert("！名子不能为空，请完善");
		 return ;
	 }
	 if( $("#sex1").val()=="" ||  $("#sex1").val()==null){
		 alert("！性别不能为空，请完善");
		 return ;
	 }
	  if( $("#age1").val()=="" ||$("#age1").val()==null ){
		 alert("！年龄不能为空，请完善");
		 return ;
	 }
	 if( $("#phone1").val()=="" || $("#phone1").val()==null){
		 alert("！电话不能为空，请完善");
		 return ;
	 } 
	 if(!(/^1[3|5|8][0-9]\d{4,8}$/.test($('#phone1').val())))
	 {
	 alert('手机号码格式不对');
	 return ;
	 }
	 $.ajax({
			url:"../wl/insertCountStudents",
			type:"post",
			dataType:"json",
			data:$("#addfrm").serializeArray(),
			success:function(res){
				if(res>0){
					$.messager.alert('警告','添加成功');
					$("#wlsdg").datagrid("reload");
					$("#add").dialog("close");
				}
				else{
					$.messager.alert('警告','添加失败');
				}
			}
		}) 
}
 function addQuexiao(){
	 $("#add").dialog("close");
 }
 /*  删除*/
 function Shanchu(){
	   var selRow = $("#wlsdg").datagrid('getSelections');
       if (selRow.length == 0) {
    	   $.messager.show({
               title : '提示',
               msg : '请至少选择一行数据!',
               timeout : 3000,
               showType : 'slide',
               style:{
            	   right:'',
            	   bottom:''
            	   }
           });
           return false;
       }
       var ids ="";
       for (var i = 0; i < selRow.length; i++) {
           var id = selRow[i].id;
         	ids+=id+","
       } 
      /*  var ids = [];
       for (var i = 0; i < selRow.length; i++) {
           var id = selRow[i].id;
           ids.push(id); //把单个id循环放到ids的数组中  
       } */
       $.messager.confirm('提示', '确认删除?', function(r) {
           if (r) {
               $.ajax({
                   url : '../wl/deleteStudents2',
                   dataType : 'json',
                   type : 'post',
                   data : {
                	   ids : ids
                   },
                   success : function(data) {
                       $.messager.show({
                           title : '提示',
                           msg : '删除成功',
                           style:{
                        	   right:'',
                        	   bottom:''
                        	   }
                       });
                       $("#wlsdg").datagrid("reload");
                   },
                   error : function(data) {
                	   $.messager.show({
                           title : '提示',
                           msg : '删除失败',
                           style:{
                        	   right:'',
                        	   bottom:''
                        	   }
                       });
                   }
               });
           }
       });
 }
 function formattercaozuo(value,row,index){
		return "<a href='javascript:void(0)' class='easyui-linkbutton'  onclick='ChaKan("+index+")'>查看</a>||<a href='javascript:void(0)'  class='easyui-linkbutton' onclick='Updatestudents("+index+")'>编辑</a>||<a href='javascript:void(0)'  class='easyui-linkbutton' onclick='Tuisong("+index+")'>动态推送</a>";
	}
 //推送信息
 function Tuisong(index){
	 	
		var arr = $("#wlsdg").datagrid("getData");
		$("#sname").html(arr.rows[index].name)
		$("#pushfrms").form("load",arr.rows[index].ziXunName);
		/* console.log(arr.rows[index].ziXunName); */
		$("#selectidss").html(arr.rows[index].ziXunName);
		$("#push").dialog("open");
	}

	function pushTijiao(){
		var row= $("#wlsdg").datagrid("getSelected");
		ws.send("${user.userName},"+$('#selectidss').html()+","+$('#textareas').val());
		 $.ajax({
			url:"../wl/addPush",
			type:"post",
			dataType:"json",
			data:{
				studentid:row.id,
				studentname:row.name,
				zxname:$("#selectidss").html(),
				context:$("#textareas").val(),
				isreader:$("#bss").val()
			},
			success:function(res){
				if(res>0){
					$.messager.alert('提示','推送成功');
					$("#push").dialog("close");
					$("#pushfrms").form("clear");
				}
				else{
					$.messager.alert('警告','推送失败');
				}
			}
		})  
	}
 
/* 查看 */

function ChaKan(index){
	var arr = $("#wlsdg").datagrid("getData");
	$("#ChaKanfrm").form("load",arr.rows[index]);
	/* selects("#selectid");
 	var asker= arr.rows[index].askers.askerName;
	$("#selectid").combobox("setValue",asker); */
	$("#ChaKan").dialog("open");
}
/* 编辑 */
function Updatestudents(index){
	var arr = $("#wlsdg").datagrid("getData");
	$("#updatefrm").form("load",arr.rows[index]);
 	var asker= arr.rows[index].askers.askerId;
 	selects("#select_id");
 	$("#select_id").combobox("setValue",asker);
	$("#update").dialog("open");
}
function updatesubmitForm(){
	 $.ajax({
			url:"../wl/updateStudents",
			type:"post",
			dataType:"json",
			data:$("#updatefrm").serializeArray(),
			success:function(res){
				if(res>0){
					$.messager.alert('警告','修改成功');
					$("#wlsdg").datagrid("reload");
					$("#update").dialog("close");
				}
				else{
					$.messager.alert('警告','修改失败');
				}
			}
		}) 
}
function updateclearForm(){
	 $("#update").dialog("close");
}
//打开设置隐藏列对话框
var checked_arr;
function Shezhi() {
	checked_arr = $("#hiddenColumn_form :checked");//默认的选中状态
	$("#hiddenColumn_dialog").dialog("open");
}

function saveLie(){
	var checked_arr2 = $("#hiddenColumn_form :checked");//之后的选中状态
	var checks=[];
	var unchecks=[];
	for (var i = 0; i < checked_arr.length; i++) {
		checks[i]=checked_arr[i].value;
	}
	for (var i = 0; i < checked_arr2.length; i++) {
		unchecks[i]=checked_arr2[i].value;
	}
	for (var i = 0; i < unchecks.length; i++) {
		if(checks.indexOf(unchecks[i])==-1){
			 $('#wlsdg').datagrid('showColumn',unchecks[i]);
		}
	}
	for (var i = 0; i < checks.length; i++) {
		if(unchecks.indexOf(checks[i])==-1){
			 $('#wlsdg').datagrid('hideColumn',checks[i]);
		}
	}
}

//关闭设置隐藏列弹框
function closed_hiddenColumn() {
	$('#hiddenColumn_dialog').dialog('close');
}
//全选按钮
function ChooseAll() {  
   var a=$("#isQuanXuan").text();//获取按钮的值
   if("全选"==a.trim()){
   	 $("#hiddenColumn_form input[type='checkbox']").prop("checked", true);//全选
   	 $('#isQuanXuan').linkbutton({ text:'全不选' });
   }else{    	
   	 $("#hiddenColumn_form input[type='checkbox']").removeAttr("checked", "checked");//取消全选
   	 $('#isQuanXuan').linkbutton({ text:'全选' });
   }
   
}
function batchOperation() {
	 var selRow = $("#wlsdg").datagrid('getSelections');
	 /* console.log(); */
	 
	 var value= $("#cc").combobox("getValue");
	 if(value=='---未选择---"'){
		 return;
	 }
	 var text = $("#cc").combobox("getText");
	 var ids = [];
     for (var i = 0; i < selRow.length; i++) {
         var id = selRow[i].id;
         ids.push(id); //把单个id循环放到ids的数组中  
     }
     $.ajax({
         url : '../directorUpdateAskers',
         dataType : 'json',
         type : 'post',
         data : {
      	   ids : ids,
      	   askerId:value,
      	   ZiXunName:text
         },
         success : function(data) {
             $.messager.show({
                 title : '提示',
                 msg : '跟踪成功',
             });
             $("#updatezixun").window("close");
             $("#wlsdg").datagrid("reload");
         },
         error : function(data) {
      	   $.messager.show({
                 title : '提示',
                 msg : '跟踪失败',
             });
         }
     });
}

</script>
</head>
<body>
<div id="tool">
	名称:
	<input  class="easyui-textbox" id="Name1"> 电话:
	<input  class="easyui-textbox" id="Phone1"> 咨询师:
	<input  class="easyui-combobox" id="askerName1">
	<!-- <select id="askerName1" panelHeight='auto' data-options="editable:false"  name="askerId" class="easyui-combobox" style="width:120px"  style="width:50px;"></select> -->
	<!-- <input   class="easyui-textbox" id="askerName1"> -->
	qq:<input  class="easyui-textbox" id="QQ1"> 创建时间
	<input class="easyui-datebox" id="minCreateTime1" data-options="editable:false"/>~
	<input class="easyui-datebox" id="maxCreateTime2" data-options="editable:false" />
	<br />
	 是否缴费：
	<select id="IsPay1" panelHeight='auto' class="easyui-combobox" data-options="editable:false">
		<option value="">---请选择---</option>
		<option value="1">是</option>
		<option value="2">否</option>
	</select> 是否有效：
	<select id="IsValid1" panelHeight='auto' class="easyui-combobox" data-options="editable:false">
		<option value="">---请选择---</option>
		<option value="1">是</option>
		<option value="2">否</option>
	</select> 是否回访：
	<select id="IsReturnVist1" panelHeight='auto' class="easyui-combobox" data-options="editable:false">
		<option value="">---请选择---</option>
		<option value="1">是</option>
		<option value="2">否</option>
	</select>
	<a href="#" class="easyui-linkbutton"
		data-options="iconCls:'icon-search'" onclick="init()">搜索</a>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'"
		onclick="add()">添加</a>
	<a href="javascript:void(0);" id="btnExport" class="easyui-linkbutton" iconCls='icon-print'>导出Excel</a>
	<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-edit'" onclick="Shezhi()">设置隐藏列</a>
	<c:if test="${role == 1}">
		<a href="javascript:void(0);" class="easyui-linkbutton" onclick="Shanchu()">删除</a>
		<a href="javascript:void(0);" class="easyui-linkbutton" onclick="$('#updatezixun').window('open')">批量操作</a>
		<input class="easyui-switchbutton" data-options="onText:'开',offText:'关'" id="automaticButton">
	</c:if>
	</div>
	<table id="wlsdg" data-options="checkbox:true">
		<thead>
			<tr>
				<th  data-options="field:'check',checkbox:true"></th>
				<th name="jingli" data-options="field:'id',hidden:true">编码</th>
				<th data-options="field:'name'">名称</th>
				<th data-options="field:'age'">年龄</th>
				<th data-options="field:'sex'">性别</th>
				<th data-options="field:'phone'">电话</th>
				<th data-options="field:'stuStatus'">客户状态</th>
				<th name="jingli" data-options="field:'perState',hidden:true">学员关注</th>
				<th name="jingli" data-options="field:'msgSource',hidden:true">来源部门</th>
				<th data-options="field:'sourceUrl'">来源网站</th>
				<th data-options="field:'sourceKeyWord'">来源关键词</th>
				<th name="jingli" data-options="field:'address',hidden:true">地址</th>
				<th name="jingli" data-options="field:'netPusherId',hidden:true"></th>
				<th name="jingli" data-options="field:'askerId',hidden:true">咨询师编号</th>
				<th data-options="field:'qq'">qq</th>
				<th data-options="field:'weiXin'">微信</th>
				<th name="jingli" data-options="field:'content',hidden:true">内容</th>
				<th name="jingli" data-options="field:'createTime',hidden:true">创建时间</th>
				<th name="jingli" data-options="field:'learnForward',hidden:true">课程方向</th>
				<th name="jingli" data-options="field:'isValid',hidden:true,formatter:isValidf">是否有效</th>
				<th name="jingli" data-options="field:'record',hidden:true">记录</th>
				<th name="jingli" data-options="field:'isReturnVist',hidden:true,formatter:isReturnVistf">是否回访</th>
				<th name="jingli" data-options="field:'firstVisitTime',hidden:true">首访时间</th>
				<th name="jingli" data-options="field:'isHome',hidden:true,formatter:isHomef">是否上门</th>
				<th name="jingli" data-options="field:'homeTime',hidden:true">上门时间</th>
				<th name="jingli" data-options="field:'lostValid',hidden:true">无效原因</th>
				<th name="jingli" data-options="field:'isPay',hidden:true,formatter:isPayf">是否缴费</th>
				<th name="jingli" data-options="field:'payTime',hidden:true">缴费时间</th>
				<th name="jingli" data-options="field:'money',hidden:true">金额</th>
				<th name="jingli" data-options="field:'isReturnMoney',hidden:true,formatter:isReturnMoneyf">是否退费</th>
				<th name="jingli" data-options="field:'isInClass',hidden:true,formatter:isInClassf">是否进班</th>
				<th name="jingli" data-options="field:'inClassTime',hidden:true">进班时间</th>
				<th name="jingli" data-options="field:'inClassContent',hidden:true">进班备注</th>
				<th name="jingli" data-options="field:'askerContent',hidden:true">咨询师备注</th>
				<th name="jingli" data-options="field:'isDel',hidden:true,formatter:isDelf">是否删除</th>
				<th data-options="field:'fromPart'">来源渠道</th>
				<th data-options="field:'ziXunName',formatter:ziXunNamef">咨询师名称</th>
				<th data-options="field:'stuConcern'">学员关注</th>
				<th data-options="field:'isBaoBei',formatter:isBaoBeif">是否报备</th>
				<th data-options="field:'createUser'">录入人</th>
				<th name="jingli" data-options="field:'returnMoneyReason',hidden:true">退费原因</th>
				<th name="jingli" data-options="field:'preMoney',hidden:true">定金金额</th>
				<th name="jingli" data-options="field:'preMoneyTime',hidden:true">定金时间</th>
				<th name="jingli" data-options="field:'scoring',hidden:true">打分</th>
				<th data-options="field:'education'">学历</th>
				<th name="jingli" data-options="field:'location',hidden:true">所在区域</th>
				<th name="jingli" data-options="field:'onlineremark',hidden:true">在线备注</th>
				<th data-options="field:'caozuo',formatter:formattercaozuo">操作</th>
			</tr>
		</thead>
	</table>
	<div style="margin:10px 0;">
        <span>选择模型: </span>
        <select data-options="editable:false" panelHeight='auto' onchange="$('#wlsdg').datagrid({singleSelect:(this.value==0)})">
            <option value="0">单选</option>
            <option value="1">多选</option>
        </select>
    </div>
<div id="updatezixun" class="easyui-window" title="修改咨询师" 
        data-options="iconCls:'icon-save',modal:true,closed:'true'">
        <select id="cc" panelHeight='auto' class="easyui-combobox" style="width:200px;">
        	<option value="---未选择---"></option>
        </select>
        <a href="javascript:void(0);" class="easyui-linkbutton" onclick="batchOperation()">提交</a>
</div>
<!-- 动态推送  -->
<div id="push" class="easyui-dialog" title="推送" style="width:500px;text-align:center;"   data-options="resizable:true,modal:true,closed:true">
<form id="pushfrms">
	<table>
		<tr>
			<td>学生姓名：</td>
			<td>
				<input type="hidden"   name="bs"  id="bss" value="0"  />
				<div id="sname"></div>
			<td>推送的咨询师姓名：</td>
			<td>
			<div id="selectidss"></div>
		</tr>
		<tr>
			<td>推送内容：</td>
			<td colspan="3" rowspan="1">
			<textarea name="sdfgh" id="textareas" style="border:0;border-radius:5px;background-color:rgba(241,241,241,.98);width: 355px;height: 100px;padding: 10px;resize: none;" placeholder="输入推送内容"></textarea>
			</td>
		</tr>
	</table>
</form>
<div style="text-align:center;padding:5px">
   <a href="javascript:void(0)" class="easyui-linkbutton"   onclick="pushTijiao()">立即推送</a> 
   </div> 
</div>

<!-- 添加弹出框 -->
	<div id="add" class="easyui-dialog" title="添加" style="width:500px;text-align:center;"   data-options="resizable:true,modal:true,closed:true">   
   <form id="addfrm">
  <table >
  <tr>
				<td><label> 姓名</label></td>
				<td><input class="easyui-textbox" name="name" id="name1" data-options="required:true,prompt:'姓名'" ></td>
				<td><label>性别</label></td>
				<td><input class="easyui-textbox" name="sex" id="sex1"></td>
			</tr>
			<tr>
				<td><label>年龄</label></td>
				<td><input class="easyui-textbox" name="age" id="age1"></td>
				<td><label>电话</label></td>
				<td><input class="easyui-textbox" name="phone" id="phone1" ></td>
			</tr>
		<tr>
				<td><label>学历</label></td>
				<td><select id="educa_tion" data-options="editable:false" panelHeight='auto' class="easyui-combobox" name="education">
				<option value="">---请选择---</option>
				<option value="未知">未知</option>
				<option value="大专">大专</option>
				<option value="高中">高中</option>
				<option value="中专">中专</option>
				<option value="初中">初中</option>
				<option value="本科">本科</option>
				<option value="其它">其它</option>
				</select>
				</td>
				<td>录入人  :</td>
	    		<td><input class="easyui-textbox" name="createUser" data-options="multiline:true" value="${user.userName}" ></input></td>
				
			</tr>
			<tr>
				<td><label>来源渠道</label></td>
				<td><input class="easyui-textbox" name="fromPart" >
				<select id="from_Part" panelHeight='auto' data-options="editable:false" class="easyui-combobox" name="fromPart">
				<option value="">---请选择---</option>
				<option value="未知" >未知</option>
				<option value="百度" >百度</option>
				<option value="百度移动端" >百度移动端</option>
				<option value="360" >360</option>
				<option value="360移动端" >360移动端</option>
				<option value="搜狗" >搜狗</option>
				<option value="搜狗移动端" >搜狗移动端</option>
				<option value="UC移动端" > UC移动端</option>
				<option value="直接输入" >直接输入</option>
				<option value="自然流量" >自然流量</option>
				<option value="直电" >直电</option>
				<option value="微信" >微信</option>
				<option value="QQ" >QQ</option>
				<option value="其它" >其它</option>
				</select>
				</td>
				<td><label>来源网站</label></td>
				<td>
				<input class="easyui-textbox" name="sourceUrl" >
				<select id="source_Url" panelHeight='auto' data-options="editable:false" class="easyui-combobox" name="sourceUrl">
				<option value="">---请选择---</option>
				<option value="其它" >其它</option>
				<option value="职英B站" >职英B站</option>
				<option value="高考站" >高考站</option>
				<option value="职英A站" >职英A站</option>
				<option value="其它" >其它</option>
				</select>
				</td>
			</tr>
			<tr>
				<td><label>来源关键词</label></td>
				<td><input class="easyui-textbox" name="sourceKeyWord" ></td>
				<td><label>学员QQ</label></td>
				<td><input class="easyui-textbox" name="qq" ></td>
			</tr>
			<tr>
				<td><label>微信号</label></td>
				<td><input class="easyui-textbox" name="weiXin" ></td>
				<td><label>是否报备</label></td>
				<td><input class="easyui-textbox" name="isBaoBei" ></td>
			</tr>
			<tr>
				<td><label>在线备注</label></td>
				<td><input class="easyui-textbox" name="inClassContent" ></td>
				<td><label>状态</label></td>
				<td>
				<select id="stu_Status" panelHeight='auto' data-options="editable:false" class="easyui-combobox" name="stuStatus">
				<option value="">---请选择---</option>
				<option value="未知">未知</option>
				<option value="待业">待业</option>
				<option value="在职">在职</option>
				<option value="在读">在读</option>
				</select>
				</td>
			</tr>
			 </table> 
   </form> 
   <div style="text-align:center;padding:5px">
   <a href="javascript:void(0)" class="easyui-linkbutton"   onclick="addTijiao()">提交</a> 
   <a href="javascript:void(0)" class="easyui-linkbutton"   onclick="addQuexiao()">取消</a>   
   </div>  
</div>   
<!-- 查看弹出框 -->

<div id="ChaKan" class="easyui-dialog" title="查看" style="width:500px;height:500px;text-align:center;"   data-options="resizable:true,modal:true,closed:true">
<form id="ChaKanfrm">
<div  class="easyui-accordion" >
<div title="在线录入:">
	    	<table  >
	    		<tr style="border:0;border-bottom:1 solid black;background:;">
	    			<td>Name:</td>
	    			<td><input class="easyui-textbox"  name="name" data-options="required:true" disabled="disabled"  style="border:0;border-bottom:1 solid black;background:;" ></input></td>
	    			<td>年龄:</td>
	    			<td><input class="easyui-textbox" type="text" name="age" data-options="required:true" disabled="disabled" style="border:0;border-bottom:1 solid black;background:;"></input></td>
	    		</tr>
	    		<tr>
	    			<td>性别:</td>
	    			<td><input class="easyui-textbox" type="text" name="sex" data-options="required:true" disabled="disabled" style="border:0;border-bottom:1 solid black;background:;"></input></td>
	    			<td>电话:</td>
	    			<td><input class="easyui-textbox" name="phone" data-options="multiline:true" disabled="disabled" style="border:0;border-bottom:1 solid black;background:;"></input></td>
	    		</tr>
	    		<tr>
				<td><label>学历:</label></td>
				<td> <input class="easyui-textbox" name="education" disabled="disabled" style="border:0;border-bottom:1 solid black;background:;" >
				</td>
				<td><label>状态:</label></td>
				<td><input class="easyui-textbox" name="stuStatus" disabled="disabled"  style="border:0;border-bottom:1 solid black;background:;">
				</td>
			</tr>
	    		<tr>
				<td><label>来源渠道:</label></td>
				<td> <input class="easyui-textbox" name="fromPart" disabled="disabled" style="border:0;border-bottom:1 solid black;background:;">
				</td>
				<td><label>来源网站:</label></td>
				<td>
				<input class="easyui-textbox" name="sourceUrl" disabled="disabled" style="border:0;border-bottom:1 solid black;background:;">
				</td>
			</tr>
	    		
	    		<tr>
	    			<td>来源关键词:</td>
	    			<td><input class="easyui-textbox" name="sourceKeyWord" disabled="disabled" data-options="multiline:true" style="border:0;border-bottom:1 solid black;background:;"></input></td>
	    			<td>所在区域:</td>
	    			<td>
	    			 <input class="easyui-textbox" name="location" disabled="disabled" data-options="multiline:true" style="border:0;border-bottom:1 solid black;background:;"></input>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td>学员关注:</td>
	    			<td>
	    			<input class="easyui-textbox" name="stuConcern" disabled="disabled" data-options="multiline:true" style="border:0;border-bottom:1 solid black;background:;"></input>
	    			</td>
	    			<td>来源部门:</td>
	    			<td>
	    			<input class="easyui-textbox" name="msgSource" disabled="disabled" data-options="multiline:true" style="border:0;border-bottom:1 solid black;background:;"></input> 
	    			</td>
	    		</tr>
	    		<tr>
	    			<td>学员QQ:</td>
	    			<td><input class="easyui-textbox" name="qq" data-options="multiline:true" disabled="disabled" style="border:0;border-bottom:1 solid black;background:;"></input></td>
	    			<td>微信号:</td>
	    			<td><input class="easyui-textbox" name="weiXin" data-options="multiline:true" disabled="disabled" style="border:0;border-bottom:1 solid black;background:;"></input></td>
	    		</tr>
	    		<tr>
	    			<td>是否报备:</td>
	    			<td>
	    			<!--  <input class="easyui-textbox" name="isBaoBei" data-options="multiline:true" disabled="disabled" style="border:0;border-bottom:1 solid black;background:;"></input> -->
	    			 <select id="is_BaoBei" class="easyui-combobox" name="isBaoBei" disabled="disabled" style="width:55px">
				<option value="1">是</option>
				<option value="2">否</option>
				</select> 
	    			</td>
	    			</tr>
	    			</table>
	    			</div>
	    			</div>
	    			<div class="easyui-accordion" style="width:atuo;height:auto;" data-options="selected:false" >
	    				<div title="咨询师:">
	    				<table>
	    		<tr>
	    		<td>咨询师录入:</td>
	    			<td>
	    			<!-- <select id="selectid" class="easyui-combobox"  style="width:50px;"></select></td> -->
	    			<input id="selectid" class="easyui-textbox" name="askerName" disabled="disabled" style="width:110px" ></input>
	    			<td>录入人  :</td>
	    			<td><input class="easyui-textbox" name="createUser" data-options="multiline:true" disabled="disabled" style="border:0;border-bottom:1 solid black;background:;"></input></td>
	    		</tr>
	    		<tr>
	    			<td>课程方向:</td>
	    			<td>
	    			 <input class="easyui-textbox" name="learnForward" data-options="multiline:true" disabled="disabled" style="border:0;border-bottom:1 solid black;background:;"></input>
	    			</td>
	    			<td>打分:</td>
	    			<td>
	    			<input class="easyui-textbox" name="scoring" data-options="multiline:true" disabled="disabled" style="border:0;border-bottom:1 solid black;background:;"></input>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td>是否有效:</td>
	    			<td>
	    			 <!-- <input class="easyui-textbox" name="isValid" data-options="multiline:true" disabled="disabled" style="border:0;border-bottom:1 solid black;background:;"></input> -->
	    			<select id="is_Valid" class="easyui-combobox" name="isValid" disabled="disabled" style="width:55px">
						<option value="1">是</option>
						<option value="2">否</option>
						<option value="3">待定</option>
					</select> 
	    			</td>
	    			<td>无效原因:</td>
	    			<td>
	    			 <input class="easyui-textbox" name="lostValid" data-options="multiline:true" disabled="disabled" style="border:0;border-bottom:1 solid black;background:;"></input> 
	    			</td>
	    		</tr>
	    		<tr>
	    			<td>是否回访:</td>
	    			<td>
	    			<!--  <input class="easyui-textbox" name="isReturnVist" data-options="multiline:true" disabled="disabled" style="border:0;border-bottom:1 solid black;background:;"></input>  -->
	    			 <select id="is_ReturnVist" class="easyui-combobox" name="isReturnVist" disabled="disabled" style="width:110px">
				<option value="1">已回访</option>
				<option  value="2">未回访</option>
				</select>
	    			</td>
	    			<td>首访时间:</td>
	    			<td><input class="easyui-textbox" name="firstVisitTime" data-options="multiline:true" disabled="disabled" style="border:0;border-bottom:1 solid black;background:;"></input></td>
				
	    		</tr>
	    		<tr>
	    		<td>上门时间:</td>
	    			<td><input class="easyui-textbox" name="homeTime" data-options="multiline:true" disabled="disabled" style="border:0;border-bottom:1 solid black;background:;"></input></td>
	    			<td>是否上门:</td>
	    			<td>
	    			<!--  <input class="easyui-textbox" name="isHome" data-options="multiline:true" disabled="disabled" style="border:0;border-bottom:1 solid black;background:;"></input> -->
	    			 <select id="is_Home" class="easyui-combobox" name="isHome" disabled="disabled" style="width:55px">
						<option value="1">是</option>
						<option value="2">否</option>
					</select>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td>定金金额:</td>
	    			<td><input class="easyui-textbox" name="preMoney" data-options="multiline:true" disabled="disabled" style="border:0;border-bottom:1 solid black;background:;"></input></td>
	    			<td>定金时间:</td>
	    			<td><input class="easyui-textbox" name="preMoneyTime" data-options="multiline:true" disabled="disabled" style="border:0;border-bottom:1 solid black;background:;"></input></td>
	    		</tr>
	    		<tr>
	    			<td>是否缴费:</td>
	    			<td>
	    			 <!-- <input class="easyui-textbox" name="isPay" data-options="multiline:true" disabled="disabled" style="border:0;border-bottom:1 solid black;background:;"></input> -->
	    			 <select id="is_Pay" class="easyui-combobox" name="isPay" disabled="disabled" style="width:110px">
				<option value="1">已缴费</option>
				<option value="2">未缴费</option>
				</select> 
	    			</td>
	    			<td>缴费时间:</td>
	    			<td><input class="easyui-textbox" name="payTime" data-options="multiline:true" disabled="disabled" style="border:0;border-bottom:1 solid black;background:;"></input></td>
	    		</tr>
	    		<tr>
	    		<td>缴费金额:</td>
	    			<td><input class="easyui-textbox" name="money" data-options="multiline:true" disabled="disabled" style="border:0;border-bottom:1 solid black;background:;"></input></td>
	    			<td>是否退费:</td>
	    			<td>
	    			<!--  <input class="easyui-textbox" name="isReturnMoney" data-options="multiline:true" disabled="disabled" style="border:0;border-bottom:1 solid black;background:;"></input>  -->
	    			 <select id="is_ReturnMoney" class="easyui-combobox" name="isReturnMoney" disabled="disabled" style="width:110px">
						<option value="1">已退费</option>
						<option value="2">未退费</option>
					</select>
	    			</td>
	    		</tr>
	    		<tr>
	    		<td>退费原因:</td>
	    			<td><input class="easyui-textbox" name="returnMoneyReason" data-options="multiline:true" disabled="disabled" style="border:0;border-bottom:1 solid black;background:;"></input></td>
	    			<td>是否进班:</td>
	    			<td>
	    			<!--  <input class="easyui-textbox" name="isInClass" data-options="multiline:true" disabled="disabled" style="border:0;border-bottom:1 solid black;background:;"></input> -->
	    			 <select id="is_InClass" class="easyui-combobox" name="isInClass" disabled="disabled" style="width:110px">
						<option value="1">已进班</option>
						<option value="2">未进班</option>
					</select>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td>进班时间:</td>
	    			<td><input class="easyui-textbox" name="inClassTime" data-options="multiline:true" disabled="disabled" style="border:0;border-bottom:1 solid black;background:;"></input></td>
	    			<td>进班备注:</td>
	    			<td><input class="easyui-textbox" name="inClassContent" data-options="multiline:true" disabled="disabled" style="border:0;border-bottom:1 solid black;background:;"></input></td>
	    		</tr>
	    		<tr>
	    			<td>咨询师备注:</td>
	    			<td><input class="easyui-textbox" name="askerContent" data-options="multiline:true" disabled="disabled" style="border:0;border-bottom:1 solid black;background:;"></input></td>
	    		</tr>
	    	</table>
	    				</div>
	    			</div>
	    			
	    </form>
</div>
<!-- 编辑弹出框 -->
<div id="update" class="easyui-dialog" title="编辑" style="width:650px;height:600px;text-align:center;"   data-options="resizable:true,modal:true,closed:true">
<form id="updatefrm">
	    	<table >
	    		<tr>
	    			<td>Name:</td>
	    			<input type="hidden" name="id" />
	    			<td><input class="easyui-textbox"  name="name" data-options="required:true"></input></td>
	    			<td>年龄:</td>
	    			<td><input class="easyui-textbox" type="text" name="age" data-options="required:true"></input></td>
	    			<td>性别:</td>
	    			<td><input class="easyui-textbox" type="text" name="sex" data-options="required:true"></input></td>
	    		</tr>
	    		<tr>
	    			<td>电话:</td>
	    			<td><input class="easyui-textbox" name="phone" data-options="multiline:true" ></input></td>
	    			<td><label>学历</label></td>
				<td><!-- <input class="easyui-textbox" name="stuStatus"  > -->
				<select id="educa_tion" panelHeight='auto' data-options="editable:false" class="easyui-combobox" style="width:120px" name="education">
				<option value="未知">未知</option>
				<option value="大专">大专</option>
				<option value="高中">高中</option>
				<option value="中专">中专</option>
				<option value="初中">初中</option>
				<option value="本科">本科</option>
				<option value="其它">其它</option>
				</select>
				</td>
				<td><label>状态</label></td>
				<td>
				<select id="stu_Status" panelHeight='auto' data-options="editable:false" class="easyui-combobox" style="width:120px" name="stuStatus">
				<option value="未知">未知</option>
				<option value="待业">待业</option>
				<option value="在职">在职</option>
				<option value="在读">在读</option>
				</select>
				</td>
	    		</tr>
	    		
	    		<tr>
				<td><label>来源渠道</label></td>
				<td>
				<select id="from_Part" panelHeight='auto' data-options="editable:false" class="easyui-combobox" style="width:120px" name="fromPart">
				<option value="未知">未知</option>
				<option value="百度">百度</option>
				<option value="百度移动端">百度移动端</option>
				<option value="360">360</option>
				<option value="360移动端">360移动端</option>
				<option value="搜狗">搜狗</option>
				<option value="搜狗移动端">搜狗移动端</option>
				<option value="UC移动端"> UC移动端</option>
				<option value="直接输入">直接输入</option>
				<option value="自然流量">自然流量</option>
				<option value="直电">直电</option>
				<option value="微信">微信</option>
				<option value="QQ">QQ</option>
				<option value="其它">其它</option>
				</select>
				</td>
				<td><label>来源网站</label></td>
				<td>
				<select id="source_Url" panelHeight='auto' data-options="editable:false" class="easyui-combobox" style="width:120px" name="sourceUrl">
				<option value="其它">其它</option>
				<option value="职英B站">职英B站</option>
				<option value="高考站">高考站</option>
				<option value="职英A站">职英A站</option>
				</select>
				</td>
				<td>来源关键词:</td>
	    			<td><input class="easyui-textbox" name="sourceKeyWord" data-options="multiline:true" ></input></td>
			</tr>
	    		<tr>
	    			<td>所在区域:</td>
	    			<td>
	    			<select id="loca_tion" panelHeight='auto' data-options="editable:false" class="easyui-combobox" style="width:120px" name="location">
				<option value="未知">未知</option>
				<option value="其它">其它</option>
				<option value="郑州">郑州</option>
				<option value="开封">开封</option>
				<option value="洛阳">洛阳</option>
				<option value="南阳">南阳</option>
				<option value="漯河">漯河</option>
				<option value="三门峡"> 三门峡</option>
				<option value="平顶山">平顶山</option>
				<option value="周口">周口</option>
				<option value="驻马店">驻马店</option>
				<option value="新乡">新乡</option>
				<option value="鹤壁">鹤壁</option>
				<option value="焦作">焦作</option>
				<option value="濮阳">濮阳</option>
				<option value="安阳">安阳</option>
				<option value="商丘">商丘</option>
				<option value="信阳">信阳</option>
				<option value="济源">济源</option>
				</select>
	    			</td>
	    			<td>学员关注:</td>
	    			<td>
	    			<select id="stu_Concern" panelHeight='auto' data-options="editable:false" class="easyui-combobox" style="width:120px" name="stuConcern">
				<option value="课程">课程</option>
				<option value="学费">学费</option>
				<option value="学时">学时</option>
				<option value="学历">学历</option>
				<option value="师资">师资</option>
				<option value="就业">就业</option>
				<option value="环境">环境</option>
				<option value="其它">其它</option>
				</select>
	    			</td>
	    			<td>来源部门:</td>
	    			<td>
	    			<select id="msg_Source" panelHeight='auto' data-options="editable:false" class="easyui-combobox" style="width:120px" name="msgSource">
				<option value="网络">网络</option>
				<option value="市场">市场</option>
				<option value="教质">教质</option>
				<option value="学术">学术</option>
				<option value="就业">就业</option>
				</select>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td>学员QQ:</td>
	    			<td><input class="easyui-textbox" name="qq" data-options="multiline:true" ></input></td>
	    			<td>微信号:</td>
	    			<td><input class="easyui-textbox" name="weiXin" data-options="multiline:true" ></input></td>
	    			<td>是否报备:</td>
	    			<td>
	    			<select id="is_BaoBei" panelHeight='auto' data-options="editable:false" class="easyui-combobox" style="width:120px" name="isBaoBei">
				<option value="1">是</option>
				<option value="2">否</option>
				</select>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td>咨询师:</td>
	    			<td><select id="select_id" panelHeight='auto' data-options="editable:false"  name="askerId" class="easyui-combobox" style="width:120px"  style="width:50px;"></select></td>
	    			<td>录入人  :</td>
	    			<td><input class="easyui-textbox" data-options="editable:false" class="easyui-combobox" name="createUser" data-options="multiline:true" ></input></td>
	    		</tr>
	    		<tr>
	    			<td>咨询师录入:</td>
	    			<td></td>
	    		</tr>
	    		<tr>
	    			<td>课程方向:</td>
	    			<td>
	    			<select id="learn_Forward" panelHeight='auto' data-options="editable:false" class="easyui-combobox" style="width:120px" name="learnForward">
				<option value="软件开发">软件开发</option>
				<option value="软件设计">软件设计</option>
				<option value="网络营销">网络营销</option>
				</select>
	    			</td>
	    			<td>打分:</td>
	    			<td>
	    			<select id="s_coring" panelHeight='auto' data-options="editable:false" class="easyui-combobox" style="width:120px" name="scoring">
				<option value="A、近期可报名">A、近期可报名</option>
				<option value="B、一个月内可报名">B、一个月内可报名</option>
				<option value="C、长期跟踪">C、长期跟踪</option>
				<option value="D、无效">D、无效</option>
				</select>
	    			</td>
	    			<td>是否有效:</td>
	    			<td>
	    			<select id="is_Valid" panelHeight='auto' data-options="editable:false" class="easyui-combobox" style="width:120px" name="isValid">
						<option value="1">是</option>
						<option value="2">否</option>
						<option value="3">待定</option>
					</select>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td>无效原因:</td>
	    			<td><input class="easyui-textbox" name="lostValid" data-options="multiline:true" ></input></td>
	    			<td>是否回访:</td>
	    			<td>
	    			<select id="is_ReturnVist" panelHeight='auto' data-options="editable:false" class="easyui-combobox" style="width:120px" name="isReturnVist">
						<option value="1">已回访</option>
						<option value="2">未回访</option>
					</select>
	    			</td>
	    			<td>首访时间:</td>
	    			<td><input class="easyui-datebox" name="firstVisitTime" style="width:120px" data-options="multiline:true,editable:false" ></input></td>
	    		</tr>
	    		
	    		<tr>
	    			<td>是否上门:</td>
	    			<td>
	    			<select id="is_Home" panelHeight='auto' data-options="editable:false" class="easyui-combobox" style="width:120px" name="isHome">
						<option value="1">是</option>
						<option value="2">否</option>
					</select>
	    			</td>
	    			<td>上门时间:</td>
	    			<td>
	    			<input class="easyui-textbox" name="homeTime" data-options="multiline:true,editable:false" ></input></td>
	    		</tr>
	    		<tr>
	    			<td>定金金额:</td>
	    			<td><input class="easyui-textbox" name="preMoney" data-options="multiline:true" ></input></td>
	    			<td>定金时间:</td>
	    			<td><input class="easyui-datebox" name="preMoneyTime" data-options="multiline:true,editable:false" ></input></td>
	    		</tr>
	    		<tr>
	    			<td>是否缴费:</td>
	    			<td>
	    			<select id="is_Pay" panelHeight='auto' data-options="editable:false" style="width:120px" class="easyui-combobox" name="isPay">
						<option value="1">已缴费</option>
						<option value="2">未缴费</option>
					</select>
	    			</td>
	    			<td>缴费时间:</td>
	    			<td><input class="easyui-datebox" name="payTime" data-options="multiline:true,editable:false" ></input></td>
	    			<td>缴费金额:</td>
	    			<td><input class="easyui-textbox" name="money" data-options="multiline:true" ></input></td>
	    		</tr>
	    		<tr>
	    			<td>是否退费:</td>
	    			<td>
	    			<select id="is_ReturnMoney" panelHeight='auto' data-options="editable:false" style="width:120px" class="easyui-combobox" name="isReturnMoney">
						<option value="1">已退费</option>
						<option value="2">未退费</option>
					</select>
	    			</td>
	    			<td>退费原因:</td>
	    			<td>
	    			<input class="easyui-textbox"  name="returnMoneyReason" data-options="multiline:true" ></input></td>
	    		</tr>
	    		<tr>
	    			<td>是否进班:</td>
	    			<td>
	    			<select id="is_InClass" panelHeight='auto' data-options="editable:false" style="width:120px" class="easyui-combobox" name="isInClass">
						<option value="1">已进班</option>
						<option value="2">未进班</option>
					</select>
	    			</td>
	    			<td>进班时间:</td>
	    			<td><input class="easyui-datebox" name="inClassTime" data-options="multiline:true,editable:false" ></input></td>
	    			<td>进班备注:</td>
	    			<td><input class="easyui-textbox" name="inClassContent" data-options="multiline:true" ></input></td>
	    		</tr>
	    		<tr>
	    			<td>咨询师备注:</td>
	    			<td><input class="easyui-textbox" name="askerContent" data-options="multiline:true" ></input></td>
	    		</tr>
	    	</table>
	    </form>
	    <div style="text-align:center;padding:5px">
	    	<a href="javascript:void(0)" class="easyui-linkbutton" onclick="updatesubmitForm()">Submit</a>
	    	<a href="javascript:void(0)" class="easyui-linkbutton" onclick="updateclearForm()">Close</a>
	    </div>
</div>

<!-- 设置隐藏列 -->
<div id="hiddenColumn_dialog" class="easyui-dialog" data-options="title:'设置隐藏列',modal:true,closed:'true',
			buttons:[{
				text:'保存',
				handler:function(){
				saveLie();<!-- 保存 -->
				init();<!-- 刷新 -->
				closed_hiddenColumn();<!-- 关闭弹窗 -->
				}
			},{
				text:'关闭',
				handler:function(){
				closed_hiddenColumn();
				}
			}]">
			<form id="hiddenColumn_form" class="easyui-form">
	<a href="javascript:void(0)"  class="easyui-linkbutton" id="isQuanXuan" onclick="ChooseAll()" data-options="iconCls:'icon-edit'">全选</a> 
		<table>
			<tr>
				<td><input type="checkbox" value="id"/>编号</td>
			
			<td><input type="checkbox" value="name"/>姓名</td>
			<td><input type="checkbox" value="age"/>年龄</td>
				<td><input type="checkbox" value="returnMoneyReason"/>退费原因</td>
				<td><input type="checkbox" value="sex"/>性别</td>
			
				<td><input type="checkbox" value="phone"/>电话</td>
			</tr>
			<tr>
				<td><input type="checkbox" value="stuStatus"/>客户状态</td>
			
				<td><input type="checkbox" value="perState"/>学员关注</td>
				<td><input type="checkbox" value="msgSource"/>来源部门</td>
			
				<td><input type="checkbox" value="sourceUrl"/>来源网站</td>
				<td><input type="checkbox" value="sourceKeyWord"/>来源关键词</td>
			
				<td><input type="checkbox" value="address"/>地址</td>
			</tr>
			<tr>
				<td><input type="checkbox" value="netPusherId"/>22</td>
			
				<td><input type="checkbox" value="askerId"/>咨询师编号</td>
				<td><input type="checkbox" value="qq"/>QQ</td>
			
				<td><input type="checkbox" value="weiXin"/>微信</td>
				<td><input type="checkbox" value="content"/>内容</td>
			
				<td><input type="checkbox" value="createTime"/>创建时间</td>
			</tr>
			<tr>
				<td><input type="checkbox" value="learnForward"/>课程方向</td>
			
				<td><input type="checkbox" value="isValid"/>是否有效</td>
				<td><input type="checkbox" value="record"/>记录</td>
			
				<td><input type="checkbox" value="isReturnVist"/>是否回访</td>
				<td><input type="checkbox" value="firstVisitTime"/>首访时间</td>
			
				<td><input type="checkbox" value="isHome"/>是否上门</td>
			</tr>
			<tr>
				<td><input type="checkbox" value="homeTime"/>上门时间</td>
			
				<td><input type="checkbox" value="lostValid"/>无效原因</td>
				<td><input type="checkbox" value="isPay"/>是否缴费</td>
			
				<td><input type="checkbox" value="payTime"/>缴费时间</td>
				<td><input type="checkbox" value="money"/>金额</td>
			
				<td><input type="checkbox" value="isReturnMoney"/>是否退费</td>
			</tr>
			<tr>
				<td><input type="checkbox" value="isInClass"/>是否进班</td>
			
				<td><input type="checkbox" value="inClassTime"/>进班时间</td>
				<td><input type="checkbox" value="inClassContent"/>进班备注</td>
			
				<td><input type="checkbox" value="askerContent"/>咨询师备注</td>
				<td><input type="checkbox" value="isDel"/>是否删除</td>
			
				<td><input type="checkbox" value="fromPart"/>来源渠道</td>
			</tr>
			<tr>
				<td><input type="checkbox" value="stuConcern"/>学员关注</td>
			
				<td><input type="checkbox" value="isBaoBei"/>是否报备</td>
				<td><input type="checkbox" value="askerName"/>咨询师</td>
			
				<td><input type="checkbox" value="createUser"/>录入人</td>
				<td><input type="checkbox" value="preMoney"/>定金金额</td>
			
				<td><input type="checkbox" value="preMoneyTime"/>定金时间</td>
			</tr>
			<tr>
				<td><input type="checkbox" value="scoring"/>打分</td>
			
				<td><input type="checkbox" value="education"/>学历</td>
				<td><input type="checkbox" value="location"/>所在区域</td>
			
				<td><input type="checkbox" value="onlineremark"/>在线备注</td>
			</tr>
		</table>
	</form>
</div>
</body>
<script type="text/javascript">
//ReportTitle 生成的Excel文件名称
//ShowLabel 生成的Excel文件列标题
//JSONData 生成的Excel文件内容
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

		//第二个循环将提取每个列并将其转换为以逗号分隔的字符串
		for ( var index in arrData[i]) {
			row += '"' + arrData[i][index] + '",';
		}

		row.slice(0, row.length - 1);//方法可从已有的数组中返回选定的元素

		//每行后添加换行符
		CSV += row + '\r\n';
	}

	if (CSV == '') {
		alert("Invalid data");
		return;
	}

	//Generate a file name
	//fileName为后台返给前端的文件名，根据下载文件格式加后缀名，后缀名必须加，不然下载在本地不方便打开
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
	var link = document.createElement("a");//动态创建link方式
	link.href = uri;

	//set the visibility hidden so it will not effect on your web-layout
	link.style = "visibility:hidden";//visibility属性用来确定元素是显示还是隐藏的
	link.download = fileName + ".csv";

	//this part will append the anchor tag and remove it after automatic click
	document.body.appendChild(link);//将指定的DOM类型的节点加到document.body的末尾  
	document.body.appendChild(link);//将指定的DOM类型的节点加到document.body的末尾  
	//DOM（文档对象模型(Document Object Model)）是对HTML标签、属性、文本解析后存放在内存中的倒置的树
	link.click();
	document.body.removeChild(link);//前端将后台传的文件流下载为文件到本地
}
/**
 * 选择id增加单击时间执行方法
 */
$("#btnExport").click(function() {
	var rows=$("#wlsdg").datagrid("getSelections");
	if(rows.length==0){
		$.messages.alert("提示","请选择你要导出的数据");
	}
	//导出全部
	var data = JSON.stringify(rows);//导出你选择的行   对象群
	if (data == '')
		return;

	JSONToCSVConvertor(data, "数据信息", true);
});
</script>


</html>