<%@ page contentType="text/html;charset=UTF-8"  %>
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
    <script src="${pageContext.request.contextPath}/front/js/jquery-3.6.0.js" type="text/javascript"
            charset="utf-8"></script>
    <!-- Bootstrap 核心 JavaScript 文件 -->
    <script src="${pageContext.request.contextPath}/backstage/files/js/bootstrap.js"></script>
    <!-- 引入ajax js文件 -->
    <script src="${pageContext.request.contextPath}/backstage/files/js/ajax_req.js"  type="text/javascript"
            charset="UTF-8" ></script>
    <%--    <script src="files/js/request.js"></script>--%>


</head>

<body>
<div class="main-container">
    <div class="nav-left-container">
        <div class="nav-user-container" style="margin-bottom: 50px;">
            <img class="avatar-lg" src="files/images/defaultAvatar.jpg" alt=""/>
            <p class="title">Admin</p>
        </div>
        <ul class="nav nav-pills nav-stacked">
            <li  role="presentation"><a
                    href="${pageContext.request.contextPath}/backstage/adminMovieManage.jsp"><i class="icon-film"></i>
                电影管理</a></li>
            <li  role="presentation"><a
                    href="${pageContext.request.contextPath}/backstage/adminScheduleManage.jsp"><i
                    class="icon-calendar"></i> 排片管理</a></li>
            <li  role="presentation"><a href="${pageContext.request.contextPath}/backstage/adminCinemaManage.jsp"><i
                    class="icon-gift"></i> 影厅管理</a></li>
            <li class="active" role="presentation"><a
                    href="${pageContext.request.contextPath}/backstage/adminOrderManage.jsp"><i
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
        <div class="content-header">
            <span class="title gray-text">用户订单管理</span>
            <!--              <button class="btn btn-primary" data-backdrop="static" data-target="#movieModal" data-toggle="modal"
                                type="button"><i class="icon-plus-sign"></i> 上架电影
                            </button>
            <-->
            <b>订单号：<input type="text" name="keyword" id="keyword" value="" style="width: 100px;"/></b>
            <b>用户名：<input type="text" name="userName" id="userName" value="" style="width: 100px"/></b>
            <b>影片编号：<input type="text" name="filmNum" id="filmNum" value="" style="width: 100px"/></b>
            <b>开始时间：<input type="datetime-local" name="Time" id="startTime" value="" style="width: 100px"/></b>
            <b>结束时间：<input type="datetime-local" name="Time" id="endTime" value="" style="width: 100px"/></b>
            <b>订单状态:
                <select id="status" style="height: 25px">
                    <option value="">请选择</option>
                    <option value="1">支付成功</option>
                    <option value="0">未支付</option>
                    <option value="-1">退票</option>
                    <option value="2">用户删除</option>
                </select>
            </b>
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
                    <th>订单编号</th>
                    <th>用户名字</th>
                    <th>电影名称</th>
                    <th>票价</th>
                    <th>数量</th>
                    <th>总价</th>
                    <th>订单状态</th>
                    <th>下单时间</th>
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

