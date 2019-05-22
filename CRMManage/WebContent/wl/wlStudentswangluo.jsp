<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../js/easyui demo/easyui/1.3.4/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="../js/easyui demo/css/wu.css" />
<link rel="stylesheet" type="text/css" href="../js/easyui demo/css/icon.css" />
<link rel="stylesheet" type="text/css" href="../css/huadong.css" />
<script type="text/javascript" src="../js/easyui demo/js/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="../js/easyui demo/easyui/1.3.4/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../js/easyui demo/easyui/1.3.4/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">
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
		document.getElementById("inner").onclick = function() {
			if (this.className == "inner-on") {
				this.style.left = -51 + "px";
				this.childNodes[1].checked = false;
				this.className = "inner-off";
				alert("关")
			}else{
				this.style.left = 0;
				this.childNodes[1].checked = true;
				this.className = "inner-on";
			}
		}	
	}
});
function selects(numbers){
	$(numbers).combobox({    
	    url:'../wl/selectAskers',    
	    valueField:'askerId',    
	    textField:'askerName' ,
	    method:'post'
	});
}
function init(){
	$("#wlsdg").datagrid({
		url : "../wl/selectAllStudentsController",
		type:"post",
		pagination : true,
		toolbar:"#tool",
		queryParams : {
			Name : $("#Name1").val(),
			Phone : $("#Phone1").val(),
			askerName : $("#askerName1").val(),
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
 
 /*  删除*/
 function Shanchu(){
	   var selRow = $("#wlsdg").datagrid('getSelections');
       if (selRow.length == 0) {
    	   $.messager.show({
               title : '提示',
               msg : '请至少选择一行数据!',
               timeout : 3000,
               showType : 'slide'
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
                       });
                       $("#wlsdg").datagrid("reload");
                   },
                   error : function(data) {
                	   $.messager.show({
                           title : '提示',
                           msg : '删除失败',
                       });
                   }
               });
           }
       });
 }
