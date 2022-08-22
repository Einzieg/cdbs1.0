<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<!-- 后台-电影管理(上架,进入修改页) -->

<head>
	<meta charset="UTF-8">
	<title>电影管理</title>
	<!-- 引入css样式文件 -->
	<link href="${pageContext.request.contextPath}/backstage/files/css/common.css" rel="stylesheet" type="text/css"/>
	<link href="${pageContext.request.contextPath}/backstage/files/css/movieList.css" rel="stylesheet" type="text/css"/>
	<!-- Bootstrap 核心 CSS 文件 -->
	<link href="${pageContext.request.contextPath}/backstage/files/css/bootstrap.css" rel="stylesheet" type="text/css"/>
	<!-- font-asesome图标库 -->
	<link href="${pageContext.request.contextPath}/backstage/files/css/font-awesome.min.css" rel="stylesheet"
	      type="text/css"/>


	<!-- 引入js脚本文件 -->
	<!-- jquery -->
	<script src="${pageContext.request.contextPath}/front/js/jquery-3.6.0.js"></script>
	<!-- Bootstrap 核心 JavaScript 文件 -->
	<script src="${pageContext.request.contextPath}/front/js/bootstrap.js"></script>
	<%--	<script src="${pageContext.request.contextPath}/backstage/files/js/request.js"></script>--%>
	<%--	<script src="${pageContext.request.contextPath}/backstage/files/js/adminMovieManage.js"></script>--%>

</head>

<body>
<div class="main-container">
	<div class="nav-left-container">
		<div class="nav-user-container" style="margin-bottom: 50px;">
			<img class="avatar-lg" src="${pageContext.request.contextPath}/backstage/files/images/defaultAvatar.jpg" />
			<p class="title">Admin</p>
		</div>
		<ul class="nav nav-pills nav-stacked">
			<li class="active" role="presentation"><a
					href="${pageContext.request.contextPath}/backstage/adminMovieManage.jsp"><i class="icon-film"></i>
				电影管理</a></li>
			<li role="presentation"><a href="${pageContext.request.contextPath}/backstage/adminScheduleManage.jsp"><i
					class="icon-calendar"></i> 排片管理</a></li>
			<li role="presentation"><a href="${pageContext.request.contextPath}/backstage/adminCinemaManage.jsp"><i
					class="icon-gift"></i> 影厅管理</a></li>
			<li role="presentation"><a href="${pageContext.request.contextPath}/backstage/adminOrderManage.jsp"><i
					class="icon-cogs"></i> 订单信息</a></li>
			<li role="presentation"><a href="${pageContext.request.contextPath}/backstage/filmgrossed.jsp"><i
					class="icon-bar-chart"></i> 票房统计</a></li>
			<li role="presentation"><a href="${pageContext.request.contextPath}/backstage/adminMessage.jsp"><i
					class="icon-gift"></i> 留言板</a></li>
			<li role="presentation"><a href="${pageContext.request.contextPath}/backstage/adminUserManage.jsp"><i
					class="icon-cogs"></i> 管理员用户管理</a></li>
			<li role="presentation"><a href="#"><i class="icon-cogs"></i> 普通会员管理</a></li>
		</ul>
	</div>
	<div class="content-container">
		<div class="content-header">
			<span class="title gray-text" style="margin-top: 8px">已上架电影</span>
			<form class="navbar-form navbar-right">
				<input type="text" class="title form-control" placeholder="搜索..." id="retrieve-film">
			</form>
			<button class="btn btn-primary" data-backdrop="static" data-target="#movieModal" data-toggle="modal"
			        type="button"><i class="icon-plus-sign"></i> 上架电影
			</button>
		</div>
		<div class="content-body">
			<div class="table-responsive">
				<table class="table table-striped" style="table-layout: fixed">
					<thead>
					<tr>
						<th>电影封面</th>
						<th>电影编号</th>
						<th>电影名称</th>
						<th>电影类型</th>
						<th>导演</th>
						<th>主演</th>
						<th>电影介绍</th>
						<th>电影语种</th>
						<th>电影时长</th>
						<th>上映日期</th>
						<th>电影票价</th>
					</tr>
					</thead>
					<tbody id="MovieList" style="table-layout: fixed">

					</tbody>
				</table>
			</div>
		</div>
		<nav aria-label="..." <%--style="position:fixed;bottom:10px;left:100px"--%> class="col-md-12 text-center">
			<ul class="pagination" id="pageItem">
			</ul>
		</nav>
		<div id="showPageInfo" class="col-md-12 text-center" <%--style="position:fixed;bottom:10px;left:100px"--%>  ></div>
	</div>

</div>
</div>

