<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<!-- 后台-排片管理 -->

<head>
	<meta charset="UTF-8">
	<title>排片管理</title>
	<link href="${pageContext.request.contextPath}/backstage/files/css/common.css" rel="stylesheet"
	      type="text/css"/>
	<link href="${pageContext.request.contextPath}/backstage/files/css/bootstrap.css" rel="stylesheet"
	      type="text/css"/>
	<link href="${pageContext.request.contextPath}/backstage/files/css/font-awesome.min.css" rel="stylesheet"
	      type="text/css"/>
	<link href="${pageContext.request.contextPath}/backstage/files/css/adminSchedule.css" rel="stylesheet"
	      type="text/css"/>


	<script src="${pageContext.request.contextPath}/front/js/jquery-3.6.0.js"></script>
	<script src="${pageContext.request.contextPath}/backstage/files/js/bootstrap.js"></script>
	<%--        <script src="${pageContext.request.contextPath}/backstage/files/js/request.js"></script>--%>
	<script src="${pageContext.request.contextPath}/backstage/files/js/adminScheduleManage.js"></script>

</head>

<body>
<div class="main-container">
	<div class="nav-left-container">
		<div class="nav-user-container" style="margin-bottom: 50px;">
			<img class="avatar-lg"
			     src="${pageContext.request.contextPath}/backstage/files/images/defaultAvatar.jpg"/>
			<p class="title">Admin</p>
		</div>
		<ul class="nav nav-pills nav-stacked">
			<li  role="presentation"><a href="${pageContext.request.contextPath}/backstage/adminMovieManage.jsp">
				<i class="icon-film"></i> 电影管理</a></li>
			<li class="active" role="presentation"><a
					href="${pageContext.request.contextPath}/backstage/adminScheduleManage.jsp"><i
					class="icon-calendar"></i> 排片管理</a></li>
			<li  role="presentation"><a
					href="${pageContext.request.contextPath}/backstage/adminCinemaManage.jsp"><i
					class="icon-gift"></i> 影厅管理</a></li>
			<li role="presentation"><a href="${pageContext.request.contextPath}/backstage/adminOrderManage.jsp"><i
					class="icon-cogs"></i> 订单信息</a></li>
			<li role="presentation"><a href="${pageContext.request.contextPath}/backstage/filmgrossed.jsp"><i
					class="icon-bar-chart"></i> 票房统计</a></li>
			<li    role="presentation"><a
					href="${pageContext.request.contextPath}/backstage/adminMessage.jsp"><i
					class="icon-gift"></i> 留言板</a></li>
			<li role="presentation"><a href="${pageContext.request.contextPath}/backstage/adminManage.jsp"><i
					class="icon-cogs"></i> 管理员用户管理</a></li>
			<li role="presentation"><a href="${pageContext.request.contextPath}/backstage/adminManage.jsp"><i class="icon-cogs"></i> 普通会员管理</a></li>
		</ul>
	</div>
	<div class="content-container">
		<div class="content-header">
			<span class="title gray-text">排片管理</span>
		</div>
		<div class="card" style="margin:20px 0;padding:20px;">
			<div style="display: flex;justify-content: space-between">
				<div>
					<span>选择影厅 </span>
					<select class="form-control" id="hall-select" name="hall-select"
					        style="display: inline-block;width: 180px;">
						<option value="default" selected>请选择</option>
					</select>
				</div>
				<div>
					<span>选择日期 </span>
					<input class="form-control" id="schedule-date-input" name="schedule-date-input"
					       style="display: inline-block;width: 180px;" type="date">
				</div>

				<button class="btn btn-primary" data-backdrop="static" data-target="#scheduleModal"
				        data-toggle="modal" type="button">新增排片
				</button>
			</div>
		</div>
		<div class="content-body">
			<div class="table-responsive">
				<table class="table table-striped" style="table-layout: fixed">
					<thead>
					<tr>
						<th>编号</th>
						<th>影厅</th>
						<th>电影</th>
						<th>开始时间</th>
						<th>结束时间</th>
						<th>操作</th>
					</tr>
					</thead>
					<tbody id="SliceList" style="table-layout: fixed">

					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>


