package com.etc.controller;

import com.etc.entity.Film;
import com.etc.entity.MessageBoard;
import com.etc.entity.User;
import com.etc.service.MessageBoardServiceimpl;
import com.etc.util.PageData;
import com.google.gson.Gson;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

/**
 * Servlet implementation class MessageBoardController
 */
@WebServlet("/MessageBoardController")
public class MessageBoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	MessageBoardServiceimpl msi= new MessageBoardServiceimpl();
	/**
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MessageBoardController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//2.获取请求参数op的值
				String op=request.getParameter("op");
				if("messageboradQuerylike".equals(op)) {//根据影片编号查询一级评论级并分页(后台)
					messageboradQuerylike(request,response);
				}else if("deleteMessageBorad".equals(op)) {//根据评论编号删除评论
					deleteMessageBorad(request,response);
				}else if("messageboradQuery".equals(op)) {//根据影片编号查询评论级并分页(前台)
					messageboradQuery(request,response);
				}else if("addMessage".equals(op)) {//新增评论
					addMessage(request,response);
				}else if("queryMessageId".equals(op)) {//查询二级评论
					queryMessageId(request,response);
				}else if("addmessageBorad".equals(op)) {//回复评论
					addmessageBorad(request,response);
				}
	}

	private void addmessageBorad(HttpServletRequest request, HttpServletResponse response) throws IOException {
		//响应的编码格式
		response.setContentType("application/json");
		int filmId= Integer.parseInt(request.getParameter("filmId"));
		int userId =Integer.parseInt(request.getParameter("userId"));
		String messageCon =request.getParameter("messageCon");
		int reply =Integer.parseInt(request.getParameter("reply"));
		MessageBoard messageBoard=new MessageBoard(new Film(filmId),  new User(userId), messageCon,reply);
		boolean result =msi.addMessageBoard(messageBoard);
		
		Gson gson = new Gson();
		String json= gson.toJson(result);
		
		response.getWriter().print(json);
	}

	private void queryMessageId(HttpServletRequest request, HttpServletResponse response) throws IOException {
		//响应的编码格式
		response.setContentType("application/json");
		int messageId=Integer.parseInt(request.getParameter("messageId"));
		MessageBoard message = msi.queryMessageById(messageId);
		
		List<MessageBoard> list= new ArrayList<MessageBoard>();
		list=msi.queryMessageBoardById(messageId);
		 list.add(0,message); 
		for (MessageBoard messageBoard : list) {
			System.out.println(messageBoard);
		}
		Gson gson = new Gson();
		String json= gson.toJson(list);
		response.getWriter().print(json);
	}

	private void addMessage(HttpServletRequest request, HttpServletResponse response) throws IOException {
		//响应的编码格式
		response.setContentType("application/json");
		int filmId= Integer.parseInt(request.getParameter("filmId"));
		String userId=request.getParameter("userId");
		int userId1=Integer.parseInt(userId);
		String message=request.getParameter("message");
		
		
		
		
		MessageBoard messageBoard=new MessageBoard(new Film(filmId),  new User(userId1), message,0);
		boolean result =msi.addMessageBoard(messageBoard);
		
		Gson gson = new Gson();
		String json= gson.toJson(result);
		
		response.getWriter().print(json);
	}

	private void messageboradQuery(HttpServletRequest request, HttpServletResponse response) throws IOException {
		//响应的编码格式
				response.setContentType("application/json");
				//1.默认页码和显示条数
				int pageNo = 1;//默认值
				int pageSize = 4;//默认值
		System.out.println(request.getParameter("filmId"));
				int fileNum = Integer.parseInt(request.getParameter("filmId"));//影片编号
				
				//2.如果前端有指定值就使用前端传过来的数据,否则憨默认显示
				if(request.getParameter("pageNo")!=null) {
					System.out.println(pageNo);
					pageNo=Integer.parseInt(request.getParameter("pageNo"));
				}
				if(request.getParameter("pageSize")!=null) {
					pageSize=Integer.parseInt(request.getParameter("pageSize"));
				}
				
				//3.调用业务层
				PageData pageData = msi.queryMessageBoardLimit(pageNo, pageSize, fileNum,0);				
				Gson gson = new Gson();
				String json= gson.toJson(pageData);
				response.getWriter().print(json);
		
	}

	private void deleteMessageBorad(HttpServletRequest request, HttpServletResponse response) throws IOException {
	response.setContentType("application/json");
		
		int messageId=Integer.parseInt(request.getParameter("messageId"));
					
		MessageBoardServiceimpl msi = new MessageBoardServiceimpl();
		boolean b =msi.deleteMessageBoard(messageId);		
		Gson gson = new Gson();
		String json = gson.toJson(b);
		PrintWriter out = response.getWriter(); 
		out.print(json);		
		out.close();
	}
		

	private void messageboradQuerylike(HttpServletRequest request, HttpServletResponse response) throws IOException {
		//响应的编码格式
				response.setContentType("application/json");
				//1.默认页码和显示条数
				int pageNo = 1;//默认值
				int pageSize = 10;//默认值
				String titlekey ="";//如果没有传递,默认查所有
				
				//2.如果前端有指定值就使用前端传过来的数据,否则憨默认显示
				if(request.getParameter("pageNo")!=null) {
					pageNo=Integer.parseInt(request.getParameter("pageNo"));
				}
				if(request.getParameter("pageSize")!=null) {
					pageSize=Integer.parseInt(request.getParameter("pageSize"));
				}
				if(request.getParameter("titlekey")!=null) {
					titlekey=request.getParameter("titlekey");
				}
				//3.调用业务层
				PageData pageData = msi.queryMessageBoardBylike(pageNo, pageSize, titlekey);				
				Gson gson = new Gson();
				String json= gson.toJson(pageData);				
				response.getWriter().print(json);
				

		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
