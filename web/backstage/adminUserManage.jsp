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
		$.get("${pageContext.request.contextPath}/AdminController",{"op":"userQueryAjxa"},function(result){
				//显示数据在tdody中,写成一个方法,以后就不用在拼接
				showData(result);
			},"json");
	
		 //点击首页跳转
		$(document).on("click",".first",function(){
			//发送ajax请求 首页
			$.get("${pageContext.request.contextPath}/AdminController",{
				"op":"userQueryAjxa",
				"pageNo":1,
				"pageSize":5,
				"titlekey":key
			},function(result){
				//显示数据在tbody中,写成一个方法
				showData(result);
			},"json");
		});
		//点击末页跳转
		$(document).on("click",".last",function(){
			//先获取totalPage->span
			var totalPage=$("#totalPage").text();
			//发送ajax请求 首页
			$.get("${pageContext.request.contextPath}/AdminController",{
				"op":"userQueryAjxa",
				"pageNo":totalPage,
				"pageSize":5,
				"titlekey":key
			},function(result){
				//显示数据在tbody中,写成一个方法
				showData(result);
			},"json");
		});
		//点击下一页跳转
		$(document).on("click",".next",function(){
			//先获取当前页
			var pageNo=$("#pageNo").text();
			//转成整数后+1就是下一页了
			var next=parseInt(pageNo)+1;
			//发送ajax请求 首页
			$.get("${pageContext.request.contextPath}/AdminController",{
				"op":"userQueryAjxa",
				"pageNo":next,
				"pageSize":5,
				"titlekey":key
			},function(result){
				//显示数据在tbody中,写成一个方法
				showData(result);
			},"json");
		});
		
		
		//点击每一页跳转
		$(document).on("click",".currentPage",function(){
			//先获取当前选中的页码
			var pageNo=$(this).text();
			//发送ajax请求 首页
			$.get("${pageContext.request.contextPath}/AdminController",{
				"op":"userQueryAjxa",
				"pageNo":pageNo,
				"pageSize":5,
				"titlekey":key
			},function(result){
				//显示数据在tbody中,写成一个方法
				showData(result);
			},"json");
		});
		//点击跳转页
		$(document).on("click",".turnto",function(){
			//先获取输入框的值
			var pageNo=$("#turntoId").val();
			var totalPage=$("#totalPage").text();
			if(pageNo<1){
				pageNo=1;
			}else if(pageNo>totalPage*1){//*1弱类型语言,字符串*1直接转数字
				pageNo=totalPage;
			}
			//发送ajax请求 首页
			$.get("${pageContext.request.contextPath}/AdminController",{
				"op":"userQueryAjxa",
				"pageNo":pageNo,
				"pageSize":5,
				"titlekey":key
			},function(result){
				//显示数据在tbody中,写成一个方法
				showData(result);
			},"json");
		});
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
			var userid=$(this).data('userid');
			var username=$(this).data('username');
			var userpassword=$(this).data('userpassword');
			var userimg=$(this).data('userimg');
			var usergender=$(this).data('usergender');
			
			//2.将获取到的值放到指定位置上
			$("#userId").val(userid);
			$("#userName").val(username);
			$("#userPassword").val(userpassword);
			$("#userImg").val(userimg);
			$("#select1 option").each(function(){
				var name=$(this).html();
				if(name==usergender){
					console.log(name);
					$(this).attr("selected",true);
				}else{
					$(this).attr("selected",false);
				}
			})
		});
		//修改用户的点击事件
		$("#update2").click(function(){
			var user={
				userId:$("#userId").val(),
				userName:$("#userName").val(),
				userPassword:$("#userPassword").val(),
				userImg:$("#userImg").val(),
				userGender:$("#select1").val()
			};
			if($("#userName").val() !="" && $("#userPassword").val() !="" && $("#userImg").val() !=""){
				$.get("${pageContext.request.contextPath}/AdminController",{
					"op":"updateUser",
					"user":JSON.stringify(user),
					},function(result){
					if(result){
						alert("修改成功!");
						//关闭模态框
						$("#myModal").modal('hide');
						//刷新数据->查询
						$.get("${pageContext.request.contextPath}/AdminController",{
							"op":"userQueryAjxa",
							"pageNo":"1",
							"pageSize":"5",
							"titlekey":key
						},function(result){
							//显示数据在tbody中,写成一个方法
							showData(result);
						},"json");	
					}
				},"json");
			}		
		})
		//删除文章点击事件
		$(document).on("click","#delete",function(){
			var userid=$(this).attr('data-userid');
			var flag=confirm("是否确定停用用户编号为"+userid+"的用户");
			if(flag){
				$.get("${pageContext.request.contextPath}/AdminController",{
					"op":"deleteUserOnAdmin",
					"userId":userid
					},function(result){
						alert("停用成功!");
					if(result){
						var pageNo=$("#pageNo").text();
						var totalCount=$("#totalCount").text();
						$.get("${pageContext.request.contextPath}/AdminController",{
							"op":"userQueryAjxa",
							"pageNo":pageNo,
							"pageSize":5,
							"keyword":key
							},function(result2){
								showData(result2);
							},"json");
					}
				},"json");
			}
		});
	})
	
	//显示数据
	function showData(result){
		//每一次遍历之前需要清空
		  $("#articleList").empty();
		$("#showPageInfo").empty();
		$("#pageItem").empty();  
		//显示用户列表数据
		$.each(result.data,function(index,user){
			$("#articleList").append("<tr>\r\n" + 
		    		"				    <td>"+user.userId+"</td>\r\n" + 
		    		"				    <td>"+user.userName+"</td>\r\n" + 
		    		"				    <td>"+user.userPassword+"</td>\r\n" + 
		    		"				    <td>"+user.userImg+"</td>\r\n" + 
		    		"				    <td>"+user.userGender+"</td>\r\n" + 
		    		"				    <td>"+user.userState+"</td>\r\n" + 
		    		"				    <td>"+user.userDate+"</td>\r\n" + 
		    		"				    <td>\r\n" + 
		    		"				    <button class=\'btn btn-warning btn-sm\' id=\'updateBtn\' data-toggle=\'modal\' data-target=\'#myModal\' "+
		    		"					data-userid="+user.userId+" data-username="+user.userName+" "+
					"					data-userpassword="+user.userPassword+" data-userimg="+user.userImg+" "+
		    		"					data-usergender="+user.userGender+">修改</button>&nbsp;&nbsp;\r\n" + 
		    		"					<button class=\'btn btn-danger btn-sm\' id=\'delete\' data-userid="+user.userId+">停用</button></td>\r\n" + 
		    		"				</tr>");
			
		});																
		//显示分页信息
	 	$("#showPageInfo").append("当前第<span id='pageNo'>"+result.pageNo+
				"</span>页/共<span id='totalPage'>"+result.totalPage+
				"</span>页/每页显示<span id='pageSize'>"+result.pageSize+
				"</span>页/共<span id='totalCount'>"+result.totalCount+"</span>条");
		
		
		//首页
		if(1==result.pageNo){
			$("#pageItem").append('<li class="disabled"><a>首页</a></li>');
		}else{
			$("#pageItem").append('<li class="first"><a>首页</a></li>');
		}
		//分页栏目
		for(var i=1;i<=result.totalPage;i++){
			if(i==result.pageNo){
				$("#pageItem").append('<li class="active"><a>'+i+'</a></li>');
			}else{
				$("#pageItem").append('<li class="currentPage"><a>'+i+'</a></li>');
			}
		}
		//下一页
		if(result.totalPage==result.pageNo){
			$("#pageItem").append('<li class="disabled"><a>next</a></li>');
		}else{
			$("#pageItem").append('<li class="next"><a>next</a></li>');
		}
		//末页
		if(result.totalPage==result.pageNo){
			$("#pageItem").append('<li class="disabled"><a>末页</a></li>');
		}else{
			$("#pageItem").append('<li class="last"><a>末页</a></li>');
		}
		//跳转页
		
		$("#pageItem").append('<li><a><input id="turntoId" style="height:20px;width:45px" type="number" min="1" max="'+result.totalPage+'"></a></li>');
		$("#pageItem").append('<li><a class="turnto">跳转</a></li>');
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

				<ul class="nav nav-pills nav-stacked">
					<li  role="presentation"><a
							href="${pageContext.request.contextPath}/backstage/adminMovieManage.jsp"><i class="icon-film"></i>
						电影管理</a></li>
					<li  role="presentation"><a
							href="${pageContext.request.contextPath}/backstage/adminScheduleManage.jsp"><i
							class="icon-calendar"></i> 排片管理</a></li>
					<li  role="presentation"><a href="${pageContext.request.contextPath}/backstage/adminCinemaManage.jsp"><i
							class="icon-gift"></i> 影厅管理</a></li>
					<li role="presentation"><a
							href="${pageContext.request.contextPath}/backstage/adminOrderManage.jsp"><i
							class="icon-cogs"></i> 订单信息</a></li>
					<li role="presentation"><a href="${pageContext.request.contextPath}/backstage/filmgrossed.jsp"><i
							class="icon-bar-chart"></i> 票房统计</a></li>
					<li role="presentation"><a href="${pageContext.request.contextPath}/backstage/adminMessage.jsp"><i
							class="icon-gift"></i> 留言板</a></li>
					<li  role="presentation"><a
							href="${pageContext.request.contextPath}/backstage/adminManage.jsp"><i
							class="icon-cogs"></i> 管理员用户管理</a></li>
					<li class="active"  role="presentation"><a href="${pageContext.request.contextPath}/backstage/adminUserManage.jsp"><i class="icon-cogs"></i> 普通会员管理</a></li>
				</ul>
            </ul>
        </div>
        <div class="content-container">
            <div class="content-header">
                <span class="title gray-text">用户列表</span>
                <form class="navbar-form navbar-right">
					<input type="text" class="form-control" placeholder="搜索标题..."id="keyword">
					<input type="button" class="form-control"value="搜索" id="searchBtn">
					<input type="button" class="form-control"value="清除" id="clearBtn">
				</form>
            </div>
           <div class="table-responsive">
					<table class="table table-striped">
						<thead>
							<tr>
								<th>用户编号</th>
								<th>用户姓名</th>
								<th>用户密码</th>
								<th>用户头像</th> 
								<th>用户性别</th>
								<th>用户状态</th> 
								<th>注册时间</th>								
								<th>操作</th>
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
        <h4 class="modal-title" id="myModallabel">修改用户信息</h4>
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
      </div>
 
      <!-- 模态框主体 -->
      <div class="modal-body">
        <form class="form-horizontal" role="form" action="" method="post">
					<div class="form-group">
						<label for="inputEmail3" class="col-sm-2 control-label">用户编号</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" id="userId" name="userId" readonly="readonly"/>
						</div>
					</div>
					<div class="form-group">
						<label for="inputEmail3" class="col-sm-2 control-label">用户姓名</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" id="userName" name="userName" />
						</div>
					</div>
					<div class="form-group">
						<label for="inputPassword3" class="col-sm-2 control-label">用户密码</label>
						<div class="col-sm-8">
							<input type="password" class="form-control" id="userPassword" name="userPassword" />
						</div>
					</div>
					<div class="form-group">
						<label for="inputPassword3" class="col-sm-2 control-label">用户头像</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" id="userImg" name="userImg" />
						</div>
					</div>
					

					 <div class="form-group">
						<label for="inputPassword3" class="col-sm-2 control-label">性别</label>
						<div class="col-sm-4">
							<select class="form-control" name="author" id="select1" >
								<option value="男">男</option>
								<option value="女">女</option>
								<option value="保密">保密</option>
								
							</select>
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
</body>

</html>