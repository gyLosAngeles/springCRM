<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>CRM管理系统</title>
<link rel="stylesheet" type="text/css" href="js/easyui demo/easyui/1.3.4/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="js/easyui demo/css/wu.css" />
<link rel="stylesheet" type="text/css" href="js/easyui demo/css/icon.css" />
<script type="text/javascript" src="js/easyui demo/js/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="js/easyui demo/easyui/1.3.4/jquery.easyui.min.js"></script>
<script type="text/javascript" src="js/easyui demo/easyui/1.3.4/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">
	$(function(){
		$('#treeNode').tree({    
		    url:'module?roleId=1',
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
	                            content: "<iframe style='width:100%;height:600px;'  src='conservator/"+node.attributes.url+".jsp'/>"    //此处做了调整，推荐使用iframe的方式实现
	                       });
	                    } else {
	                        $("#tab_Module").tabs('select', node.text);  
	                    }
	            }  
		    }
		}); 	
	});
	
</script>
</head>
<body class="easyui-layout">
	<!-- 头部 -->
	<div class="wu-header" data-options="region:'north',border:false,split:true">
    	<div class="wu-header-left">
        	<h1>CRM管理系统</h1>
        </div>
        <div class="wu-header-right">
        	<p><strong class="easyui-tooltip" title="2条未读消息">admin</strong>，欢迎您！</p>
            <p><a href="#">支持论坛</a>|<a href="#">帮助中心</a>|<a href="#">安全退出</a></p>
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
     
</body>
</html>