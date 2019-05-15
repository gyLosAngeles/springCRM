<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>模块管理</title>
<link rel="stylesheet" type="text/css" href="/CRMManage/js/easyui demo/easyui/1.3.4/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="/CRMManage/js/easyui demo/css/wu.css" />
<link rel="stylesheet" type="text/css" href="/CRMManage/js/easyui demo/css/icon.css" />
<script type="text/javascript" src="/CRMManage/js/easyui demo/js/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="/CRMManage/js/easyui demo/easyui/1.3.4/jquery.easyui.min.js"></script>
<script type="text/javascript" src="/CRMManage/js/easyui demo/easyui/1.3.4/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">
$(function(){
     $('#menuTree').tree({
        url: '../moduleSelectAll',
        method: 'post',
        animate: true,
        onContextMenu:function(e,node){
			e.preventDefault;
			$("#menuTree").tree('select',node.target);
			$('#mm').menu('show',{
				left:e.pageX,
				top:e.pageY
			});
			 e.preventDefault();
		}
    });
});
function menuHandler(item){
	if(item.name=='add'){
		 $("#adduser_window").window("open");
	}else if(item.name=='edit'){
		reloadModules();
	}else if(item.name=='del'){
		var row = $("#menuTree").tree("getSelected");
		alert(row.id);
		return;
		$.messager.confirm("确认","你确认要删除模块吗？",function(r){
    		if(r){
	    		$.post("../moduleRemove",{
	    			moduleId:row.id
			},function (res){
				if(res){
					alert("成功");
					 $("#menuTree").tree("reload");
				}else{
					alert("失败");
				}
			},"json") 
    		}
		});
	}
}
var parentId;
function reloadModules(){
	
}
function updateModules(){
	var row = $("#menuTree").tree("getSelected");
	var weight=$("#weight").val();
	var url=$("#url").val();
	var name=$("#name").val();
	$.ajax({
		method:'post',
		url:'http://stuapi.ysd3g.com/api/UpdateModule',
		dataType:'json',
		data:{
			moduleId:row.id,
			parentId:parentId,
			moduleWeight:weight,
			moduleUrl:url,
			moduleName:name
		},
		success:function(res){
			if(res){
				$("#menuTree").tree("reload");
				$.messager.alert("提示信息","OK");
			}
		}
	});
}
function addSim(){
	var row = $("#menuTree").tree("getSelected");
	var weight=$("#add_weight").val();
	var url=$("#add_url").val();
	var name=$("#add_name").val();
	$.ajax({
		method:'post',
		url:'../moduleAdd',
		dataType:'json',
		data:{
			parentId: row.id,
			moduleWeight:weight,
			moduleUrl:url,
			moduleName:name
		},
		success:function(res){
			if(res.success){
				$("#menuTree").tree("reload");
				$.messager.alert("提示信息","OK");
			}
		}
	});
}
</script>
</head>
<body>
<div id="" style="color: red;font-size: 13px;">
		 	提示：右击节点进行操作
    </div>
    
        <div data-options="region:'west',split:true" title="导航应用" style="width:100%;">
           <div id="menuTree" ><!--这个地方显示树状结构--></div>
        </div>
    <div id="mm" class="easyui-menu" data-options = "onClick:menuHandler" style="width: 160px;">
    	<div data-options = "iconCls:'icon-add',name:'add'">追加</div>
    	<div data-options = "iconCls:'icon-edit',name:'edit'">修改</div>
    	<div data-options = "iconCls:'icon-remove',name:'del'">删除</div>
    </div>
	<div id="adduser_window" class="easyui-window" title="添加员工信息" data-options="closed:true,iconCls:'icon-save'" style="width:500px;height:300px;padding:10px;">
         <form id="updateuserForm">
                <table>
                    <tr>
                        <td>权重:</td>
                        <td><input class="easyui-textbox" type="text" name="add_weight" id="add_weight" data-options="required:true"></input></td>
                    </tr>
                    <tr>
                        <td>url:</td>
                        <td><input class="easyui-textbox" type="text" id="add_url" name="add_url" data-options="required:true"></input></td>
                    </tr>
                    <tr>
                        <td>模块名称:</td>
                        <td><input class="easyui-textbox" type="text" name="add_name" id="add_name" data-options="required:true"></input></td>
                    </tr>
                </table>
         </form>
            <div style="text-align:center;padding:5px">
                <a href="javascript:void(0)" class="easyui-linkbutton" type="button" onclick="addSim()">保存</a>
            </div>
    </div>
</body>
</html>