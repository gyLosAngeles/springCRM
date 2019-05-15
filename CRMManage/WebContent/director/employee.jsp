<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>员工签到</title>
<link rel="stylesheet" type="text/css" href="/CRMManage/js/easyui demo/easyui/1.3.4/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="/CRMManage/js/easyui demo/css/wu.css" />
<link rel="stylesheet" type="text/css" href="/CRMManage/js/easyui demo/css/icon.css" />
<script type="text/javascript" src="/CRMManage/js/easyui demo/js/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="/CRMManage/js/easyui demo/easyui/1.3.4/jquery.easyui.min.js"></script>
<script type="text/javascript" src="/CRMManage/js/easyui demo/easyui/1.3.4/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">
$(function(){
	init();
})
function init(){
	$("#dg").datagrid({ 
    	url:"../directorSignInSelect",  //数据接口的地址
        queryParams: {  
        	userName:$("#Name").val(),
        	checkInTimeBigin:$("#userCreateTimeBigin").val(),
        	checkInTimeEnd:$("#userCreateTimeEnd").val(),
        	CheckState:$("#userIsLockout").combobox("getValue")
        },  
        method:'post',
        singleSelect:true,
        pagination:true,
        toolbar:'#usertb'
   })
}
function Cancel(value,row,index) {
	return '<a href="javascript:userCancel('+index+')">退签</a>'
} 
function userCancel(index){
	var row=$("#dg").datagrid("getRows")[index];
	if(row.checkState==2){
		alert("不能重复退签");
		return;
	}
	$.messager.confirm("确认","你确认要退签吗？",function(r){
		if(r){
    		$.post("/CRMManage/directorSignInUpdate",{
    			UserName:row.userName,
    			CheckState:2
		},function (res){
			if(res){
				alert("成功");
				$("#dg").datagrid("reload");
			}else{
				alert("失败");
			}
		},"json")
		}
	});
}
</script>
</head>
<body>
<div id="usertb" style="padding:5px; height:auto">
    <div style="margin-bottom:5px" title="用户信息">
    	<form id="ff" method="post">   
		    <div>
		                        用户名:   <input class="easyui-validatebox" type="text" id="Name"   data-options="required:true" />   
				签到开始时间:<input class="easyui-datebox" type="text"  id="userCreateTimeBigin" required="required" />-   
		    		    <input class="easyui-datebox" type="text" id="userCreateTimeEnd"  required="required" />
		    	签到状态:	<select id="userIsLockout" class="easyui-combobox" name="dept">   
						    <option value="">请选择</option>   
						    <option value="1">已签到</option>   
						    <option value="2">未签到</option>   
						</select>
					 <a href="javascript:init()" class="easyui-linkbutton" data-options="iconCls:'icon-search'">查找</a>
		   	 </div>
    	</form> 
    </div>
</div>
<table id="dg" title="用户列表" style="width:300;height:400">
    <thead>
        <tr>
             <th data-options="field:'userId',width:280,hidden:true">用户ID</th>
             <th data-options="field:'userName',width:100">用户名</th>
             <th data-options="field:'checkInTime',width:100">签到时间</th>
             <th data-options="field:'checkState',width:100,formatter:function(value,row,index){return value==1?'已签到':'未签到';}">签到状态</th>
             <th data-options="field:'checkOutTime',width:160">退签时间</th>
             <th data-options="field:'Cancel',width:160,formatter:Cancel">功能</th>
        </tr>
    </thead>
</table>

</body>
</html>