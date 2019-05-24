<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>CRM管理系统</title>
<link rel="stylesheet" type="text/css" href="js/easyui/insdep.easyui.min.css">
<link rel="stylesheet" type="text/css" href="js/easyui/icon.css">
<script type="text/javascript" src="js/easyui/jquery.min.js"></script>
<script type="text/javascript" src="js/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript"src="js/easyui/insdep.extend.min.js"></script>
<script type="text/javascript"src="js/easyui/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">
	$(function(){
		if("${role}"=="4"){
			$.post("/CRMManage/user/userSignInCheckState",{
				userName:"${user.userName}"
				},function (res){
					if(res==2){
						$("#userSignIn").text("签到");   
					}else{
						$("#userSignIn").text("已签到").removeAttr("href"); 
					} 
				},"json");
		}
		$('#treeNode').tree({
		    url:'module?userId=${user.userId}',
		    method:'get',
		    onClick:function(node){
		    	/* console.log(node) */
		    	 var flag = $("#tab_Module").tabs('exists', node.text);
		    	 var isLeaf = $('#treeNode').tree('isLeaf',node.target);
		    	  if (isLeaf) { 
	                    if(!flag) {
	                        $('#tab_Module').tabs('add', {  
	                            title: node.text,   
	                            closable: true,
	                            content: "<iframe style='width:100%;height:100%;'  src='"+node.attributes.url+".jsp'/>"    //此处做了调整，推荐使用iframe的方式实现
	                       });
	                    } else {
	                        $("#tab_Module").tabs('select', node.text);  
	                 }
	            }  
		    }
		});
		
	});
	function updatePassword() {
		var pwd = $("#passWord").val();
		var newpwd = $("#newPassWord").val();
		var confirmpwd = $("#newPassWord").val();
		if(pwd==""||newpwd==""||confirmpwd==""){
			return;
		}
		if(pwd!=confirmpwd){
			alert("确认密码不一致");
			return;
		}
	} 
	function signIn() {
		$.post("/CRMManage/user/userSignIn",{
			askerId:"${user.userId}",
			askerName:"${user.userName}",
			checkState:1
			},function (res){
				if(res){
					alert("签到成功");
					$("#userSignIn").text("已签到").removeAttr("href");
				} 
			},"json");
	}
</script>
</head>
<body class="easyui-layout">
	<!-- 头部 -->
	 <div data-options="region:'north',tools:'#indexTools',title:'CRM管理系统'," style="height:100px;background: url('img/bg_header_2.jpg');">
	 </div>
	 <div id="indexTools">
	 <strong class="easyui-tooltip" title="2条未读消息">${user.userName}，欢迎您！</strong>
	 	<a href="#" onclick="$('#win').window('open')" style="width:50px">修改密码</a>
	 	<c:if test="${role==4}">
	 		<a id="userSignIn" style="width:45px" href="javascript:signIn()">签到</a>
	 	</c:if>
	 	
	    |<a style="width:50px" href="#">安全退出</a> 
	   </div>
    <!--树状菜单 -->
    <div data-options="region:'west',title:'导航菜单',split:true" style="width:200px;">
    	<div class="easyui-accordion" data-options="border:false,fit:true"> 
        	<div title="快捷菜单" data-options="iconCls:'icon-application-cascade'" style="padding:5px;">  	
    			<ul class="easyui-tree" id="treeNode"></ul>
            </div>
        </div>
    </div>
    <div data-options="region:'center'" style="padding:5px;background:#eee;">
    	<div id="tab_Module" class="easyui-tabs" data-options="border:false,fit:true"></div>
    </div>
      
    <div id="win" class="easyui-window" title="密码修改" style="width:250px;height:200px"   
        data-options="iconCls:'icon-save',modal:true,closed:true">   
		    <div>   
		        <label for="passWord">原密码:</label>   
		        <input class="easyui-validatebox" type="password" name="passWord" id="passWord" data-options="required:true" />   
		    </div>   
		    <div>   
		        <label for="newPassWord">新密码:</label>   
		        <input class="easyui-validatebox" type="password" name="newPassWord" id="newPassWord" data-options="required:true" />   
		    </div>
		    <div>   
		        <label for="confirmPassWrod">确认密码:</label>   
		        <input class="easyui-validatebox" type="password" name="confirmPassWrod" id="confirmPassWrod" data-options="required:true" />   
		    </div>   
			<a id="btn" href="javascript:updatePassword()" class="easyui-linkbutton" data-options="iconCls:'icon-save'">保存</a> 
	</div>
</body>
</html>