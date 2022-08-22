<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!-- 电影的留言页 -->
<html>

<head>
	<%
		String userName = "";
		String password = "";
		String checked = "";

		//读取cookies
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (Cookie c : cookies) {
				//判断
				if ("userName".equals(c.getName())) {
					userName = c.getValue();
				} else if ("password".equals(c.getName())) {
					password = c.getValue();
				} else if ("checked".equals(c.getName())) {
					checked = c.getValue();
				}
			}
		}


		//将变量存储到作用域中
		pageContext.setAttribute("userName", userName);
		pageContext.setAttribute("password", password);
		pageContext.setAttribute("checked", checked);

	%>
	<title>Single Page</title>
	<!-- for-mobile-apps -->
	<meta content="width=device-width, initial-scale=1" name="viewport">
	<meta content="text/html; charset=utf-8" http-equiv="Content-Type"/>
	<meta name=""/>
	<script src="${pageContext.request.contextPath}/front/js/jquery-3.6.0.js"></script>
	<script type="application/x-javascript"> addEventListener("load", function () {
        setTimeout(hideURLbar, 0);
    }, false);

    function hideURLbar() {
        window.scrollTo(0, 1);
    } </script>
	<!-- //for-mobile-apps -->
	<link href="${pageContext.request.contextPath}/front/css/bootstrap.css" media="all" rel="stylesheet"
	      type="text/css"/>
	<!-- pop-up -->
	<link href="${pageContext.request.contextPath}/front/css/popuo-box.css" media="all" rel="stylesheet"
	      type="text/css"/>
	<!-- //pop-up -->
	<link href="${pageContext.request.contextPath}/front/css/easy-responsive-tabs.css" rel='stylesheet'
	      type='text/css'/>
	<link href="${pageContext.request.contextPath}/front/css/zoomslider.css" rel="stylesheet" type="text/css"/>
	<link href="${pageContext.request.contextPath}/front/css/style.css" rel="stylesheet" type="text/css"/>
	<link href="${pageContext.request.contextPath}/front/css/font-awesome.css" rel="stylesheet">
	<script src="${pageContext.request.contextPath}/front/js/modernizr-2.6.2.min.js" type="text/javascript"></script>
	<!--/web-fonts-->
	<link href='http://fonts.googleapis.com/css?family=Tangerine:400,700' rel='stylesheet' type='text/css'>
	<link href="http://fonts.googleapis.com/css?family=Lato:100,100i,300,300i,400,400i,700,700i,900" rel="stylesheet">
	<link href='http://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
	<!--//web-fonts-->
</head>

<body>
<!--页面头部-->
<div class="banner-inner" id="demo-12">
	<div class="banner-inner-dott" style="height: 100px">
		<!--/header-w3l-->
		<div class="header-w3-agileits" id="home">
			<div class="inner-header-agile part2">
				<nav class="navbar navbar-default">
					<div class="navbar-header">
						<button class="navbar-toggle" data-target="#bs-example-navbar-collapse-1"
						        data-toggle="collapse" type="button">
							<span class="sr-only">Toggle navigation</span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
						</button>
						<h1><a href="${pageContext.request.contextPath}/front/index.jsp"><span>淘</span>喵喵<span>影院</span></a>
						</h1>
					</div>
					<!-- navbar-header -->
					<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
						<ul class="nav navbar-nav">
							<li class="active"><a href="${pageContext.request.contextPath}/front/index.jsp">主页</a></li>
							<%--<li class="dropdown">
								<a class="dropdown-toggle" data-toggle="dropdown" href="#">分类 <b
										class="caret"></b></a>
								<ul class="dropdown-menu multi-column columns-3">
									<li>
										<div class="col-sm-4">
											<ul class="multi-column-dropdown">
												<li><a href="genre.html">全部</a></li>
												<li><a href="genre.html">Biography</a></li>
												<li><a href="genre.html">Crime</a></li>
												<li><a href="genre.html">Family</a></li>
												<li><a href="horror.html">Horror</a></li>
												<li><a href="genre.html">Romance</a></li>
												<li><a href="genre.html">Sports</a></li>
												<li><a href="genre.html">War</a></li>
											</ul>
										</div>
										<div class="col-sm-4">
											<ul class="multi-column-dropdown">
												<li><a href="genre.html">Adventure</a></li>
												<li><a href="comedy.html">Comedy</a></li>
												<li><a href="genre.html">Documentary</a></li>
												<li><a href="genre.html">Fantasy</a></li>
												<li><a href="genre.html">Thriller</a></li>
											</ul>
										</div>
										<div class="col-sm-4">
											<ul class="multi-column-dropdown">
												<li><a href="genre.html">Animation</a></li>
												<li><a href="genre.html">Costume</a></li>
												<li><a href="genre.html">Drama</a></li>
												<li><a href="genre.html">History</a></li>
												<li><a href="genre.html">Musical</a></li>
												<li><a href="genre.html">Psychological</a></li>
											</ul>
										</div>
										<div class="clearfix"></div>
									</li>
								</ul>
							</li>--%>
							<!--<li><a href="series.html">tv - series</a></li>-->
							<!--<li><a href="news.html">news</a></li>-->
							<%--<li class="dropdown">
								<a class="dropdown-toggle" data-toggle="dropdown" href="#">语言 <b
										class="caret"></b></a>
								<ul class="dropdown-menu multi-column columns-3">
									<li>
										<div class="col-sm-4">
											<ul class="multi-column-dropdown">
												<li><a href="genre.html">法语</a></li>
												<li><a href="genre.html">汉语</a></li>
												<li><a href="genre.html">法语</a></li>
											</ul>
										</div>
										<div class="col-sm-4">
											<ul class="multi-column-dropdown">
												<li><a href="genre.html">俄语</a></li>
												<li><a href="genre.html">德语</a></li>
												<li><a href="genre.html">日语</a></li>
											</ul>
										</div>
										<div class="col-sm-4">
											<ul class="multi-column-dropdown">
												<li><a href="genre.html">西班牙语</a></li>
												<li><a href="genre.html">阿拉伯语</a></li>
												<li><a href="genre.html">印地语</a></li>
											</ul>
										</div>
										<div class="clearfix"></div>
									</li>
								</ul>
							</li>--%>
							<%--<li><a href="list.html">A - z list</a></li>--%>
							<!--<li><a href="contact.html">Contact</a></li>-->
						</ul>

					</div>
					<div class="clearfix"></div>
				</nav>
				<div class="w3ls_search">
					<div class="cd-main-header">
						<ul class="cd-header-buttons">
							<li><a class="cd-search-trigger" href="#cd-search"> <span></span></a></li>
						</ul> <!-- cd-header-buttons -->
					</div>
					<div class="cd-search" id="cd-search">
						<form action="#" method="post">
							<input name="Search" placeholder="Search..." type="search">
						</form>
					</div>
				</div>

			</div>

		</div>
		<!--//header-w3l-->
	</div>
