<%@ page contentType="text/html;charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<!-- 后台订单管理页面 -->

<head>
    <meta charset="UTF-8">
    <title>订单管理</title>
    <!-- 引入css样式文件 -->
    <link href="files/css/common.css" rel="stylesheet" type="text/css"/>
    <link href="files/css/movieList.css" rel="stylesheet" type="text/css"/>
    <!-- Bootstrap 核心 CSS 文件 -->
    <link href="files/css/bootstrap.css" rel="stylesheet" type="text/css"/>
    <!-- font-asesome图标库 -->
    <link href="files/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>


    <!-- jquery -->
    <script src="${pageContext.request.contextPath}/front/js/jquery-3.6.0.js"
            charset="utf-8"></script>
    <!-- Bootstrap 核心 JavaScript 文件 -->
    <script src="${pageContext.request.contextPath}/backstage/files/js/bootstrap.js" charset="utf-8"></script>


</head>

<body>
<div class="main-container">
    <div class="nav-left-container">
        <div class="nav-user-container" style="margin-bottom: 50px;">
            <img class="avatar-lg" src="files/images/defaultAvatar.jpg" alt=""/>
            <p class="title">Admin</p>
        </div>
        <ul class="nav nav-pills nav-stacked">
            <li  role="presentation"><a href="${pageContext.request.contextPath}/backstage/adminMovieManage.jsp">
                <i class="icon-film"></i> 电影管理</a></li>
            <li  role="presentation"><a
                    href="${pageContext.request.contextPath}/backstage/adminScheduleManage.jsp"><i
                    class="icon-calendar"></i> 排片管理</a></li>
            <li  role="presentation"><a
                    href="${pageContext.request.contextPath}/backstage/adminCinemaManage.jsp"><i
                    class="icon-gift"></i> 影厅管理</a></li>
            <li role="presentation"><a href="${pageContext.request.contextPath}/backstage/adminOrderManage.jsp"><i
                    class="icon-cogs"></i> 订单信息</a></li>
            <li class="active" role="presentation"><a
                    href="${pageContext.request.contextPath}/backstage/filmgrossed.jsp"><i
                    class="icon-bar-chart" ></i> 票房统计</a></li>
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
        <div class="content-header">
            <span class="title gray-text">票房查询</span>
            <!--              <button class="btn btn-primary" data-backdrop="static" data-target="#movieModal" data-toggle="modal"
                                type="button"><i class="icon-plus-sign"></i> 上架电影
                            </button>
            <-->
            <b>影片名字：<input type="text" name="keyword" id="keyword" value="" style="width: 100px"/></b>
            <b>显示条数
                <select id="pageSize" style="height: 25px">
                    <option value="1">1</option>
                    <option value="2" selected="selected">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                    <option value="6">6</option>
                    <option value="7">7</option>
                    <option value="8">8</option>
                    <option value="9">9</option>
                    <option value="10">10</option>
                </select>
            </b>

        </div>
        <ul class="movie-on-list">
        </ul>

        <div class="table-responsive">
            <table class="table table-striped" style="table-layout: fixed">
                <thead>
                <tr>
                    <th>电影名称</th>
                    <th>票价</th>
                    <th>数量</th>
                    <th>票房</th>
                </tr>
                </thead>
                <tbody id="orderList">

                </tbody>

            </table>

            <!--  显示分页信息 -->
            <div id="showPageInfo">

            </div>
            <!-- 分页栏显示 -->
            <nav aria-label="..." class="col-md-12 text-center">
                <%--            <div id="pageInfo" class="col-md-12 text-center" >--%>
                <ul class="pagination" id="pageItem">

                </ul>
            </nav>
        </div>
    </div>
</div>
</div>

