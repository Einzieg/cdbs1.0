<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<!-- 后台-留言板管理(删除留言) -->

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
	
	
	
	<script>
	var key="";//全局变量影片名
	$(function(){
		//界面一进来就发起ajax请求评论列表
		$.get("${pageContext.request.contextPath}/MessageBoardController",{
			"op":"messageboradQuerylike"
			},function(result){
				//显示数据在tdody中,写成一个方法,以后就不用在拼接
				showData(result);
			},"json");
		 //点击首页跳转
		$(document).on("click",".first",function(){
			//发送ajax请求 首页
			$.get("${pageContext.request.contextPath}/MessageBoardController",{
				"op":"messageboradQuerylike",
				"pageNo":1,
				"pageSize":10,
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
			$.get("${pageContext.request.contextPath}/MessageBoardController",{
				"op":"messageboradQuerylike",
				"pageNo":totalPage,
				"pageSize":10,
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
			$.get("${pageContext.request.contextPath}/MessageBoardController",{
				"op":"messageboradQuerylike",
				"pageNo":next,
				"pageSize":10,
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
			$.get("${pageContext.request.contextPath}/MessageBoardController",{
				"op":"messageboradQuerylike",
				"pageNo":pageNo,
				"pageSize":10,
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
			$.get("${pageContext.request.contextPath}/MessageBoardController",{
				"op":"messageboradQuerylike",
				"pageNo":pageNo,
				"pageSize":10,
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
			$.get("${pageContext.request.contextPath}/MessageBoardController",{
				"op":"messageboradQuerylike",
				"pageNo":1,
				"pageSize":10,
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
		//删除评论
		 $(document).on("click","#delete",function(){
			var messageId=$(this).data('messageboradid');
			console.log(messageId);
			var flag=confirm("是否删除此条评论"+messageId);
			if(flag){
				$.get("${pageContext.request.contextPath}/MessageBoardController",{
					"op":"deleteMessageBorad",
					"messageId":messageId
				},function(result){
					if(result){
						var pageNo=$('#pageNo').text();
						var totalCount=$("#totalCount").text();
						var num = Math.ceil((totalCount-1)/3);
						if(pageNo>num){
							pageNo=num;
						}
						$.get("${pageContext.request.contextPath}/MessageBoardController",{
							"op":"messageboradQuerylike",
							"pageNo":pageNo,
							"pageSize":10,
							"titlekey":key
						},function(result){
							//显示数据在tbody中,写成一个方法
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
		 $("#messageList").empty();
		$("#showPageInfo").empty();
		$("#pageItem").empty();  
		//显示用户列表数据
		
		$.each(result.data,function(index,messageborad){
			$("#messageList").append("							<tr>\r\n" + 
		    		"    <td>"+messageborad.messageId+"</td>\r\n" + 
		    		"    <td>"+messageborad.film.filmId+"</td>\r\n" + 
		    		"    <td>"+messageborad.film.filmName+"</td>\r\n" + 
		    		"    <td>"+messageborad.user.userId+"</td>\r\n" + 
		    		"    <td>"+messageborad.evaluateContent+"</td>\r\n" + 
		    		"    <td>"+messageborad.evaluateDate+"</td>\r\n" + 
		    		"    <td>"+messageborad.parentMessageId+"</td>\r\n" + 
		    		
		    		"    <td><button class=\'btn btn-danger btn-sm\' id=\'delete\'data-messageboradid="+messageborad.messageId+">删除</button></td></td>\r\n" + 
		    		"</tr>");
			
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
				<li class="active" role="presentation"><a
						href="${pageContext.request.contextPath}/backstage/adminMessage.jsp"><i
						class="icon-gift"></i> 留言板</a></li>
				<li  role="presentation"><a
						href="${pageContext.request.contextPath}/backstage/adminManage.jsp"><i
						class="icon-cogs"></i> 管理员用户管理</a></li>
				<li role="presentation"><a href="${pageContext.request.contextPath}/backstage/adminUserManage.jsp"><i class="icon-cogs"></i> 普通会员管理</a></li>
			</ul>
        </div>
        <div class="content-container">
            <div class="content-header">
                <span class="title gray-text">留言列表</span>
                <form class="navbar-form navbar-right">
					<input type="text" class="form-control" placeholder="搜索标题..." id="keyword">
					<input type="button" class="form-control" value="搜索" id="searchBtn">
					<input type="button" class="form-control" value="清除" id="clearBtn">
				</form>
            </div>
           <div class="table-responsive">
					<table class="table table-striped">
						<thead>
							<tr>
								<th>评论编号</th>
								<th>影片编号</th>
								<th>影片名</th>
								<th>用户编号</th>
								<th>评论内容</th> 
								<th>评论时间</th>
								<th>父级评论编号</th> 																
								<th>操作</th>
							</tr>

							
						</thead>
						<tbody id="messageList">
						

					
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
    
</body>

</html>