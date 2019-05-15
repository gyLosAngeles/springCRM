<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
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
<script type="text/javascript">
$(function() {
	into();
})
function into(){
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
			IsReturnVist : $("#IsReturnVist1").combobox("getValue")
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
	 alert(1);
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
       var ids = [];
       for (var i = 0; i < selRow.length; i++) {
           var id = selRow[i].id;
           ids.push(id); //把单个id循环放到ids的数组中  
       }
       alert(ids);
       $.messager.confirm('提示', '确认删除?', function(r) {
           if (r) {
               $.ajax({
                   url : '../wl/deleteStudents',
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
	return "<a href='javascript:void(0)' onclick='ChaKan("+index+")'>查看</a>";
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
	<select id="IsValid1" class="easyui-combobox"">
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
	<a href="#" class="easyui-linkbutton" onclick="Shezhi()">设置</a>
	<a href="#" class="easyui-linkbutton" onclick="Shanchu()">删除</a>
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
				<th data-options="field:'perState'">学员关注</th>
				<th data-options="field:'msgSource'">来源部门</th>
				<th data-options="field:'sourceUrl'">来源网站</th>
				<th data-options="field:'sourceKeyWord'">来源关键词</th>
				<th data-options="field:'address'">地址</th>
				<th data-options="field:'netPusherId'"></th>
				<th data-options="field:'askerId'">咨询师编号</th>
				<th data-options="field:'qq'">qq</th>
				<th data-options="field:'weiXin'">微信</th>
				<th data-options="field:'content'">内容</th>
				<th data-options="field:'createTime'">创建时间</th>
				<th data-options="field:'learnForward'">课程方向</th>
				<th data-options="field:'isValid'">是否有效</th>
				<th data-options="field:'record'">记录</th>
				<th data-options="field:'isReturnVist'">是否回访</th>
				<th data-options="field:'firstVisitTime'">首访时间</th>
				<th data-options="field:'isHome'">是否上门</th>
				<th data-options="field:'homeTime'">上门时间</th>
				<th data-options="field:'lostValid'">无效原因</th>
				<th data-options="field:'isPay'">是否缴费</th>
				<th data-options="field:'payTime'">缴费时间</th>
				<th data-options="field:'money'">金额</th>
				<th data-options="field:'isReturnMoney'">是否退费</th>
				<th data-options="field:'isInClass'">是否进班</th>
				<th data-options="field:'inClassTime'">进班时间</th>
				<th data-options="field:'inClassContent'">进班备注</th>
				<th data-options="field:'askerContent'">咨询师备注</th>
				<th data-options="field:'isDel'">是否删除</th>
				<th data-options="field:'fromPart'">来源渠道</th>
				<th data-options="field:'stuConcern'">学员关注</th>
				<th data-options="field:'isBaoBei'">是否报备</th>
				<th data-options="field:'askerName',formatter:function(value,row,index){return row.askers.askerName}">咨询师</th>
				<th data-options="field:'createUser'">录入人</th>
				<th data-options="field:'returnMoneyReason'">退费原因</th>
				<th data-options="field:'preMoney'">定金金额</th>
				<th data-options="field:'preMoneyTime'">定金时间</th>
				<th data-options="field:'scoring'">打分</th>
				<th data-options="field:'education'">学历</th>
				<th data-options="field:'location'">所在区域</th>
				<th data-options="field:'onlineremark'">在线备注</th>
				<th data-options="field:'caozuo',formatter:formattercaozuo">操作</th>
			</tr>
		</thead>
	</table>
<!-- 查看 -->
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
				<td><label>学历</label></td>
				<td><input class="easyui-textbox" name="stuStatus"  ></td>
			</tr>
			<tr>
				<td><label>状态</label></td>
				<td><input class="easyui-textbox" name="phone" ></td>
			</tr>
			<tr>
				<td><label>来源渠道</label></td>
				<td><input class="easyui-textbox" name="fromPart" ></td>
			</tr>
			<tr>
				<td><label>来源网站</label></td>
				<td><input class="easyui-textbox" name="sourceUrl" ></td>
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
   <a href="javascript:void(0)" class="easyui-linkbutton"   onclick="addTijiao()">提交</a> 
   <a href="javascript:void(0)" class="easyui-linkbutton"  >取消</a>     
</div>  
</body>
</html>