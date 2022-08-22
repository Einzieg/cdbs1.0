package com.etc.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.util.UUID;


/**
 * Servlet implementation class MovieFileDownloadServlet
 */
@WebServlet("/UploadServlet")
@MultipartConfig//支持文件上传
public class UploadServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = -4354763158338790587L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		//接收表单提交的内容 包含的文件组件
		String filename=request.getParameter("fileName");
		//获取文件
		Part part = request.getPart("myfile");
		//创建目录 文件的存储位置
		File file = new File("E:\\uploadFile");
		if (!file.exists()) {
			//创建目录
			file.mkdirs();
		}
		//获取文件名
		System.out.println(part.getName());
		//文件真实名称,需要设置请求头
		String header = part.getHeader("content-disposition");
		String realName = header.substring(header.indexOf("filename="+10,header.length()-1));
		//避免文件名重复,在文件名前面加入UUID唯一标识符
		UUID uuid = UUID.randomUUID();
		String newFileName= uuid+realName;
		//文件名
		System.out.println(newFileName);
		
		//文件大小
		long size = part.getSize();
		System.out.println(size);
		//文件类型
		System.out.println(part.getContentType());
		
		String filePath="E:\\uploadFile\\"+realName;
		//写入文件
		part.write(filePath);
		System.out.println("文件上传成功");
		
		
	}
}