</div>
<!--头部登录注册条-->
<div class="w3_agilits_banner_bootm">
	<div class="w3_agilits_inner_bottom">
		<div class="col-md-6 wthree_agile_login" id="navbar">
			<c:if test="${sessionScope.frontUser==null }">
				<ul>
					<li><i aria-hidden="true" class="fa fa-phone"></i> (+86) 182
						5907 9225
					</li>
					<li><a class="login" data-target="#myModal4" data-toggle="modal" href="#">登录</a>
					</li>
					<li><a class="login reg" data-target="#myModal5" data-toggle="modal" href="#">注册</a>
					</li>

				</ul>
			</c:if>
			<c:if test="${sessionScope.frontUser!=null }">
				<ul>
					<li><i aria-hidden="true" class="fa fa-phone"></i> (+86) 182
						5907 9225
					</li>
					<li><img
							src="${pageContext.request.contextPath}/FileDownloadServlet?fileName=${sessionScope.frontUser.userImg}"
							style="width: 30px; height: 30px; border-radius: 50%;"
							onerror="this.src='${pageContext.request.contextPath}/front/images/5.jpg'">
					</li>
					<li><a class="login"
					       href="/cdbs1.0/backstage/userHome.jsp">${sessionScope.frontUser.userName}</a>
					</li>
					<li><a id="exit" class="login reg">退出</a></li>
				</ul>
			</c:if>
		</div>

	</div>
</div>
<!--//banner-bottom-->
<!-- Modal1 -->

<div class="modal fade" id="myModal4" role="dialog" tabindex="-1">

	<div class="modal-dialog">
		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button class="close" data-dismiss="modal" type="button">&times;</button>
				<h4>登录</h4>
				<div class="login-form">

					<form action="UserController?op=Login" method="post">
						<input name="userName" placeholder="请输入用户名" required=""
						       type="text" id="userName" value="${userName}"> <input
							name="password" placeholder="请输入密码" required="" type="password"
							id="password" value="${password}">
						<div class="tp">
							<input type="button" value="登录" id="loginBtn"
							       data-dismiss="modal"
							       style="outline: none; padding: 0.9em 0; width: 100%; text-align: center; font-size: 1em; margin-top: 1em; border: none; color: #FFFFFF; cursor: pointer; background: #02a388; box-shadow: 0px 2px 1px rgb(28 28 29/ 42%); border-radius: 50px;">
						</div>
						<div class="forgot-grid">
							<div class="log-check">
								<c:if test="${checked == 'checked'}">
									<label class="checkbox"><input name="remember-me"
									                               class="checkbox" type="checkbox"
									                               checked/>记住我</label>
								</c:if>
								<c:if test="${checked != 'checked'}">
									<label class="checkbox"><input name="remember-me"
									                               class="checkbox" type="checkbox"/>记住我</label>
								</c:if>
							</div>
							<div class="forgot">
								<a data-target="#myModal2" data-toggle="modal" href="#"
								   id="password3">忘记密码?</a>
							</div>
							<div class="clearfix"></div>
						</div>

					</form>


				</div>
			</div>
		</div>
	</div>
</div>
<!-- //Modal1 -->
<!-- Modal1 -->
<div class="modal fade" id="myModal5" role="dialog" tabindex="-1">
	<div class="modal-dialog">
		<!-- 注册模态框-->


		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button class="close" data-dismiss="modal" type="button">&times;</button>
					<h4>注册新用户</h4>
					<div class="login-form">
						<form
								action="${pageContext.request.contextPath}/UserController?op=register"
								method="post" enctype="multipart/form-data" id="form1">
							<div class="inputBox">
								<input name="userName2" placeholder="用户名" required=""
								       type="text" id="userName1"/> <label id="userNameTip"></label>
							</div>

							<div class="inputBox">
								<input name="password2" placeholder="密码" required=""
								       type="password" id="password1"/> <label id="userPwdId"></label>
							</div>
							<div class="inputBox">
								<input name="repassword" placeholder="确认密码" required=""
								       type="password" id="repassword"/> <label id="repasswordTip"></label>
							</div>
							<div>
								<input name="sex" type="radio" value="1" checked/>男 <input
									name="sex" type="radio" value="0"/>女
							</div>
							<div>
								<p id="repasswordTip" style="padding: 13px">上传头像</p>
								<input type="file" name="userImg2" id="userImg"
								       style="padding: 13px">
							</div>
							<div class="signin-rit">
								<span class="agree-checkbox"> <label class="checkbox">
										<input type="checkbox" id="ok" value="checked"/>点此视为同意我们的 <a
										class="w3layouts-t" href="#" target="_blank">使用条款</a> 和 <a
										class="w3layouts-t" href="#" target="_blank">隐私政策</a>
								</label><label id="okTip"></label>
								</span>
							</div>

							<div class="tp">
								<input type="submit" value="立即注册" id="regForm">
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- //Modal1 -->
<!-- breadcrumb -->

<%--电影详情--%>
<div class="col-md-12 movie-detail-header"
     style="background-image:url('${pageContext.request.contextPath}/front/images/TB1oidOLFXXXXXxXFXXXXXXXXXX-1920-600.jpg_q90.jpg')  ;width: 100%; height: 400px;  ">
	<div class="col-md-12">
		<div class="detail-cont">
			<div class="center-wrap">
				<h3 class="cont-title" id="film-name"
				    style="font-size: 32px;margin-left: 6px;">${requestScope.film.filmName}</h3>
				<div class="cont-pic">
					<img style="width: 220px;"
					     src="${pageContext.request.contextPath}/MovieFileDownloadServlet?fileName=${requestScope.film.filmPoster}"
					     alt="">
				</div>
				<ul class="cont-info">
					<li>导演：${requestScope.film.directorName}</li>
					<li>主演：${requestScope.film.performerName}</li>
					<li>类型：${requestScope.film.filmType}</li>
					<li>语言：${requestScope.film.filmLanguage}</li>
					<li>片长：${requestScope.film.filmTime}</li>
					<li class="J_shrink shrink">剧情介绍：${requestScope.film.filmIntroduce} </li>
					<li>上映时间：${requestScope.film.movieShowtime}</li>
					<%--<a class="buy-tickets-seat-btn" href="#">选座购票</a>--%>
				</ul>
			</div>
		</div>
	</div>
	<%--	<div class="col-md-3">
			<div class="video_agile_player sidebar-player" style="width: 100% ;height: 400px;padding-top: 40px ;">
				<div class="video-grid-single-page-agileits text-center">
					<a style="color: #0b0b0b">观看预告</a>
					<div data-video="fNKUgX8PhMA" id="video1">

						<img alt="" class="img-responsive" src="${pageContext.request.contextPath}/front/images/22.jpg">
						<div id="play"></div>
					</div>
				</div>
				&lt;%&ndash;<div class="player-text side-bar-info">
					<p class="fexi_header">Me Before You </p>
					<p class="fexi_header_para"><span class="conjuring_w3">Story
												Line<label>:</label></span>Me
						Before You Official Trailer #2 (2016) - Emilia Clarke, Sam Claflin Movie HD

						A girl in a small town forms an unlikely....</p>
					<p class="fexi_header_para"><span>Release On<label>:</label></span>Feb 3, 2016 </p>
					<p class="fexi_header_para">
						<span>Genres<label>:</label> </span>
						<a href="genre.html">Drama</a> |
						<a href="genre.html">Adventure</a> |
						<a href="genre.html">Family</a>
					</p>
					<p class="fexi_header_para fexi_header_para1"><span>Star
												Rating<label>:</label></span>
						<a href="#"><i aria-hidden="true" class="fa fa-star"></i></a>
						<a href="#"><i aria-hidden="true" class="fa fa-star"></i></a>
						<a href="#"><i aria-hidden="true" class="fa fa-star-half-o"></i></a>
						<a href="#"><i aria-hidden="true" class="fa fa-star-o"></i></a>
						<a href="#"><i aria-hidden="true" class="fa fa-star-o"></i></a>
					</p>
				</div>&ndash;%&gt;

			</div>
		</div>--%>

