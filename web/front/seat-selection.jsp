<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<!DOCTYPE html>
<!-- 选座页面 -->
<html lang="en">
<html manifest="offline_book.manifest">
<head>
    <meta charset="utf-8">
    <meta content="IE=edge" http-equiv="X-UA-Compatible">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <title>电影售票界面</title>
    <link href="${pageContext.request.contextPath}/front/css/base.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/front/css/index.css" rel="stylesheet"  >
    <script src="${pageContext.request.contextPath}/front/js/jquery-3.6.0.js" charset="UTF-8"></script>
</head>

<body>
    <div class="contener clearfix">
        <div class="contener_left">
            <div class="header">
                屏幕
            </div>
            <div class="main">
                <table cellspacing="0" id="tab">
                    <div >

                    </div>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td ></td>
                        <td ></td>
                        <td ></td>
                        <td></td>
                    </tr>
                </table>
            </div>
            <div class="footer">
                <div>
                    <i></i>
                    <sapn>已选座位</sapn>
                </div>
                <div>
                    <i></i>
                    <sapn>可选座位</sapn>
                </div>
                <div>
                    <i></i>
                    <sapn>售出座位</sapn>
                </div>
            </div>
        </div>
        <div class="contener_right">
            <div class="pic_jj clearfix">
                <div class="pic_img">
                    <img alt="" src="${pageContext.request.contextPath}/MovieFileDownloadServlet?fileName=${requestScope.film.filmPoster}">
                </div>
                <div class="pic_txt">
                    <ul>
                        <li >中文名：<i>${requestScope.film.filmName}</i></li>
                        <li>剧情：${requestScope.film.filmType}</li>
                        <li>版本：${requestScope.film.filmLanguage}</li>
                        <li>时长：${requestScope.film.filmTime}</li>
                        <li>上映时间:${requestScope.film.movieShowtime}</li>
                    </ul>
                </div>
            </div>

            <div class="pic_movies">

                <ul>
                    <li>影院：<b>淘喵喵影城</b></li>
                    <li>影厅：<b>${requestScope.name}</b></li>
                    <li>场次：<b>${requestScope.time}</b></li>
                    <li>座位：<span class="zw"></span></li>
                    <li>已选择<b class="color-red sit"></b>个座位，<b class="color-red ">再次点击可取消，您最多只能买5张票！</b></li>
                </ul>
                <form name=alipayment action=${pageContext.request.contextPath}/front/alipay.trade.page.pay.jsp
                      method=post
                      target="_blank">
                    <input id="movieName" name="movieName" value="${requestScope.film.filmName}" hidden="hidden"
                           readonly="readonly">
                    <input id="filmId" name="filmId" value="${requestScope.film.filmId}" hidden="hidden"
                           readonly="readonly">
                    <input id="userId" name="userId" value="${sessionScope.users.userId}" hidden="hidden"
                           readonly="readonly">
                    <input id="name" name="name" value="${requestScope.name}" hidden="hidden"
                           readonly="readonly">
                    <input id="setId" name="setId" type="text" value="" hidden="hidden" readonly="readonly" >
                    <input id="setNum" name="setNum" type="text" value="" hidden="hidden"  readonly="readonly" >
                    <input id="time" name="time" value="${requestScope.time}" hidden="hidden" readonly="readonly">
                    <input id="count" name="count" id="count" value=""  hidden="hidden" readonly="readonly">

                <div class="pic_count">
                    <p >单价：<b>&yen;
                        <input name="WIDtotal_amount" id="WIDtotal_amount"
                               style="background: rgba(0,0,0,0);border-color: transparent;font-size: 15px"
                               value="${requestScope.film.ticketPrice}" readonly="readonly"></b></p>
                    <p>总价：<b class="color-red countPrice"></b></p>
                    <button class="btnSub" type="submit" id="btnSub">确认信息，下单</button>
                </div>
                </form>
            </div>

        </div>
    </div>

<%--    <script src="${pageContext.request.contextPath}/front/js/index.js" charset="UTF-8"></script>--%>
    <script >


        $(function (){
            //发送ajax请求查询作为情况
            $.get("${pageContext.request.contextPath}/UserController", {op: "querySeatNum",num:"${requestScope.time}"}, function (data) {
                    $.each(data,function (index, id){

                        $("td").eq(id.playNum).addClass("p60");
                    })
            })
            var count = 0;
            var countPrice = 0;
            var set='';
            setNum="";
            $("td").on("click", function () {
                var className = this.className;
                var index= $("td").index(this);

                var bian = "p0" + index;
                if (count < 5 && className !== "p0" && className !== "p60") {
                    count++;
                    $(this).addClass("p0");
                    console.log(index);
                    $(".sit").html(count);
                    console.log(className === "p0");
                    //动态显示座位
                    //获取十位上的数字
                    var b = parseInt((index % 100) / 10) + 1;
                    //获取个位上的数字
                    var a = parseInt(index % 10) + 1;
                    if (index >= 100 && index <= 107) {
                        b = 11;
                        a = a + 1;
                    } else if (index >= 108 && index < 110) {
                        b = 12;
                        a = a - 6;
                    } else if (index >= 110) {
                        b = 12;
                        a = a + 4;
                    }
                    console.log("b:" + b);
                    console.log("a:" + a);
                    bian = $('<button class="btn" id="' + bian + '">' + b + '行' + a + '列</button>');
                    $(".zw").before(bian);

                } else if (count <= 5 && className === "p0" && className !== "p60") {
                    count--;
                    $(this).removeClass("p0");


                    $(".sit").html(count);
                    $("#" + bian).remove();
                } else if (className === "p60") {
                    return false;
                } else {
                    alert("您做多只能买五张票！");
                }
                set+=index;
                $("#setId").attr("value",""+set+"")

                setNum+=""+b+'行'+a+'列'+",";
                $("#setNum").attr("value",""+setNum+"")
                $("#count").attr("value",""+count+"")
                countPrice = count * $("#WIDtotal_amount").val();
                $(".countPrice").html("&yen;" + countPrice );

                //提交
                var that = this;
                $(".btnSub").on("click", function () {
                    if (that.className === "p0") {
                        $(that).removeClass("p0");
                        $(that).addClass("p60");
                        count = 0;
                        countPrice = 0;
                        $(".sit").html(count);
                        countPrice = count * $("#WIDtotal_amount").val();
                        $(".countPrice").html("&yen;" + countPrice );
                        $(".btn").remove();


                    }
                });
            })

        })
    </script>
</body>

</html>