<%--   修改订单的模态框 --%>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel" style="text-align: center">修改订单状态</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" role="form"
                      action="${pageContext.request.contextPath}/OrderServlet?op=updateByOrderId"
                      method="post">
                    <div class="form-group">
                        <label for="inputOrderId" class="col-sm-2 control-label">订单编号</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="inputOrderId"  readonly="readonly"
                                   name="inputOrderId"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputOrderId" class="col-sm-2 control-label">用户名</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="inputUserName"  readonly="readonly"
                                  />
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="inputOrderId" class="col-sm-2 control-label">电影名称</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="inputFilmName"  readonly="readonly"
                                  />
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="inputOrderId" class="col-sm-2 control-label">票价</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="inputTicketPrice"  readonly="readonly"
                                   name="articleTitle"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="inputOrderId" class="col-sm-2 control-label">数量</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="inputConut"  readonly="readonly"
                                   name="articleTitle"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="inputOrderId" class="col-sm-2 control-label">总价</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="inputTotalPrice"  readonly="readonly"
                                   name="articleTitle"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="inputOrderId" class="col-sm-2 control-label">订单状态</label>
                        <div class="col-sm-8">
                            <select id="inputOrderStatus" name="inputOrderStatus" style="height: 30px;border-radius: 5px;font-size: 20px">
                                <option value="1">支付成功</option>
                                <option value="0">未支付</option>
                                <option value="-1">退票</option>
                                <option value="2">用户已删除</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="inputOrderId" class="col-sm-2 control-label">下单时间</label>
                        <div class="col-sm-8">
                            <input type="datetime-local" class="form-control" id="inputPlaceOrderDate"
                                   readonly="readonly"
                                   name="articleTitle"/>
                        </div>
                    </div>



                    <div class="modal-footer">
                        <button type="submit" class="btn btn-primary">确认</button>
                        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    </div>
                </form>
            </div>
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
            "op": "queryAllOrder",
            "pageSize": pageSize,
            "keyword": keyword
        }, function (result) {
            //显示数据的函数
            showData(result);
        }, "json");
        //首页的点击事件
        $(document).on("click", ".first", function () {
            //发ajax请求->首页
            //判断请求执行的操作参数
            var op = setOp();
            var pageSize = $("#pageSize").val();
            var keyword = $("#keyword").val().trim();
            var userName = $("#userName").val().trim()
            var filmNum = $("#filmNum").val().trim();
            var starTime = $("#startTime").val();
            var endTime = $("#endTime").val();
            var status = $("#status").val();
            $.get("${pageContext.request.contextPath}/OrderServlet", {
                "op": op,
                "pageNo": 1,
                "pageSize": pageSize,
                "keyword": keyword,
                "userName": userName,
                "filmNum": filmNum,
                "startTime": starTime,
                "endTime": endTime,
                "OrderStatus": status
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

            var userName = $("#userName").val().trim()
            var filmNum = $("#filmNum").val().trim();
            var starTime = $("#startTime").val();
            var endTime = $("#endTime").val();
            var status = $("#status").val();
            var op = setOp();
            $.get("${pageContext.request.contextPath}/OrderServlet", {
                "op": op,
                "pageNo": totalPage,
                "pageSize": pageSize,
                "keyword": keyword,
                "userName": userName,
                "filmNum": filmNum,
                "startTime": starTime,
                "endTime": endTime,
                "OrderStatus": status
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
            var userName = $("#userName").val().trim()
            var filmNum = $("#filmNum").val().trim();
            var starTime = $("#startTime").val();
            var endTime = $("#endTime").val();
            var status = $("#status").val();
            var op = setOp();

            $.get("${pageContext.request.contextPath}/OrderServlet", {
                "op": op,
                "pageNo": (parseInt(pageNo) + 1),
                "pageSize": pageSize,
                "keyword": keyword,
                "userName": userName,
                "filmNum": filmNum,
                "startTime": starTime,
                "endTime": endTime,
                "OrderStatus": status
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
            var userName = $("#userName").val().trim()
            var filmNum = $("#filmNum").val().trim();
            var starTime = $("#startTime").val();
            var endTime = $("#endTime").val();
            var status = $("#status").val();
            var op = setOp();
            console.log(op);
            //发ajax请求
            $.get("${pageContext.request.contextPath}/OrderServlet", {
                "op": op,
                "pageNo": pageNo,
                "pageSize": pageSize,
                "keyword": keyword,
                "userName": userName,
                "filmNum": filmNum,
                "startTime": starTime,
                "endTime": endTime,
                "OrderStatus": status
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
            var userName = $("#userName").val().trim()
            var filmNum = $("#filmNum").val().trim();
            var starTime = $("#startTime").val();
            var endTime = $("#endTime").val();
            var status = $("#status").val();
            if (pageNo < 1) {
                pageNo = 1;
            } else if (pageNo > totalPage) {
                pageNo = totalPage;
            }
            var op = setOp();
            //发ajax请求
            $.get("${pageContext.request.contextPath}/OrderServlet",
                {
                    "op": op,
                    "pageNo": pageNo,
                    "pageSize": pageSize,
                    "keyword": keyword,
                    "userName": userName,
                    "filmNum": filmNum,
                    "startTime": starTime,
                    "endTime": endTime,
                    "OrderStatus": status
                }, function (result) {
                    //显示数据的函数
                    showData(result);
                }, "json");
        });
        //条数改变事件
        $("#pageSize").change(function () {
            var pageSize = $("#pageSize").val();
            var keyword = $("#keyword").val().trim();
            var userName = $("#userName").val().trim()
            var filmNum = $("#filmNum").val().trim();
            var starTime = $("#startTime").val();
            var endTime = $("#endTime").val();
            var status = $("#status").val();
            var op = setOp();
            //当前页码超过总页码返回第一页
            var totalCount = $("#totalCount").html() * 1;
            var pageNo = $("#pageNo").html() * 1;
            if (totalCount / pageSize < pageNo) {
                pageNo = 1;

            }
            $.get("${pageContext.request.contextPath}/OrderServlet",
                {
                    "op": op,
                    "pageSize": pageSize,
                    "keyword": keyword,
                    "userName": userName,
                    "filmNum": filmNum,
                    "startTime": starTime,
                    "endTime": endTime,
                    "pageNo": pageNo,
                    "OrderStatus": status
                }, function (result) {
                    //显示数据的函数
                    showData(result);
                }, "json");
        })
        //订单号模糊查询
        $("#keyword").on("input propertychange", function () {
            var pageSize = $("#pageSize").val();
            var keyword = $("#keyword").val().trim();
            var op = setOp();

            $.get("${pageContext.request.contextPath}/OrderServlet",
                {
                    "op": op,
                    "pageSize": pageSize,
                    "keyword": keyword
                },
                function (result) {
                    //显示数据的函数
                    showData(result);
                }, "json");
        })
        //影片编号模糊查询
        $("#filmNum").on("input propertychange", function () {
            var pageSize = $("#pageSize").val();
            var filmNum = $("#filmNum").val().trim();
            var op = setOp();
            $.get("${pageContext.request.contextPath}/OrderServlet",
                {
                    "op": op,
                    "pageSize": pageSize,
                    "filmNum": filmNum
                },
                function (result) {
                    //显示数据的函数
                    showData(result);
                }, "json");
        })
        //时间区间模糊查询
        $("input[name='Time']").on("input propertychange", function () {
            var pageSize = $("#pageSize").val();
            var startTime = $("#startTime").val();
            var endTime = $("#endTime").val();
            var op = setOp();
            $.get("${pageContext.request.contextPath}/OrderServlet",
                {
                    "op": op,
                    "pageSize": pageSize,
                    "startTime": startTime,
                    "endTime": endTime
                },
                function (result) {
                    //显示数据的函数
                    showData(result);
                }, "json");
        })
        // 订单状态查询
        $("#status").on("input propertychange", function () {
            var status = $("#status").val();
            var op = setOp();
            var pageSize = $("#pageSize").val();
            var totalCount = $("#totalCount").html() * 1;
            var pageNo = $("#pageNo").html() * 1;
            if (totalCount / pageSize < pageNo) {
                pageNo = 1;
            }
            $.get("${pageContext.request.contextPath}/OrderServlet",
                {
                    "op": op,
                    "pageSize": pageSize,
                    "OrderStatus": status,
                    "pageNo":pageNo

                },
                function (result) {
                    //显示数据的函数
                    showData(result);
                }, "json");
        })
        //根据用户名查询
        $("#userName").on("input propertychange", function () {
            var userName = $("#userName").val().trim();
            var op = setOp();
            $.get("${pageContext.request.contextPath}/OrderServlet",
                {
                    "op": op,
                    "pageSize": pageSize,
                    "userName": userName
                },
                function (result) {
                    //显示数据的函数
                    showData(result);
                }, "json");
        })

        //设置执行操作
        function setOp() {
            var op;


            if ($("#keyword").val().trim() !== "" || keyword === "" && $("#userName").val().trim() === "" && $("#filmNum").val().trim() === ""
                && $("#startTime").val() === "" && $("#endTime").val() === "" && $("#status").val() === "") {
                op = "queryAllOrder";
            } else if ($("#filmNum").val().trim() !== "") {
                op = "queryByFilmNum";
            } else if ($("#startTime").val() !== "" || $("#endTime").val() !== "") {
                op = "queryByOrderDate";
            } else if ($("#status").val() !== "") {
                op = "queryByOrderStatus";
            }else if ($("#userName").val()!==""){
                op = "queryByUserName";
            }
            return op;
        }

        //修改订单信息
        $(document).on("click","#updateBtn",function (){
            //获取data-属性的值
            orderId =$(this).data('ordeid');
            userName =$(this).data('username');
            filmName =$(this).data('filmname');
            ticketPrice =$(this).data('ticketprice');
            count =$(this).data('count');
            totalPrice =$(this).data('totalprice');
            orderStatus =$(this).data('orderstatus');
            placeOrderDate =$(this).data('placeorderdate');
            console.log(placeOrderDate)
            //将获取到值的放到指定位置
            $("#inputOrderId").val(orderId);
            $("#inputUserName").val(userName);
            $("#inputFilmName").val(filmName);
            $("#inputTicketPrice").val(ticketPrice);
            $("#inputConut").val(count);
            $("#inputTotalPrice").val(totalPrice);
            $("#inputOrderStatus").val(orderStatus);
            $("#inputPlaceOrderDate").val(placeOrderDate);

            $("#inputOrderStatus option").each(function(){
                var Status=$(this).val();
                if(orderStatus===Status){

                    $(this).attr("selected",true);
                }else{
                    $(this).attr("selected",false);
                }
            })

        } )
        function showData(result) {
            //清空原来的数据
            $("#orderList").empty();
            $("#showPageInfo").empty();
            $("#pageItem").empty();
            //遍历订单数据数据
            $.each(result.data, function (index, order) {
                var Status= order.orderStatus===-1?"退票":(order.orderStatus===0)?"未支付":(order.orderStatus===1)?"支付成功":"用户已删除";

                $("#orderList").append("<tr>\r\n" +
                    "		                  <td>" + order.orderId + "</td>\r\n" +
                    "		                  <td>" + order.user.userName + "</td>\r\n" +
                    "		                  <td>" + order.film.filmName + "</td>\r\n" +
                    "		                  <td>" + order.ticketPrice + "</td>\r\n" +
                    "		                  <td>" + order.count + "</td>\r\n" +
                    "		                  <td>" + order.totalPrice + "</td>\r\n" +
                    "		                  <td >" +  Status + "</td>\r\n" +
                    "		                  <td>" + order.placeOrderDate + "</td>\r\n" +
                    "		                  <td><a href=\"#\" id=\"updateBtn\" data-toggle=\"modal\" data-target=\"#myModal\"" +
                    "                              data-toggle=\"modal\" data-target=\"#myModal\" " +
                    "							   data-ordeid='" + order.orderId + "' data-username='" + order.user.userName + "'" +
                    "                              data-filmname='" + order.film.filmName + "' data-ticketprice='"+order.ticketPrice+"'" +
                    "                              data-count='"+order.count+"' data-totalprice='"+order.totalPrice+"' " +
                    "                              data-orderstatus='"+order.orderStatus +"' data-placeorderdate='"+order.placeOrderDate+"'"+
                    "                             >修改</a>" +
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