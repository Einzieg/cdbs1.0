<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!-- 主页-有关电影的详情 -->
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
	<title>Home</title>
	<!-- for-mobile-apps -->
	<meta content="width=device-width, initial-scale=1" name="viewport">
	<meta content="text/html; charset=utf-8" http-equiv="Content-Type"/>
	<meta name=""/>
	<script src="${pageContext.request.contextPath}/front/js/jquery-3.6.0.js"></script>
	<script type="text/javascript"
	        src="https://api.map.baidu.com/api?v=1.0&&type=webgl&ak=IEuyGsGABYoun2GcTMMfWWnnGE3SStyN"></script>
	<script src="${pageContext.request.contextPath}/front/js/jquery.magnific-popup.js" type="text/javascript"></script>
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
<!--/main-header-->
<!--/轮播图-->
<div id="demo-1"
     data-zs-src='["images/marvellogo_0.jpg", "images/15-1Z12QFH0.jpg", "images/Cf1b9d16fdfaaf51da88d3d58c5494eef01f7a74.jpg","images/160230lwr0qoiktizwqkkt.jpg"]'
     data-zs-overlay="dots">
	<div class="demo-inner-content">
		<!--/header-w3l-->
		<div class="header-w3-agileits" id="home">
			<div class="inner-header-agile">
				<nav class="navbar navbar-default">
					<div class="navbar-header">
						<button class="navbar-toggle" data-target="#bs-example-navbar-collapse-1"
						        data-toggle="collapse" type="button">
							<span class="sr-only">Toggle navigation</span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
						</button>
						<h1><a href="index.jsp"><span>淘</span>喵喵 <span>影院</span></a></h1>
					</div>
					<!-- navbar-header -->
					<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
						<ul class="nav navbar-nav">
							<li class="active"><a href="index.jsp">主页</a></li>
							<li class="dropdown">
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
							</li>
							<!--<li><a href="series.html">tv - series</a></li>-->
							<!--<li><a href="news.html">news</a></li>-->
							<li class="dropdown">
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
							</li>
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
							<input name="Search" placeholder="搜索..." type="search">
						</form>
					</div>
				</div>

			</div>

		</div>
		<!--//header-w3l-->
		<!--/banner-info-->
		<!--主页轮播图上的字段-->
		<div class="baner-info">
			<h3> 火热<span>上映</span> <span></span></h3>
			<h4>In space no one can hear you scream.</h4>
			<!--<a class="w3_play_icon1" href="#small-dialog1">
				Watch Trailer
			</a>-->
		</div>
		<!--/banner-ingo-->
	</div>
</div>
<!--/banner-section-->
<!--//main-header-->
<!--/banner-bottom-->
<div class="w3_agilits_banner_bootm">
	<div class="w3_agilits_inner_bottom">
		<div class="col-md-6 wthree_agile_login" id="navbar">
			<c:if test="${sessionScope.frontUser==null }">
				<ul>
					<li><i aria-hidden="true" class="fa fa-phone"></i> (+86) 182
						5907 9225
					</li>
					<li><a class="login" data-target="#myModal4"
					       data-toggle="modal" href="#">登录</a></li>
					<li><a class="login reg" data-target="#myModal5"
					       data-toggle="modal" href="#">注册</a></li>

				</ul>
			</c:if>
			<c:if test="${sessionScope.frontUser!=null }">
				<ul>
					<li><i aria-hidden="true" class="fa fa-phone"></i> (+86)
						182 5907 9225
					</li>
					<li><img
							src="${pageContext.request.contextPath}/FileDownloadServlet?fileName=${sessionScope.frontUser.userImg}"
							style="width:30px;height:30px;border-radius:50%;"
							onerror="this.src='${pageContext.request.contextPath}/front/images/5.jpg'"></li>
					<li><a class="login"
					       href="${pageContext.request.contextPath}/front/userHome.jsp">${sessionScope.frontUser.userName}</a>
					</li>
					<li><a id="exit" class="login reg">退出</a></li>
				</ul>
			</c:if>
		</div>
		<div class="col-md-6 wthree_share_agile">

			<div class="single-agile-shar-buttons">
				<ul>
					<li>
						<div class="fb-like" data-action="like" data-href=""
						     data-layout="button_count" data-share="false"
						     data-show-faces="false" data-size="small"></div>

					</li>
					<li>
						<div class="fb-share-button" data-href=""
						     data-layout="button_count" data-mobile-iframe="true"
						     data-size="small">

						</div>
					</li>
					<a class="login reg" data-toggle="modal" data-target="#myModal8" style="margin-right: 0px"
					   id="btnModal">地址
					</a>
				</ul>

			</div>

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
							name="password" placeholder="请输入密码" required=""
							type="password" id="password" value="${password}">
						<div class="tp">
							<input type="button" value="登录" id="loginBtn"
							       data-dismiss="modal"
							       style="outline: none; padding: 0.9em 0; width: 100%; text-align: center; font-size: 1em; margin-top: 1em; border: none; color: #FFFFFF; cursor: pointer; background: #02a388; box-shadow: 0px 2px 1px rgb(28 28 29/ 42%); border-radius: 50px;">
						</div>
						<div class="forgot-grid">
							<div class="log-check">
								<c:if test="${checked == 'checked'}">
									<label class="checkbox"><input name="remember-me" class="checkbox" type="checkbox"
									                               checked
									/>记住我</label>
								</c:if>
								<c:if test="${checked != 'checked'}">
									<label class="checkbox"><input name="remember-me" class="checkbox" type="checkbox"
									/>记住我</label>
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
		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button class="close" data-dismiss="modal" type="button">&times;</button>
				<h4>注册</h4>
				<div class="login-form">
					<form action="${pageContext.request.contextPath}/UserController?op=register"
					      method="post" enctype="multipart/form-data" id="form1">
						<div class="inputBox">
							<input name="userName2" placeholder="用户名" required="" type="text"
							       id="userName1"/> <label id="userNameTip"></label>
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
							<input name="sex" type="radio" value="1" checked/>男
							<input name="sex" type="radio" value="0"/>女
						</div>
						<div>
							<p id="repasswordTip" style="padding: 13px">上传头像</p><input type="file" name="userImg2"
							                                                           id="userImg"
							                                                           style="padding: 13px">
						</div>
						<div class="signin-rit">
								<span class="agree-checkbox"> <label class="checkbox">
										<input type="checkbox" id="ok" value="checked"/>我同意您的 <a class="w3layouts-t"
										                                                         href="#"
										                                                         target="_blank">使用条款</a> 和 <a
										class="w3layouts-t"
										href="#" target="_blank">隐私政策</a>
								</label><label id="okTip"></label>
								</span>
						</div>

						<div class="tp">
							<input type="submit" value="立即注册" id="regForm"
							>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- //Modal1 -->
