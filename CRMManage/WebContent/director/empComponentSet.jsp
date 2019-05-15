<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>分量设置</title>
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
    	url:"/CRMManage/directorSignInSelect",  //数据接口的地址
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
</script>
</head>
<body>
	
	
</body>
</html>