</div>


<div class="w3_content_agilleinfo_inner">

	<div class="agile_featured_movies">

		<div class="latest-news-agile-info">


			<div class="col-md-8 latest-news-agile-left-content">
				<%--标签--%>
				<ul id="myTab" class="nav nav-tabs">
					<li class="active"><a href="#show-buy-tickets" data-toggle="tab">选座购票</a></li>
					<li><a href="#show-comment" data-toggle="tab">查看影评</a></li>
				</ul>

				<div id="myTabContent" class="tab-content">
					<%--评论的标签--%>
					<div class="tab-pane fade" id="show-comment">
						<div class="latest-news-agile-info">


								<%--<div class="single-agile-shar-buttons">
									<h5>Share This :</h5>
									<ul>
										<li>
											<div class="fb-like" data-action="like" data-href=""
											     data-layout="button_count" data-share="false" data-show-faces="false"
											     data-size="small"></div>
											<!-- <script>(function (d, s, id) {
										var js, fjs = d.getElementsByTagName(s)[0];
										if (d.getElementById(id)) return;
										js = d.createElement(s);
										js.id = id;
										js.src = "//connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v2.7";
										fjs.parentNode.insertBefore(js, fjs);
									}(document, 'script', 'facebook-jssdk'));</script> -->
										</li>
										<li>
											<div class="fb-share-button" data-href="" data-layout="button_count"
											     data-mobile-iframe="true" data-size="small">
												<a class="fb-xfbml-parse-ignore" href="" target="_blank">Share</a>
											</div>
										</li>
										<li class="news-twitter"><a class="twitter-follow-button"
										                            data-show-count="false" href="">Follow @w3layouts</a></li>
										<li><a class="twitter-mention-button" data-show-count="false"
										       href="https://twitter.com/intent/tweet?screen_name=w3layouts">Tweet
											to @w3layouts</a></li>
										<li>
											<!-- Place this tag where you want the +1 button to render. -->
											<div class="g-plusone" data-size="medium"></div>
											<!-- Place this tag after the last +1 button tag. -->
											<!-- <script type="text/javascript">
									(function () {
										var po = document.createElement('script');
										po.type = 'text/javascript';
										po.async = true;
										po.src = 'https://apis.google.com/js/platform.js';
										var s = document.getElementsByTagName('script')[0];
										s.parentNode.insertBefore(po, s);
									})();
								</script> -->
										</li>
									</ul>
								</div>--%>
								<!--  <div class="admin-text">
						<h5>WRITTEN BY ADMIN</h5>
						<div class="admin-text-left">
							<a href="#"><img alt="" src="images/admin.jpg"></a>
						</div>
						<div class="admin-text-right">
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,There are many variations of
								passages of Lorem Ipsum available,
								sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
							<span>View all posts by :<a href="#"> Admin </a></span>
						</div>
						<div class="clearfix"></div>
					</div> -->

								<h4 style="margin-top: 20px;">留言板</h4>
								<div class="response" id="articleList">
									<!-- <div class="media response-info" > -->
									<!-- <div class="media-left response-text-left">
								<a href="#"> <img alt="" class="media-object"
									src="images/admin.jpg">
								</a>
								<h5>
									<a href="#">messageborad.user.userName</a>
								</h5>
							</div>
							<div class="media-body response-text-right">
								<p>messageborad.evaluateContent</p>
								<ul>
									<li>messageborad.evaluateDate</li>
									<li><a href="single.html"><i aria-hidden="true"
											class="fa fa-reply"></i> 回复</a></li>
									<li><a href="single.html"><i aria-hidden="true"
											></i> 删除</a></li>
								</ul>
							</div> -->
									<!-- <div class="clearfix"></div>  -->

								</div>
								<!-- 分页信息 -->
								<div id="showPageInfo"></div>
								<nav aria-label="Page navigation">
									<div class="col-md-12 text-center">
										<ul class="pagination pagination-lg" id="pageItem">
										</ul>
									</div>
								</nav>
								<div class="all-comments-info">

									<h5>留下足迹</h5>
									<div class="agile-info-wthree-box">
										<form method="get" target="nm_iframe">
											<div class="col-md-12 form-info">

												<textarea placeholder="请发表您心情" required="" name="message"
												          id="message"></textarea>
												<input type="button" value="发表" id="announce" name="announce">
											</div>
											<div class="clearfix"></div>


										</form>
									</div>
									<!--<div class="media response-info">
							<div class="media-left response-text-left">
								<a href="#">
									<img alt="" class="media-object" src="images/admin.jpg">
								</a>
								<h5><a href="#">钟民</a></h5>
							</div>
							<div class="media-body response-text-right">
								<p>呵呵哈哈哈或或</p>
								<ul>
									<li>2022-07-13</li>
									<li><a href="single.html"><i aria-hidden="true" class="fa fa-reply"></i> 回复</a>
									</li>
								</ul>
								<div class="media response-info">
									<div class="media-left response-text-left">
										<a href="#">
											<img alt="" class="media-object" src="images/admin.jpg">
										</a>
										<h5><a href="#">洪涛</a></h5>
									</div>
									<div class="media-body response-text-right">
										<p>回复<a>@钟民</a>呵呵哈哈哈</p>
										<ul>
											<li>2022-07-13</li>
											<li><a href="single.html"><i aria-hidden="true" class="fa fa-reply"></i>
													回复</a></li>
										</ul>
									</div>
									<div class="clearfix"></div>
								</div>
							</div>
							<div class="clearfix"></div>
						</div> -->
								</div>
								<!-- <div class="media response-info">
							<div class="media-left response-text-left">
								<a href="#">
									<img alt="" class="media-object" src="images/admin.jpg">
								</a>
								<h5><a href="#">Admin</a></h5>
							</div>
							<div class="media-body response-text-right">
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,There are many variations of
									passages of Lorem Ipsum available,
									sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.There are many
									variations of passages of Lorem Ipsum available.</p>
								<ul>
									<li>November 03, 2016</li>
									<li><a href="single.html"><i aria-hidden="true" class="fa fa-reply"></i> Reply</a>
									</li>
								</ul>
							</div>
							<div class="clearfix"></div>
						</div>  -->



							<!-- <div class="all-comments-info" >
						<h5>留下足迹</h5>
						<div class="agile-info-wthree-box" style="width:60%">
							<form>
								<div class="col-md-6 form-info">
									<input name="name" placeholder="Your Name" required="" type="text">
									<input name="email" placeholder="Your Email" required="" type="email">
									<input name="phone" placeholder="Your Phone" required="" type="text">
								</div>
								<div class="col-md-6 form-info">

								<textarea placeholder="Message" required=""></textarea>
								<input type="submit" value="发表">
						</div>
						<div class="clearfix"></div>


						</form>
					</div> -->

						</div>


						<%--<div class="all-comments-info">
							<h5>LEAVE A COMMENT</h5>
							<div class="agile-info-wthree-box">
								<form>
									<div class="col-md-6 form-info">
										<input name="name" placeholder="Your Name" required="" type="text">
										<input name="email" placeholder="Your Email" required="" type="email">
										<input name="phone" placeholder="Your Phone" required="" type="text">
									</div>
									<div class="col-md-6 form-info">

										<textarea placeholder="Message" required=""></textarea>
										<input type="submit" value="SEND">
									</div>
									<div class="clearfix"></div>


								</form>
							</div>
						</div>--%>
					</div>
					<%--购票的标签--%>
					<div class="tab-pane fade in active" id="show-buy-tickets">
						<div class="day-set-tab center-wrap ">
							<ul class="filter-select">
								<li>
									<label>选择日期</label>
									<div class="select-tags">
										<a id="date-today" class="day-set-btn" href="javascript:void(0)"
										   data-time="">
											<span>今天</span><span id="span-date-today"></span>
										</a>
										<a id="date-tomorrow" class="day-set-btn" href="javascript:void(0)">
											<span>明天</span><span id="span-date-tomorrow"></span>
										</a>
										<a id="date-after-tomorrow" class="day-set-btn"
										   href="javascript:void(0)">
											<span>后天</span><span id="span-date-after-tomorrow"></span>
										</a>
									</div>
								</li>
							</ul>
						</div>
						<div class="table-responsive hall-table" style="width: 100%;">
							<table class="table table-striped text-center" style="table-layout: fixed">
								<thead style="background: #EAEAEA;font-size: 14px;">
								<tr>
									<th class="text-center">放映时间</th>
									<th class="text-center">语言版本</th>
									<th class="text-center">放映厅</th>
									<th class="text-center">售价(元)</th>
									<th class="text-center">选座购票</th>
								</tr>
								</thead>
								<tbody id="SliceList" style="table-layout: fixed">

								</tbody>
							</table>
						</div>
					</div>

				</div>

			</div>
			<%--热门推荐--%>
			<div class="col-md-4 latest-news-agile-right-content">
				<div class="clearfix"></div>
				<%--这行不能删--%>
				<div class="agile-info-recent">
					<h4 class="side-t-w3l-agile">热门 <span>推荐</span></h4>
					<div class="w3ls-recent-grids">
						<div class="w3l-recent-grid">
							<div class="wom">
								<a href="single.html"><img alt=" " class="img-responsive"
								                           src="${pageContext.request.contextPath}/front/images/m12.jpg"></a>
							</div>
							<div class="wom-right">
								<h5><a href="single.html">Lorem Integer rutrum</a></h5>
								<p>Mauris fermentum dictum magna. Sed laoreet aliquam leo.
									Ut tellus dolor, dapibus eget.</p>
								<ul class="w3l-sider-list">
									<li><i aria-hidden="true" class="fa fa-clock-o"></i>On Jan 12, 2016</li>
									<li><i aria-hidden="true" class="fa fa-eye"></i> 2602</li>
								</ul>
							</div>
							<div class="clearfix"></div>
						</div>
						<div class="w3l-recent-grid">
							<div class="wom">
								<a href="single.html"><img alt=" " class="img-responsive"
								                           src="${pageContext.request.contextPath}/front/images/m13.jpg"></a>
							</div>
							<div class="wom-right">
								<h5><a href="single.html">Lorem Integer rutrum</a></h5>
								<p>Mauris fermentum dictum magna. Sed laoreet aliquam leo.
									Ut tellus dolor, dapibus eget.</p>
								<ul class="w3l-sider-list">
									<li><i aria-hidden="true" class="fa fa-clock-o"></i>On Mar 3, 2016</li>
									<li><i aria-hidden="true" class="fa fa-eye"></i> 2742</li>
								</ul>
							</div>
							<div class="clearfix"></div>
						</div>
						<div class="w3l-recent-grid">
							<div class="wom">
								<a href="single.html"><img alt=" " class="img-responsive"
								                           src="${pageContext.request.contextPath}/front/images/m14.jpg"></a>
							</div>
							<div class="wom-right">
								<h5><a href="single.html">Lorem Integer rutrum</a></h5>
								<p>Mauris fermentum dictum magna. Sed laoreet aliquam leo.
									Ut tellus dolor, dapibus eget.</p>
								<ul class="w3l-sider-list">
									<li><i aria-hidden="true" class="fa fa-clock-o"></i>On Oct 13, 2016</li>
									<li><i aria-hidden="true" class="fa fa-eye"></i> 2802</li>
								</ul>
							</div>
							<div class="clearfix"></div>
						</div>
					</div>
				</div>
			</div>
			<%--这行不能删--%>
			<div class="clearfix"></div>

		</div>

	</div>
