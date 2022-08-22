package com.etc.controller;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Paths;

@WebServlet(name = "MovieFileDownloadServlet", value = "/MovieFileDownloadServlet")
public class MovieFileDownloadServlet extends HttpServlet {

    @Override
    public void init() throws ServletException {
        super.init();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        InputStream in = null;
        ServletOutputStream out = null;
        try {
            //设置编码格式
            request.setCharacterEncoding("utf-8");
            response.setContentType("text/html; charset=UTF-8");
            //System.out.println("MovieFileDownloadServlet");
            /*
             * 解决下载 你的名字.txt时乱码的问题
             */
            //1.获取下载文件的名称
            String filename = request.getParameter("fileName");
            //System.out.println("获取的文件名" + filename);
            filename = new String(filename.getBytes("ISO8859-1"), StandardCharsets.UTF_8);
            //*告诉客户端这个文件不是解析 而是以附件的形式下载
            response.setHeader("Content-Disposition", "attachment;filename=" + filename);
            //2.获取文件的绝对路径
            String path = "D:\\TestSe\\cdbs1.0\\web\\backstage\\files\\images\\filmPester\\" + filename;
            //3.获得该文件的输入流
            in = Files.newInputStream(Paths.get(path));
            //获得输出流---通过response获得的输出流  用于向客户端写内容
            out = response.getOutputStream();
            //拷贝文件
            int len = 0;
            byte[] buffer = new byte[1024];

            while ((len = in.read(buffer)) > 0) {
                out.write(buffer, 0, len);
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        } finally {
            try {
                if (null != in) {
                    in.close();
                }
                if (null != out) {
                    out.close();
                }
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    public void destroy() {
        super.destroy();
    }
}