<!--/content-inner-section-->
<div class="w3_content_agilleinfo_inner">
	<div class="agile_featured_movies">
		<!--/agileinfo_tabs-->
		<!--<div class="agileinfo_tabs">
			&lt;!&ndash;/tab-section&ndash;&gt;
			<div id="horizontalTab">
				<ul class="resp-tabs-list">
					<li>Recent</li>
					<li>Popularity</li>
					<li>Top Rating</li>

				</ul>
				<div class="resp-tabs-container">
					<div class="tab1">
						<div class="tab_movies_agileinfo">
							<div class="w3_agile_featured_movies">

								<div class="col-md-12 wthree_agile-movies_list">
									<div class="w3l-movie-gride-agile">
										<a class="hvr-sweep-to-bottom" href="single.jsp"><img alt=" "
												class="img-responsive" src="images/m1.jpg" title="Movies Pro">
											<div class="w3l-action-icon"><i aria-hidden="true"
													class="fa fa-play-circle-o"></i></div>
										</a>
										<div class="mid-1 agileits_w3layouts_mid_1_home">
											<div class="w3l-movie-text">
												<h6><a href="single.jsp">Swiss Army Man </a></h6>
											</div>
											<div class="mid-2 agile_mid_2_home">
												<p>2016</p>
												<div class="block-stars">
													<ul class="w3l-ratings">
														<li><a href="#"><i aria-hidden="true"
																	class="fa fa-star"></i></a></li>
														<li><a href="#"><i aria-hidden="true"
																	class="fa fa-star"></i></a></li>
														<li><a href="#"><i aria-hidden="true"
																	class="fa fa-star-o"></i></a>
														</li>
														<li><a href="#"><i aria-hidden="true"
																	class="fa fa-star-o"></i></a>
														</li>
														<li><a href="#"><i aria-hidden="true"
																	class="fa fa-star-o"></i></a>
														</li>
													</ul>
												</div>
												<div class="clearfix"></div>
											</div>
										</div>
										<div class="ribben">
											<p>NEW</p>
										</div>
									</div>
									<div class="w3l-movie-gride-agile">
										<a class="hvr-sweep-to-bottom" href="single.jsp"><img alt=" "
												class="img-responsive" src="images/m2.jpg" title="Movies Pro">
											<div class="w3l-action-icon"><i aria-hidden="true"
													class="fa fa-play-circle-o"></i></div>
										</a>
										<div class="mid-1 agileits_w3layouts_mid_1_home">
											<div class="w3l-movie-text">
												<h6><a href="single.jsp">Me Before you</a></h6>
											</div>
											<div class="mid-2 agile_mid_2_home">
												<p>2016</p>
												<div class="block-stars">
													<ul class="w3l-ratings">
														<li><a href="#"><i aria-hidden="true"
																	class="fa fa-star"></i></a></li>
														<li><a href="#"><i aria-hidden="true"
																	class="fa fa-star"></i></a></li>
														<li><a href="#"><i aria-hidden="true"
																	class="fa fa-star-o"></i></a>
														</li>
														<li><a href="#"><i aria-hidden="true"
																	class="fa fa-star-o"></i></a>
														</li>
														<li><a href="#"><i aria-hidden="true"
																	class="fa fa-star-o"></i></a>
														</li>
													</ul>
												</div>
												<div class="clearfix"></div>
											</div>
										</div>
										<div class="ribben">
											<p>NEW</p>
										</div>
									</div>
									<div class="w3l-movie-gride-agile">
										<a class="hvr-sweep-to-bottom" href="single.jsp"><img alt=" "
												class="img-responsive" src="images/m3.jpg" title="Movies Pro">
											<div class="w3l-action-icon"><i aria-hidden="true"
													class="fa fa-play-circle-o"></i></div>
										</a>
										<div class="mid-1 agileits_w3layouts_mid_1_home">
											<div class="w3l-movie-text">
												<h6><a href="single.jsp">Deadpool</a></h6>
											</div>
											<div class="mid-2 agile_mid_2_home">
												<p>2016</p>
												<div class="block-stars">
													<ul class="w3l-ratings">
														<li><a href="#"><i aria-hidden="true"
																	class="fa fa-star"></i></a></li>
														<li><a href="#"><i aria-hidden="true"
																	class="fa fa-star"></i></a></li>
														<li><a href="#"><i aria-hidden="true"
																	class="fa fa-star-o"></i></a>
														</li>
														<li><a href="#"><i aria-hidden="true"
																	class="fa fa-star-o"></i></a>
														</li>
														<li><a href="#"><i aria-hidden="true"
																	class="fa fa-star-o"></i></a>
														</li>
													</ul>
												</div>
												<div class="clearfix"></div>
											</div>
										</div>
										<div class="ribben">
											<p>NEW</p>
										</div>
									</div>
									<div class="w3l-movie-gride-agile">
										<a class="hvr-sweep-to-bottom" href="single.jsp"><img alt=" "
												class="img-responsive" src="images/m4.jpg" title="Movies Pro">
											<div class="w3l-action-icon"><i aria-hidden="true"
													class="fa fa-play-circle-o"></i></div>
										</a>
										<div class="mid-1 agileits_w3layouts_mid_1_home">
											<div class="w3l-movie-text">
												<h6><a href="single.jsp">Rogue One </a></h6>
											</div>
											<div class="mid-2 agile_mid_2_home">
												<p>2016</p>
												<div class="block-stars">
													<ul class="w3l-ratings">
														<li><a href="#"><i aria-hidden="true"
																	class="fa fa-star"></i></a></li>
														<li><a href="#"><i aria-hidden="true"
																	class="fa fa-star"></i></a></li>
														<li><a href="#"><i aria-hidden="true"
																	class="fa fa-star-o"></i></a>
														</li>
														<li><a href="#"><i aria-hidden="true"
																	class="fa fa-star-o"></i></a>
														</li>
														<li><a href="#"><i aria-hidden="true"
																	class="fa fa-star-o"></i></a>
														</li>
													</ul>
												</div>
												<div class="clearfix"></div>
											</div>
										</div>
										<div class="ribben">
											<p>NEW</p>
										</div>
									</div>
									<div class="w3l-movie-gride-agile">
										<a class="hvr-sweep-to-bottom" href="single.jsp"><img alt=" "
												class="img-responsive" src="images/m5.jpg" title="Movies Pro">
											<div class="w3l-action-icon"><i aria-hidden="true"
													class="fa fa-play-circle-o"></i></div>
										</a>
										<div class="mid-1 agileits_w3layouts_mid_1_home">
											<div class="w3l-movie-text">
												<h6><a href="single.jsp">Storks </a></h6>
											</div>
											<div class="mid-2 agile_mid_2_home">
												<p>2016</p>
												<div class="block-stars">
													<ul class="w3l-ratings">
														<li><a href="#"><i aria-hidden="true"
																	class="fa fa-star"></i></a></li>
														<li><a href="#"><i aria-hidden="true"
																	class="fa fa-star"></i></a></li>
														<li><a href="#"><i aria-hidden="true"
																	class="fa fa-star-o"></i></a>
														</li>
														<li><a href="#"><i aria-hidden="true"
																	class="fa fa-star-o"></i></a>
														</li>
														<li><a href="#"><i aria-hidden="true"
																	class="fa fa-star-o"></i></a>
														</li>
													</ul>
												</div>
												<div class="clearfix"></div>
											</div>
										</div>
										<div class="ribben">
											<p>NEW</p>
										</div>
									</div>
									<div class="w3l-movie-gride-agile">
										<a class="hvr-sweep-to-bottom" href="single.jsp"><img alt=" "
												class="img-responsive" src="images/m6.jpg" title="Movies Pro">
											<div class="w3l-action-icon"><i aria-hidden="true"
													class="fa fa-play-circle-o"></i></div>
										</a>
										<div class="mid-1 agileits_w3layouts_mid_1_home">
											<div class="w3l-movie-text">
												<h6><a href="single.jsp">Hopeless</a></h6>
											</div>
											<div class="mid-2 agile_mid_2_home">
												<p>2016</p>
												<div class="block-stars">
													<ul class="w3l-ratings">
														<li><a href="#"><i aria-hidden="true"
																	class="fa fa-star"></i></a></li>
														<li><a href="#"><i aria-hidden="true"
																	class="fa fa-star"></i></a></li>
														<li><a href="#"><i aria-hidden="true"
																	class="fa fa-star-o"></i></a>
														</li>
														<li><a href="#"><i aria-hidden="true"
																	class="fa fa-star-o"></i></a>
														</li>
														<li><a href="#"><i aria-hidden="true"
																	class="fa fa-star-o"></i></a>
														</li>
													</ul>
												</div>
												<div class="clearfix"></div>
											</div>
										</div>
										<div class="ribben">
											<p>NEW</p>
										</div>
									</div>
									<div class="w3l-movie-gride-agile">
										<a class="hvr-sweep-to-bottom" href="single.jsp"><img alt=" "
												class="img-responsive" src="images/m7.jpg" title="Movies Pro">
											<div class="w3l-action-icon"><i aria-hidden="true"
													class="fa fa-play-circle-o"></i></div>
										</a>
										<div class="mid-1 agileits_w3layouts_mid_1_home">
											<div class="w3l-movie-text">
												<h6><a href="single.jsp">Mechanic</a></h6>
											</div>
											<div class="mid-2 agile_mid_2_home">
												<p>2016</p>
												<div class="block-stars">
													<ul class="w3l-ratings">
														<li><a href="#"><i aria-hidden="true"
																	class="fa fa-star"></i></a></li>
														<li><a href="#"><i aria-hidden="true"
																	class="fa fa-star"></i></a></li>
														<li><a href="#"><i aria-hidden="true"
																	class="fa fa-star-o"></i></a>
														</li>
														<li><a href="#"><i aria-hidden="true"
																	class="fa fa-star-o"></i></a>
														</li>
														<li><a href="#"><i aria-hidden="true"
																	class="fa fa-star-o"></i></a>
														</li>
													</ul>
												</div>
												<div class="clearfix"></div>
											</div>
										</div>
										<div class="ribben">
											<p>NEW</p>
										</div>
									</div>
									<div class="w3l-movie-gride-agile">
										<a class="hvr-sweep-to-bottom" href="single.jsp"><img alt=" "
												class="img-responsive" src="images/m8.jpg" title="Movies Pro">
											<div class="w3l-action-icon"><i aria-hidden="true"
													class="fa fa-play-circle-o"></i></div>
										</a>
										<div class="mid-1 agileits_w3layouts_mid_1_home">
											<div class="w3l-movie-text">
												<h6><a href="single.jsp">Timeless</a></h6>
											</div>
											<div class="mid-2 agile_mid_2_home">
												<p>2016</p>
												<div class="block-stars">
													<ul class="w3l-ratings">
														<li><a href="#"><i aria-hidden="true"
																	class="fa fa-star"></i></a></li>
														<li><a href="#"><i aria-hidden="true"
																	class="fa fa-star"></i></a></li>
														<li><a href="#"><i aria-hidden="true"
																	class="fa fa-star-o"></i></a>
														</li>
														<li><a href="#"><i aria-hidden="true"
																	class="fa fa-star-o"></i></a>
														</li>
														<li><a href="#"><i aria-hidden="true"
																	class="fa fa-star-o"></i></a>
														</li>
													</ul>
												</div>
												<div class="clearfix"></div>
											</div>
										</div>
										<div class="ribben">
											<p>NEW</p>
										</div>
									</div>
								</div>
								<div class="clearfix"></div>
							</div>
							<div class="cleafix"></div>
						</div>
					</div>
					<div class="tab2">
						<div class="tab_movies_agileinfo">
							<div class="w3_agile_featured_movies">
								<div class="col-md-5 video_agile_player">
									<div class="video-grid-single-page-agileits">
										<div data-video="fNKUgX8PhMA" id="video1"><img alt="" class="img-responsive"
												src="images/22.jpg" /></div>
									</div>


									<div class="player-text">
										<p class="fexi_header">Me Before You </p>
										<p class="fexi_header_para"><span class="conjuring_w3">Story
												Line<label>:</label></span>Me Before You
											Official Trailer #2 (2016) - Emilia Clarke, Sam Claflin Movie HD

											A girl in a small town forms an unlikely bond with a recently-paralyzed
											man
											she's taking care of....</p>
										<p class="fexi_header_para"><span>Release On<label>:</label></span>Feb 3,
											2016
										</p>
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
									</div>

								</div>
								<div class="col-md-7 wthree_agile-movies_list">
									<div class="w3l-movie-gride-agile">
										<a class="hvr-sweep-to-bottom" href="single.jsp"><img alt=" "
												class="img-responsive" src="images/m9.jpg" title="Movies Pro">
											<div class="w3l-action-icon"><i aria-hidden="true"
													class="fa fa-play-circle-o"></i></div>
										</a>
										<div class="mid-1 agileits_w3layouts_mid_1_home">
											<div class="w3l-movie-text">
												<h6><a href="single.jsp">Inferno</a></h6>
											</div>
											<div class="mid-2 agile_mid_2_home">
												<p>2016</p>
												<div class="block-stars">
													<ul class="w3l-ratings">
														<li><a href="#"><i aria-hidden="true"
																	class="fa fa-star"></i></a></li>
														<li><a href="#"><i aria-hidden="true"
																	class="fa fa-star"></i></a></li>
														<li><a href="#"><i aria-hidden="true"
																	class="fa fa-star-o"></i></a>
														</li>
														<li><a href="#"><i aria-hidden="true"
																	class="fa fa-star-o"></i></a>
														</li>
														<li><a href="#"><i aria-hidden="true"
																	class="fa fa-star-o"></i></a>
														</li>
													</ul>
												</div>
												<div class="clearfix"></div>
											</div>
										</div>
										<div class="ribben">
											<p>NEW</p>
										</div>
									</div>
									<div class="w3l-movie-gride-agile">
										<a class="hvr-sweep-to-bottom" href="single.jsp"><img alt=" "
												class="img-responsive" src="images/m10.jpg" title="Movies Pro">
											<div class="w3l-action-icon"><i aria-hidden="true"
													class="fa fa-play-circle-o"></i></div>
										</a>
										<div class="mid-1 agileits_w3layouts_mid_1_home">
											<div class="w3l-movie-text">
												<h6><a href="single.jsp">Now You See Me 2</a></h6>
											</div>
											<div class="mid-2 agile_mid_2_home">
												<p>2016</p>
												<div class="block-stars">
													<ul class="w3l-ratings">
														<li><a href="#"><i aria-hidden="true"
																	class="fa fa-star"></i></a></li>
														<li><a href="#"><i aria-hidden="true"
																	class="fa fa-star"></i></a></li>
														<li><a href="#"><i aria-hidden="true"
																	class="fa fa-star-o"></i></a>
														</li>
														<li><a href="#"><i aria-hidden="true"
																	class="fa fa-star-o"></i></a>
														</li>
														<li><a href="#"><i aria-hidden="true"
																	class="fa fa-star-o"></i></a>
														</li>
													</ul>
												</div>
												<div class="clearfix"></div>
											</div>
										</div>
										<div class="ribben">
											<p>NEW</p>
										</div>
									</div>
									<div class="w3l-movie-gride-agile">
										<a class="hvr-sweep-to-bottom" href="single.jsp"><img alt=" "
												class="img-responsive" src="images/m11.jpg" title="Movies Pro">
											<div class="w3l-action-icon"><i aria-hidden="true"
													class="fa fa-play-circle-o"></i></div>
										</a>
										<div class="mid-1 agileits_w3layouts_mid_1_home">
											<div class="w3l-movie-text">
												<h6><a href="single.jsp">Warcraft</a></h6>
											</div>
											<div class="mid-2 agile_mid_2_home">
												<p>2016</p>
												<div class="block-stars">
													<ul class="w3l-ratings">
														<li><a href="#"><i aria-hidden="true"
																	class="fa fa-star"></i></a></li>
														<li><a href="#"><i aria-hidden="true"
																	class="fa fa-star"></i></a></li>
														<li><a href="#"><i aria-hidden="true"
																	class="fa fa-star-o"></i></a>
														</li>
														<li><a href="#"><i aria-hidden="true"
																	class="fa fa-star-o"></i></a>
														</li>
														<li><a href="#"><i aria-hidden="true"
																	class="fa fa-star-o"></i></a>
														</li>
													</ul>
												</div>
												<div class="clearfix"></div>
											</div>
										</div>
										<div class="ribben">
											<p>NEW</p>
										</div>
									</div>
									<div class="w3l-movie-gride-agile">
										<a class="hvr-sweep-to-bottom" href="single.jsp"><img alt=" "
												class="img-responsive" src="images/m12.jpg" title="Movies Pro">
											<div class="w3l-action-icon"><i aria-hidden="true"
													class="fa fa-play-circle-o"></i></div>
										</a>
										<div class="mid-1 agileits_w3layouts_mid_1_home">
											<div class="w3l-movie-text">
												<h6><a href="single.jsp">Money Monster</a></h6>
											</div>
											<div class="mid-2 agile_mid_2_home">
												<p>2016</p>
												<div class="block-stars">
													<ul class="w3l-ratings">
														<li><a href="#"><i aria-hidden="true"
																	class="fa fa-star"></i></a></li>
														<li><a href="#"><i aria-hidden="true"
																	class="fa fa-star"></i></a></li>
														<li><a href="#"><i aria-hidden="true"
																	class="fa fa-star-o"></i></a>
														</li>
														<li><a href="#"><i aria-hidden="true"
																	class="fa fa-star-o"></i></a>
														</li>
														<li><a href="#"><i aria-hidden="true"
																	class="fa fa-star-o"></i></a>
														</li>
													</ul>
												</div>
												<div class="clearfix"></div>
											</div>
										</div>
										<div class="ribben">
											<p>NEW</p>
										</div>
									</div>
									<div class="w3l-movie-gride-agile">
										<a class="hvr-sweep-to-bottom" href="single.jsp"><img alt=" "
												class="img-responsive" src="images/m13.jpg" title="Movies Pro">
											<div class="w3l-action-icon"><i aria-hidden="true"
													class="fa fa-play-circle-o"></i></div>
										</a>
										<div class="mid-1 agileits_w3layouts_mid_1_home">
											<div class="w3l-movie-text">
												<h6><a href="single.jsp">Ghostbuster</a></h6>
											</div>
											<div class="mid-2 agile_mid_2_home">
												<p>2016</p>
												<div class="block-stars">
													<ul class="w3l-ratings">
														<li><a href="#"><i aria-hidden="true"
																	class="fa fa-star"></i></a></li>
														<li><a href="#"><i aria-hidden="true"
																	class="fa fa-star"></i></a></li>
														<li><a href="#"><i aria-hidden="true"
																	class="fa fa-star-o"></i></a>
														</li>
														<li><a href="#"><i aria-hidden="true"
																	class="fa fa-star-o"></i></a>
														</li>
														<li><a href="#"><i aria-hidden="true"
																	class="fa fa-star-o"></i></a>
														</li>
													</ul>
												</div>
												<div class="clearfix"></div>
											</div>
										</div>
										<div class="ribben">
											<p>NEW</p>
										</div>
									</div>
									<div class="w3l-movie-gride-agile">
										<a class="hvr-sweep-to-bottom" href="single.jsp"><img alt=" "
												class="img-responsive" src="images/m14.jpg" title="Movies Pro">
											<div class="w3l-action-icon"><i aria-hidden="true"
													class="fa fa-play-circle-o"></i></div>
										</a>
										<div class="mid-1 agileits_w3layouts_mid_1_home">
											<div class="w3l-movie-text">
												<h6><a href="single.jsp">Rambo 4</a></h6>
											</div>
											<div class="mid-2 agile_mid_2_home">
												<p>2016</p>
												<div class="block-stars">
													<ul class="w3l-ratings">
														<li><a href="#"><i aria-hidden="true"
																	class="fa fa-star"></i></a></li>
														<li><a href="#"><i aria-hidden="true"
																	class="fa fa-star"></i></a></li>
														<li><a href="#"><i aria-hidden="true"
																	class="fa fa-star-o"></i></a>
														</li>
														<li><a href="#"><i aria-hidden="true"
																	class="fa fa-star-o"></i></a>
														</li>
														<li><a href="#"><i aria-hidden="true"
																	class="fa fa-star-o"></i></a>
														</li>
													</ul>
												</div>
												<div class="clearfix"></div>
											</div>
										</div>
										<div class="ribben">
											<p>NEW</p>
										</div>
									</div>
									<div class="w3l-movie-gride-agile">
										<a class="hvr-sweep-to-bottom" href="single.jsp"><img alt=" "
												class="img-responsive" src="images/m15.jpg" title="Movies Pro">
											<div class="w3l-action-icon"><i aria-hidden="true"
													class="fa fa-play-circle-o"></i></div>
										</a>
										<div class="mid-1 agileits_w3layouts_mid_1_home">
											<div class="w3l-movie-text">
												<h6><a href="single.jsp">RoboCop</a></h6>
											</div>
											<div class="mid-2 agile_mid_2_home">
												<p>2016</p>
												<div class="block-stars">
													<ul class="w3l-ratings">
														<li><a href="#"><i aria-hidden="true"
																	class="fa fa-star"></i></a></li>
														<li><a href="#"><i aria-hidden="true"
																	class="fa fa-star"></i></a></li>
														<li><a href="#"><i aria-hidden="true"
																	class="fa fa-star-o"></i></a>
														</li>
														<li><a href="#"><i aria-hidden="true"
																	class="fa fa-star-o"></i></a>
														</li>
														<li><a href="#"><i aria-hidden="true"
																	class="fa fa-star-o"></i></a>
														</li>
													</ul>
												</div>
												<div class="clearfix"></div>
											</div>
										</div>
										<div class="ribben">
											<p>NEW</p>
										</div>
									</div>
									<div class="w3l-movie-gride-agile">
										<a class="hvr-sweep-to-bottom" href="single.jsp"><img alt=" "
												class="img-responsive" src="images/m16.jpg" title="Movies Pro">
											<div class="w3l-action-icon"><i aria-hidden="true"
													class="fa fa-play-circle-o"></i></div>
										</a>
										<div class="mid-1 agileits_w3layouts_mid_1_home">
											<div class="w3l-movie-text">
												<h6><a href="single.jsp">X-Men</a></h6>
											</div>
											<div class="mid-2 agile_mid_2_home">
												<p>2016</p>
												<div class="block-stars">
													<ul class="w3l-ratings">
														<li><a href="#"><i aria-hidden="true"
																	class="fa fa-star"></i></a></li>
														<li><a href="#"><i aria-hidden="true"
																	class="fa fa-star"></i></a></li>
														<li><a href="#"><i aria-hidden="true"
																	class="fa fa-star-o"></i></a>
														</li>
														<li><a href="#"><i aria-hidden="true"
																	class="fa fa-star-o"></i></a>
														</li>
														<li><a href="#"><i aria-hidden="true"
																	class="fa fa-star-o"></i></a>
														</li>
													</ul>
												</div>
												<div class="clearfix"></div>
											</div>
										</div>
										<div class="ribben">
											<p>NEW</p>
										</div>
									</div>
								</div>
								<div class="clearfix"></div>
							</div>
							<div class="cleafix"></div>
						</div>
					</div>
					<div class="tab3">
						<div class="tab_movies_agileinfo">
							<div class="w3_agile_featured_movies">
								<div class="col-md-5 video_agile_player">
									<div class="video-grid-single-page-agileits">
										<div data-video="BXEZFd0RT5Y" id="video2"><img alt="" class="img-responsive"
												src="images/44.jpg" /></div>
									</div>

									<div class="player-text">
										<p class="fexi_header">Storks </p>
										<p class="fexi_header_para"><span class="conjuring_w3">Story
												Line<label>:</label></span>Starring: Andy
											Samberg, Jennifer Aniston, Ty Burrell Storks Official Trailer 3 (2016) -
											Andy Samberg Movie the company's top delivery stork, lands in hot water
											when
											the Baby Factory produces an adorable....... </p>
										<p class="fexi_header_para"><span>Release On<label>:</label></span>Aug 1,
											2016
										</p>
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
									</div>

								</div>
								<div class="col-md-7 wthree_agile-movies_list">
									<div class="w3l-movie-gride-agile">
										<a class="hvr-sweep-to-bottom" href="single.jsp"><img alt=" "
												class="img-responsive" src="images/m1.jpg" title="Movies Pro">
											<div class="w3l-action-icon"><i aria-hidden="true"
													class="fa fa-play-circle-o"></i></div>
										</a>
										<div class="mid-1 agileits_w3layouts_mid_1_home">
											<div class="w3l-movie-text">
												<h6><a href="single.jsp">Swiss Army Man </a></h6>
											</div>
											<div class="mid-2 agile_mid_2_home">
												<p>2016</p>
												<div class="block-stars">
													<ul class="w3l-ratings">
														<li><a href="#"><i aria-hidden="true"
																	class="fa fa-star"></i></a></li>
														<li><a href="#"><i aria-hidden="true"
																	class="fa fa-star"></i></a></li>
														<li><a href="#"><i aria-hidden="true"
																	class="fa fa-star-o"></i></a>
														</li>
														<li><a href="#"><i aria-hidden="true"
																	class="fa fa-star-o"></i></a>
														</li>
														<li><a href="#"><i aria-hidden="true"
																	class="fa fa-star-o"></i></a>
														</li>
													</ul>
												</div>
												<div class="clearfix"></div>
											</div>
										</div>
										<div class="ribben">
											<p>NEW</p>
										</div>
									</div>
									<div class="w3l-movie-gride-agile">
										<a class="hvr-sweep-to-bottom" href="single.jsp"><img alt=" "
												class="img-responsive" src="images/m2.jpg" title="Movies Pro">
											<div class="w3l-action-icon"><i aria-hidden="true"
													class="fa fa-play-circle-o"></i></div>
										</a>
										<div class="mid-1 agileits_w3layouts_mid_1_home">
											<div class="w3l-movie-text">
												<h6><a href="single.jsp">Me Before you</a></h6>
											</div>
											<div class="mid-2 agile_mid_2_home">
												<p>2016</p>
												<div class="block-stars">
													<ul class="w3l-ratings">
														<li><a href="#"><i aria-hidden="true"
																	class="fa fa-star"></i></a></li>
														<li><a href="#"><i aria-hidden="true"
																	class="fa fa-star"></i></a></li>
														<li><a href="#"><i aria-hidden="true"
																	class="fa fa-star-o"></i></a>
														</li>
														<li><a href="#"><i aria-hidden="true"
																	class="fa fa-star-o"></i></a>
														</li>
														<li><a href="#"><i aria-hidden="true"
																	class="fa fa-star-o"></i></a>
														</li>
													</ul>
												</div>
												<div class="clearfix"></div>
											</div>
										</div>
										<div class="ribben">
											<p>NEW</p>
										</div>
									</div>
									<div class="w3l-movie-gride-agile">
										<a class="hvr-sweep-to-bottom" href="single.jsp"><img alt=" "
												class="img-responsive" src="images/m3.jpg" title="Movies Pro">
											<div class="w3l-action-icon"><i aria-hidden="true"
													class="fa fa-play-circle-o"></i></div>
										</a>
										<div class="mid-1 agileits_w3layouts_mid_1_home">
											<div class="w3l-movie-text">
												<h6><a href="single.jsp">Deadpool</a></h6>
											</div>
											<div class="mid-2 agile_mid_2_home">
												<p>2016</p>
												<div class="block-stars">
													<ul class="w3l-ratings">
														<li><a href="#"><i aria-hidden="true"
																	class="fa fa-star"></i></a></li>
														<li><a href="#"><i aria-hidden="true"
																	class="fa fa-star"></i></a></li>
														<li><a href="#"><i aria-hidden="true"
																	class="fa fa-star-o"></i></a>
														</li>
														<li><a href="#"><i aria-hidden="true"
																	class="fa fa-star-o"></i></a>
														</li>
														<li><a href="#"><i aria-hidden="true"
																	class="fa fa-star-o"></i></a>
														</li>
													</ul>
												</div>
												<div class="clearfix"></div>
											</div>
										</div>
										<div class="ribben">
											<p>NEW</p>
										</div>
									</div>
									<div class="w3l-movie-gride-agile">
										<a class="hvr-sweep-to-bottom" href="single.jsp"><img alt=" "
												class="img-responsive" src="images/m4.jpg" title="Movies Pro">
											<div class="w3l-action-icon"><i aria-hidden="true"
													class="fa fa-play-circle-o"></i></div>
										</a>
										<div class="mid-1 agileits_w3layouts_mid_1_home">
											<div class="w3l-movie-text">
												<h6><a href="single.jsp">Rogue One </a></h6>
											</div>
											<div class="mid-2 agile_mid_2_home">
												<p>2016</p>
												<div class="block-stars">
													<ul class="w3l-ratings">
														<li><a href="#"><i aria-hidden="true"
																	class="fa fa-star"></i></a></li>
														<li><a href="#"><i aria-hidden="true"
																	class="fa fa-star"></i></a></li>
														<li><a href="#"><i aria-hidden="true"
																	class="fa fa-star-o"></i></a>
														</li>
														<li><a href="#"><i aria-hidden="true"
																	class="fa fa-star-o"></i></a>
														</li>
														<li><a href="#"><i aria-hidden="true"
																	class="fa fa-star-o"></i></a>
														</li>
													</ul>
												</div>
												<div class="clearfix"></div>
											</div>
										</div>
										<div class="ribben">
											<p>NEW</p>
										</div>
									</div>
									<div class="w3l-movie-gride-agile">
										<a class="hvr-sweep-to-bottom" href="single.jsp"><img alt=" "
												class="img-responsive" src="images/m5.jpg" title="Movies Pro">
											<div class="w3l-action-icon"><i aria-hidden="true"
													class="fa fa-play-circle-o"></i></div>
										</a>
										<div class="mid-1 agileits_w3layouts_mid_1_home">
											<div class="w3l-movie-text">
												<h6><a href="single.jsp">Storks</a></h6>
											</div>
											<div class="mid-2 agile_mid_2_home">
												<p>2016</p>
												<div class="block-stars">
													<ul class="w3l-ratings">
														<li><a href="#"><i aria-hidden="true"
																	class="fa fa-star"></i></a></li>
														<li><a href="#"><i aria-hidden="true"
																	class="fa fa-star"></i></a></li>
														<li><a href="#"><i aria-hidden="true"
																	class="fa fa-star-o"></i></a>
														</li>
														<li><a href="#"><i aria-hidden="true"
																	class="fa fa-star-o"></i></a>
														</li>
														<li><a href="#"><i aria-hidden="true"
																	class="fa fa-star-o"></i></a>
														</li>
													</ul>
												</div>
												<div class="clearfix"></div>
											</div>
										</div>
										<div class="ribben">
											<p>NEW</p>
										</div>
									</div>
									<div class="w3l-movie-gride-agile">
										<a class="hvr-sweep-to-bottom" href="single.jsp"><img alt=" "
												class="img-responsive" src="images/m6.jpg" title="Movies Pro">
											<div class="w3l-action-icon"><i aria-hidden="true"
													class="fa fa-play-circle-o"></i></div>
										</a>
										<div class="mid-1 agileits_w3layouts_mid_1_home">
											<div class="w3l-movie-text">
												<h6><a href="single.jsp">Hopeless</a></h6>
											</div>
											<div class="mid-2 agile_mid_2_home">
												<p>2016</p>
												<div class="block-stars">
													<ul class="w3l-ratings">
														<li><a href="#"><i aria-hidden="true"
																	class="fa fa-star"></i></a></li>
														<li><a href="#"><i aria-hidden="true"
																	class="fa fa-star"></i></a></li>
														<li><a href="#"><i aria-hidden="true"
																	class="fa fa-star-o"></i></a>
														</li>
														<li><a href="#"><i aria-hidden="true"
																	class="fa fa-star-o"></i></a>
														</li>
														<li><a href="#"><i aria-hidden="true"
																	class="fa fa-star-o"></i></a>
														</li>
													</ul>
												</div>
												<div class="clearfix"></div>
											</div>
										</div>
										<div class="ribben">
											<p>NEW</p>
										</div>
									</div>
									<div class="w3l-movie-gride-agile">
										<a class="hvr-sweep-to-bottom" href="single.jsp"><img alt=" "
												class="img-responsive" src="images/m7.jpg" title="Movies Pro">
											<div class="w3l-action-icon"><i aria-hidden="true"
													class="fa fa-play-circle-o"></i></div>
										</a>
										<div class="mid-1 agileits_w3layouts_mid_1_home">
											<div class="w3l-movie-text">
												<h6><a href="single.jsp">Mechanic</a></h6>
											</div>
											<div class="mid-2 agile_mid_2_home">
												<p>2016</p>
												<div class="block-stars">
													<ul class="w3l-ratings">
														<li><a href="#"><i aria-hidden="true"
																	class="fa fa-star"></i></a></li>
														<li><a href="#"><i aria-hidden="true"
																	class="fa fa-star"></i></a></li>
														<li><a href="#"><i aria-hidden="true"
																	class="fa fa-star-o"></i></a>
														</li>
														<li><a href="#"><i aria-hidden="true"
																	class="fa fa-star-o"></i></a>
														</li>
														<li><a href="#"><i aria-hidden="true"
																	class="fa fa-star-o"></i></a>
														</li>
													</ul>
												</div>
												<div class="clearfix"></div>
											</div>
										</div>
										<div class="ribben">
											<p>NEW</p>
										</div>
									</div>
									<div class="w3l-movie-gride-agile">
										<a class="hvr-sweep-to-bottom" href="single.jsp"><img alt=" "
												class="img-responsive" src="images/m8.jpg" title="Movies Pro">
											<div class="w3l-action-icon"><i aria-hidden="true"
													class="fa fa-play-circle-o"></i></div>
										</a>
										<div class="mid-1 agileits_w3layouts_mid_1_home">
											<div class="w3l-movie-text">
												<h6><a href="single.jsp">Timeless</a></h6>
											</div>
											<div class="mid-2 agile_mid_2_home">
												<p>2016</p>
												<div class="block-stars">
													<ul class="w3l-ratings">
														<li><a href="#"><i aria-hidden="true"
																	class="fa fa-star"></i></a></li>
														<li><a href="#"><i aria-hidden="true"
																	class="fa fa-star"></i></a></li>
														<li><a href="#"><i aria-hidden="true"
																	class="fa fa-star-o"></i></a>
														</li>
														<li><a href="#"><i aria-hidden="true"
																	class="fa fa-star-o"></i></a>
														</li>
														<li><a href="#"><i aria-hidden="true"
																	class="fa fa-star-o"></i></a>
														</li>
													</ul>
												</div>
												<div class="clearfix"></div>
											</div>
										</div>
										<div class="ribben">
											<p>NEW</p>
										</div>
									</div>
								</div>
								<div class="clearfix"></div>
							</div>
							<div class="cleafix"></div>
						</div>
					</div>
				</div>
			</div>

		</div>-->
		<!--//movies-->
		<h3 class="agile_w3_title">正在 <span>热映</span></h3>
		<!--/requested-movies-->
		<div class="wthree_agile-requested-movies" id="requested-movies">

			<div class="col-md-2 w3l-movie-gride-agile requested-movies">
				<a class="hvr-sweep-to-bottom" href="single.jsp">
					<img alt=" " class="img-responsive" src="images/m1.jpg" title="Movies Pro">
					<div class="w3l-action-icon"><i aria-hidden="true" class="fa fa-play-circle-o"></i></div>
				</a>
				<div class="mid-1 agileits_w3layouts_mid_1_home">
					<div class="w3l-movie-text">
						<h6><a href="single.jsp">Swiss Army Man</a></h6>
					</div>

				</div>
				<div class="ribben one">
					<p>NEW</p>
				</div>
			</div>

			<%--<div class="col-md-2 w3l-movie-gride-agile requested-movies">
				<a class="hvr-sweep-to-bottom" href="single.jsp">
					<img alt=" " class="img-responsive" src="images/m2.jpg" title="Movies Pro">
					<div class="w3l-action-icon"><i aria-hidden="true" class="fa fa-play-circle-o"></i></div>
				</a>
				<div class="mid-1 agileits_w3layouts_mid_1_home">
					<div class="w3l-movie-text">
						<h6><a href="single.jsp">Me Before you</a></h6>
					</div>

				</div>
				<div class="ribben one">
					<p>NEW</p>
				</div>
			</div>
			<div class="col-md-2 w3l-movie-gride-agile requested-movies">
				<a class="hvr-sweep-to-bottom" href="single.jsp">
					<img alt=" " class="img-responsive" src="images/m3.jpg" title="Movies Pro">
					<div class="w3l-action-icon"><i aria-hidden="true" class="fa fa-play-circle-o"></i></div>
				</a>
				<div class="mid-1 agileits_w3layouts_mid_1_home">
					<div class="w3l-movie-text">
						<h6><a href="single.jsp">Deadpool</a></h6>
					</div>

				</div>
				<div class="ribben one">
					<p>NEW</p>
				</div>
			</div>
			<div class="col-md-2 w3l-movie-gride-agile requested-movies">
				<a class="hvr-sweep-to-bottom" href="single.jsp">
					<img alt=" " class="img-responsive" src="images/m4.jpg" title="Movies Pro">
					<div class="w3l-action-icon"><i aria-hidden="true" class="fa fa-play-circle-o"></i></div>
				</a>
				<div class="mid-1 agileits_w3layouts_mid_1_home">
					<div class="w3l-movie-text">
						<h6><a href="single.jsp">Rogue One </a></h6>
					</div>

				</div>
				<div class="ribben one">
					<p>NEW</p>
				</div>
			</div>
			<div class="col-md-2 w3l-movie-gride-agile requested-movies">
				<a class="hvr-sweep-to-bottom" href="single.jsp">
					<img alt=" " class="img-responsive" src="images/m5.jpg" title="Movies Pro">
					<div class="w3l-action-icon"><i aria-hidden="true" class="fa fa-play-circle-o"></i></div>
				</a>
				<div class="mid-1 agileits_w3layouts_mid_1_home">
					<div class="w3l-movie-text">
						<h6><a href="single.jsp">Storks </a></h6>
					</div>

				</div>
				<div class="ribben one">
					<p>NEW</p>
				</div>
			</div>
			<div class="col-md-2 w3l-movie-gride-agile requested-movies">
				<a class="hvr-sweep-to-bottom" href="single.jsp">
					<img alt=" " class="img-responsive" src="images/m6.jpg" title="Movies Pro">
					<div class="w3l-action-icon"><i aria-hidden="true" class="fa fa-play-circle-o"></i></div>
				</a>
				<div class="mid-1 agileits_w3layouts_mid_1_home">
					<div class="w3l-movie-text">
						<h6><a href="single.jsp">Hopeless</a></h6>
					</div>

				</div>
				<div class="ribben one">
					<p>NEW</p>
				</div>
			</div>
			<div class="col-md-2 w3l-movie-gride-agile requested-movies">
				<a class="hvr-sweep-to-bottom" href="single.jsp">
					<img alt=" " class="img-responsive" src="images/m7.jpg" title="Movies Pro">
					<div class="w3l-action-icon"><i aria-hidden="true" class="fa fa-play-circle-o"></i></div>
				</a>
				<div class="mid-1 agileits_w3layouts_mid_1_home">
					<div class="w3l-movie-text">
						<h6><a href="single.jsp">Mechanic</a></h6>
					</div>

				</div>
				<div class="ribben one">
					<p>NEW</p>
				</div>
			</div>
			<div class="col-md-2 w3l-movie-gride-agile requested-movies">
				<a class="hvr-sweep-to-bottom" href="single.jsp">
					<img alt=" " class="img-responsive" src="images/m8.jpg" title="Movies Pro">
					<div class="w3l-action-icon"><i aria-hidden="true" class="fa fa-play-circle-o"></i></div>
				</a>
				<div class="mid-1 agileits_w3layouts_mid_1_home">
					<div class="w3l-movie-text">
						<h6><a href="single.jsp">Timeless</a></h6>
					</div>

				</div>
				<div class="ribben one">
					<p>NEW</p>
				</div>
			</div>
			<div class="col-md-2 w3l-movie-gride-agile requested-movies">
				<a class="hvr-sweep-to-bottom" href="single.jsp">
					<img alt=" " class="img-responsive" src="images/m9.jpg" title="Movies Pro">
					<div class="w3l-action-icon"><i aria-hidden="true" class="fa fa-play-circle-o"></i></div>
				</a>
				<div class="mid-1 agileits_w3layouts_mid_1_home">
					<div class="w3l-movie-text">
						<h6><a href="single.jsp">Inferno</a></h6>
					</div>

				</div>
				<div class="ribben one">
					<p>NEW</p>
				</div>
			</div>
			<div class="col-md-2 w3l-movie-gride-agile requested-movies">
				<a class="hvr-sweep-to-bottom" href="single.jsp">
					<img alt=" " class="img-responsive" src="images/m11.jpg" title="Movies Pro">
					<div class="w3l-action-icon"><i aria-hidden="true" class="fa fa-play-circle-o"></i></div>
				</a>
				<div class="mid-1 agileits_w3layouts_mid_1_home">
					<div class="w3l-movie-text">
						<h6><a href="single.jsp">Warcraft</a></h6>
					</div>

				</div>
				<div class="ribben one">
					<p>NEW</p>
				</div>
			</div>--%>
			<!--<div class="clearfix"></div>-->
		</div>
		<!--//tab-section-->
		<h3 class="agile_w3_title"> 热门 <span>电影</span></h3>
		<!--/movies-->
		<div class="w3_agile_latest_movies">

			<div class="owl-carousel owl-theme" id="owl-demo" style="clear: both;">
				<div class="item">
					<div class="w3l-movie-gride-agile w3l-movie-gride-slider ">
						<a class="hvr-sweep-to-bottom" href="single.jsp">
							<img alt=" " class="img-responsive" src="images/m5.jpg" title="Movies Pro"/>
							<div class="w3l-action-icon"><i aria-hidden="true" class="fa fa-play-circle-o"></i>
							</div>
						</a>
						<div class="mid-1 agileits_w3layouts_mid_1_home">
							<div class="w3l-movie-text">
								<h6><a href="single.jsp">逗鸟外传 </a></h6>
							</div>

						</div>
						<div class="ribben one">
							<p>NEW</p>
						</div>
					</div>
				</div>
				<div class="item">
					<div class="w3l-movie-gride-agile w3l-movie-gride-slider ">
						<a class="hvr-sweep-to-bottom" href="single.jsp">
							<img alt=" " class="img-responsive" src="images/m6.jpg" title="Movies Pro"/>
							<div class="w3l-action-icon"><i aria-hidden="true" class="fa fa-play-circle-o"></i>
							</div>
						</a>
						<div class="mid-1 agileits_w3layouts_mid_1_home">
							<div class="w3l-movie-text">
								<h6><a href="single.jsp">Hopeless</a></h6>
							</div>

						</div>
						<div class="ribben one">
							<p>NEW</p>
						</div>
					</div>
				</div>
				<div class="item">
					<div class="w3l-movie-gride-agile w3l-movie-gride-slider ">
						<a class="hvr-sweep-to-bottom" href="single.jsp">
							<img alt=" " class="img-responsive" src="images/m7.jpg" title="Movies Pro"/>
							<div class="w3l-action-icon"><i aria-hidden="true" class="fa fa-play-circle-o"></i>
							</div>
						</a>
						<div class="mid-1 agileits_w3layouts_mid_1_home">
							<div class="w3l-movie-text">
								<h6><a href="single.jsp">机械师</a></h6>
							</div>

						</div>
						<div class="ribben one">
							<p>NEW</p>
						</div>
					</div>
				</div>
				<div class="item">
					<div class="w3l-movie-gride-agile w3l-movie-gride-slider ">
						<a class="hvr-sweep-to-bottom" href="single.jsp">
							<img alt=" " class="img-responsive" src="images/m8.jpg" title="Movies Pro"/>
							<div class="w3l-action-icon"><i aria-hidden="true" class="fa fa-play-circle-o"></i>
							</div>
						</a>
						<div class="mid-1 agileits_w3layouts_mid_1_home">
							<div class="w3l-movie-text">
								<h6><a href="single.jsp">时间永恒</a></h6>
							</div>

						</div>
						<div class="ribben one">
							<p>NEW</p>
						</div>
					</div>
				</div>
				<div class="item">
					<div class="w3l-movie-gride-agile w3l-movie-gride-slider ">
						<a class="hvr-sweep-to-bottom" href="single.jsp">
							<img alt=" " class="img-responsive" src="images/m3.jpg" title="Movies Pro"/>
							<div class="w3l-action-icon"><i aria-hidden="true" class="fa fa-play-circle-o"></i>
							</div>
						</a>
						<div class="mid-1 agileits_w3layouts_mid_1_home">
							<div class="w3l-movie-text">
								<h6><a href="single.jsp">死侍</a></h6>
							</div>

						</div>
						<div class="ribben one">
							<p>NEW</p>
						</div>
					</div>
				</div>
				<div class="item">
					<div class="w3l-movie-gride-agile w3l-movie-gride-slider ">
						<a class="hvr-sweep-to-bottom" href="single.jsp">
							<img alt=" " class="img-responsive" src="images/m11.jpg" title="Movies Pro"/>
							<div class="w3l-action-icon"><i aria-hidden="true" class="fa fa-play-circle-o"></i>
							</div>
						</a>
						<div class="mid-1 agileits_w3layouts_mid_1_home">
							<div class="w3l-movie-text">
								<h6><a href="single.jsp">魔兽</a></h6>
							</div>

						</div>
						<div class="ribben one">
							<p>NEW</p>
						</div>
					</div>
				</div>
				<div class="item">
					<div class="w3l-movie-gride-agile w3l-movie-gride-slider ">
						<a class="hvr-sweep-to-bottom" href="single.jsp">
							<img alt=" " class="img-responsive" src="images/m14.jpg" title="Movies Pro"/>
							<div class="w3l-action-icon"><i aria-hidden="true" class="fa fa-play-circle-o"></i>
							</div>
						</a>
						<div class="mid-1 agileits_w3layouts_mid_1_home">
							<div class="w3l-movie-text">
								<h6><a href="single.jsp">第一滴血 4</a></h6>
							</div>

						</div>
						<div class="ribben one">
							<p>NEW</p>
						</div>
					</div>
				</div>
				<div class="item">
					<div class="w3l-movie-gride-agile w3l-movie-gride-slider ">
						<a class="hvr-sweep-to-bottom" href="single.jsp">
							<img alt=" " class="img-responsive" src="images/m13.jpg" title="Movies Pro"/>
							<div class="w3l-action-icon"><i aria-hidden="true" class="fa fa-play-circle-o"></i>
							</div>
						</a>
						<div class="mid-1 agileits_w3layouts_mid_1_home">
							<div class="w3l-movie-text">
								<h6><a href="single.jsp">Ghostbuster</a></h6>
							</div>

						</div>
						<div class="ribben one">
							<p>NEW</p>
						</div>
					</div>
				</div>
				<div class="item">
					<div class="w3l-movie-gride-agile w3l-movie-gride-slider ">
						<a class="hvr-sweep-to-bottom" href="single.jsp">
							<img alt=" " class="img-responsive" src="images/m15.jpg" title="Movies Pro"/>
							<div class="w3l-action-icon"><i aria-hidden="true" class="fa fa-play-circle-o"></i>
							</div>
						</a>
						<div class="mid-1 agileits_w3layouts_mid_1_home">
							<div class="w3l-movie-text">
								<h6><a href="single.jsp">机械战警</a></h6>
							</div>
						</div>
						<div class="ribben one">
							<p>NEW</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!--//content-inner-section-->

