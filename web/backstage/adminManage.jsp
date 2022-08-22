<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<!-- 后台-电影管理(上架,进入修改页) -->

<head>
    <meta charset="UTF-8">
    <title>电影管理</title>
    <!-- 引入css样式文件 -->
    <link href="${pageContext.request.contextPath}/backstage/files/css/common.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/backstage/files/css/movieList.css" rel="stylesheet" type="text/css" />
    <!-- Bootstrap 核心 CSS 文件 -->
    <link href="${pageContext.request.contextPath}/backstage/files/css/bootstrap.css" rel="stylesheet" type="text/css" />
    <!-- font-asesome图标库 -->
    <link href="${pageContext.request.contextPath}/backstage/files/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
	

    <!-- 引入js脚本文件 -->
    <!-- jquery -->
   <!--  <script src="/backstage/files/js/jquery.js"></script>
    Bootstrap 核心 JavaScript 文件
    <script src="/backstage/files/js/bootstrap.js"></script>
    <script src="/backstage/files/js/request.js"></script>
    <script src="/backstage/files/js/adminMovieManage.js"></script> -->
	
	
	
	<script
	src="${pageContext.request.contextPath}/front/js/jquery-3.6.0.js"
	type="text/javascript" charset="utf-8"></script>
	
	<script
	src="${pageContext.request.contextPath}/backstage/files/js/bootstrap.js"
	type="text/javascript" charset="utf-8"></script>

	<script>
	
	var key="";//全局变量用户名关键字
	$(function(){
		//界面一进来就发起ajax请求文章列表
		$.get("${pageContext.request.contextPath}/AdminController",{"op":"queryAdmins"},function(result){
				//显示数据在tdody中,写成一个方法,以后就不用在拼接
				showData(result);
			},"json");
	
		//搜索按钮的模糊查询
		$("#searchBtn").click(function(){
			//1.获取用户输入的关键字
			key=$("#keyword").val();
			//发送ajax请求 首页
			$.get("${pageContext.request.contextPath}/AdminController",{
				"op":"userQueryAjxa",
				"pageNo":"1",
				"pageSize":"5",
				"titlekey":key
			},function(result){
				//显示数据在tbody中,写成一个方法
				showData(result);
			},"json");	
		});
		//清除按钮
		$("#clearBtn").click(function(){
			key="";
			$("#keyword").val(key);
		});
		$(document).on("click","#updateBtn",function(){
			//1.获取data-属性的值
			var adminid=$(this).data('adminid');
			var adminname=$(this).data('adminname');
			var adminpassword=$(this).data('adminpassword');
			var adminstate=$(this).data('adminstate');
			
			//2.将获取到的值放到指定位置上
			$("#adminId").val(adminid);
			$("#adminName").val(adminname);
			$("#adminPassword").val(adminpassword);
			$("#select1 option").each(function(){
				var name=$(this).val();
				if(name==adminstate){
					console.log(name);
					$(this).attr("selected",true);
				}else{
					$(this).attr("selected",false);
				}
			})
		});
		//增加管理员按钮的点击事件
		$("#addAdmin").click(function(){
			if($("#addAdminName").val() !="" && $("#addAdminPassword").val() !=""){
				$.get("${pageContext.request.contextPath}/AdminController",{
					 "op":"addAdmin",
					 "adminName":$("#addAdminName").val(),
					 "adminPassword":$("#addAdminPassword").val()
					 },function(result){
					 if(result){
						 alert("增加成功!");
						 //关闭模态框
						 $("#hallModal").modal('hide');
						 $.get("${pageContext.request.contextPath}/AdminController",{
							"op":"queryAdmins"
						},function(result){
							//显示数据在tbody中,写成一个方法
							showData(result);
						},"json");	
					 }
				 },"json")
			}
			 
		})
		//修改管理员的点击事件
		$("#update2").click(function(){
			var admin={
				adminId:$("#adminId").val(),
				adminName:$("#adminName").val(),
				adminPassword:$("#adminPassword").val(),
				adminState:$("#select1").val()
			};
			if($("#adminName").val() !="" && $("#adminPassword").val() != ""){
				$.get("${pageContext.request.contextPath}/AdminController",{
					"op":"updateAdmin",
					"admin":JSON.stringify(admin),
					},function(result){
					if(result){
						alert("修改成功!");
						//关闭模态框
						$("#myModal").modal('hide');
							//显示数据在tbody中,写成一个方法
						$.get("${pageContext.request.contextPath}/AdminController",{"op":"queryAdmins"},function(result){
							//显示数据在tdody中,写成一个方法,以后就不用在拼接
							showData(result);
						},"json");
					}
				},"json");
			}
			
		})
		
	})
	
	//显示数据
	function showData(result){
		//每一次遍历之前需要清空
		  $("#articleList").empty();
		$("#showPageInfo").empty();
		$("#pageItem").empty();  
		//显示用户列表数据
		$.each(result,function(index,admin){
			var state="";
			if(admin.adminState==1){
				state="在职";
			}else{
				state="离职";
			}
			$("#articleList").append("<tr>\r\n" + 
		    		"				    <td>"+admin.adminId+"</td>\r\n" + 
		    		"				    <td>"+admin.adminName+"</td>\r\n" + 
		    		"				    <td>"+admin.adminPassword+"</td>\r\n" + 
		    		"				    <td>"+state+"</td>\r\n" + 
		    		"				    <td>\r\n" + 
		    		"				    <button class=\'btn btn-warning btn-sm\' id=\'updateBtn\' data-toggle=\'modal\' data-target=\'#myModal\' "+
		    		"					data-adminid="+admin.adminId+" data-adminname="+admin.adminName+" "+
					"					data-adminpassword="+admin.adminPassword+" data-adminstate="+admin.adminState+">修改</button>&nbsp;&nbsp;\r\n" + 
		    		"				</tr>");
		});																
	}
	</script>
