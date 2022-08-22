<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>电影详情</title>
    <!-- Bootstrap 核心 CSS 文件 -->
    <link href="${pageContext.request.contextPath}/backstage/files/css/bootstrap.css" rel="stylesheet" type="text/css" />
    <!-- font-asesome图标库 -->
    <link href="${pageContext.request.contextPath}/backstage/files/css/font-awesome.min.css" rel="stylesheet" type="text/css" />

    <!-- 引入css样式文件 -->
    <link href="${pageContext.request.contextPath}/backstage/files/css/common.css" rel="stylesheet" type="text/css" />
<%--    <link href="${pageContext.request.contextPath}/backstage/files/css/movieDetail.css" rel="stylesheet" type="text/css" />--%>
    <link href="${pageContext.request.contextPath}/backstage/files/css/userMovieDetail.css" rel="stylesheet" type="text/css" />

    <!-- 引入js脚本文件 -->
    <!-- jquery -->
    <script src="${pageContext.request.contextPath}/front/js/jquery-3.6.0.js"></script>
    <!-- Bootstrap 核心 JavaScript 文件 -->
    <script src="${pageContext.request.contextPath}/backstage/files/js/bootstrap.js"></script>
    <script src="${pageContext.request.contextPath}/backstage/files/js/request.js"></script>
<%--    <script src="${pageContext.request.contextPath}/backstage/files/js/movieDetail.js"></script>--%>
<%--    <script src="${pageContext.request.contextPath}/backstage/files/js/userMovieDetail.js"></script>--%>

<%--    <!-- 引入ajax js文件 -->--%>
<%--    <script src="${pageContext.request.contextPath}/front/js/ajax_res.js"></script>--%>
</head>

