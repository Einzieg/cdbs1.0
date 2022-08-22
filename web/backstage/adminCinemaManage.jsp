<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<!-- 后台-影院管理 -->

<head>
<meta charset="UTF-8">
<title>影院管理</title>
<!-- <link href="/backstage/files/css/common.css" rel="stylesheet" type="text/css" /> -->
<link
	href="${pageContext.request.contextPath}/backstage/files/css/common.css"
	rel="stylesheet" type="text/css" />
<!-- <link href=" /backstage/files/css/bootstrap.css" rel="stylesheet" type="text/css" /> -->
<link
	href="${pageContext.request.contextPath}/backstage/files/css/bootstrap.css"
	rel="stylesheet" type="text/css" />

<link
	href="${pageContext.request.contextPath}/backstage/files/css/font-awesome.min.css"
	rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath}/backstage/files/css/cinemaHall.css"
	rel="stylesheet" type="text/css" />

<script
	src="${pageContext.request.contextPath}/backstage/files/js/jquery.js"></script>
<%--     <script src="${pageContext.request.contextPath}/backstage/files/js/bootstrap.js"></script> --%>
<%--     <script src="${pageContext.request.contextPath}/backstage/files/js/request.js"></script>--%>
<%-- <script
	src="${pageContext.request.contextPath}/backstage/files/js/adminCinemaManage.js"></script> --%>

<script
	src="${pageContext.request.contextPath}/front/js/j"
	type="text/javascript" charset="utf-8"></script>

<script
	src="${pageContext.request.contextPath}/backstage/files/js/bootstrap.js"
	type="text/javascript" charset="utf-8"></script>
</head>

<body>
	<div class="main-container">
		<div class="nav-left-container">
			<div class="nav-user-container" style="margin-bottom: 50px;">
				<img class="avatar-lg"
					src="${pageContext.request.contextPath}/backstage/files/images/defaultAvatar.jpg" />
				<p class="title">Admin</p>
			</div>
			<ul class="nav nav-pills nav-stacked">
				<li  role="presentation"><a
						href="${pageContext.request.contextPath}/backstage/adminMovieManage.jsp"><i class="icon-film"></i>
					电影管理</a></li>
				<li role="presentation"><a href="${pageContext.request.contextPath}/backstage/adminScheduleManage.jsp"><i
						class="icon-calendar"></i> 排片管理</a></li>
				<li class="active"
						role="presentation"><a href="${pageContext.request.contextPath}/backstage/adminCinemaManage.jsp"><i
						class="icon-gift"></i> 影厅管理</a></li>
				<li role="presentation"><a href="${pageContext.request.contextPath}/backstage/adminOrderManage.jsp"><i
						class="icon-cogs"></i> 订单信息</a></li>
				<li role="presentation"><a href="${pageContext.request.contextPath}/backstage/filmgrossed.jsp"><i
						class="icon-bar-chart"></i> 票房统计</a></li>
				<li role="presentation"><a href="${pageContext.request.contextPath}/backstage/adminMessage.jsp"><i
						class="icon-gift"></i> 留言板</a></li>
				<li  role="presentation"><a
						href="${pageContext.request.contextPath}/backstage/adminManage.jsp"><i
						class="icon-cogs"></i> 管理员用户管理</a></li>
				<li role="presentation"><a href="${pageContext.request.contextPath}/backstage/adminUserManage.jsp"><i
						class="icon-cogs"></i> 普通会员管理</a></li>
			</ul>
		</div>
		<div class="content-container">

			<div class="content-item">
				<span class="title gray-text">影厅管理</span>
				<button class="btn btn-primary" data-backdrop="static"
						data-target="#hallModal" data-toggle="modal" type="button" >
					<i class="icon-plus-sign"></i>新增影厅
				</button>
				<div class="content-card card" id="hall-card">
					<div class="content-body">
						<div class="table-responsive">
							<table class="table table-striped" style="table-layout: fixed">
								<thead>
								<tr>
									<th>影厅编号</th>
									<th>影厅名称</th>
									<th>影厅座位数</th>
									<th>影厅状态</th>
								</tr>
								</thead>
								<tbody id="cinemaList" style="table-layout: fixed">

								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

	<!-- 新增影厅的模态框 -->
	<div aria-labelledby="hallModalLabel" class="modal fade" id="hallModal"
		role="dialog" tabindex="-1">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button aria-label="Close" class="close" data-dismiss="modal"
						type="button">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="hallModalLabel">新增影厅</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" role="form">
						<div class="form-group">
							<label class="col-sm-2 control-label" for="hall-name-input"><span
								class="error-text">*</span>影厅名称</label>
							<div class="col-sm-10">
								<input class="form-control" id="addCinemaName"
									placeholder="请输入影厅名称" type="text">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="hall-column-input"><span
								class="error-text">*</span>影厅座数</label>
							<div class="col-sm-10">
								<input class="form-control" id="addCinemaSeat"
									placeholder="请输入影厅座位数" type="text">
							</div>
						</div>
						
					</form>
				</div>
				<div class="modal-footer">
					<button class="btn btn-default" data-dismiss="modal" type="button">取消</button>
					<button class="btn btn-primary" id="addCinema" type="submit" >确认</button>
				</div>
			</div>
		</div>
	</div>
	
	
	<!-- 模态框 -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModallabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
 
      <!-- 模态框头部 -->
      <div class="modal-header">
        <h4 class="modal-title" id="myModallabel">修改影厅信息</h4>
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
      </div>
 
      <!-- 模态框主体 -->
      <div class="modal-body">
        <form class="form-horizontal" role="form" action="" method="post">
					<div class="form-group">
						<label for="inputEmail3" class="col-sm-2 control-label">影厅编号</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" id="cinemaId" name="cinemaId" readonly="readonly"/>
						</div>
					</div>
					<div class="form-group">
						<label for="inputEmail3" class="col-sm-2 control-label">影厅名称</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" id="cinemaName" name="cinemaName" />
						</div>
					</div>
					<div class="form-group">
						<label for="inputPassword3" class="col-sm-2 control-label">影厅座数</label>
						<div class="col-sm-8">
							<input type="text" rows="5" class="form-control" id="cinemaSeat" name="cinemaSeat">
						</div>
					</div>


					<div class="form-group">
						<label for="inputPassword3" class="col-sm-2 control-label">影厅状态</label>
						<div class="col-sm-4">
							<select class="form-control" name="author" id="select1" >
								<option value="1">可用</option>
								<option value="0">不可用</option>
								
							</select>
						</div>
					</div>

				</form>
      </div>
 
      <!-- 模态框底部 -->
      
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
        <button type="button" class="btn btn-primary" id="update2" type="submit">提交更改</button>
      </div>
 
    </div>
  </div>
