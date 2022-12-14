<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.util.Map"%>
<%@ page import="com.etc.controller.*"%>
<%@ page import="com.alipay.api.*"%>
<%@ page import="com.alipay.api.internal.util.*"%>
<%@ page import="com.sun.org.apache.xpath.internal.operations.Or" %>
<%@ page import="com.etc.service.OrderServiceImpl" %>
<%@ page import="com.etc.util.PageData" %>
<%@ page import="com.etc.entity.Order" %>
<%
/* *
 * 功能：支付宝服务器异步通知页面
 * 日期：2017-03-30
 * 说明：
 * 以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
 * 该代码仅供学习和研究支付宝接口使用，只是提供一个参考。


 *************************页面功能说明*************************
 * 创建该页面文件时，请留心该页面文件中无任何HTML代码及空格。
 * 该页面不能在本机电脑测试，请到服务器上做测试。请确保外部可以访问该页面。
 * 如果没有收到该页面返回的 success 
 * 建议该页面只做支付成功的业务逻辑处理，退款的处理请以调用退款查询接口的结果为准。
 */
	System.out.println("异步通知");

	//获取支付宝POST过来反馈信息
	Map<String,String> params = new HashMap<String,String>();
	Map<String,String[]> requestParams = request.getParameterMap();
	for (Iterator<String> iter = requestParams.keySet().iterator(); iter.hasNext();) {
		String name = (String) iter.next();
		String[] values = (String[]) requestParams.get(name);
		String valueStr = "";
		for (int i = 0; i < values.length; i++) {
			valueStr = (i == values.length - 1) ? valueStr + values[i]
					: valueStr + values[i] + ",";
		}
		//乱码解决，这段代码在出现乱码时使用
//		valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");
		params.put(name, valueStr);
	}
	
	boolean signVerified = AlipaySignature.rsaCheckV1(params, AlipayConfig.alipay_public_key, AlipayConfig.charset, AlipayConfig.sign_type); //调用SDK验证签名
	System.out.println("验签"+signVerified);
	//——请在这里编写您的程序（以下代码仅作参考）——
	
	/* 实际验证过程建议商户务必添加以下校验：
	1、需要验证该通知数据中的out_trade_no是否为商户系统中创建的订单号，
	2、判断total_amount是否确实为该订单的实际金额（即商户订单创建时的金额），
	3、校验通知中的seller_id（或者seller_email) 是否为out_trade_no这笔单据的对应的操作方（有的时候，一个商户可能有多个seller_id/seller_email）
	4、验证app_id是否为该商户本身。
	*/
	OrderServiceImpl osi=new OrderServiceImpl();
	if(signVerified) {//验证成功

		//商户订单号
		String out_trade_no = new String(request.getParameter("out_trade_no").getBytes("ISO-8859-1"),"UTF-8");
		System.out.println(out_trade_no);
		//支付宝交易号
		String trade_no = new String(request.getParameter("trade_no").getBytes("ISO-8859-1"),"UTF-8");
	
		//交易状态
		String trade_status = new String(request.getParameter("trade_status").getBytes("ISO-8859-1"),"UTF-8");
		System.out.println(trade_status);

		//交易状态说明
		//TRADE_FINISHED 交易结束，不可退款
		// 为true 触发通知
		//false 不触发通知
		if(trade_status.equals("TRADE_FINISHED")){
			//判断该笔订单是否在商户网站中已经做过处理
			//如果没有做过处理，根据订单号（out_trade_no）在商户网站的订单系统中查到该笔订单的详细，并执行商户的业务程序
			//如果有做过处理，不执行商户的业务程序
				
			//注意：
			//退款日期超过可退款期限后（如三个月可退款），支付宝系统发送该交易状态通知

		//TRADE_SUCCESS 支付成功
		}else if (trade_status.equals("TRADE_SUCCESS")){
			//查询该笔订单是否处理过
			PageData pageData=osi.queryAllOrder(out_trade_no,1,1);
			Order order= (Order) pageData.getData().get(0);
			if(pageData.getData().size()!=0){
				int satus= order.getOrderStatus();
				System.out.println(satus);
				//订单未处理过
				if(satus!=1&&satus!=-1){
					//执行修改订单
					boolean flag=osi.updateByOrderId(1,out_trade_no);
					if(flag){
						System.out.println("修改成功");
					}else {
						System.out.println("修改状态，未知错误");
					}
				}
			}
		}
		
		out.println("success");
		
	}else {//验证失败
		out.println("fail");
	
		//调试用，写文本函数记录程序运行情况是否正常
		//String sWord = AlipaySignature.getSignCheckContentV1(params);
		//AlipayConfig.logResult(sWord);
	}
	
	//——请在这里编写您的程序（以上代码仅作参考）——
	
%>