<script type="text/javascript">
    var key = "";

    //模糊查询所有
    $(function () {
        var pageSize = $("#pageSize").val();
        var keyword = $("#keyword").val().trim();
        $.get("${pageContext.request.contextPath}/OrderServlet", {
            "op": "queryGrossed",
            "pageSize": pageSize,
            "keyword": keyword
        }, function (result) {
            //显示数据的函数
            showData(result);
        }, "json");
        //首页的点击事件
        $(document).on("click", ".first", function () {
            //发ajax请求->首页
            var pageSize = $("#pageSize").val();
            var keyword = $("#keyword").val().trim();
            $.get("${pageContext.request.contextPath}/OrderServlet", {
                "op": "queryGrossed",
                "pageNo": 1,
                "pageSize": pageSize,
                "keyword": keyword,
            }, function (result) {
                //显示数据的函数
                showData(result);


            }, "json");
        });
        //末页的点击事件
        $(document).on("click", ".last", function () {
            //发ajax请求
            var totalPage = $("#totalPage").html();
            var pageSize = $("#pageSize").val();
            var keyword = $("#keyword").val().trim();
            $.get("${pageContext.request.contextPath}/OrderServlet", {
                "op": "queryGrossed",
                "pageNo": totalPage,
                "pageSize": pageSize,
                "keyword": keyword
            }, function (result) {
                //显示数据的函数
                showData(result);


            }, "json");
        });
        //下一页的点击事件
        $(document).on("click", ".next", function () {

            //发ajax请求
            var keyword = $("#keyword").val();
            var pageNo = $("#pageNo").html();
            var pageSize = $("#pageSize").val().trim();
            $.get("${pageContext.request.contextPath}/OrderServlet", {
                "op": "queryGrossed",
                "pageNo": (parseInt(pageNo) + 1),
                "pageSize": pageSize,
                "keyword": keyword
            }, function (result) {

                showData(result);


            }, "json");
        });
        //每一页的点击事件
        $(document).on("click", ".currentPage", function () {
            //获取当前点击的页码
            var pageNo = $(this).html();
            var pageSize = $("#pageSize").val();
            var keyword = $("#keyword").val().trim();
            //发ajax请求
            $.get("${pageContext.request.contextPath}/OrderServlet", {
                "op": "queryGrossed",
                "pageNo": pageNo,
                "pageSize": pageSize,
                "keyword": keyword
            }, function (result) {
                //显示数据的函数
                showData(result);


            }, "json");
        });
        //跳转页的点击事件
        $(document).on("click", ".turnTo", function () {
            //获取输入框的值
            var pageNo = $(".number").val();
            //末页
            var totalPage = $("#totalPage").html();
            var pageSize = $("#pageSize").val();
            var keyword = $("#keyword").val().trim();
            if (pageNo < 1) {
                pageNo = 1;
            } else if (pageNo > totalPage) {
                pageNo = totalPage;
            }
            //发ajax请求
            $.get("${pageContext.request.contextPath}/OrderServlet",
                {
                    "op": "queryGrossed",
                    "pageNo": pageNo,
                    "pageSize": pageSize,
                    "keyword": keyword,

                }, function (result) {
                    //显示数据的函数
                    showData(result);
                }, "json");
        });
        //条数改变事件
        $("#pageSize").change(function () {
            var pageSize = $("#pageSize").val();
            var keyword = $("#keyword").val().trim();
            //当前页码超过总页码返回第一页
            var totalCount = $("#totalCount").html() * 1;
            var pageNo = $("#pageNo").html() * 1;
            if (totalCount / pageSize < pageNo) {
                pageNo = 1;

            }
            $.get("${pageContext.request.contextPath}/OrderServlet",
                {
                    "op": "queryGrossed",
                    "pageSize": pageSize,
                    "keyword": keyword,
                    "pageNo": pageNo
                }, function (result) {
                    //显示数据的函数
                    showData(result);
                }, "json");
        })
        //订单号模糊查询
        $("#keyword").on("input propertychange", function () {
            var pageSize = $("#pageSize").val();
            var keyword = $("#keyword").val().trim();


            $.get("${pageContext.request.contextPath}/OrderServlet",
                {
                    "op": "queryGrossed",
                    "pageSize": pageSize,
                    "keyword": keyword
                },
                function (result) {
                    //显示数据的函数
                    showData(result);
                }, "json");
        })
        function showData(result) {
            //清空原来的数据
            $("#orderList").empty();
            $("#showPageInfo").empty();
            $("#pageItem").empty();
            //遍历订单数据数据
            $.each(result.grossed, function (index, order) {
                    $("#orderList").append("<tr>\r\n" +
                        "		                  <td>" + order.filmName + "</td>\r\n" +
                        "		                  <td>" + order.ticketPrice + "</td>\r\n" +
                        "		                  <td>" + order.count + "</td>\r\n" +
                        "		                  <td>" + order.total + "</td>\r\n" +

                        "               			 </tr>");

            });
            //显示分页数据
            $("#showPageInfo").append("当前第<span id='pageNo'>" + result.pageNo +
                "</span>页/共<span id='totalPage'>" + result.totalPage +
                "</span>页/每页显示<span id='pageSize'>" + result.pageSize +
                "</span>条/共<span id='totalCount' >" + result.totalCount +
                "</span>条");
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
                $("#pageItem").append('<li><a href="#" class="next">下一页</a></li>');
            }
            //末页
            if (result.pageNo === result.totalPage) {
                $("#pageItem").append('<li class="disabled"><a href="#">末页</a></li>');
            } else {
                $("#pageItem").append('<li><a href="#" class="last">末页</a></li>');
            }
            //跳转页
            $("#pageItem").append('<li><a class=""><input class="number" type="number" style="width: 40px;height: 16px;" min="1" max="' + result.totalPage + '" /></a></li>');
            $("#pageItem").append('<li><a class="turnTo">跳转</a></li>');

        }
    })

</script>
</body>

</html>