</div>


<!--底部模块-->
<div class="contact-w3ls" id="contact">
	<div class="footer-w3lagile-inner">

		<div class="footer-grids w3-agileits">
			<div class="col-md-2 footer-grid">
				<h4>伟鹏影院</h4>
				<ul>
					<li><img src="${pageContext.request.contextPath}/front/images/qrcode_localhost.png"
					         width="100px">
					</li>

				</ul>
			</div>
			<div class="col-md-2 footer-grid">
				<h4>选座购票流程</h4>
				<ul>
					<li><a href="genre.html">选择影片和场次</a></li>
					<li><a href="comedy.html">选择中意的座位</a></li>
					<li><a href="series.html">支付并收到取票短信</a></li>
				</ul>
			</div>

			<div class="col-md-2 footer-grid">
				<h4>取票流程</h4>
				<ul>
					<li><a href="comedy.html">收到取票短信</a></li>
					<li><a href="horror.html">影院自助取票</a></li>
					<li><a href="series.html">短信重发方式</a></li>
				</ul>
			</div>

			<div class="col-md-2 footer-grid">
				<h4>常见问题</h4>
				<ul>
					<li><a href="comedy.html">是否支持退换票</a></li>
					<li><a href="horror.html">填错手机号怎么办</a></li>
					<li><a href="series.html">更多问题>></a></li>
				</ul>
			</div>

			<div class="col-md-2 footer-grid">
				<h4>协议规范</h4>
				<ul>
					<li><a href="comedy.html">用户服务协议</a></li>
					<li><a href="horror.html">食品管理规范</a></li>
					<li><a href="series.html">隐私权政策</a></li>
					<li><a href="series.html">改退签服务费规范</a></li>
				</ul>
			</div>

			<div class="clearfix"></div>

		</div>
		<h3 class="text-center follow">联系 <span>我们</span></h3>
		<ul class="social-icons1 agileinfo">
			<li><a href="#"><i class="fa fa-facebook"></i></a></li>
			<li><a href="#"><i class="fa fa-twitter"></i></a></li>
			<li><a href="#"><i class="fa fa-linkedin"></i></a></li>
			<li><a href="#"><i class="fa fa-youtube"></i></a></li>
			<li><a href="#"><i class="fa fa-google-plus"></i></a></li>
		</ul>

	</div>

</div>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
				        aria-hidden="true">&times;
				</button>
				<h4 class="modal-title" id="myModalLabel"></h4>
			</div>

			<div class="modal-body" id="mtk"></div>
			<div class="modal-footer">
				<form>
					<input type="text" class="btn btn-default"
					       style="width: 500px; height: 100px; float: left;" id="messageCon">
					</input> </br>
					<input type="button" class="btn btn-primary" style="float: left;"id="subBtn" value="发布"
					data-messageboradid=messageborad.messageId>
				</form>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal -->