<body>
    <div class="nav-top-container">
        <div class="nav-logo title">会员中心</div>
        <ul class="nav nav-pills">
            <li  role="presentation"><a href="${pageContext.request.contextPath}/front/index.jsp">首页</a></li>
            <li  role="presentation"><a href="${pageContext.request.contextPath}/front/userHome.jsp">
                个人信息</a></li>
            <li class="active" role="presentation"><a href="${pageContext.request.contextPath}/front/userOreder.jsp">
                我看过的电影</a></li>
        </ul>
        <div class="btn-group">
            <button aria-expanded="false" aria-haspopup="true" class="nav-user-container btn dropdown-toggle"
                data-toggle="dropdown" type="button">
                <img class="avatar-sm" src="${pageContext.request.contextPath}/FileDownloadServlet?fileName=${sessionScope.frontUser.userImg}" />
                <span class="gray-text" style="vertical-align: middle">${sessionScope.frontUser.userName}&nbsp;<span
                        class="caret"></span></span>
            </button>
            <ul class="dropdown-menu">
                <li><a href="#">电影票</a></li>
                <li><a href="#">消费纪录</a></li>
                <li><a href="#">卡包</a></li>
                <li id="logout"><a href="#">登出</a></li>
            </ul>
        </div>
    </div>
    <div class="main-container">

        <div class="content-container">
            <div class="content-header" >
                <span class="title gray-text"></span>
            </div>
            <ul class="movie-on-list">
            </ul>
            <div class="table-responsive">
                <table class="table table-striped" style="table-layout: fixed">
                    <thead>
                    <b>开始时间：<input type="datetime-local" name="Time" id="startTime" value="" style="width: 200px"/></b>
                    <b>结束时间：<input type="datetime-local" name="Time" id="endTime" value="" style="width: 200px"/></b>
                    <b>显示条数</b>
                    <select id="pageSize2" style="height: 25px">
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
                    <tr>
                        <th>订单编号</th>
                        <th>电影名称</th>
                        <th>票价</th>
                        <th>数量</th>
                        <th>总价</th>
                        <th>订单状态</th>
                        <th>下单时间</th>
                        <th>详情</th>
                        <th>操作</th>
                    </tr>

                    </thead>

                    <tbody id="orderList">

                    </tbody>

                </table>

                <!--  显示分页信息 -->
                <div id="showPageInfo">

                </div>

                <!-- 分页栏显示 -->
                <div aria-label="..." class="col-md-12 text-center">
                    <ul class="pagination" id="pageItem">

                    </ul>

                </div>


            </div>

        </div>

    </div>
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title" id="myModalLabel2">确认删除</h4>
                </div>
                <div class="modal-body" style="color: red">
                    请确认是否删除该订单信息！
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" id="confirm" data-dismiss="modal">删除</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">

        $(function () {
             UserId =${sessionScope.frontUser.userId} ;
            //一进来发送AJAX请求订单数据
            var pageSize = $("#pageSize2").val();
            //暂时写死后面获取登录用户的id
            $.get("${pageContext.request.contextPath}/OrderServlet", {
                "op": "queryByUserId",
                "pageSize": pageSize,
                "userId": UserId
            }, function (result) {
                //显示数据的函数
                showData(result);
            }, "json");

            //首页的点击事件
            $(document).on("click", ".first", function () {
                //发ajax请求->首页
                var starTime = $("#startTime").val();
                var endTime = $("#endTime").val();
                var op=setOp();
                //判断请求执行的操作参数
                var pageSize = $("#pageSize2").val();
                $.get("${pageContext.request.contextPath}/OrderServlet", {
                    "op":op,
                    "pageNo": 1,
                    "pageSize": pageSize,
                    "userId": UserId,
                    "starTime":starTime,
                    "endTime":endTime

                }, function (result) {
                    //显示数据的函数
                    showData(result);


                }, "json");
            });
            //末页的点击事件
            $(document).on("click", ".last", function () {

                var totalPage=$("#totalPage").html();
                var pageSize = $("#pageSize2").val();
                var starTime = $("#startTime").val();
                var endTime = $("#endTime").val();
                var op=setOp();
                $.get("${pageContext.request.contextPath}/OrderServlet", {
                    "op":op,
                    "userId": UserId,
                    "pageNo": totalPage,
                    "pageSize": pageSize,
                    "starTime":starTime,
                    "endTime":endTime
                }, function (result) {
                    //显示数据的函数
                    showData(result);


                }, "json");
            });
            //下一页的点击事件
            $(document).on("click", ".next", function () {
                /* alert(111);*/
                //发ajax请求
                var pageNo = $("#pageNo").html();
                var pageSize = $("#pageSize2").val();
                var starTime = $("#startTime").val();
                var endTime = $("#endTime").val();
                var op=setOp();
                $.get("${pageContext.request.contextPath}/OrderServlet", {
                    "op":op,
                    "pageNo": (parseInt(pageNo) + 1),
                    "userId": UserId,
                    "pageSize": pageSize,
                    "starTime":starTime,
                    "endTime":endTime
                }, function (result) {

                    showData(result);


                }, "json");
            });
            //每一页的点击事件
            $(document).on("click", ".currentPage", function () {
                //获取当前点击的页码
                var pageNo = $(this).html();
                var pageSize = $("#pageSize2").val();
                var starTime = $("#startTime").val();
                var endTime = $("#endTime").val();
                var op=setOp();
                //发ajax请求
                $.get("${pageContext.request.contextPath}/OrderServlet", {
                    "op":op,
                    "pageNo": pageNo,
                    "pageSize": pageSize,
                    "userId": UserId,
                    "starTime":starTime,
                    "endTime":endTime
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
                var pageSize = $("#pageSize2").val();
                var starTime = $("#startTime").val();
                var endTime = $("#endTime").val();
                if (pageNo < 1) {
                    pageNo = 1;
                } else if (pageNo > totalPage) {
                    pageNo = totalPage;
                }
                //发ajax请求
                var op=setOp();

                $.get("${pageContext.request.contextPath}/OrderServlet",
                    {
                        "op": op,
                        "pageNo": pageNo,
                        "pageSize": pageSize,
                        "userId": UserId,
                        "starTime":starTime,
                        "endTime":endTime
                    }, function (result) {
                        //显示数据的函数
                        showData(result);
                    }, "json");
            });
            //条数改变事件
            $("#pageSize2").change(function () {
                var pageSize =$(this).val();
                //当前页码超过总页码返回第一页
                var totalCount = $("#totalCount").html() * 1;
                var pageNo = $("#pageNo").html() * 1;
                var starTime = $("#startTime").val();
                var endTime = $("#endTime").val();
                if (totalCount / pageSize < pageNo) {
                    pageNo = 1;

                }
                var op=setOp();
                $.get("${pageContext.request.contextPath}/OrderServlet",
                    {
                        "op":op,
                        "pageNo":pageNo,
                        "pageSize": pageSize,
                        "userId": UserId,
                        "starTime":starTime,
                        "endTime":endTime
                    }, function (result) {
                        //显示数据的函数
                        showData(result);
                    }, "json");
            })
            //删除订单
            $(document).on("click","#confirm",function () {
                //获取订单编号
                var userid =1;
                var pageSize =$("#updateBtn").val();
                var ordeid  =$("#updateBtn").data("ordeid");

                alert(ordeid)
                $.get("${pageContext.request.contextPath}/OrderServlet",
                    {
                        "op":"delByOrderId",
                        "pageSize": pageSize,
                        "userId": UserId,
                        "orderId":ordeid
                    }, function (result) {
                    if(result){
                        alert("删除成功");
                        var pageSize = $("#pageSize2").val();
                        //暂时写死后面获取登录用户的id

                        $.get("${pageContext.request.contextPath}/OrderServlet", {
                            "op": "queryByUserId",
                            "pageSize": pageSize,
                            "userId": UserId
                        }, function (result) {
                            //显示数据的函数
                            showData(result);
                        }, "json");
                    }else {
                        alert("删除失败，未知错误请重试");
                    }
                    }, "json");
            })
            //时间区间模糊查询
            $("input[name='Time']").on("input propertychange", function () {
                var pageSize = $("#pageSize2").val();
                var startTime = $("#startTime").val();
                var endTime = $("#endTime").val();
                var op = setOp();
                $.get("${pageContext.request.contextPath}/OrderServlet",
                    {
                        "op": op,
                        "pageSize": pageSize,
                        "userId": UserId,
                        "startTime": startTime,
                        "endTime": endTime
                    },
                    function (result) {
                        //显示数据的函数
                        showData(result);
                    }, "json");
            })
            //设置执行操作
            function setOp() {
                var op;
                if ( $("#startTime").val() === "" && $("#endTime").val() === "") {
                    op = "queryByUserId";
                } else {
                    op="queryByIdAndTime";
                }
                return op;
            }
            function showData(result) {
                //清空原来的数据
                $("#orderList").empty();
                $("#showPageInfo").empty();
                $("#pageItem").empty();
                //遍历订单数据数据
                $.each(result.data, function (index, order) {
                    var Status = order.orderStatus === -1 ? "退票" : (order.orderStatus === 0) ? "未支付" : (order.orderStatus === 1) ? "支付成功" : "用户已删除";

                    $("#orderList").append("<tr>\r\n" +
                        "		                  <td>" + order.orderId + "</td>\r\n" +
                        "		                  <td>" + order.film.filmName + "</td>\r\n" +
                        "		                  <td>" + order.ticketPrice + "</td>\r\n" +
                        "		                  <td>" + order.count + "</td>\r\n" +
                        "		                  <td>" + order.totalPrice + "</td>\r\n" +
                        "		                  <td >" + Status + "</td>\r\n" +
                        "		                  <td>" + order.placeOrderDate + "</td>\r\n" +
                        "		                  <td>" + order.info + "</td>\r\n" +
                        "		                  <td><a href=\"#\" id=\"updateBtn\" data-toggle=\"modal\" data-target=\"#myModal\"" +
                        "                              data-toggle=\"modal\" data-target=\"#myModal\"  data-ordeid='" + order.orderId +"'" +
                        "                              >删除</a> </tr>");
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