function formattercaozuo(value,row,index){
	return "<a href='javascript:void(0)' class='easyui-linkbutton'  onclick='ChaKan("+index+")'>查看</a>||<a href='javascript:void(0)'  class='easyui-linkbutton' onclick='Updatestudents("+index+")'>编辑</a>";
}
/* 查看 */
function ChaKan(index){
	var arr = $("#wlsdg").datagrid("getData");
	$("#ChaKanfrm").form("load",arr.rows[index]);
	selects("#selectid");
 	var asker= arr.rows[index].askers.askerName;
	$("#selectid").combobox("setValue",asker);
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
                 msg : '删除失败',
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
	<input   class="easyui-textbox" id="askerName1">
	qq:<input  class="easyui-textbox" id="QQ1"> 创建时间
	<input class="easyui-datebox" id="minCreateTime1" />~
	<input class="easyui-datebox" id="maxCreateTime2" />
	<br />
	 是否缴费：
	<select id="IsPay1" class="easyui-combobox">
		<option value="">---请选择---</option>
		<option value="是">是</option>
		<option value="否">否</option>
	</select> 是否有效：
	<select id="IsValid1" class="easyui-combobox">
		<option value="">---请选择---</option>
		<option value="是">是</option>
		<option value="否">否</option>
	</select> 是否回访：
	<select id="IsReturnVist1" class="easyui-combobox">
		<option value="">---请选择---</option>
		<option value="是">是</option>
		<option value="否">否</option>
	</select>
	<a href="#" class="easyui-linkbutton"
		data-options="iconCls:'icon-search'" onclick="into()">搜索</a>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'"
		onclick="add()">添加</a>
	<a href="javascript:void(0);" id="btnExport" class="easyui-linkbutton" iconCls='icon-print'>导出Excel</a>
	<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-edit'" onclick="Shezhi()">设置隐藏列</a>
	<c:if test="${role == 1}">
		<a href="javascript:void(0);" class="easyui-linkbutton" onclick="Shanchu()">删除</a>
		<a href="javascript:void(0);" class="easyui-linkbutton" onclick="$('#updatezixun').window('open')">批量操作</a>
		<div class="slide-btn">
		<div class="inner-on" id="inner">
			<input style="display:none;" type="checkbox" checked>
			<span class="left">ON</span><span class="space">&nbsp;</span><span class="right">OFF</span>
		</div>
	</div>
	</c:if>
	</div>
	<table id="wlsdg" data-options="checkbox:true ">
		<thead>
			<tr>
				<th data-options="field:'check',checkbox:true"></th>
				<th data-options="field:'id'">编码</th>
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
				<th name="jingli" data-options="field:'isValid',hidden:true">是否有效</th>
				<th name="jingli" data-options="field:'record',hidden:true">记录</th>
				<th name="jingli" data-options="field:'isReturnVist',hidden:true">是否回访</th>
				<th name="jingli" data-options="field:'firstVisitTime',hidden:true">首访时间</th>
				<th name="jingli" data-options="field:'isHome',hidden:true">是否上门</th>
				<th name="jingli" data-options="field:'homeTime',hidden:true">上门时间</th>
				<th name="jingli" data-options="field:'lostValid',hidden:true">无效原因</th>
				<th name="jingli" data-options="field:'isPay',hidden:true">是否缴费</th>
				<th name="jingli" data-options="field:'payTime',hidden:true">缴费时间</th>
				<th name="jingli" data-options="field:'money',hidden:true">金额</th>
				<th name="jingli" data-options="field:'isReturnMoney',hidden:true">是否退费</th>
				<th name="jingli" data-options="field:'isInClass',hidden:true">是否进班</th>
				<th name="jingli" data-options="field:'inClassTime',hidden:true">进班时间</th>
				<th name="jingli" data-options="field:'inClassContent',hidden:true">进班备注</th>
				<th name="jingli" data-options="field:'askerContent',hidden:true">咨询师备注</th>
				<th name="jingli" data-options="field:'isDel',hidden:true">是否删除</th>
				<th data-options="field:'fromPart'">来源渠道</th>
				<th name="jingli" data-options="field:'ziXunName',hidden:true">咨询师名称</th>
				<th data-options="field:'stuConcern'">学员关注</th>
				<th data-options="field:'isBaoBei'">是否报备</th>
				<th name="jingli" data-options="field:'askerName',hidden:true,formatter:function(value,row,index){return row.askers.askerName}">咨询师</th>
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
<div id="updatezixun" class="easyui-window" title="修改咨询师" 
        data-options="iconCls:'icon-save',modal:true,closed:'true'">
        <select id="cc" class="easyui-combobox" style="width:200px;">
        	<option value="---未选择---"></option>
        </select>
        <a href="javascript:void(0);" class="easyui-linkbutton" onclick="batchOperation()">提交</a>
</div>
<!-- 添加弹出框 -->
	<div id="add" class="easyui-dialog" title="添加" style="width:400px;"  data-options="resizable:true,modal:true,closed:true">   
   <form id="addfrm">
   <table >
  			<tr>
				<td><label> 姓名</label></td>
				<td><input class="easyui-textbox" name="name"  ></td>
			</tr>
			<tr>
				<td><label>性别</label></td>
				<td><input class="easyui-textbox" name="sex"  ></td>
			</tr>
			<tr>
				<td><label>年龄</label></td>
				<td><input class="easyui-textbox" name="age"  ></td>
			</tr>
			<tr>
				<td><label>电话</label></td>
				<td><input class="easyui-textbox" name="phone" ></td>
			</tr>
			<tr>
	    		<td>录入人  :</td>
	    		<td><input class="easyui-textbox" name="createUser" data-options="multiline:true" value="${user.userName}" ></input></td>
	    	</tr>
			<tr>
				<td><label>学历</label></td>
				<td><!-- <input class="easyui-textbox" name="stuStatus"  > -->
				<select id="educa_tion" name="education">
				<option>未知</option>
				<option>大专</option>
				<option>高中</option>
				<option>中专</option>
				<option>初中</option>
				<option>本科</option>
				<option>其它</option>
				</select>
				</td>
			</tr>
			<tr>
				<td><label>状态</label></td>
				<td>
				<!-- <input class="easyui-textbox" name="phone" > -->
				<select id="stu_Status" name="stuStatus">
				<option>未知</option>
				<option>待业</option>
				<option>在职</option>
				<option>在读</option>
				</select>
				</td>
			</tr>
			<tr>
				<td><label>来源渠道</label></td>
				<td><!-- <input class="easyui-textbox" name="fromPart" > -->
				<select id="from_Part" name="fromPart">
				<option>未知</option>
				<option>百度</option>
				<option>百度移动端</option>
				<option>360</option>
				<option>360移动端</option>
				<option>搜狗</option>
				<option>搜狗移动端</option>
				<option> UC移动端</option>
				<option>直接输入</option>
				<option>自然流量</option>
				<option>直电</option>
				<option>微信</option>
				<option>QQ</option>
				<option>其它</option>
				</select>
				</td>
			</tr>
			<tr>
				<td><label>来源网站</label></td>
				<td>
				<!-- <input class="easyui-textbox" name="sourceUrl" > -->
				<select id="source_Url" name="sourceUrl">
				<option>其它</option>
				<option>职英B站</option>
				<option>高考站</option>
				<option>职英A站</option>
				<option>其它</option>
				</select>
				</td>
			</tr>

			<tr>
				<td><label>来源关键词</label></td>
				<td><input class="easyui-textbox" name="sourceKeyWord" ></td>
			</tr>
			<tr>
				<td><label>学员QQ</label></td>
				<td><input class="easyui-textbox" name="qq" ></td>
			</tr>
			<tr>
				<td><label>微信号</label></td>
				<td><input class="easyui-textbox" name="weiXin" ></td>
			</tr>
			<tr>
				<td><label>是否报备</label></td>
				<td><input class="easyui-textbox" name="isBaoBei" ></td>
			</tr>
			<tr>
				<td><label>在线备注</label></td>
				<td><input class="easyui-textbox" name="inClassContent" ></td>
			</tr>
			 </table>
   </form> 
   <div style="text-align:center;padding:5px">
   <a href="javascript:void(0)" class="easyui-linkbutton"   onclick="addTijiao()">提交</a> 
   <a href="javascript:void(0)" class="easyui-linkbutton"  >取消</a>   
   </div>  
</div>  
<!-- 查看弹出框 -->
<div id="ChaKan" class="easyui-dialog" title="查看" style="width:400px;height:500px;"   data-options="resizable:true,modal:true,closed:true">
<form id="ChaKanfrm">
	    	<table >
	    		<tr>
	    			<td>Name:</td>
	    			<td><input class="easyui-textbox"  name="name" data-options="required:true"></input></td>
	    		</tr>
	    		<tr>
	    			<td>年龄:</td>
	    			<td><input class="easyui-textbox" type="text" name="age" data-options="required:true"></input></td>
	    		</tr>
	    		<tr>
	    			<td>性别:</td>
	    			<td><input class="easyui-textbox" type="text" name="sex" data-options="required:true"></input></td>
	    		</tr>
	    		<tr>
	    			<td>电话:</td>
	    			<td><input class="easyui-textbox" name="phone" data-options="multiline:true" ></input></td>
	    		</tr>
	    		<!-- <tr>
	    			<td>学历:</td>
	    			<td><input class="easyui-textbox" name="education" data-options="multiline:true" ></input></td>
	    		</tr> -->
	    		<tr>
				<td><label>学历</label></td>
				<td><!-- <input class="easyui-textbox" name="stuStatus"  > -->
				<select id="educa_tion" name="education">
				<option value="未知">未知</option>
				<option value="大专">大专</option>
				<option value="高中">高中</option>
				<option value="中专">中专</option>
				<option value="初中">初中</option>
				<option value="本科">本科</option>
				<option alue="其它">其它</option>
				</select>
				</td>
			</tr>
	    		
	    		<!-- <tr>
	    			<td>状态:</td>
	    			<td><input class="easyui-textbox" name="stuStatus" data-options="multiline:true" ></input></td>
	    		</tr> -->
	    		<tr>
				<td><label>状态</label></td>
				<td>
				<!-- <input class="easyui-textbox" name="phone" > -->
				<select id="stu_Status" name="stuStatus">
				<option value="未知">未知</option>
				<option value="待业">待业</option>
				<option value="在职">在职</option>
				<option value="在读">在读</option>
				</select>
				</td>
			</tr>
	    		
	    		<!-- <tr>
	    			<td>来源渠道:</td>
	    			<td><input class="easyui-textbox" name="fromPart" data-options="multiline:true" ></input></td>
	    		</tr> -->
	    		<tr>
				<td><label>来源渠道</label></td>
				<td><!-- <input class="easyui-textbox" name="fromPart" > -->
				<select id="from_Part" name="fromPart">
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
			</tr>
	    		
	    		<!-- <tr>
	    			<td>来源网站:</td>
	    			<td><input class="easyui-textbox" name="sourceUrl" data-options="multiline:true" ></input></td>
	    		</tr> -->
	    		<tr>
				<td><label>来源网站</label></td>
				<td>
				<!-- <input class="easyui-textbox" name="sourceUrl" > -->
				<select id="source_Url" name="sourceUrl">
				<option value="其它">其它</option>
				<option value="职英B站">职英B站</option>
				<option value="高考站">高考站</option>
				<option value="职英A站">职英A站</option>
				<option value="其它">其它</option>
				</select>
				</td>
			</tr>
	    		
	    		<tr>
	    			<td>来源关键词:</td>
	    			<td><input class="easyui-textbox" name="sourceKeyWord" data-options="multiline:true" ></input></td>
	    		</tr>
	    		<tr>
	    			<td>所在区域:</td>
	    			<td>
	    			<!-- <input class="easyui-textbox" name="location" data-options="multiline:true" ></input> -->
	    			<select id="loca_tion" name="location">
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
	    		</tr>
	    		<tr>
	    			<td>学员关注:</td>
	    			<td><!-- <input class="easyui-textbox" name="stuConcern" data-options="multiline:true" ></input> -->
	    			<select id="stu_Concern" name="stuConcern">
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
	    		</tr>
	    		<tr>
	    			<td>来源部门:</td>
	    			<td><!-- <input class="easyui-textbox" name="msgSource" data-options="multiline:true" ></input> -->
	    			<select id="msg_Source" name="msgSource">
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
	    		</tr>
	    		<tr>
	    			<td>微信号:</td>
	    			<td><input class="easyui-textbox" name="weiXin" data-options="multiline:true" ></input></td>
	    		</tr>
	    		<tr>
	    			<td>是否报备:</td>
	    			<td><!-- <input class="easyui-textbox" name="isBaoBei" data-options="multiline:true" ></input> -->
	    			<select id="is_BaoBei" name="isBaoBei">
				<option value="1">是</option>
				<option value="2">否</option>
				</select>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td>咨询师:</td>
	    			<td><select id="selectid" class="easyui-combobox"  style="width:50px;"></select></td>
	    		</tr>
	    		<tr>
	    			<td>录入人  :</td>
	    			<td><input class="easyui-textbox" name="createUser" data-options="multiline:true" ></input></td>
	    		</tr>
	    		<tr>
	    			<td>咨询师录入:</td>
	    			<td></td>
	    		</tr>
	    		<tr>
	    			<td>课程方向:</td>
	    			<td>
	    			<!-- <input class="easyui-textbox" name="learnForward" data-options="multiline:true" ></input> -->
	    			<select id="learn_Forward" name="learnForward">
				<option value="软件开发">软件开发</option>
				<option value="软件设计">软件设计</option>
				<option value="网络营销">网络营销</option>
				</select>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td>打分:</td>
	    			<td><!-- <input class="easyui-textbox" name="scoring" data-options="multiline:true" ></input> -->
	    			<select id="s_coring" name="scoring">
				<option value="A、近期可报名">A、近期可报名</option>
				<option value="B、一个月内可报名">B、一个月内可报名</option>
				<option value="C、长期跟踪">C、长期跟踪</option>
				<option value="D、无效">D、无效</option>
				</select>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td>是否有效:</td>
	    			<td>
	    			<!-- <input class="easyui-textbox" name="isValid" data-options="multiline:true" ></input> -->
	    			<select id="is_Valid" name="isValid">
						<option value="1">是</option>
						<option value="2">否</option>
						<option value="0">待定</option>
					</select>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td>无效原因:</td>
	    			<td>
	    			 <input class="easyui-textbox" name="lostValid" data-options="multiline:true" ></input> 
	    			</td>
	    		</tr>
	    		<tr>
	    			<td>是否回访:</td>
	    			<td>
	    			<!-- <input class="easyui-textbox" name="isReturnVist" data-options="multiline:true" ></input> -->
	    			<select id="is_ReturnVist" name="isReturnVist">
				<option value="1">已回访</option>
				<option  value="2">未回访</option>
				</select>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td>首访时间:</td>
	    			<td><input class="easyui-textbox" name="firstVisitTime" data-options="multiline:true" ></input></td>
	    		</tr>
	    		<tr>
	    			<td>是否上门:</td>
	    			<td><input class="easyui-textbox" name="isHome" data-options="multiline:true" ></input></td>
	    		</tr>
	    		<tr>
	    			<td>上门时间:</td>
	    			<td><input class="easyui-textbox" name="homeTime" data-options="multiline:true" ></input></td>
	    		</tr>
	    		<tr>
	    			<td>定金金额:</td>
	    			<td><input class="easyui-textbox" name="preMoney" data-options="multiline:true" ></input></td>
	    		</tr>
	    		<tr>
	    			<td>定金时间:</td>
	    			<td><input class="easyui-textbox" name="preMoneyTime" data-options="multiline:true" ></input></td>
	    		</tr>
	    		<tr>
	    			<td>是否缴费:</td>
	    			<td>
	    			<!-- <input class="easyui-textbox" name="isPay" data-options="multiline:true" ></input> -->
	    			<select id="is_Pay" name="isPay">
				<option>已缴费</option>
				<option>未缴费</option>
				</select>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td>缴费时间:</td>
	    			<td><input class="easyui-textbox" name="payTime" data-options="multiline:true" ></input></td>
	    		</tr>
	    		<tr>
	    			<td>缴费金额:</td>
	    			<td><input class="easyui-textbox" name="money" data-options="multiline:true" ></input></td>
	    		</tr>
	    		<tr>
	    			<td>是否退费:</td>
	    			<td><input class="easyui-textbox" name="isReturnMoney" data-options="multiline:true" ></input></td>
	    		</tr>
	    		<tr>
	    			<td>退费原因:</td>
	    			<td><input class="easyui-textbox" name="returnMoneyReason" data-options="multiline:true" ></input></td>
	    		</tr>
	    		<tr>
	    			<td>是否进班:</td>
	    			<td><input class="easyui-textbox" name="isInClass" data-options="multiline:true" ></input></td>
	    		</tr>
	    		<tr>
	    			<td>进班时间:</td>
	    			<td><input class="easyui-textbox" name="inClassTime" data-options="multiline:true" ></input></td>
	    		</tr>
	    		<tr>
	    			<td>进班备注:</td>
	    			<td><input class="easyui-textbox" name="inClassContent" data-options="multiline:true" ></input></td>
	    		</tr>
	    		<tr>
	    			<td>咨询师备注:</td>
	    			<td><input class="easyui-textbox" name="askerContent" data-options="multiline:true" ></input></td>
	    		</tr>
	    	</table>
	    </form>
</div>
<!-- 编辑弹出框 -->
<div id="update" class="easyui-dialog" title="编辑" style="width:400px;height:500px;"   data-options="resizable:true,modal:true,closed:true">
<form id="updatefrm">
	    	<table >
	    		<tr>
	    			<td>Name:</td>
	    			<input type="hidden" name="id" />
	    			<td><input class="easyui-textbox"  name="name" data-options="required:true"></input></td>
	    		</tr>
	    		<tr>
	    			<td>年龄:</td>
	    			<td><input class="easyui-textbox" type="text" name="age" data-options="required:true"></input></td>
	    		</tr>
	    		<tr>
	    			<td>性别:</td>
	    			<td><input class="easyui-textbox" type="text" name="sex" data-options="required:true"></input></td>
	    		</tr>
	    		<tr>
	    			<td>电话:</td>
	    			<td><input class="easyui-textbox" name="phone" data-options="multiline:true" ></input></td>
	    		</tr>
	    		<tr>
				<td><label>学历</label></td>
				<td><!-- <input class="easyui-textbox" name="stuStatus"  > -->
				<select id="educa_tion" name="education">
				<option value="未知">未知</option>
				<option value="大专">大专</option>
				<option value="高中">高中</option>
				<option value="中专">中专</option>
				<option value="初中">初中</option>
				<option value="本科">本科</option>
				<option alue="其它">其它</option>
				</select>
				</td>
			</tr>
	    		
	    		<tr>
				<td><label>状态</label></td>
				<td>
				<!-- <input class="easyui-textbox" name="phone" > -->
				<select id="stu_Status" name="stuStatus">
				<option value="未知">未知</option>
				<option value="待业">待业</option>
				<option value="在职">在职</option>
				<option value="在读">在读</option>
				</select>
				</td>
			</tr>
	    		<tr>
				<td><label>来源渠道</label></td>
				<td><!-- <input class="easyui-textbox" name="fromPart" > -->
				<select id="from_Part" name="fromPart">
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
			</tr>
	    		
	    		<tr>
				<td><label>来源网站</label></td>
				<td>
				<!-- <input class="easyui-textbox" name="sourceUrl" > -->
				<select id="source_Url" name="sourceUrl">
				<option value="其它">其它</option>
				<option value="职英B站">职英B站</option>
				<option value="高考站">高考站</option>
				<option value="职英A站">职英A站</option>
				<option value="其它">其它</option>
				</select>
				</td>
			</tr>
	    		<tr>
	    			<td>来源关键词:</td>
	    			<td><input class="easyui-textbox" name="sourceKeyWord" data-options="multiline:true" ></input></td>
	    		</tr>
	    		<tr>
	    			<td>所在区域:</td>
	    			<td>
	    			<!-- <input class="easyui-textbox" name="location" data-options="multiline:true" ></input> -->
	    			<select id="loca_tion" name="location">
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
	    		</tr>
	    		<tr>
	    			<td>学员关注:</td>
	    			<td><!-- <input class="easyui-textbox" name="stuConcern" data-options="multiline:true" ></input> -->
	    			<select id="stu_Concern" name="stuConcern">
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
	    		</tr>
	    		<tr>
	    			<td>来源部门:</td>
	    			<td><!-- <input class="easyui-textbox" name="msgSource" data-options="multiline:true" ></input> -->
	    			<select id="msg_Source" name="msgSource">
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
	    		</tr>
	    		<tr>
	    			<td>微信号:</td>
	    			<td><input class="easyui-textbox" name="weiXin" data-options="multiline:true" ></input></td>
	    		</tr>
	    		<tr>
	    			<td>是否报备:</td>
	    			<td><!-- <input class="easyui-textbox" name="isBaoBei" data-options="multiline:true" ></input> -->
	    			<select id="is_BaoBei" name="isBaoBei">
				<option value="1">是</option>
				<option value="2">否</option>
				</select>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td>咨询师:</td>
	    			<td><select id="select_id" name="askerId" class="easyui-combobox"  style="width:50px;"></select></td>
	    		</tr>
	    		<tr>
	    			<td>录入人  :</td>
	    			<td><input class="easyui-textbox" name="createUser" data-options="multiline:true" ></input></td>
	    		</tr>
	    		<tr>
	    			<td>咨询师录入:</td>
	    			<td></td>
	    		</tr>
	    		<tr>
	    			<td>课程方向:</td>
	    			<td>
	    			<!-- <input class="easyui-textbox" name="learnForward" data-options="multiline:true" ></input> -->
	    			<select id="learn_Forward" name="learnForward">
				<option value="软件开发">软件开发</option>
				<option value="软件设计">软件设计</option>
				<option value="网络营销">网络营销</option>
				</select>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td>打分:</td>
	    			<td><!-- <input class="easyui-textbox" name="scoring" data-options="multiline:true" ></input> -->
	    			<select id="s_coring" name="scoring">
				<option value="A、近期可报名">A、近期可报名</option>
				<option value="B、一个月内可报名">B、一个月内可报名</option>
				<option value="C、长期跟踪">C、长期跟踪</option>
				<option value="D、无效">D、无效</option>
				</select>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td>是否有效:</td>
	    			<td>
	    			<!-- <input class="easyui-textbox" name="isValid" data-options="multiline:true" ></input> -->
	    			<select id="is_Valid" name="isValid">
						<option value="1">是</option>
						<option value="2">否</option>
						<option value="0">待定</option>
					</select>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td>无效原因:</td>
	    			<td><input class="easyui-textbox" name="lostValid" data-options="multiline:true" ></input></td>
	    		</tr>
	    		<tr>
	    			<td>是否回访:</td>
	    			<td>
	    			<!-- <input class="easyui-textbox" name="isReturnVist" data-options="multiline:true" ></input> -->
	    			<select id="is_ReturnVist" name="isReturnVist">
						<option value="1">已回访</option>
						<option value="2">未回访</option>
					</select>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td>首访时间:</td>
	    			<td><input class="easyui-textbox" name="firstVisitTime" data-options="multiline:true" ></input></td>
	    		</tr>
	    		<tr>
	    			<td>是否上门:</td>
	    			<td><input class="easyui-textbox" name="isHome" data-options="multiline:true" ></input></td>
	    		</tr>
	    		<tr>
	    			<td>上门时间:</td>
	    			<td>
	    			<input class="easyui-textbox" name="homeTime" data-options="multiline:true" ></input></td>
	    		</tr>
	    		<tr>
	    			<td>定金金额:</td>
	    			<td><input class="easyui-textbox" name="preMoney" data-options="multiline:true" ></input></td>
	    		</tr>
	    		<tr>
	    			<td>定金时间:</td>
	    			<td><input class="easyui-textbox" name="preMoneyTime" data-options="multiline:true" ></input></td>
	    		</tr>
	    		<tr>
	    			<td>是否缴费:</td>
	    			<td>
	    			<!-- <input class="easyui-textbox" name="isPay" data-options="multiline:true" ></input> -->
	    			<select id="is_Pay" name="isPay">
						<option value="1">已缴费</option>
						<option value="2">未缴费</option>
					</select>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td>缴费时间:</td>
	    			<td><input class="easyui-textbox" name="payTime" data-options="multiline:true" ></input></td>
	    		</tr>
	    		<tr>
	    			<td>缴费金额:</td>
	    			<td><input class="easyui-textbox" name="money" data-options="multiline:true" ></input></td>
	    		</tr>
	    		<tr>
	    			<td>是否退费:</td>
	    			<td><!-- <input class="easyui-textbox" name="isReturnMoney" data-options="multiline:true" ></input> -->
	    			<select id="is_ReturnMoney" name="isReturnMoney">
						<option value="1">已退费</option>
						<option value="2">未退费</option>
					</select>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td>退费原因:</td>
	    			<td>
	    			<input class="easyui-textbox" name="returnMoneyReason" data-options="multiline:true" ></input></td>
	    		</tr>
	    		<tr>
	    			<td>是否进班:</td>
	    			<td><!-- <input class="easyui-textbox" name="isInClass" data-options="multiline:true" ></input> -->
	    			<select id="is_InClass" name="isInClass">
						<option value="1">已进班</option>
						<option value="2">未进班</option>
					</select>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td>进班时间:</td>
	    			<td><input class="easyui-textbox" name="inClassTime" data-options="multiline:true" ></input></td>
	    		</tr>
	    		<tr>
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
	    	<a href="javascript:void(0)" class="easyui-linkbutton" onclick="updateclearForm()">Clear</a>
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
			</tr>
			<tr>
			<td><input type="checkbox" value="name"/>姓名</td>
			</tr>
			<tr>
				<td><input type="checkbox" value="age"/>年龄</td>
			</tr>
			<tr>
				<td><input type="checkbox" value="sex"/>性别</td>
			
				<td><input type="checkbox" value="phone"/>电话</td>
			</tr>
			<tr>
				<td><input type="checkbox" value="stuStatus"/>客户状态</td>
			
				<td><input type="checkbox" value="stuConcern"/>学员关注</td>
			</tr>
			<tr>
				<td><input type="checkbox" value="msgSource"/>来源部门</td>
			
				<td><input type="checkbox" value="sourceUrl"/>来源网站</td>
			</tr>
			<tr>
				<td><input type="checkbox" value="sourceKeyWord"/>来源关键词</td>
			
				<td><input type="checkbox" value="address"/>地址</td>
			</tr>
			<tr>
				<td><input type="checkbox" value="netPusherId"/>22</td>
			
				<td><input type="checkbox" value="askerId"/>咨询师编号</td>
			</tr>
			<tr>
				<td><input type="checkbox" value="qq"/>QQ</td>
			
				<td><input type="checkbox" value="weiXin"/>微信</td>
			</tr>
			
			<tr>
				<td><input type="checkbox" value="content"/>内容</td>
			
				<td><input type="checkbox" value="createTime"/>创建时间</td>
			</tr>
			<tr>
				<td><input type="checkbox" value="learnForward"/>课程方向</td>
			
				<td><input type="checkbox" value="isValid"/>是否有效</td>
			</tr>
			<tr>
				<td><input type="checkbox" value="record"/>记录</td>
			
				<td><input type="checkbox" value="isReturnVist"/>是否回访</td>
			</tr>
			<tr>
				<td><input type="checkbox" value="firstVisitTime"/>首访时间</td>
			
				<td><input type="checkbox" value="isHome"/>是否上门</td>
			</tr>
			<tr>
				<td><input type="checkbox" value="homeTime"/>上门时间</td>
			
				<td><input type="checkbox" value="lostValid"/>无效原因</td>
			</tr>
			<tr>
				<td><input type="checkbox" value="isPay"/>是否缴费</td>
			
				<td><input type="checkbox" value="payTime"/>缴费时间</td>
			</tr>
			<tr>
				<td><input type="checkbox" value="money"/>金额</td>
			
				<td><input type="checkbox" value="isReturnMoney"/>是否退费</td>
			</tr>
			<tr>
				<td><input type="checkbox" value="isInClass"/>是否进班</td>
			
				<td><input type="checkbox" value="inClassTime"/>进班时间</td>
			</tr>
			<tr>
				<td><input type="checkbox" value="inClassContent"/>进班备注</td>
			
				<td><input type="checkbox" value="askerContent"/>咨询师备注</td>
			</tr>
			<tr>
				<td><input type="checkbox" value="isDel"/>是否删除</td>
			
				<td><input type="checkbox" value="fromPart"/>来源渠道</td>
			</tr>
			<tr>
				<td><input type="checkbox" value="stuConcern"/>学员关注</td>
			
				<td><input type="checkbox" value="isBaoBei"/>是否报备</td>
			</tr>
			<tr>
				<td><input type="checkbox" value="ziXunName"/>咨询师名称</td>
			
				<td><input type="checkbox" value="createUser"/>录入人</td>
			</tr>
			<tr>
				<td><input type="checkbox" value="returnMoneyReason"/>退费原因</td>
			</tr> 
			<tr>
				<td><input type="checkbox" value="preMoney"/>定金金额</td>
			
				<td><input type="checkbox" value="preMoneyTime"/>定金时间</td>
			</tr>
			<tr>
				<td><input type="checkbox" value="scoring"/>打分</td>
			
				<td><input type="checkbox" value="education"/>学历</td>
			</tr>
			<tr>
				<td><input type="checkbox" value="location"/>所在区域</td>
			
				<td><input type="checkbox" value="onlineremark"/>在线备注</td>
			</tr>
		</table>
	</form>
</div>
</body>
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
	var rows=$("#wlsdg").datagrid("getSelections");
	if(rows.length==0){
		$.messages.alert("提示","请选择你要导出的数据");
	}
	var data = JSON.stringify(rows);
	if (data == '')
		return;

	JSONToCSVConvertor(data, "数据信息", true);
});
</script>


</html>