<div aria-labelledby="movieModalLabel" class="modal fade" id="movieModal" role="dialog" tabindex="-1">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button aria-label="Close" class="close" data-dismiss="modal" type="button"><span
						aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="movieModalLabel">新增电影</h4>
			</div>
			<div class="modal-body">
				<%--------form--------%>
				<form class="form-horizontal" enctype="multipart/form-data" role="form"
				      action="${pageContext.request.contextPath}/AdminController?op=addMovie" method="post">
					<div class="form-group">
						<label class="col-sm-2 control-label" for="movie-type-input">电影类型</label>
						<div class="col-sm-10">
							<input name="filmType" class="form-control" id="movie-type-input" placeholder="请输入电影类型"
							       type="text">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label" for="movie-name-input"><span
								class="error-text">*</span>电影名称</label>
						<div class="col-sm-10">
							<input name="filmName" class="form-control" id="movie-name-input" placeholder="请输入电影名称"
							       type="text">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label" for="movie-date-input"><span
								class="error-text">*</span>上映时间</label>
						<div class="col-sm-10">
							<input name="movieShowtime" class="form-control" id="movie-date-input"
							       placeholder="请输入电影上映时间" type="date">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label" <%--for="movie-img-input"--%>>电影海报</label>
						<div class="col-sm-10 inputBox">
							<input type="file" name="filmPester" id="filmPester">
							<label id="userImgTip"></label>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label" for="movie-description-input">剧情介绍</label>
						<div class="col-sm-10">
                                <textarea name="filmIntroduce" class="form-control" id="movie-description-input"
                                          placeholder="请输入剧情介绍"
                                          rows="3"></textarea>
						</div>
					</div>

					<div class="form-group">
						<label class="col-sm-2 control-label" for="movie-length-input">片长(分钟)</label>
						<div class="col-sm-10">
							<input name="filmTime" class="form-control" id="movie-length-input" placeholder="请输入电影片长"
							       type="text">
						</div>
					</div>

					<div class="form-group">
						<label class="col-sm-2 control-label" for="movie-language-input">电影语言</label>
						<div class="col-sm-10">
							<input name="filmLanguage" class="form-control" id="movie-language-input"
							       placeholder="请输入电影语言" type="text">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label" for="movie-director-input">电影导演</label>
						<div class="col-sm-10">
							<input name="directorName" class="form-control" id="movie-director-input"
							       placeholder="请输入电影导演" type="text">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label" for="movie-star-input">电影主演</label>
						<div class="col-sm-10">
							<input name="performerName" class="form-control" id="movie-star-input" placeholder="请输入电影主演"
							       type="text">
						</div>
					</div>
					<%--<div class="form-group">
						<label class="col-sm-2 control-label" for="movie-writer-input">电影编剧</label>
						<div class="col-sm-10">
							<input class="form-control" id="movie-writer-input" placeholder="请输入电影编剧" type="text">
						</div>
					</div>--%>
					<div class="form-group">
						<label class="col-sm-2 control-label" for="movie-ticket-price">电影票价</label>
						<div class="col-sm-10">
							<input name="ticketPrice" class="form-control" id="movie-ticket-price" placeholder="请输入票价"
							       type="text">
						</div>
					</div>
					<div class="modal-footer">
						<button class="btn btn-default" data-dismiss="modal" type="button">取消</button>
						<button class="btn btn-primary" id="movie-form-btn" type="submit">确认</button>
					</div>
				</form><%--------formEnd--------%>
			</div>
			<%--<div class="modal-footer">
				<button class="btn btn-default" data-dismiss="modal" type="button">取消</button>
				<button class="btn btn-primary" id="movie-form-btn"  type="submit">确认</button>
			</div>--%>
		</div>
	</div>
</div>