</div>
<%--返回顶部--%>
<a class="scroll" href="#home" id="toTop" style="display: block;">
	<span id="toTopHover" style="opacity: 1;"></span>
</a>
<script type="text/javascript">
    var date = new Date();
    var dateMonth = date.getMonth();//获取月
    var dateDay = date.getDate();//获取日
    if (date.getMonth() < 10) {
        var month = "0" + (date.getMonth() + 1);
    }
    if (date.getDate() < 10) {
        dateDay = "0" + date.getDate();
    }
    var dateToday = month + "-" + dateDay;
    var todayTime = dateToday.toString();//当天日期

    // var dateTomorrow=

    var screeningsId =${requestScope.film.filmId};
    var filmName = "${requestScope.film.filmName}";
    var filmLanguage = "${requestScope.film.filmLanguage}";


    function GetDateStr(AddDayCount) {
        var dd = new Date();
        dd.setDate(dd.getDate() + AddDayCount);//获取AddDayCount天后的日期
        var m = dd.getMonth() + 1;//获取当前月份的日期
        var d = dd.getDate();
        return m + "-" + d;
    }

    var today = GetDateStr(0);  //今天
    console.log("今天" + GetDateStr(0));
    var tomorrow = GetDateStr(1);  //明天
    console.log("明天" + GetDateStr(1));
    var afterTomorrow = GetDateStr(2);  //后天
    console.log("后天" + GetDateStr(2));

    $(function () {
        $("#span-date-today").html(GetDateStr(0));
        $("#span-date-tomorrow").html(GetDateStr(1));
        $("#span-date-after-tomorrow").html(GetDateStr(2));
    })

    //发起ajax调用show方法
    $.get("${pageContext.request.contextPath}/UserController", {
        "op": "querySlice",
        "filmName": filmName,
        "dateTime": today
    }, function (result) {
        showSliceArrangement(result);
    }, "json");

    function showSliceArrangement(result) {
        $("#SliceList").empty();
        $.each(result, function (index, slice) {
            $("#SliceList").append("<tr>\r\n" +
                "		                  <td class=\'hall-time\'><em class=\'bold\'>" + slice.startingTime + "</em>预计" + slice.endTime + "散场</td>\r\n" +
                "		                  <td>" + filmLanguage + "</td>\r\n" +
                "		                  <td>" + slice.cinema.cinemaName + "</td>\r\n" +
                "		                  <td>" + ${requestScope.film.ticketPrice} +"</td>\r\n" +
                "		                  <td><a class=\'buy-tickets-seat-btn\' " +
					"href=\'${pageContext.request.contextPath}/UserController?op=alipay&filmId=" +
					slice.film.filmId  +"&startingTime="+slice.startingTime +"&cinemaName="+slice.cinema.cinemaName +"\'>选座购票</a></td>" +
                "	               </tr>");
        });
    }


    $("#date-today").click(function () {
        $.get("${pageContext.request.contextPath}/UserController", {
            "op": "querySlice",
            "filmName": filmName,
            "dateTime": dateToday
        }, function (result) {
            showSliceArrangement(result);
        }, "json");
    })
    $("#date-tomorrow").click(function () {
        $.get("${pageContext.request.contextPath}/UserController", {
            "op": "querySlice",
            "filmName": filmName,
            "dateTime": tomorrow
        }, function (result) {
            showSliceArrangement(result);
        }, "json");
    })
    $("#date-after-tomorrow").click(function () {
        $.get("${pageContext.request.contextPath}/UserController", {
            "op": "querySlice",
            "filmName": filmName,
            "dateTime": afterTomorrow
        }, function (result) {
            showSliceArrangement(result);
        }, "json");
    })

    var key =${requestScope.film.filmId};//全局变量影片编号

    $(function () {
        $(document).on("click", "#loginBtn", function () {
            //ajax请求
            $.post("${pageContext.request.contextPath}/UserController", {
                    op: "frontLogin",
                    uname: $("#userName").val(),
                    upwd: $("#password").val()
                },
                function (data) {
                    if (data.flag) {
                        //先把首页的右上角ul标签复制到controller的字符串中,复制到记事本,把\"替换成\',直接复制过来,加上userName就行
                        var info = "<ul>\r\n" +
                            "					<li><i aria-hidden=\'true\' class=\'fa fa-phone\'></i> (+86) 182\r\n" +
                            "						5907 9225</li>\r\n" +
                            "					<li><img  src=\'${pageContext.request.contextPath}/FileDownloadServlet?fileName=" + data.users.userImg + "\'\r\n" +
                            "						style=\'width:30px;height:30px;border-radius:50%;\' onerror='this.src=\"${pageContext.request.contextPath}/front/images/5.jpg\"\'></li>\r\n" +
                            "					<li><a class=\'login\'  href=\'${pageContext.request.contextPath}/backstage/userHome.jsp\'>" + $('#userName').val() + "</a></li>\r\n" +
                            "					<li><a id=\'exit\' class=\'login reg\' >退出</a></li>\r\n" +
                            "				</ul>"
                        $("#navbar").html(info);
                        $("#myModal").modal('hide');
                        location.assign("http://localhost:8080/cdbs1.0/UserController?op=queryMovieById&filmId=${requestScope.film.filmId}");
                    } else {
                        alert("用户名或密码错误");
                    }
                }, "json");

        });

        //退出按钮实现:
        $(document).on("click", "#exit", function () {
            //ajax请求
            $.post("${pageContext.request.contextPath}/UserController", {op: "frontExit"},
                function (data) {
                    //先把首页的右上角ul标签复制到controller的字符串中,复制到记事本,把\"替换成\',直接复制过来,加上userName就行
                    var info = "<ul>\r\n" +
                        "					<li><i aria-hidden=\'true\' class=\'fa fa-phone\'></i> (+86) 009\r\n" +
                        "						455 4088</li>\r\n" +
                        "					<li><a class=\'login\' data-target=\'#myModal4\'\r\n" +
                        "						data-toggle=\'modal\' href=\'#\'>登录</a></li>\r\n" +
                        "					<li><a class=\'login reg\' data-target=\'#myModal5\'\r\n" +
                        "						data-toggle=\'modal\' href=\'#\'>注册</a></li>\r\n" +
                        "\r\n" +
                        "				</ul>";
                    $("#navbar").html(info);
                }, "text");
        })
        //对用户名做失去焦点时判断
        $("#userName1").blur(function () {
            //判断用户名是否为空
            if ($("#userName1").val().trim() == "") {
                $("#userNameTip").text("账号不能为空");
            } else {
                //发送ajax请求,用户名进行ajax验证是否可用
                $.get("${pageContext.request.contextPath}/UserController", {
                    op: "checkName",
                    uname: $("#userName1").val()
                }, function (data) {
                    $("#userNameTip").text(data);
                })

            }
        })

        //对密码做失去焦点时判断
        $("#password1").blur(function () {
            //判断密码是否为空
            if ($("#password1").val().trim() == "") {
                $("#userPwdId").text("密码不能为空");
            } else {
                if ($("#password1").val().trim().length <= 6 && $("#password1").val().indexOf(" ") == -1) {
                    $("#userPwdId").text("正确");
                } else {
                    $("#userPwdId").text("密码长度不超过6位,不能包含空格!");
                }
            }
        })

        //对确认密码做失去焦点时判断
        $("#repassword").blur(function () {
            var urepwd = $("#repassword").val();
            var password = $("#password1").val();
            //判断密码是否为空
            if (urepwd.trim() == "") {
                $("#repasswordTip").text("确认密码不能为空");
            } else {
                if (urepwd == password) {
                    $("#repasswordTip").text("两次密码一致");
                } else {
                    $("#repasswordTip").text("两次密码不一致");
                }

            }
        })
        //对确认条款做失去焦点时判断
        $("#ok").blur(function () {
            var meok = $("#ok").val();
            //判断密码是否为空
            if (meok == "checked") {
                $("#okTip").text("已同意");
            } else {
                $("#okTip").text("请确认同意使用条款和隐私政策");
            }
        })
        //最终表单提交事件
        $("#form1").submit(function () {
            //判断提示框的值就行
            if ($("#userNameTip").text() == "可用" && $("#userPwdId").text() == "正确" && $("#repasswordTip").text() == "两次密码一致" && $("#okTip").text() == "已同意") {
                /* $.post("





                ${pageContext.request.contextPath}/UserController",{op:"register",uname:$("#userName1").val(),upwd:$("#password1").val(),userImg:$("#userImg").val()},function(data){},"text");
					 $("#myModal").modal('hide'); */

                return true;
            }
            return false;
        })
        //界面一进来就发起ajax请求评论列表
        $.get("${pageContext.request.contextPath}/MessageBoardController", {"op": "messageboradQuery","filmId": key}, function (result) {
            //显示数据在tdody中,写成一个方法,以后就不用在拼接
            showData(result);
        }, "json");
        //新增评论
        $("#announce").click(function () {
            var message = $("#message").val();
            if ("${sessionScope.frontUser.userId}" != 0) {
                if (message.trim() != "") {
                    $.get("${pageContext.request.contextPath}/MessageBoardController", {
                        "op": "addMessage",
                        "filmId": key,
                        "userId": "${sessionScope.frontUser.userId}",
                        "message": message,
                        "replyMessageId": 0
                    }, function (result) {

                        if (result) {
                            $.get("${pageContext.request.contextPath}/MessageBoardController", {"op": "messageboradQuery","filmId": key,}, function (result) {
                                //显示数据在tdody中,写成一个方法,以后就不用在拼接
                                showData(result);
                            }, "json");
                        } else {
                            alert("评论失败");
                        }
                    }, "json");
                    var content = "";
                    $("#message").val(content);
                }
            } else {
                /* $(this).attr("data-toggle","modal");
				$(this).attr("data-target","#myModal4"); */
                $("#myModal4").modal("show");
            }
        });


        //回复
        $(document).on("click", "#subBtn", function () {
            var messageId = $(this).data('messageboradid');
            var mmmId = $("#mtk ul li:eq(0)").html();
            var messageCon = $("#messageCon").val();
            if ("${sessionScope.frontUser.userId}" != 0) {
                if (messageCon.trim() != "") {


                    $.get("${pageContext.request.contextPath}/MessageBoardController", {
                        "op": "addmessageBorad",
                        "filmId": key,
                        "userId": "${sessionScope.frontUser.userId}",
                        "messageCon": messageCon,
                        "reply": mmmId
                    }, function (result) {
                        if (result) {
                            $.get("${pageContext.request.contextPath}/MessageBoardController", {
                                "op": "queryMessageId",
                                "messageId": mmmId
                            }, function (result) {
                                $("#mtk").empty();
                                $.each(result, function (index, messageborad) {
                                    $("#mtk").append("<div class=\'media response-info\'>\r\n" +
                                        "							<div class=\'media-left response-text-left\'>\r\n" +
                                        "								 <img alt=\'\' class=\'media-object\'\r\n" +
                                        "                        src=\'${pageContext.request.contextPath}/FileDownloadServlet?fileName=" + messageborad.user.userImg + "\'r\n" +
                                        "				style=\'width:100px;height:100px; margin-top:5px;\' \r\n" +
                                        "		onerror=\'this.src=\"${pageContext.request.contextPath}/backstage/files/images/defaultAvatar.jpg\"\'>\r\n" + "								</a>\r\n" +
                                        "								<h5>\r\n" +
                                        "									<span >" + messageborad.user.userName + "</span>\r\n" +
                                        "								</h5>\r\n" +
                                        "							</div>\r\n" +
                                        "							<div class=\'media-body response-text-right\' id='second'>\r\n" +
                                        "								<p>" + messageborad.evaluateContent + "</p>\r\n" +
                                        "								<ul>\r\n" +
                                        "                                    <li id=\' mmmId\' style=\'display:none;\'>" + messageborad.messageId + "</li> \r\n" +
                                        "									<li>" + messageborad.evaluateDate + "</li>\r\n" +

                                        "									<li ><a id=\'del\' data-messageboradid=" + messageborad.messageId + ">删除</a></li>\r\n" +
                                        "								</ul>\r\n" +

                                        "							</div>\r\n" +
                                        "							<div class=\'clearfix\'></div>"
                                    );
                                })

                            }, "json");
                        } else {
                            aleat("回复失败");
                        }
                    }, "json");
                    var content = "";
                    $("#messageCon").val(content);
                }
            } else {
                /* $(this).attr("data-toggle","modal");
				$(this).attr("data-target","#myModal4"); */
                $("#myModal").modal("hide");
                $("#myModal4").modal("show");
            }
        })


        //二级评论查询
        $(document).on("click", "#mtkquery", function () {
            var messageId = $(this).data('messageboradid');

            $.get("${pageContext.request.contextPath}/MessageBoardController", {
                "op": "queryMessageId",
                "messageId": messageId
            }, function (result) {
                $("#mtk").empty();
                $.each(result, function (index, messageborad) {
                    $("#mtk").append("<div class=\'media response-info\'>\r\n" +
                        "							<div class=\'media-left response-text-left\'>\r\n" +
                        "								 <img alt=\'\' class=\'media-object\'\r\n" +
                        "                        src=\'${pageContext.request.contextPath}/FileDownloadServlet?fileName=" + messageborad.user.userImg + "\'r\n" +
                        "				style=\'width:100px;height:100px; margin-top:5px;\' \r\n" +
                        "		onerror=\'this.src=\"${pageContext.request.contextPath}/backstage/files/images/defaultAvatar.jpg\"\'>\r\n" +
                        "								</a>\r\n" +
                        "								<h5>\r\n" +
                        "									<span >" + messageborad.user.userName + "</span>\r\n" +
                        "								</h5>\r\n" +
                        "							</div>\r\n" +
                        "							<div class=\'media-body response-text-right\' id='second'>\r\n" +
                        "								<p>" + messageborad.evaluateContent + "</p>\r\n" +
                        "								<ul>\r\n" +
                        "                                    <li id=\' mmmId\' style=\'display:none;\'>" + messageborad.messageId + "</li> \r\n" +
                        "                                    <li id=\' usId\' style=\'display:none;\'>" + messageborad.user.userId + "</li> \r\n" +
                        "									<li>" + messageborad.evaluateDate + "</li>\r\n" +

                        "									<li ><a id=\'del\' data-messageboradid=" + messageborad.messageId + " data-userid=" + messageborad.user.userId + ">删除</a></li>\r\n" +
                        "								</ul>\r\n" +

                        "							</div>\r\n" +
                        "							<div class=\'clearfix\'></div>"
                    );
                })

            }, "json");
        })

        //点击首页跳转
        $(document).on("click", ".first", function () {
            //发送ajax请求 首页
            $.get("${pageContext.request.contextPath}/MessageBoardController", {
                "op": "messageboradQuery",
                "pageNo": 1,
                "pageSize": 4,
                "filmId": key,
            }, function (result) {
                //显示数据在tbody中,写成一个方法
                showData(result);
            }, "json");

        });
        //点击末页跳转
        $(document).on("click", ".last", function () {
            //先获取totalPage->span
            var totalPage = $("#totalPage").text();
            //发送ajax请求 首页
            $.get("${pageContext.request.contextPath}/MessageBoardController", {
                "op": "messageboradQuery",
                "pageNo": totalPage,
                "pageSize": 4,
                "filmId": key,
            }, function (result) {
                //显示数据在tbody中,写成一个方法
                showData(result);
            }, "json");
        });
        //点击下一页跳转
        $(document).on("click", ".next", function () {
            //先获取当前页
            var pageNo = $("#pageNo").text();
            //转成整数后+1就是下一页了
            var next = parseInt(pageNo) + 1;
            //发送ajax请求 首页
            $.get("${pageContext.request.contextPath}/MessageBoardController", {
                "op": "messageboradQuery",
                "pageNo": next,
                "pageSize": 4,
                "filmId": key,
            }, function (result) {
                //显示数据在tbody中,写成一个方法
                showData(result);
            }, "json");
        });


        //点击每一页跳转
        $(document).on("click", ".currentPage", function () {
            //先获取当前选中的页码
            var pageNo = $(this).text();
            //发送ajax请求 首页
            $.get("${pageContext.request.contextPath}/MessageBoardController", {
                "op": "messageboradQuery",
                "pageNo": pageNo,
                "pageSize": 4,
                "filmId": key,
            }, function (result) {
                //显示数据在tbody中,写成一个方法
                showData(result);
            }, "json");
        });
        //点击跳转页
        $(document).on("click", ".turnto", function () {
            //先获取输入框的值
            var pageNo = $("#turntoId").val();
            var totalPage = $("#totalPage").text();
            if (pageNo < 1) {
                pageNo = 1;
            } else if (pageNo > totalPage * 1) {//*1弱类型语言,字符串*1直接转数字
                pageNo = totalPage;
            }
            //发送ajax请求 首页
            $.get("${pageContext.request.contextPath}/MessageBoardController", {
                "op": "messageboradQuery",
                "pageNo": pageNo,
                "pageSize": 4,
                "filmId": key,
            }, function (result) {
                //显示数据在tbody中,写成一个方法
                showData(result);
            }, "json");
        });
        //删除评论
        //与钟民的登录整合后需要判断是否与用户id相同 才能删除
        $(document).on("click", "#delete", function () {
            var messageId = $(this).data('messageboradid');
            var userId = $(this).data('userid');
            if ("${sessionScope.frontUser.userId}" == userId) {


                console.log(messageId);
                var flag = confirm("是否删除此条评论" + messageId);
                if (flag) {
                    $.get("${pageContext.request.contextPath}/MessageBoardController", {
                        "op": "deleteMessageBorad",
                        "messageId": messageId
                    }, function (result) {
                        if (result) {
                            var pageNo = $('#pageNo').text();
                            var totalCount = $("#totalCount").text();
                            var num = Math.ceil((totalCount - 1) / 3);
                            if (pageNo > num) {
                                pageNo = num;
                            }
                            $.get("${pageContext.request.contextPath}/MessageBoardController", {
                                "op": "messageboradQuery",
                                "pageNo": pageNo,
                                "pageSize": 4,
                                "filmId": key,
                            }, function (result) {
                                //显示数据在tbody中,写成一个方法
                                showData(result);
                            }, "json");

                        }

                    }, "json");
                }
            }

        })

        //二级删除评论
        //删除回复评论 与钟民的登录整合后需要判断是否与第一条用户id相同 才能删除其他的评论 否则只能删除自己的评论
        $(document).on("click", "#del", function () {
            var messageId = $(this).data('messageboradid');
            var mmmId = $("#mtk ul li:eq(0)").html();
            var usId = $("#mtk ul li:eq(1)").html();
            var uId = $(this).data('userid');
            if (messageId != mmmId) {

                if ("${sessionScope.frontUser.userId}" == usId || "${sessionScope.frontUser.userId}" == uId) {
                    var flag = confirm("是否删除此条评论" + messageId);
                    if (flag) {
                        $.get("${pageContext.request.contextPath}/MessageBoardController", {
                            "op": "deleteMessageBorad",
                            "messageId": messageId
                        }, function (result) {
                            if (result) {
                                $.get("${pageContext.request.contextPath}/MessageBoardController", {
                                    "op": "queryMessageId",
                                    "messageId": mmmId
                                }, function (result) {
                                    $("#mtk").empty();
                                    $.each(result, function (index, messageborad) {
                                        $("#mtk").append("<div class=\'media response-info\'>\r\n" +
                                            "							<div class=\'media-left response-text-left\'>\r\n" +
                                            "								 <img alt=\'\' class=\'media-object\'\r\n" +
                                            "                        src=\'${pageContext.request.contextPath}/FileDownloadServlet?fileName=" + messageborad.user.userImg + "\'r\n" +
                                            "				style=\'width:70px;height:70px; margin-top:5px;\' \r\n" +
                                            "		onerror=\'this.src=\"${pageContext.request.contextPath}/backstage/files/images/defaultAvatar.jpg\"\'>\r\n" +
                                            "								</a>\r\n" +
                                            "								<h5>\r\n" +
                                            "									<span >" + messageborad.user.userName + "</span>\r\n" +
                                            "								</h5>\r\n" +
                                            "							</div>\r\n" +
                                            "							<div class=\'media-body response-text-right\' id='second'>\r\n" +
                                            "								<p>" + messageborad.evaluateContent + "</p>\r\n" +
                                            "								<ul>\r\n" +
                                            "                                    <li id=\' mmmId\' style=\'display:none;\'>" + messageborad.messageId + "</li> \r\n" +
                                            "                                    <li id=\' usId\' style=\'display:none;\'>" + messageborad.user.userId + "</li> \r\n" +
                                            "									<li>" + messageborad.evaluateDate + "</li>\r\n" +

                                            "									<li ><a id=\'del\' data-messageboradid=" + messageborad.messageId + " data-userid=" + messageborad.user.userId + ">删除</a></li>\r\n" +
                                            "								</ul>\r\n" +

                                            "							</div>\r\n" +
                                            "							<div class=\'clearfix\'></div>"
                                        );
                                    })


                                }, "json");
                            }

                        }, "json");
                    }
                }
            }

        })


    })

    //显示数据
    function showData(result) {
        //每一次遍历之前需要清空
        $("#articleList").empty();
        $("#showPageInfo").empty();
        $("#pageItem").empty();
        //显示评论列表数据
        $.each(result.data, function (index, messageborad) {
            $("#articleList").append("<div class=\'media response-info\'>\r\n" +
                "							<div class=\'media-left response-text-left\'>\r\n" +
                "								 <img alt=\'\' class=\'media-object\'\r\n" +
                "									src=\'${pageContext.request.contextPath}/FileDownloadServlet?fileName=" + messageborad.user.userImg + "\'r\n" +
                "				style=\'width:100px;height:100px; margin-top:5px;\' \r\n" +
                "		onerror=\'this.src=\"${pageContext.request.contextPath}/backstage/files/images/defaultAvatar.jpg\"\'>\r\n" +
                "								</a>\r\n" +
                "								<h5>\r\n" +
                "									<span>" + messageborad.user.userName + "</span>\r\n" +
                "								</h5>\r\n" +
                "							</div>\r\n" +
                "							<div class=\'media-body response-text-right\' id='second'>\r\n" +
                "								<p>" + messageborad.evaluateContent + "</p>\r\n" +
                "								<ul>\r\n" +
                "									<li>" + messageborad.evaluateDate + "</li>\r\n" +

                "									<li ><a id=\'delete\' data-messageboradid=" + messageborad.messageId + " data-userid=" + messageborad.user.userId + "><i aria-hidden=\'true\'\r\n" +
                "											></i> 删除</a></li>\r\n" +
                "								</ul>\r\n" +
                "                               <button type=\'button\' class=\'btn btn-danger btn-sm\' data-toggle=\'modal\' data-target=\'#myModal\' id=\'mtkquery\' data-messageboradid=" + messageborad.messageId + ">查看回复</button> \r\n" +
                "							</div>\r\n" +
                "							<div class=\'clearfix\'></div>");

        });
        //显示分页信息
        $("#showPageInfo").append("当前第<span id='pageNo'>" + result.pageNo +
            "</span>页/共<span id='totalPage'>" + result.totalPage +
            "</span>页/每页显示<span id='pageSize'>" + result.pageSize +
            "</span>页/共<span id='totalCount'>" + result.totalCount + "</span>条");


        //首页
        if (1 == result.pageNo) {
            $("#pageItem").append('<li class="disabled"><a>首页</a></li>');
        } else {
            $("#pageItem").append('<li class="first"><a>首页</a></li>');
        }
        //分页栏目
        for (var i = 1; i <= result.totalPage; i++) {
            if (i == result.pageNo) {
                $("#pageItem").append('<li class="active"><a>' + i + '</a></li>');
            } else {
                $("#pageItem").append('<li class="currentPage"><a>' + i + '</a></li>');
            }
        }
        //下一页
        if (result.totalPage == result.pageNo) {
            $("#pageItem").append('<li class="disabled"><a>next</a></li>');
        } else {
            $("#pageItem").append('<li class="next"><a>next</a></li>');
        }
        //末页
        if (result.totalPage == result.pageNo) {
            $("#pageItem").append('<li class="disabled"><a>末页</a></li>');
        } else {
            $("#pageItem").append('<li class="last"><a>末页</a></li>');
        }
        //跳转页

        $("#pageItem").append('<li><a><input id="turntoId" style="height:20px;width:45px" type="number" min="1" max="' + result.totalPage + '"></a></li>');
        $("#pageItem").append('<li><a class="turnto">跳转</a></li>');
    }