<div aria-labelledby="movieModalLabel" class="modal fade" id="scheduleModal" role="dialog" tabindex="-1">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button aria-label="Close" class="close" data-dismiss="modal" type="button"><span
						aria-hidden="true">&times;</span></button>
				<h4 class="modal-title">新增排片</h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal" role="form"
				      action="${pageContext.request.contextPath}/AdminController?op=addSliceArrangement" method="post">
					<div class="form-group">
						<label class="col-sm-2 control-label" for="schedule-movie-input"><span
								class="error-text">*</span>电影名称</label>
						<div class="col-sm-10">
							<select class="form-control" id="schedule-movie-input" name="schedule-movie-input">
								<option value="default" selected>请选择</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label" for="schedule-hall-input"><span
								class="error-text">*</span>放映影厅</label>
						<div class="col-sm-10">
							<select class="form-control" id="schedule-hall-input" name="schedule-hall-input">
								<option value="default" selected>请选择</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label" for="schedule-start-date-input"><span
								class="error-text">*</span>开始时间</label>
						<div class="col-sm-10">
							<input class="form-control" id="schedule-start-date-input" name="schedule-start-date-input" placeholder="请选择开始时间"
							       type="datetime-local">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label" for="schedule-end-date-input"><span
								class="error-text">*</span>结束时间</label>
						<div class="col-sm-10">
							<input class="form-control" id="schedule-end-date-input" name="schedule-end-date-input" placeholder="请选择结束时间"
							       type="datetime-local">
						</div>
					</div>
					<%--<div class="form-group">
						<label class="col-sm-2 control-label" for="schedule-price-input"><span
								class="error-text">*</span>场次票价</label>
						<div class="col-sm-10">
							<input class="form-control" id="schedule-price-input" placeholder="请输入票价"
								type="text">
						</div>
					</div>--%>
					<div class="modal-footer">
						<button class="btn btn-default" data-dismiss="modal" type="button">取消</button>
						<button class="btn btn-primary" id="schedule-form-btn" type="submit">确认</button>
					</div>
				</form>
			</div>

		</div>
	</div>
</div>

<div aria-labelledby="movieModalLabel" class="modal fade" id="scheduleEditModal" role="dialog" tabindex="-1">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button aria-label="Close" class="close" data-dismiss="modal" type="button"><span
						aria-hidden="true">&times;</span></button>
				<h4 class="modal-title">修改排片</h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal" role="form" action="${pageContext.request.contextPath}/AdminController?op=updateSliceArr" method="post">
					<div class="form-group">
						<label class="col-sm-2 control-label" for="sliceId-input">场次编号</label>
						<div class="col-sm-10">
							<input name="sliceId" class="form-control" id="sliceId-input" readonly="readonly"
							       type="text">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label" for="schedule-movie-input"><span
								class="error-text">*</span>电影名称</label>
						<div class="col-sm-10">
							<select class="form-control" id="schedule-edit-movie-input" name="schedule-edit-movie-input">

							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label" for="schedule-hall-input"><span
								class="error-text">*</span>放映影厅</label>
						<div class="col-sm-10">
							<select class="form-control" id="schedule-edit-hall-input" name="schedule-edit-hall-input">
								<%--<option value="default" selected>请选择</option>--%>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label" for="schedule-edit-start-date-input"><span
								class="error-text">*</span>开始时间</label>
						<div class="col-sm-10">
							<input class="form-control" id="schedule-edit-start-date-input" name="schedule-edit-start-date-input"
							       type="datetime-local">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label" for="schedule-edit-end-date-input"><span
								class="error-text">*</span>结束时间</label>
						<div class="col-sm-10">
							<input class="form-control" id="schedule-edit-end-date-input" name="schedule-edit-end-date-input"
							       type="datetime-local">
						</div>
					</div>
					<%--<div class="form-group">
						<label class="col-sm-2 control-label" for="schedule-edit-price-input"><span
								class="error-text">*</span>场次票价</label>
						<div class="col-sm-10">
							<input class="form-control" id="schedule-edit-price-input" placeholder="请输入票价"
							       type="text">
						</div>
					</div>--%>
					<div class="modal-footer">
						<button class="btn btn-danger" id="schedule-edit-remove-btn" type="button">删除</button>
						<button class="btn btn-default" data-dismiss="modal" type="button">取消</button>
						<button class="btn btn-primary" id="schedule-edit-form-btn" type="submit">确认</button>
					</div>
				</form>
			</div>

		</div>
	</div>