<script type="text/javascript">
    var key = "";
    $(function () {
        $.get("${pageContext.request.contextPath}/AdminController", {"op": "queryMovies"}, function (result) {
            showMovies(result);
        }, "json");
        //首页的点击事件
        $(document).on("click", ".first", function () {
            //发ajax请求->首页
            $.get("${pageContext.request.contextPath}/AdminController", {
                "op": "queryMovies",
                "pageNo": 1,
                "pageSize": 10,
                "titleKey": key
            }, function (result) {
                //显示数据的函数
                showMovies(result);


            }, "json");
        });
        //末页的点击事件
        $(document).on("click", ".last", function () {
            //发ajax请求
            var totalPage = $("#totalPage").html();
            $.get("${pageContext.request.contextPath}/AdminController", {
                "op": "queryMovies",
                "pageNo": totalPage,
                "pageSize": 10,
                "titleKey": key
            }, function (result) {
                //显示数据的函数
                showMovies(result);


            }, "json");
        });
        //下一页的点击事件
        $(document).on("click", ".nextpg", function () {
            //发ajax请求
            var pageNo = $("#pageNo").html();
            $.get("${pageContext.request.contextPath}/AdminController", {
                "op": "queryMovies",
                "pageNo": (parseInt(pageNo) + 1),
                "pageSize": 10,
                "titleKey": key
            }, function (result) {
                //显示数据的函数
                showMovies(result);


            }, "json");
        });
        //每一页的点击事件
        $(document).on("click", ".currentPage", function () {
            //获取当前点击的页码
            var pageNo = $(this).html();
            //发ajax请求
            $.get("${pageContext.request.contextPath}/AdminController", {
                "op": "queryMovies",
                "pageNo": pageNo,
                "pageSize": 10,
                "titleKey": key
            }, function (result) {
                //显示数据的函数
                showMovies(result);


            }, "json");
        });
        //跳转页的点击事件
        $(document).on("click", ".turnTo", function () {
            //获取输入框的值
            var pageNo = $(".number").val();
            //末页
            var totalPage = $("#totalPage").html();
            if (pageNo < 1) {
                pageNo = 1;
            } else if (pageNo > totalPage) {
                pageNo = totalPage;
            }
            //发ajax请求
            $.get("${pageContext.request.contextPath}/AdminController", {
                "op": "queryMovies",
                "pageNo": pageNo,
                "pageSize": 10,
                "titleKey": key
            }, function (result) {
                //显示数据的函数
                showMovies(result);


            }, "json");
        });

    })
	//搜索框
	$("#retrieve-film").on("input propertychange", function () {
		key=$("#retrieve-film").val();
		$.get("${pageContext.request.contextPath}/AdminController", {
			"op": "queryMovies",
			"pageNo": 1,
			"pageSize": 10,
			"titleKey": key
		}, function (result) {
			//显示数据的函数
			showMovies(result);
		}, "json");
	})
    function showMovies(result) {
        $("#showPageInfo").empty();
        $("#MovieList").empty();
        $("#pageItem").empty();
        $.each(result.data, function (index, film) {
            $("#MovieList").append("<tr>\r\n" +
                "		                  <td><a href=\'${pageContext.request.contextPath}/AdminController?op=queryMovieById&filmId=" + film.filmId + "\'><img src=\'${pageContext.request.contextPath}/FileDownloadServlet?fileName=" + film.filmPoster + "\' " +
                "                         style=\'white:40px;height:54px\' /></a></td>\r\n" +
                "		                  <td>" + film.filmId + "</td>\r\n" +
                "		                  <td style=\'overflow: hidden;text-overflow: ellipsis;white-space: nowrap;\'>" + film.filmName + "</td>\r\n" +
                "		                  <td style=\'overflow: hidden;text-overflow: ellipsis;white-space: nowrap;\'>" + film.filmType + "</td>\r\n" +
                "		                  <td style=\'overflow: hidden;text-overflow: ellipsis;white-space: nowrap;\'>" + film.directorName + "</td>\r\n" +
                "		                  <td style=\'overflow: hidden;text-overflow: ellipsis;white-space: nowrap;\'>" + film.performerName + "</td>\r\n" +
                "		                  <td style=\'overflow: hidden;text-overflow: ellipsis;white-space: nowrap;\'>" + film.filmIntroduce + "</td>\r\n" +
                "		                  <td>" + film.filmLanguage + "</td>\r\n" +
                "		                  <td>" + film.filmTime + "</td>\r\n" +
                "		                  <td>" + film.movieShowtime + "</td>\r\n" +
                "		                  <td>" + film.ticketPrice + "</td>\r\n" +
                "               		</tr>");

        });
        //分页数据
        $("#showPageInfo").append("当前第<span id='pageNo'>" + result.pageNo +
            "</span>页/共<span id='totalPage'>" + result.totalPage +
            "</span>页/每页显示<span id='pageSize'>" + result.pageSize +
            "</span>条/共<span id='totalCount'>" + result.totalCount + "条");
        //分页栏显示
        //首页
        if (1 === result.pageNo) {
            $("#pageItem").append('<li class="disabled"><a href="#">首页</a></li>');
        } else {
            $("#pageItem").append('<li><a href="#" class="first">首页</a></li>');
        }
        //分页栏目->总页数
        for (var i = 1; i <= result.totalPage; i++) {
            //什么时候激活->当i=当前页的时候
            if (i === result.pageNo) {
                $("#pageItem").append('<li class="active"><a href="#">' + i + '</a></li>');
            } else {
                $("#pageItem").append('<li><a href="#" class="currentPage">' + i + '</a></li>');
            }
        }
        //下一页
        if (result.pageNo === result.totalPage) {
            $("#pageItem").append('<li class="disabled"><a href="#">下一页</a></li>');
        } else {
            $("#pageItem").append('<li><a href="#" class="nextpg">下一页</a></li>');
        }
        //末页
        if (result.pageNo === result.totalPage) {
            $("#pageItem").append('<li class="disabled"><a href="#">末页</a></li>');
        } else {
            $("#pageItem").append('<li><a href="#" class="last">末页</a></li>');
        }
        //跳转页
        $("#pageItem").append('<li><a class=""><input class="number" type="number" style="width: 40px;height: 20px;" min="1" max="' + result.totalPage + '" /></a></li>');
        $("#pageItem").append('<li><a class="turnTo">跳转</a></li>');

    }

</script>
</body>

</html>