</script>
<%--下面是没用的js语句--%>
<%--<script>
	$(document).ready(function () {
		$(".dropdown").hover(
			function () {
				$('.dropdown-menu', this).stop(true, true).slideDown("fast");
				$(this).toggleClass('open');
			},
			function () {
				$('.dropdown-menu', this).stop(true, true).slideUp("fast");
				$(this).toggleClass('open');
			}
		);
	});
</script>--%>
<%--<script src="${pageContext.request.contextPath}js/main.js"></script>--%>

<%--<script>
	$("document").ready(function () {
		$("#video").simplePlayer();
	});
</script>
<script>
	$("document").ready(function () {
		$("#video1").simplePlayer();
	});
</script>
<script>
	$("document").ready(function () {
		$("#video2").simplePlayer();
	});
</script>
<script>
	$("document").ready(function () {
		$("#video3").simplePlayer();
	});
</script>
<script>
	$("document").ready(function () {
		$("#video4").simplePlayer();
	});
</script>
<script>
	$("document").ready(function () {
		$("#video5").simplePlayer();
	});
</script>
<script>
	$("document").ready(function () {
		$("#video6").simplePlayer();
	});
</script>
<script>
	$("document").ready(function () {
		$("#video6").simplePlayer();
	});
</script>--%>
<script src="${pageContext.request.contextPath}/front/js/jquery.magnific-popup.js"
        type="text/javascript"></script>
