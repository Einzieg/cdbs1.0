<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- 用户页 -->
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>电影</title>
    <!-- Bootstrap 核心 CSS 文件 -->
    <link href="${pageContext.request.contextPath}/backstage/files/css/bootstrap.css" rel="stylesheet" type="text/css" />
    <!-- font-asesome图标库 -->
    <link href="${pageContext.request.contextPath}/backstage/files/css/font-awesome.min.css" rel="stylesheet" type="text/css" />

    <!-- 引入css样式文件 -->
    <link href="${pageContext.request.contextPath}/backstage/files/css/common.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/backstage/files/css/userHome.css" rel="stylesheet" type="text/css" />

    <!-- 引入js脚本文件 -->
    <!-- jquery -->
    <script src="${pageContext.request.contextPath}/backstage/files/js/jquery.js"></script>
    <!-- Bootstrap 核心 JavaScript 文件 -->
    <script src="${pageContext.request.contextPath}/backstage/files/js/bootstrap.js"></script>
<%--     <script src="${pageContext.request.contextPath}/backstage/files/js/request.js"></script> --%>
<%--     <script src="${pageContext.request.contextPath}/backstage/files/js/userHome.js"></script>
 --%>
</head>

<body>
    <div class="nav-top-container">
        <div class="nav-logo title">用户中心</div>
        <ul class="nav nav-pills">
            <li
                role="presentation"><a href="${pageContext.request.contextPath}/front/index.jsp">首页</a></li>
            <li class="active" role="presentation"><a href="${pageContext.request.contextPath}/front/userHome.jsp">
                个人信息</a></li>
            <li role="presentation"><a href="${pageContext.request.contextPath}/front/userOreder.jsp">我看过的电影</a></li>
        </ul>
        <div class="btn-group">
            <button aria-expanded="false" aria-haspopup="true" class="nav-user-container btn dropdown-toggle"
                data-toggle="dropdown" type="button">
                <img class="avatar-sm" src="${pageContext.request.contextPath}/FileDownloadServlet?fileName=${sessionScope.frontUser.userImg}" />
                <span class="gray-text" style="vertical-align: middle">${sessionScope.frontUser.userName }&nbsp;<span class="caret"></span></span>
            </button>
            <ul class="dropdown-menu">
                <li><a href="#" data-target="#myModal4" data-toggle="modal">修改个人信息</a></li>
                <li><a href="#">电影票</a></li>
                <li><a href="#">消费纪录</a></li>
                <li><a href="#">卡包</a></li>
                <li id="logout"><a href="#">登出</a></li>
            </ul>
        </div>
    </div>
    <div class="modal fade" id="myModal4" role="dialog" tabindex="-1">

		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content" style="width: 405px;">
				<div class="modal-header" >
					<button class="close" data-dismiss="modal" type="button">&times;</button>
					<h4 style="text-align: center; ">修改个人信息</h4>
					<div class="login-form">
						<form action="${pageContext.request.contextPath}/UserController?op=upUser"
							method="post" enctype="multipart/form-data" id="form1">
							<div class="inputBox" style="margin-left: 30px;">
								<input name="userName2" id="userName1"readonly="true"/>
								 <label id="userNameTip"></label>
							</div>
							
							<div class="inputBox" style="margin-left: 30px;">
								<input name="password2" placeholder="新密码" required=""
									type="password" id="password1" style="border:2px;"/>
									 <label id="userPwdId"></label>
							</div>
							<div class="inputBox" style="margin-left: 30px;">
								<input name="repassword" placeholder="确认密码" required=""
									type="password" id="repassword" style="border:2px;"/> <label id="repasswordTip"></label>
							</div>
							<div style="margin-left: 30px;">
								<input name="gender" type="radio" value="1" checked style="width: 15px;height: 15px;"/>男 <input
									name="gender" type="radio" value="0" style="width: 15px;height: 15px;"/>女
							</div>
							<div style="margin-left: 30px;"> <label
									id="repasswordTip">上传头像</label>
								<input type="file" name="userImg2" id="userImg"style="width: 150px;" >
							</div>
							

							<div class="tp">
								<input type="submit" value="立即修改" id="regForm"
									>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
    <div class="content-container">
        <div class="movie-contianer">
            <div class="adiv" id="flash">
            <p><span style="color: #ffffff;
    background-color: #1caf9a;padding: 5px 15px;border-radius: 6px;">用户头像</span>
				<img src="${pageContext.request.contextPath}/FileDownloadServlet?fileName=${sessionScope.frontUser.userImg}" style=" width: 75px;height: 75px; border-radius: 50%;"/></p>
				<p style="margin: 0 0 35px;"><span style="color: #ffffff;
    background-color: #1caf9a;padding: 5px 15px;border-radius: 6px;">用户&nbsp;&nbsp;&nbsp;&nbsp;id</span> ${sessionScope.frontUser.userId}</p>
				<p style="margin: 0 0 35px;"><span style="color: #ffffff;
    background-color: #1caf9a;padding: 5px 15px;border-radius: 6px;">用户名称</span> ${sessionScope.frontUser.userName}</p>
				
				<p style="margin: 0 0 35px;"><span style="color: #ffffff;
    background-color: #1caf9a;padding: 5px 15px;border-radius: 6px;">用户性别</span>
				${sessionScope.frontUser.userGender eq 1?"男":"女"}</p>
				<p style="margin: 0 0 35px;"><span style="color: #ffffff;
    background-color: #1caf9a;padding: 5px 15px;border-radius: 6px;">用户状态</span>
				${sessionScope.frontUser.userState eq 0?"注销":"正常"}</p>
				<p style="margin: 0 0 35px;"><span style="color: #ffffff;
    background-color: #1caf9a;padding: 5px 15px;border-radius: 6px;">注册日期</span>
				${sessionScope.frontUser.userDate}</p>


			</div>
        </div>

    </div>
    <script>
		  $(function(){
			   //对密码做失去焦点时判断
			  $("#password1").blur(function(){
				  //判断密码是否为空
				  if($("#password1").val().trim()==""){
					  $("#userPwdId").text("密码不能为空");
				  }else{
					  if($("#password1").val().trim().length<=6 && $("#password1").val().indexOf(" ")==-1){
						  $("#userPwdId").text("正确");
					  }else{
						  $("#userPwdId").text("密码长度不超过6位,不能包含空格!");
					  }
				  }
			  })
			  
			  //对确认密码做失去焦点时判断
			  $("#repassword").blur(function(){
				  var urepwd=$("#repassword").val();
				  var password=$("#password1").val();
				  //判断密码是否为空
				  if(urepwd.trim()==""){
					  $("#repasswordTip").text("确认密码不能为空");
				  }else{
					if(urepwd==password){
						 $("#repasswordTip").text("两次密码一致");
					}else{
						 $("#repasswordTip").text("两次密码不一致");
					}
					  
				  }
			  })
			  
			  //最终表单提交事件
			  $("#form1").submit(function(){
				  //判断提示框的值就行
				 if($($("#userPwdId").text()=="正确" && $("#repasswordTip").text()=="两次密码一致")){
					 /* $.post("${pageContext.request.contextPath}/UserController",{op:"register",uname:$("#userName1").val(),upwd:$("#password1").val(),userImg:$("#userImg").val()},function(data){},"text");
					 $("#myModal").modal('hide'); */
					 return true;
				  }
				  return false;
			  })
			 
		  });
		  document.getElementById("userName1").value="${sessionScope.frontUser.userName}";
		</script>
</body>

</html>