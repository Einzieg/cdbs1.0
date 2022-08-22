<!--
	Author: W3layouts
	Author URL: http://w3layouts.com
-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<!--后台-管理员登录-->
<!DOCTYPE html>
<html lang="zxx">

<!-- Head -->

<head>
	<script
	src="${pageContext.request.contextPath}/front/js/jquery-3.6.0.js"
	type="text/javascript" charset="utf-8"></script>
	<script src="${pageContext.request.contextPath}/backstage/files/js/bootstrap.min.js"></script>
	
    <title>Universe Signin Form Flat Responsive Widget Template :: W3layouts</title>

    <!-- Meta-Tags -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <!-- style CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/backstage/files/css/style.css" type="text/css" media="all">
    <!-- google fonts -->
   <!--  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+JP:wght@400;500;700&display=swap" rel="stylesheet"> -->
</head>
<!-- //Head -->

<!-- Body -->

<body>
<%
	String adminName="";
	String adminPassword="";
	String checked=""; 
	
		Cookie[] cookies=request.getCookies();
	if(cookies !=null){
		for(Cookie c:cookies){
			if(c.getName().equals("adminName")){
				adminName=c.getValue();
			}else if(c.getName().equals("adminPassword")){
				adminPassword=c.getValue();
			}else if(c.getName().equals("checked")){
				checked=c.getValue();
			}
		}
		
		pageContext.setAttribute("uname", adminName);
		pageContext.setAttribute("pwd", adminPassword);
		pageContext.setAttribute("checked", checked);
	}
	%>

    <section class="main">
        <div class="logo text-center">
            <h1> <a href=""> 影厅系统管理员登录</a></h1>
        </div>
        <div class="content-w3ls text-center">
            <img src="${pageContext.request.contextPath}/backstage/files/images/admin.png" alt="" class="img-responsive">
            <form action="${pageContext.request.contextPath}/AdminController?op=adminLogin" method="post">
                <div class="wthree-field">
                   <input autocomplete="off" class="form-control" id="adminName" name="adminName" placeholder="请输入管理员账号"
                           type="text" value="${uname}" />
                </div>
                <div class="wthree-field">
                    <input autocomplete="new-password" class="form-control" id="adminPassword" name="adminPassword" placeholder="请输入密码"
                           type="password" value="${pwd}"/>
                </div>
                <%-- <c:if test="${checked eq 'checked'}">
				<input type="checkBox" name="rememberMe" value="rememberMe" checked style="color:white;" />记住我
				</c:if>
				<c:if test="${checked != 'checked'}">
				<input type="checkBox" name="rememberMe" value="rememberMe" style="color:white;">记住我
				</c:if> --%>
	            <p class="text-danger" id="infoLogin"></p>
                <div class="wthree-field">
                    <button type="submit" class="btn" href="javascript:document.f.submit()">登录</button>
                </div>
                <!-- <div class="login-bottom">
                    <a href="#url" class="">Create An Account</a>
                </div> -->
            </form>
        </div>
        <div class="copyright">
            <p>Y© 2022 Cinema management system  </p>
        </div>
    </section>

</body>
<!-- //Body -->

</html>