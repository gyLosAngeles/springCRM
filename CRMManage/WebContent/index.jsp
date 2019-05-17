<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>CRM管理系统</title>
<link rel="stylesheet" type="text/css" href="/CRMManage/js/easyui demo/easyui/1.3.4/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="/CRMManage/js/easyui demo/css/wu.css" />
<link rel="stylesheet" type="text/css" href="/CRMManage/js/easyui demo/css/icon.css" />
<script type="text/javascript" src="/CRMManage/js/easyui demo/js/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="/CRMManage/js/easyui demo/easyui/1.3.4/jquery.easyui.min.js"></script>
<script type="text/javascript" src="/CRMManage/js/easyui demo/easyui/1.3.4/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">
	$(function(){
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
	                            content: "<iframe style='width:100%;height:600px;'  src='"+node.attributes.url+".jsp'/>"    //此处做了调整，推荐使用iframe的方式实现
	                       });
	                    } else {
	                        $("#tab_Module").tabs('select', node.text);  
	                 }
	            }  
		    }
		});
		$.post("/CRMManage/user/userSignInCheckState",{
			userName:"${user.userName}"
			},function (res){
				if(res==2){
					$("#userSignIn").text("签到");   
				}else{
					$("#userSignIn").text("已签到").removeAttr("href"); 
				} 
			},"json")
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
			userName:"${user.userName}",
			CheckState:1
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
	<div class="wu-header" data-options="region:'north',border:false,split:true">
    	<div class="wu-header-left">
        	<h1>CRM管理系统</h1>
        </div>
        <div class="wu-header-right">
        	<p><strong class="easyui-tooltip" title="2条未读消息">${user.userName}</strong>，欢迎您！</p>
            <p><a onclick="$('#win').window('open')">修改密码</a>|<a id="userSignIn" href="javascript:signIn()">签到</a>|<a href="#">安全退出</a></p>
        </div>
    </div>
    <!--树状菜单 -->
	<div class="wu-sidebar" data-options="region:'west',split:true,border:true,title:'导航菜单'"> 
    	<div class="easyui-accordion" data-options="border:false,fit:true"> 
        	<div title="快捷菜单" data-options="iconCls:'icon-application-cascade'" style="padding:5px;">  	
    			<ul class="easyui-tree" id="treeNode"></ul>
            </div>
        </div>
    </div>	
    
    <!-- 选项卡-->
    <div class="wu-main" data-options="region:'center'">
        <div id="tab_Module" class="easyui-tabs" data-options="border:false,fit:true"></div>
    </div>
     <!-- 底部 -->
	<div class="wu-footer" data-options="region:'south',border:true,split:true">
    	&copy; 2013 Wu All Rights Reserved  
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