</div>
	<script>
	$(function(){
		//一进页面就发起ajax请求,显示所有的影厅信息
		$.get("${pageContext.request.contextPath}/AdminController",{
			"op":"queryCinemas"
		},function(result){
			//调用显示影厅的函数
			showCinema(result);
		})
		//修改按钮的点击事件
		$(document).on("click","#update",function(){
			//获取data-属性的值
			var cinemaid=$(this).data('cinemaid');
			var cinemaname=$(this).data('cinemaname');
			var cinemaseat=$(this).data('cinemaseat');
			var cinemastate=$(this).data('cinemastate');
			
			//将接收到的数据赋值给模态框上对应的位置
			$("#cinemaId").val(cinemaid);
			$("#cinemaName").val(cinemaname);
			$("#cinemaSeat").val(cinemaseat);
			//影厅状态
			$("#select1 option").each(function(){
				var state=$(this).val();
				if(state==cinemastate){
					$(this).attr("selected",true);
				}else{
					$(this).attr("selected",false);
				}
			})
			
		})
		//修改影厅提交按钮点击事件
		$("#update2").click(function(){
			var cinema={
				cinemaId:$("#cinemaId").val(),
				cinemaName:$("#cinemaName").val(),
				cinemaSeat:$("#cinemaSeat").val(),
				cinemaState:$("#select1").val()
			};
			if($("#cinemaName").val() !="" && $("#cinemaSeat").val() !="" ){
				$.get("${pageContext.request.contextPath}/AdminController",{
					"op":"updateCinema",
					"cinema":JSON.stringify(cinema)
					},function(result){
					if(result){
						alert("修改成功!");
						//关闭模态框
						$("#myModal").modal('hide');
						//刷新数据->查询
						$.get("${pageContext.request.contextPath}/AdminController",{
							"op":"queryCinemas",
						},function(result){
							//显示数据在tbody中,写成一个方法
							showCinema(result);
						},"json");	
					}
				},"json");
			}
		})
		//增加影厅按钮的点击事件
		$("#addCinema").click(function(){
			if($("#addCinemaName").val() !="" && $("#addCinemaSeat").val() !=""){
				 $.get("${pageContext.request.contextPath}/AdminController",{
					 "op":"addCinema",
					 "cinemaName":$("#addCinemaName").val(),
					 "cinemaSeat":$("#addCinemaSeat").val()
					 },function(result){
					 if(result){
						 alert("增加成功!");
						 //关闭模态框
						 $("#hallModal").modal('hide');
						 $.get("${pageContext.request.contextPath}/AdminController",{
							"op":"queryCinemas",
						},function(result){
							//显示数据在tbody中,写成一个方法
							showCinema(result);
						},"json");	
					 }
				 },"json")
			}
		})
	})

	
	//显示所有影厅的函数
	function showCinema(result){
		$("#cinemaList").empty();
		$.each(result,function(i,cinema){
			var state="";
			if(cinema.cinemaState==1){
				state="可用";
			}else{
				state="不可用";
			}
			$("#cinemaList").append("<tr>\r\n" + 
					"				<th>"+cinema.cinemaId+"</th>\r\n" + 
					"				<th>"+cinema.cinemaName+"</th>\r\n" + 
					"				<th>"+cinema.cinemaSeat+"</th>\r\n" + 
					"				<th>"+state+"</th>\r\n" + 
					"				<th>\r\n" + 
					"				<button class=\'btn btn-warning btn-sm\' id=\'update\' data-toggle=\'modal\' data-target=\'#myModal\' "+
					"				data-cinemaid="+cinema.cinemaId+" data-cinemaname="+cinema.cinemaName+" "+
					"				data-cinemaseat="+cinema.cinemaSeat+" data-cinemastate="+cinema.cinemaState+" "+
					"				>修改</button>&nbsp;&nbsp;\r\n" + 
					"				</th>\r\n" + 
					"			</tr>")
		})
	}
	</script>
</body>

</html>