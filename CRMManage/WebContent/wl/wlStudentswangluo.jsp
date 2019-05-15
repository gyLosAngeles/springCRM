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
	shezhidongtai();
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

function formattercaozuo(value,row,index){
	return null;
}


function shezhidongtai(){
	var createGridHeaderContextMenu = function(e, field) {
		e.preventDefault();
		var grid = $(this);/* grid本身 */
		var headerContextMenu = this.headerContextMenu;/* grid上的列头菜单对象 */
		var okCls = 'tree-checkbox1';// 选中
		var emptyCls = 'tree-checkbox0';// 取消
		if (!headerContextMenu) {
			var tmenu = $('<div style="width:100px;"></div>').appendTo('body');
			var fields = grid.datagrid('getColumnFields');
			for (var i = 0; i < fields.length; i++) {
				var fildOption = grid.datagrid('getColumnOption', fields[i]);
				if (!fildOption.hidden) {
					$('<div iconCls="' + okCls + '" field="' + fields[i] + '"/>')
							.html(fildOption.title).appendTo(tmenu);
				} else {
					$('<div iconCls="' + emptyCls + '" field="' + fields[i] + '"/>')
							.html(fildOption.title).appendTo(tmenu);
				}
			}
			headerContextMenu = this.headerContextMenu = tmenu.menu({
				onClick : function(item) {
					var field = $(item.target).attr('field');
					if (item.iconCls == okCls) {
						grid.datagrid('hideColumn', field);
						$(this).menu('setIcon', {
							target : item.target,
							iconCls : emptyCls
						});
					} else {
						grid.datagrid('showColumn', field);
						$(this).menu('setIcon', {
							target : item.target,
							iconCls : okCls
						});
					}
				}
			});
		}
		headerContextMenu.menu('show', {
			left: e.pageX,
            top: e.pageY
		});
	};
	$.fn.datagrid.defaults.onHeaderContextMenu = createGridHeaderContextMenu;
	$.fn.treegrid.defaults.onHeaderContextMenu = createGridHeaderContextMenu;
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
	<a href="javascript:void(0);" id="btnExport" class="easyui-linkbutton" iconCls='icon-print'>导出Excel</a>
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
	var data = JSON.stringify($('#wlsdg').datagrid('getData').rows);
	if (data == '')
		return;

	JSONToCSVConvertor(data, "数据信息", true);
});
</script>
</html>