<div class="mfp-hide" id="small-dialog1">
	<iframe src=""></iframe>
</div>
<div class="mfp-hide" id="small-dialog2">
	<iframe src=""></iframe>
</div>
<%--<script>
	$(document).ready(function () {
		$('.w3_play_icon,.w3_play_icon1,.w3_play_icon2').magnificPopup({
			type: 'inline',
			fixedContentPos: false,
			fixedBgPos: true,
			overflowY: 'auto',
			closeBtnInside: true,
			preloader: false,
			midClick: true,
			removalDelay: 300,
			mainClass: 'my-mfp-zoom-in'
		});

	});
</script>--%>
<script src="${pageContext.request.contextPath}/front/js/easy-responsive-tabs.js"></script>
<%--<script>
	$(document).ready(function () {
		$('#horizontalTab').easyResponsiveTabs({
			type: 'default', //Types: default, vertical, accordion
			width: 'auto', //auto or any width like 600px
			fit: true,   // 100% fit in a container
			closed: 'accordion', // Start closed if in accordion view
			activate: function (event) { // Callback function if tab is switched
				var $tab = $(this);
				var $info = $('#tabInfo');
				var $name = $('span', $info);
				$name.text($tab.text());
				$info.show();
			}
		});
		$('#verticalTab').easyResponsiveTabs({
			type: 'vertical',
			width: 'auto',
			fit: true
		});
	});
