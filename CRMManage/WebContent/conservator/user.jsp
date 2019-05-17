<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>用户管理</title>
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
    	url:"/CRMManage/userSelect",  //数据接口的地址
        queryParams: { //要发送的参数列表
        	userName:$("#Name").val(),
        	userCreateTimeBigin:$("#userCreateTimeBigin").val(),
        	userCreateTimeEnd:$("#userCreateTimeEnd").val(),
        	userIsLockout:$("#userIsLockout").val(),
        },
        method:'post',
        singleSelect:true,
        pagination:true,
        toolbar:'#usertb'
   })
}
function addUser(){
	$.post("/CRMManage/userInsert",{
		userName:$("#add_loginName").val(),
		userPassWord:$("#add_pwd").val(),
		userTelephone:$("#add_mtel").val(),
		userEmail:$("#add_email").val()
		},function (res){
			if(res){
				alert("添加成功");
				$("#dg").datagrid("reload");
				$("#adduser_window").window("close");
			}else{
				alert("用户名重复");
			}
		},"json")
}
function openupdate(index) {
	var row=$("#dg").datagrid("getRows");
	/* console.log(row[index]) */
	$('#updateuserForm').form('load',row[index]); 
	$("#updateuser_window").window("open");
}
function updateUser() {
	$.post("/CRMManage/userUpdate",{
		userEmail:$("#userEmail").val(),
		userTelephone:$("#userTelephone").val(),
		userName:$("#userName").val()
	},function (res){ 
		if(res){
			alert("修改成功");
			$("#dg").datagrid("reload");
			$("#updateuser_window").window("close");
		}else{
			alert("修改失败");
		}
	},"json")
}
function deleteUser(index) {
	var row=$("#dg").datagrid("getRows");
	$.messager.confirm("确认","你确认要删除用户吗？",function(r){
		if(r){
    		$.post("/CRMManage/userDelete",{
    		userName:row[index].userName
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
function Lockout(index,value){
	var row=$("#dg").datagrid("getRows");
	var lo = value==2?'解锁':'锁定';
	$.messager.confirm("确认","你确认要"+lo+"用户吗？",function(r){
		if(r){
    		$.post("/CRMManage/userIsLockout",{
    			userIsLockout:value,
    			userName:row[index].userName
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
function refreshPwd(index) {
	var row=$("#dg").datagrid("getRows");
	$.messager.confirm("确认","你确认要重置密码吗？",function(r){
		if(r){
    		$.post("/CRMManage/userRefreshPassWord",{
    			userName:row[index].userName
		},function (res){
			if(res){
				alert("重置成功");
				$("#dg").datagrid("reload");
			}else{
				alert("重置失败");
			}
		},"json") 
		}
	});
}
/* 角色设置 */
  var UserId;
function shezhi(index){
	var rows=$("#dg").datagrid("getRows");
	var row=rows[index];
	UserId = row.userId;
	$("#allJs").datagrid({ 
    	url: '/CRMManage/UserRoleAllSelect', 
        method:'post',
        singleSelect:true
   });
    $("#thisJs").datagrid({ 
    	url: '/CRMManage/UserRoleSelect',  //数据接口的地址
        queryParams: { //要发送的参数列表
           userId:row.userId
        },
        method:'post',
        singleSelect:true
   });
   $("#szuser_window").window("open");
}
function addUserRole(){
	var row= $("#allJs").datagrid("getSelected");
	 $.post("/CRMManage/UserRoleInsert",{
			userId:UserId,
			roleId:row.roleId
		},function (res){
			if(res){
				$("#thisJs").datagrid("reload");
			}else{
				alert("失败");
			}
	},"json")
}
function removeUserRole() {
	var row= $("#thisJs").datagrid("getSelected");
	 $.post("/CRMManage/UserRoleDelete",{
			userId:UserId,
			roleId:row.roleId
		},function (res){
			if(res){
				$("#thisJs").datagrid("reload");
			}else{
				alert("失败");
			}
	},"json")
}
function cz(value,row,index){
	return "<a href='javascript:openupdate("+index+")'>编辑</a>"+"&ensp;"+"<a href='javascript:deleteUser("+index+")'>删除</a>";
}
function js(value,row,index){
	return "<a href='javascript:shezhi("+index+")'>设置</a>";
}
function cz2(value,row,index){
	return "<a href='javascript:refreshPwd("+index+")'>重置密码</a>";
}
function cz3(value,row,index){
	return "<a href='javascript:Lockout("+index+",1)'>锁定用户</a>"+"&ensp;"+"<a href='javascript:Lockout("+index+",2)'>解锁用户</a>";
} 
</script>

</head>
<body>
<div id="usertb" style="padding:5px; height:auto">
    <div style="margin-bottom:5px" title="用户信息">
    	<form id="ff" method="post">   
		    <div>
		    	 
		                        用户名:   <input class="easyui-validatebox" type="text" id="Name"   data-options="required:true" />   
				起止时时间:<input class="easyui-datebox" type="text"  id="userCreateTimeBigin" required="required" />-   
		    		    <input class="easyui-datebox" type="text" id="userCreateTimeEnd"  required="required" />
		    	是否锁定:	<select id="userIsLockout" class="easyui-combobox" name="dept">   
						    <option value="">请选择</option>   
						    <option value="1">是</option>   
						    <option value="2">否</option>   
						</select>
				排序:	<select id="ord" class="easyui-combobox" name="orderBy" style="height:auto;">
					    <option value="">请选择</option>
					    <option value="CreateTime">创建时间</option>
					    <option value="LastLoginTime">最后登录时间</option>
					</select>
					 <a href="javascript:init()" class="easyui-linkbutton" iconCls="icon-search">查找</a>
			  		 <a onclick="$('#adduser_window').window('open')" class="easyui-linkbutton" iconCls="icon-add" >创建</a>
		   	 </div>
    	</form> 
    </div>
</div>
<table id="dg" title="用户列表" style="width:300;height:400">
    <thead>
        <tr>
             <th data-options="field:'userId',width:280,hidden:true">用户ID</th>
             <th data-options="field:'userName',width:100">用户名</th>
             <th data-options="field:'userEmail',width:100">邮箱</th>
             <th data-options="field:'userTelephone',width:100">手机号</th>
             <th data-options="field:'userIsLockout',width:100,formatter:function(value,row,index){return value==1?'是':'否';}">是否锁定</th>
             <th data-options="field:'userCreateTime',width:160">创建时间</th>
             <th data-options="field:'userLastLoginTime',width:160">最后登录的时间</th>
             <th data-options="field:'roleName',width:160,formatter:js">角色</th>
             <th data-options="field:'caozuo',width:160,formatter:cz">操作</th>
             <th data-options="field:'caozuo1',width:160,formatter:cz2">操作</th>
             <th data-options="field:'Usercaozuo',width:160,formatter:cz3">用户操作</th> 
        </tr>
    </thead>
</table>
<!--添加用户  -->
<div id="adduser_window" class="easyui-window" title="添加用户信息" data-options="closed:true,iconCls:'icon-save'" style="width:300px;height:300px;padding:10px;">
         <form>
                <table>
                    <tr>
                        <td>登陆名:</td>
                        <td><input class="easyui-textbox" type="text" name="add_loginName" id="add_loginName" data-options="required:true"></input></td>
                    </tr>
                    <tr>
                        <td>密码:</td>
                        <td><input class="easyui-textbox" type="text" name="add_pwd" id="add_pwd" data-options="required:true"></input></td>
                    </tr>
                    <tr>
                        <td>邮箱:</td>
                        <td><input class="easyui-textbox" type="text" id="add_email" name="add_email" data-options="required:true"></input></td>
                    </tr>
                    <tr>
                        <td>手机号码:</td>
                        <td><input class="easyui-textbox" type="text" name="add_mtel" id="add_mtel" data-options="required:true"></input></td>
                    </tr>
                </table>
         </form>
            <div style="text-align:center;padding:5px">
                <a href="javascript:void(0)" class="easyui-linkbutton" type="button" onclick="addUser()">保存</a>
            </div>
    </div>
    <!-- 修改用户 -->
    <div id="updateuser_window" class="easyui-window" title="编辑用户信息" data-options="closed:true,iconCls:'icon-save'" style="width:300px;height:300px;padding:10px;">
         <form id="updateuserForm">
                <table>
                    <tr>
                        <td>登陆名:</td>
                        <td><input class="easyui-textbox" type="text" name="userName" id="userName" data-options="required:true"></input></td>
                    </tr>
                    <tr>
                        <td>邮箱:</td>
                        <td><input class="easyui-textbox" type="text" id="userEmail" name="userEmail" data-options="required:true"></input></td>
                    </tr>
                    <tr>
                        <td>手机号码:</td>
                        <td><input class="easyui-textbox" type="text" name="userTelephone" id="userTelephone" data-options="required:true"></input></td>
                    </tr>
                </table>
         </form>
         <div style="text-align:center;padding:5px">
             <a href="javascript:void(0)" class="easyui-linkbutton" type="button" onclick="updateUser()">修改</a>
         </div>
    </div>
    <div id="szuser_window" class="easyui-window" title="设置用户信息" data-options="closed:true" style="width:400px;height:600px;padding:10px;">
		<table style="width: 100%; height: 250px;">
				<tr>
					<td style="width: 40%;">
						<table id="allJs" title="系统所有角色" >
						    <thead>
						        <tr>
						             <th data-options="field:'roleId',width:280,hidden:true">ID</th>
						             <th data-options="field:'roleName',width:100">名称</th>
						        </tr>
						    </thead>
						</table>
					</td>
					<td style="width:20%;">
						<a href="javascript:addUserRole()" class="easyui-linkbutton" style="width: 50%;">>></a><br />
						<a href="javascript:removeUserRole()" class="easyui-linkbutton" style="width: 50%;"><<</a>
					</td>
					<td style="width: 40%;">
						<table id="thisJs" title="当前用户所有角色" >
						    <thead>
						        <tr>
						             <th data-options="field:'roleId',width:280,hidden:true">ID</th>
						             <th data-options="field:'roleName',width:100">名称</th>
						        </tr>
						    </thead>
						</table>
					</td>
				</tr>
		</table>
    </div>
    
</body>
</html>