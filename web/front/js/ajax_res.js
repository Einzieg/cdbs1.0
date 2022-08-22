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