</script>--%>
<link href="${pageContext.request.contextPath}/front/css/owl.carousel.css" media="all" rel="stylesheet"
      type="text/css">
<script src="${pageContext.request.contextPath}/front/js/owl.carousel.js"></script>
<%--<script>
	$(document).ready(function () {
		$("#owl-demo").owlCarousel({

			autoPlay: 3000, //Set AutoPlay to 3 seconds
			autoPlay: true,
			navigation: true,

			items: 5,
			itemsDesktop: [640, 4],
			itemsDesktopSmall: [414, 3]

		});

	});
</script>--%>
<script src="${pageContext.request.contextPath}/front/js/move-top.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/front/js/easing.js" type="text/javascript"></script>
<%--<script type="text/javascript">
	jQuery(document).ready(function ($) {
		$(".scroll").click(function (event) {
			event.preventDefault();
			$('html,body').animate({scrollTop: $(this.hash).offset().top}, 900);
		});
	});
</script>
<script type="text/javascript">
	$(document).ready(function () {
		/*
		var defaults = {
			  containerID: 'toTop', // fading element id
			containerHoverID: 'toTopHover', // fading element hover id
			scrollSpeed: 1200,
			easingType: 'linear'
		 };
		*/

		$().UItoTop({easingType: 'easeOutQuart'});

	});
</script>--%>
<script src="${pageContext.request.contextPath}/front/js/bootstrap.js"></script>
</body>

</html>