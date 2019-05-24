<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>分量设置</title>
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
    	url:"/CRMManage/directorAskersSelect",  //数据接口的地址
        method:'post',
        singleSelect:true,
        columns:[[    
            {field:'askerId',title:'编号',width:100},    
            {field:'askerName',title:'咨询师名称',width:100},    
            {field:'weight',title:'权重',width:100},    
            {field:'bakContent',title:'备注',width:100},
            {field:'gu',title:'工具',width:100,formatter:function(value,row,index){return "<a href='javascript:openupdate("+index+")'>编辑</a>";}}
        ]] 
   })
}
	 function openupdate(index){
		 var row = $("#dg").datagrid("getRows");
		 $('#ff').form('load',row[index]);
		 $('#win').window('open');
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
	<div id="win" class="easyui-window" title="编辑"    
        data-options="iconCls:'icon-save',modal:true,closed:true">
    <form id="ff">
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
	<table id="dg"></table>
</body>
</html>