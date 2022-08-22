<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>付款</title>
</head>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="com.etc.controller.*"%>
<%@ page import="com.alipay.api.*"%>
<%@ page import="com.alipay.api.request.*"%>
<%@ page import="java.util.UUID" %>
<%@ page import="java.nio.charset.StandardCharsets" %>
<%@ page import="com.etc.service.OrderServiceImpl" %>
<%@ page import="com.etc.entity.Order" %>
<%@ page import="com.etc.entity.Film" %>
<%@ page import="com.etc.entity.User" %>
<%
	
	//获得初始化的AlipayClient
	AlipayClient alipayClient = new DefaultAlipayClient(AlipayConfig.gatewayUrl, AlipayConfig.app_id, AlipayConfig.merchant_private_key, "json", AlipayConfig.charset, AlipayConfig.alipay_public_key, AlipayConfig.sign_type);

	//设置请求参数
	AlipayTradePagePayRequest alipayRequest = new AlipayTradePagePayRequest();
	alipayRequest.setReturnUrl(AlipayConfig.return_url);
	alipayRequest.setNotifyUrl(AlipayConfig.notify_url);

	//商户订单号，商户网站订单系统中唯一订单号，必填
	String out_trade_no = String.valueOf(UUID.randomUUID());
	//付款金额，必填
	String total_amount = new String(request.getParameter("WIDtotal_amount"));
	//订单名称，必填
	String subject =new String(request.getParameter("movieName"));
	//电影编号
	int fimlNum=Integer.parseInt(new String(request.getParameter("filmId")));
	//用户编号
	int userid=Integer.parseInt(new String(request.getParameter("userId")));
	//座位编号
	String setId=new String(request.getParameter("setId"));
	//座位信息
	String setNum=new String(request.getParameter("setNum"));
	//场次
	String playNum=new String(request.getParameter("time"));
	//厅号
	String name =new String(request.getParameter("name"));
	String info =name+","+playNum+","+setNum;

	//数量
	int count =Integer.parseInt(new String(request.getParameter("count")));
	Order order =new
			Order(out_trade_no,new Film(fimlNum,subject),new User(userid),Double.parseDouble(total_amount),count,playNum,setId,info);
	new OrderServiceImpl().addOrder(order);
	System.out.println("创建订单成功");
	//付款限制时间
	String timeout_express ="10m";


	alipayRequest.setBizContent("{\"out_trade_no\":\""+ out_trade_no +"\","
			+ "\"total_amount\":\""+ total_amount +"\","
			+ "\"setId\":\""+ setId +"\","
			+ "\"setNum\":\""+ setNum +"\","
			+ "\"playNum\":\""+ playNum +"\","
			+ "\"subject\":\""+ subject +"\","
		/*	+ "\"body\":\""+ body +"\"," */
			+ "\"timeout_express\":\""+ timeout_express +"\","
			+ "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");

	//若想给BizContent增加其他可选请求参数，以增加自定义超时时间参数timeout_express来举例说明
	//alipayRequest.setBizContent("{\"out_trade_no\":\""+ out_trade_no +"\","
	//		+ "\"total_amount\":\""+ total_amount +"\","
	//		+ "\"subject\":\""+ subject +"\","
	//		+ "\"body\":\""+ body +"\","
	//		+ "\"timeout_express\":\"10m\","
	//		+ "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");
	//请求参数可查阅【电脑网站支付的API文档-alipay.trade.page.pay-请求参数】章节

	//请求
	String result = alipayClient.pageExecute(alipayRequest).getBody();

	//输出
	out.println(result);
%>
<body>
</body>
</html>