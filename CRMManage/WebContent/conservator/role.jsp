<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>角色管理</title>
<link rel="stylesheet" type="text/css" href="../js/easyui/insdep.easyui.min.css">
<link rel="stylesheet" type="text/css" href="../js/easyui/icon.css">
<script type="text/javascript" src="../js/easyui/jquery.min.js"></script>
<script type="text/javascript" src="../js/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript"src="../js/easyui/insdep.extend.min.js"></script>
<script type="text/javascript"src="../js/easyui/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">
function searchRoleInfo(){
    $("#dg").datagrid({
    	method:'post',
    	toolbar:'#usertb',
    	singleSelect:true,
        pagination:true,
    	url: '/CRMManage/RoleAllSelect'
   }); 
}
function updateRole(){
	var row=$("#dg").datagrid("getSelected");
	$.post("/CRMManage/Roleupdate",{
			roleId:row.roleId,
			roleName:$("#Name").val()
		},function (res){
			if(res){
				alert("成功");
				$("#dg").datagrid("reload");
				$("#updatejs_window").window("close");
			}else{
				alert("失败");
			}
		},"json")
}
function addRole(){
	$.post("/CRMManage/Roleinsert",{
			roleName:$("#add_Name").val()
		},function (res){
			if(res){
				alert("成功");
				$("#dg").datagrid("reload");
				$("#addjs_window").window("close");
			}else{
				alert("失败");
			}
		},"json")
}
function deletejs(index){
	var row=$("#dg").datagrid("getRows");
	$.messager.confirm("确认","你确认要删除角色吗？",function(r){
		if(r){
		if(row[index].roleId<5){
			alert("删除失败模块正在被引用");
			return;
		}
    	  $.post("/CRMManage/Roledelete",{
		roleId:row[index].roleId
		},function (res){
			if(res){
				alert("成功");
				$("#dg").datagrid("reload");
			}else{
				alert("删除失败模块正在引用");
			}
		},"json")  
		}
	});
}
/*修改角色弹出框  */
function upadtejs(index) {
	var row=$("#dg").datagrid("getRows");
	$("#Name").textbox("setValue",row[index].roleName);
	$("#updatejs_window").window("open");
}
function addInfo() {
	$("#addjs_window").window("open");
}
function cz(val,row,index){
	return "<a href='javascript:upadtejs("+index+")'>编辑</a>";
}
function cz1(val,row,index){
	return "<a href='javascript:deletejs("+index+")'>删除</a>"
}
function shezhi(val,row,index){
	return "<a href='javascript:sz("+index+")'>设置</a>";
}
$(function(){
	searchRoleInfo();
});
function sz(index) {
	var row=$("#dg").datagrid("getRows");
	$("#diaSetRight").dialog({
		closed:false,
		title:"您正在设置"+row[index].roleName,
		toolbar:[{
			text:"保存",
			handler:function(){
				var row=$("#dg").datagrid("getRows");
				var nodes = $("#rightTree").tree('getChecked',['checked','indeterminate']);
				var s = "";
				for (var i = 0;i<nodes.length;i++) {
					if(s == ""){
						s+=nodes[i].id;
					}else{
						s+=",";
						s+=nodes[i].id;
					}
				}
				$.post("/CRMManage/RoleModuleSet",{
					Modules:s,
					roleId:row[index].roleId
				},function(res){
					if(res){
						alert("修改成功");
					}else{
						alert("修改失败")
					}
				},"json")
			}
		}]
	});
	 $.post("/CRMManage/RoleModuleSelect",{
			roleId:row[index].roleId
		},function (res){
			 $("#rightTree").tree("loadData",res)
		},"json");
}
</script>

</head>
<body>
<div id="jsLayout" style="width:800px;height:400px;">   
<table  id="dg" title="角色信息" style="width:300;height:400" >
	    <thead>
	        <tr>
	             <th data-options="field:'roleId',width:280,hidden:true">用户ID</th>
	             <th data-options="field:'roleName',width:100">名称</th>
	             <th data-options="field:'cz',width:100,align:'center',formatter:cz">操作</th>
	             <th data-options="field:'cz1',width:100,align:'center',formatter:cz1">操作</th>
	             <th data-options="field:'shezhi',width:100,align:'center',formatter:shezhi">设置</th>
	        </tr>
		</thead>
	</table>
</div>
<div id="usertb" style="padding:5px; height:auto">
	 <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search">检索</a>
	 <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" onclick="addInfo()">创建</a>
</div>
<div id="updatejs_window" class="easyui-window" title="修改用户信息" data-options="closed:true,iconCls:'icon-save'" style="width:250px;height:150px;padding:10px;">
                <table>
                    <tr>
                        <td>名称:</td>
                        <td>
                        	<input class="easyui-textbox" type="text" name="Name" id="Name" data-options="required:true"/>
                        </td>
                    </tr>
                </table>
            <div style="text-align:center;padding:5px">
                <a href="javascript:void(0)" class="easyui-linkbutton" type="button" onclick="updateRole()">保存</a>
            </div>
    </div>
	<div id="addjs_window" class="easyui-window" title="添加用户信息" data-options="closed:true,iconCls:'icon-save'" style="width:250px;height:150px;padding:10px;">
	                <table>
	                    <tr>
	                        <td>名称:</td>
	                        <td><input class="easyui-textbox" type="text" name="add_Name" id="add_Name" data-options="required:true"></input></td>
	                    </tr>
	                </table>
	            <div style="text-align:center;padding:5px">
	                <a href="javascript:void(0)" class="easyui-linkbutton" type="button" onclick="addRole()">保存</a>
	            </div>
	</div>
	<div id="diaSetRight" class="easyui-window" data-options="closed:true,iconCls:'icon-save'" style="width:250px;height:600px;padding:10px;">
		<ul id="rightTree" class="easyui-tree" checkbox="true"></ul>
	</div>
</body>
</html>