</head>

<body>
    <div class="main-container">
        <div class="nav-left-container">
            <div class="nav-user-container" style="margin-bottom: 50px;">
                <img class="avatar-lg" src="${pageContext.request.contextPath}/backstage/files/images/defaultAvatar.jpg" />
                <p class="title">Admin</p>
            </div>
			<ul class="nav nav-pills nav-stacked">
				<li  role="presentation"><a
						href="${pageContext.request.contextPath}/backstage/adminMovieManage.jsp"><i class="icon-film"></i>
					电影管理</a></li>
				<li role="presentation"><a href="${pageContext.request.contextPath}/backstage/adminScheduleManage.jsp"><i
						class="icon-calendar"></i> 排片管理</a></li>
				<li
					role="presentation"><a href="${pageContext.request.contextPath}/backstage/adminCinemaManage.jsp"><i
						class="icon-gift"></i> 影厅管理</a></li>
				<li role="presentation"><a href="${pageContext.request.contextPath}/backstage/adminOrderManage.jsp"><i
						class="icon-cogs"></i> 订单信息</a></li>
				<li role="presentation"><a href="${pageContext.request.contextPath}/backstage/filmgrossed.jsp"><i
						class="icon-bar-chart"></i> 票房统计</a></li>
				<li role="presentation"><a href="${pageContext.request.contextPath}/backstage/adminMessage.jsp"><i
						class="icon-gift"></i> 留言板</a></li>
				<li class="active" role="presentation"><a
						href="${pageContext.request.contextPath}/backstage/adminManage.jsp"><i
						class="icon-cogs"></i> 管理员用户管理</a></li>
				<li role="presentation"><a href="${pageContext.request.contextPath}/backstage/adminUserManage.jsp"><i class="icon-cogs"></i> 普通会员管理</a></li>
			</ul>
        </div>
        <div class="content-container">
            <div class="content-header">
                <span class="title gray-text">管理员列表</span>
                <form class="navbar-form navbar-right">
					<input type="text" class="form-control" placeholder="搜索标题..."id="keyword">
					<input type="button" class="form-control"value="搜索" id="searchBtn">
					<input type="button" class="form-control"value="清除" id="clearBtn">
				</form>
            </div>
           <div class="table-responsive">
           <button class="btn btn-primary" data-backdrop="static"
					data-target="#hallModal" data-toggle="modal" type="button" >
					<i class="icon-plus-sign"></i>新增管理员
				</button>
					<table class="table table-striped">
						<thead>
							<tr>
								<th>管理员编号</th>
								<th>管理员姓名</th>
								<th>管理员密码</th>
								<th>管理员状态</th>
							</tr>
							
						</thead>
						<tbody id="articleList">
						

					
						</tbody>
					</table>
					<!-- 分页信息 -->
					<div id="showPageInfo"></div>
					<nav aria-label="Page navigation">
					<div class="col-md-12 text-center">
					<ul class="pagination pagination-lg" id="pageItem">
						</ul>
					</div>
					</nav>
						
				</div>
        </div>
    </div>
    <!-- 模态框 -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModallabel" aria-hidden="true" >
  <div class="modal-dialog">
    <div class="modal-content">
 
      <!-- 模态框头部 -->
      <div class="modal-header">
        <h4 class="modal-title" id="myModallabel">修改管理员信息</h4>
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
      </div>
 
      <!-- 模态框主体 -->
      <div class="modal-body">
        <form class="form-horizontal" role="form" action="" method="post">
					<div class="form-group">
						<label for="inputEmail3" class="col-sm-2 control-label">管理员编号</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" id="adminId" name="adminId" readonly="readonly"/>
						</div>
					</div>
					<div class="form-group">
						<label for="inputEmail3" class="col-sm-2 control-label">管理员姓名</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" id="adminName" name="adminName" />
						</div>
					</div>
					<div class="form-group">
						<label for="inputPassword3" class="col-sm-2 control-label">管理员密码</label>
						<div class="col-sm-8">
							<input type="password" class="form-control" id="adminPassword" name="adminPassword" />
						</div>
					</div>
					<div class="form-group">
						<label for="inputPassword3" class="col-sm-2 control-label">管理员状态</label>
						<div class="col-sm-4">
							<select class="form-control" name="author" id="select1" >
								<option value="1">在职</option>
								<option value="0">离职</option>
								
							</select>
						</div>
					</div>
					</div>

				</form>
      </div>
 
      <!-- 模态框底部 -->
      <div class="modal-footer" >
        <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
        <button type="button" class="btn btn-primary" id="update2" type="submit" >提交更改</button>
      </div>
 
    </div>
  </div>
</div>
<!-- 新增管理员的模态框 -->
	<div aria-labelledby="hallModalLabel" class="modal fade" id="hallModal"
		role="dialog" tabindex="-1">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button aria-label="Close" class="close" data-dismiss="modal"
						type="button">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="hallModalLabel">新增管理员</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" role="form">
						<div class="form-group">
							<label class="col-sm-3 control-label" for="hall-name-input"><span
								class="error-text">*</span>管理员名称</label>
							<div class="col-sm-8">
								<input class="form-control" id="addAdminName"
									placeholder="请输入管理员名称" type="text">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label" for="hall-column-input"><span
								class="error-text">*</span>管理员密码</label>
							<div class="col-sm-8">
								<input class="form-control" id="addAdminPassword"
									placeholder="请输入管理员密码" type="text">
							</div>
						</div>
						
					</form>
				</div>
				<div class="modal-footer">
					<button class="btn btn-default" data-dismiss="modal" type="button">取消</button>
					<button class="btn btn-primary" id="addAdmin" type="submit" >确认</button>
				</div>
			</div>
		</div>
	</div>
</body>

</html>