<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>员工签到</title>
<link rel="stylesheet" type="text/css" href="../js/easyui/insdep.easyui.min.css">
<link rel="stylesheet" type="text/css" href="../js/easyui/icon.css">
<script type="text/javascript" src="../js/easyui/jquery.min.js"></script>
<script type="text/javascript" src="../js/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript"src="../js/easyui/insdep.extend.min.js"></script>
<script type="text/javascript"src="../js/easyui/locale/easyui-lang-zh_CN.js"></script>
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
	return '<a href="javascript:userCancel('+index+')">退签</a>'+"  "+'<a href="javascript:openupdate('+index+')">分量设置</a>';
} 
function openupdate(index){
	 var row = $("#dg").datagrid("getRows");
	 $('#widthAsker').form('load',row[index]);
	 $('#win').window('open');
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
    			askerName:row.askerName,
    			checkState:2
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
function submitUpdate(){
	 $.post("/CRMManage/directorAskersUpdateWidth",{
		 weight:$("#weight").val(),
		 bakContent:$("#bakContent").val(),
		 askerId:$("#askerId").val()
		},function (res){
			if(res){
				alert("修改成功");
				$("#win").window("close");
				$("#dg").datagrid("reload");
			}else{
				alert("失败");
			}
	},"json")
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
<div id="win" class="easyui-window" title="编辑"    
        data-options="iconCls:'icon-save',modal:true,closed:true">
    <form id="widthAsker">
    <div style="display: none;">   
        <input class="easyui-validatebox" type="text" id="askerId" name="askerId"  />   
    </div>   
    <div>   
        <label for="weight">权重:</label>   
        <input class="easyui-validatebox" type="text" name="weight" id="weight"  />   
    </div>   
    <div>   
        <label for="bakContent">备注:</label>   
        <input class="easyui-validatebox" type="text" name="bakContent" id="bakContent"  />   
    </div>
    <div style="text-align:center;padding:5px">
         <a href="javascript:void(0)" class="easyui-linkbutton" type="button" onclick="submitUpdate()">保存</a>
     </div>   
</form>   
	</div>
<table id="dg" title="用户列表" style="width:300;height:400">
    <thead>
        <tr>
             <th data-options="field:'askerId',width:280,hidden:true">用户ID</th>
             <th data-options="field:'askerName',width:100">用户名</th>
             <th data-options="field:'checkInTime',width:100">签到时间</th>
             <th data-options="field:'checkState',width:100,formatter:function(value,row,index){return value==1?'已签到':'未签到';}">签到状态</th>
             <th data-options="field:'Cancel',width:160,formatter:Cancel">功能</th>
        </tr>
    </thead>
</table>

</body>
</html>