</div>
<script type="text/javascript">


    $(function () {
        //将当天日期赋值给日期框
        var ddd = new Date();
        var day = ddd.getDate();
        if (ddd.getMonth() < 10) {
            var month = "0" + (ddd.getMonth() + 1);
        }
        if (ddd.getDate() < 10) {
            day = "0" + ddd.getDate();
        }
        var dateq = ddd.getFullYear() + "-" + month + "-" + day;
        var datew = dateq.toString();
        $("#schedule-date-input").val(datew);

        var cinemaName = $("#hall-select").val();
        var dateTime = $("#schedule-date-input").val();

        //填充影厅选择框
        $.get("${pageContext.request.contextPath}/AdminController", {"op": "queryCinemaName"}, function (data) {
            $.each(data, function (i, cinema) {
                $("#hall-select").append("<option value='" + cinema.cinemaName + "'>" + cinema.cinemaName + "</option>")
                $("#schedule-hall-input").append("<option value='" + cinema.cinemaName + "'>" + cinema.cinemaName + "</option>")
                $("#schedule-edit-hall-input").append("<option value='" + cinema.cinemaName + "'>" + cinema.cinemaName + "</option>")
            }, "json")
        })
        //填充电影选择框
        $.get("${pageContext.request.contextPath}/AdminController", {"op": "queryFilmName"}, function (data) {
            $.each(data, function (i, film) {
                $("#schedule-movie-input").append("<option value='" + film.filmName + "'>" + film.filmName + "</option>")
                $("#schedule-edit-movie-input").append("<option value='" + film.filmName + "'>" + film.filmName + "</option>")
            }, "json")
        })

        //发起ajax调用show方法
        $.get("${pageContext.request.contextPath}/AdminController", {
            "op": "querySlice",
            "cinemaName": cinemaName,
            "dateTime": dateTime
        }, function (result) {

            showSliceArrangement(result);
        }, "json");

        //修改按钮点击事件
        $(document).on("click", "#EditModal", function () {
            var filmName = $(this).data("filmname");
            var cinemaName = $(this).data("cinemaname");
            var startingTime = $(this).data("startingtime");
            var endTime = $(this).data("endtime");
            var sliceId = $(this).data("sliceid");

            $("#schedule-edit-movie-input option").each(function () {
                var state = $(this).val();
                if (state === filmName) {
                    $(this).attr("selected", true);
                } else {
                    $(this).attr("selected", false);
                }
            })
            $("#schedule-edit-hall-input option").each(function () {
                var state = $(this).val();
                if (state === cinemaName) {
                    $(this).attr("selected", true);
                } else {
                    $(this).attr("selected", false);
                }
            })
            $("#sliceId-input").val(sliceId);
            $("#schedule-edit-start-date-input").val(startingTime);
            $("#schedule-edit-end-date-input").val(endTime);


        })

    })

   //删除按钮
    $("#schedule-edit-remove-btn").click(function () {
        var cinemaName = $("#hall-select").val();
        var dateTime = $("#schedule-date-input").val();
        var sliceId=$("#sliceId-input").val();
        console.log("id="+sliceId);
        $.get("${pageContext.request.contextPath}/AdminController", {
            "op": "deleteSlice",
	        "sliceId":sliceId
        },function (result) {
	        if (result){
                alert("删除成功");
                $("#scheduleEditModal").modal('hide');
                $.get("${pageContext.request.contextPath}/AdminController", {
                    "op": "querySlice",
                    "cinemaName": cinemaName,
                    "dateTime": dateTime
                }, function (result) {
                    showSliceArrangement(result);
                }, "json");
	        }
        })
    })

    //影厅发生改变时
    $("#hall-select").change(function () {
        var cinemaName = $(this).val();
        var dateTime = $("#schedule-date-input").val();
        $.get("${pageContext.request.contextPath}/AdminController", {
            "op": "querySlice",
            "cinemaName": cinemaName,
            "dateTime": dateTime
        }, function (result) {
            showSliceArrangement(result);
        }, "json");
    })
    //日期发生改变时
    $("#schedule-date-input").change(function () {
        var cinemaName = $("#hall-select").val();
        var dateTime = $(this).val();
        $.get("${pageContext.request.contextPath}/AdminController", {
            "op": "querySlice",
            "cinemaName": cinemaName,
            "dateTime": dateTime
        }, function (result) {
            showSliceArrangement(result);
        }, "json");
    })

    function showSliceArrangement(result) {
        $("#SliceList").empty();
        $.each(result, function (index, slice) {
            $("#SliceList").append("<tr>\r\n" +
                "		                  <td>" + slice.id + "</td>\r\n" +
                "		                  <td>" + slice.cinema.cinemaName + "</td>\r\n" +
                "		                  <td>" + slice.film.filmName + "</td>\r\n" +
                "		                  <td>" + slice.startingTime + "</td>\r\n" +
                "		                  <td>" + slice.endTime + "</td>\r\n" +
                "		                  <td><a href=\'#\' class=\'btn btn-primary\'data-backdrop=\'static\'data-target=\'#scheduleEditModal\'data-toggle=\'modal\' type=\'button\' id=\'EditModal\'  " +
                "                           data-sliceid ='" + slice.id + "'" +
                "                           data-filmname ='" + slice.film.filmName + "'" +
                "                           data-cinemaname = '" + slice.cinema.cinemaName + "'" +
                "                           data-startingtime ='" + slice.startingTime + "'" +
                "                           data-endtime ='" + slice.endTime + "'>修改</a></td>" +
                "               		</tr>");
        });
    }
</script>
</body>

</html>