<!--/footer-bottom-->
<div class="contact-w3ls" id="contact">
	<div class="footer-w3lagile-inner">

		<div class="footer-grids w3-agileits">
			<div class="col-md-2 footer-grid">
				<h4>伟鹏影院</h4>
				<ul>
					<li><img src="images/qrcode_localhost.png" width="100px"></li>

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
<a class="scroll" href="#home" id="toTop" style="display: block;">
	<span id="toTopHover" style="opacity: 1;"></span>
</a>

<div class="modal fade" id="myModal8" role="dialog" tabindex="-1">


	<div id="container12">

	</div>

</div>

<!-- Dropdown-Menu-JavaScript -->

<script type="text/javascript">
    $(function () {
        //ajax请求,显示电影
        $.get("${pageContext.request.contextPath}/UserController", {
            "op": "queryMovies"
        }, function (data) {
            var info = "";
            $.each(data, function (index, film) {
                info += "<div class=\'col-md-2 w3l-movie-gride-agile requested-movies\'>\n" +
                    "\t\t\t\t<a class=\'hvr-sweep-to-bottom\' href=\'${pageContext.request.contextPath}/UserController?op=queryMovieById&filmId=" + film.filmId + "\'>\n" +
                    "\t\t\t\t\t<img alt=\' \' class=\'img-responsive\' style=\'height:356.13px\' src=\'${pageContext.request.contextPath}/MovieFileDownloadServlet?fileName=" + film.filmPoster + "\' title=\'Movies Pro\'>\n" +
                    "\t\t\t\t\t<div class=\'w3l-action-icon\'><i aria-hidden=\'true\' class=\'fa fa-play-circle-o\'></i></div>\n" +
                    "\t\t\t\t</a>\n" +
                    "\t\t\t\t<div class=\'mid-1 agileits_w3layouts_mid_1_home\'>\n" +
                    "\t\t\t\t\t<div class=\'w3l-movie-text\'>\n" +
                    "\t\t\t\t\t\t<h6><a href=\'single.jsp\' style=\'overflow: hidden;text-overflow: ellipsis;white-space: nowrap;\'>" + film.filmName + "</a></h6>\n" +
                    "\t\t\t\t\t</div>\n" +
                    "\n" +
                    "\t\t\t\t</div>\n" +
                    "\t\t\t\t<div class=\'ribben one\'>\n" +
                    "\t\t\t\t\t<p>NEW</p>\n" +
                    "\t\t\t\t</div>\n" +
                    "\t\t\t</div>";
            })
            $("#requested-movies").html(info);
        }, "json");
    })

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
                            "					<li><a class=\'login\'  href=\'${pageContext.request.contextPath}/front/userHome.jsp\'>" + $('#userName').val() + "</a></li>\r\n" +
                            "					<li><a id=\'exit\' class=\'login reg\' >退出</a></li>\r\n" +
                            "				</ul>"
                        $("#navbar").html(info);
                        $("#myModal").modal('hide');
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
                        "					<li><i aria-hidden=\'true\' class=\'fa fa-phone\'></i> (+86) 182\r\n" +
                        "						5907 9225</li>\r\n" +
                        "					<li><a class=\'login\' data-target=\'#myModal4\'\r\n" +
                        "						data-toggle=\'modal\' href=\'#\'>登录</a></li>\r\n" +
                        "					<li><a class=\'login reg\' data-target=\'#myModal5\'\r\n" +
                        "						data-toggle=\'modal\' href=\'#\'>注册</a></li>\r\n" +
                        "\r\n" +
                        "				</ul>";
                    $("#navbar").html(info);
                }, "text");
        })

    })

    $(function () {

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
			var str=new RegExp(/^[a-zA-Z]\w{5,17}$/);
            if ($("#password1").val().trim() == "") {
                $("#userPwdId").text("密码不能为空");
            } else {
                if (str.test($("#password1").val())) {
                    $("#userPwdId").text("正确");
                } else {
                    $("#userPwdId").text("密码字母开头，长度6-18位之间!");
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
            if (meok === "checked") {
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

    });

 	$("#btnModal").on("click",function (){


    //创建地图实例
    var map = new BMapGL.Map("container12");

    //设置中心点坐标
    var point = new BMapGL.Point(118.059, 24.6135);
    //地图初始化，同时设置地图展示级别(3-19)
    map.centerAndZoom(point, 16);
    //开启鼠标滚轮缩放
    map.enableScrollWheelZoom(true);
    //添加控件
    map.addControl(new BMapGL.ScaleControl());  	//添加控件：	默认位于地图左下方，显示地图的比例关系
    map.addControl(new BMapGL.ZoomControl());  	//添加控件：	默认位于地图右下方，控制地图级别的缩放
    map.addControl(new BMapGL.LocationControl());  //添加控件：	默认位于地图左下方，用于获取定位
    map.addControl(new BMapGL.CityListControl());  //添加控件：	默认位于地图左上方，用于进行城市选择定位

    var marker = new BMapGL.Marker(point);        // 创建标注
    map.addOverlay(marker);                     // 将标注添加到地图中
    //监听事件
    var opts = {
        width: 250,     // 信息窗口宽度
        height: 100,    // 信息窗口高度
        title: "地址详情:"  // 信息窗口标题
    }
    var infoWindow = new BMapGL.InfoWindow("福建省厦门市集美区软件园三期-A区  淘喵喵影院", opts);  // 创建信息窗口对象
    map.openInfoWindow(infoWindow, point);        // 打开信息窗口
    map.addEventListener('click', function (e) {
		map.openInfoWindow(infoWindow, point);        // 打开信息窗口

    });

	})

</script>


<script src="js/jquery-1.11.1.min.js"></script>
<!-- Dropdown-Menu-JavaScript -->
<script>
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

</script>
<!-- //Dropdown-Menu-JavaScript -->


<script type="text/javascript" src="js/jquery.zoomslider.min.js"></script>
<!-- search-jQuery -->
<script src="js/main.js"></script>
<script src="js/simplePlayer.js"></script>
<script>
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

<!-- pop-up-box -->
<script src="js/jquery.magnific-popup.js" type="text/javascript"></script>
<!--//pop-up-box -->

<div id="small-dialog1" class="mfp-hide">
	<iframe src=""></iframe>
</div>
<div id="small-dialog2" class="mfp-hide">
	<iframe src=""></iframe>
</div>
<script>
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
</script>
<script src="js/easy-responsive-tabs.js"></script>
<script>
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
</script>
<link href="css/owl.carousel.css" rel="stylesheet" type="text/css" media="all">
<script src="js/owl.carousel.js"></script>
<script>
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
</script>

<!--/script-->
<script type="text/javascript" src="js/move-top.js"></script>
<script type="text/javascript" src="js/easing.js"></script>

<script type="text/javascript">
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
</script>
<!--end-smooth-scrolling-->
<script src="js/bootstrap.js"></script>


</body>

</html>