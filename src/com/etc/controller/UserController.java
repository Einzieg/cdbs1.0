package com.etc.controller;

import com.etc.entity.Film;
import com.etc.entity.Order;
import com.etc.entity.SliceArrangement;
import com.etc.entity.User;
import com.etc.service.*;
import com.google.gson.Gson;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

@WebServlet(name = "UserController", value = "/UserController")
@MultipartConfig
public class UserController extends HttpServlet {

    FilmServiceImpl filmService = new FilmServiceImpl();
    SliceArrangementServiceImpl sliceService = new SliceArrangementServiceImpl();
    CinemaServiceImpl cinemaService = new CinemaServiceImpl();
    UserService serviceImpl = new UserServiceImpl();

    @Override
    public void init() throws ServletException {
        super.init();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //设置编码格式
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html; charset=UTF-8");
        String op = request.getParameter("op");
        if (op != null) {
            userOp(op, request, response);
        }
    }

    private void userOp(String op, HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        switch (op) {
            case "queryMovies"://首页显示电影
                queryMovies(request, response);
                break;
            case "queryMovieById"://电影详情页
                queryMovieById(request, response);
                break;
            case "querySlice"://显示排片
                querySlice(request, response);
                break;
            case "checkName":
                checkName(request, response);
                break;
            case "register":
                register(request,response);
                break;
            case "frontLogin":
                frontLogin(request,response);
                break;
            case "frontExit":
                frontExit(request,response);
                break;
            case "upUser":
                upUser(request,response);
                break;
            case "alipay":
                alipay(request,response);
                break;
            case "querySeatNum":
                querySeatNum(request,response);
                break;
        }
    }

    private void querySeatNum(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("application/json");
        String time =request.getParameter("num");
        OrderServiceImpl osi=new OrderServiceImpl();
        List<Order> list=osi.queryByPlay(time);
        Gson gson = new Gson();
        String json = gson.toJson(list);
        PrintWriter out = response.getWriter();
        out.print(json);
        out.close();
    }

    private void alipay(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.setCharacterEncoding("utf-8");
        Integer filmId = Integer.valueOf(request.getParameter("filmId"));
        Film film = filmService.queryFilmById(filmId);
        String time =request.getParameter("startingTime");
        String name=request.getParameter("cinemaName");
        request.setAttribute("film", film);
        request.setAttribute("time", time);
        request.setAttribute("name",name);

        //response.sendRedirect("front/single.jsp");
        request.getRequestDispatcher("front/seat-selection.jsp").forward(request, response);
    }

    private void upUser(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        //1.获取用户名和密码
        String userName = request.getParameter("userName2");
        String password = request.getParameter("password2");
        Part part = request.getPart("userImg2");
        String gender = request.getParameter("gender");
        //创建目录 文件的存储位置
        File file = new File("D:\\TestSe\\cdbs1.0\\web\\backstage\\files\\images\\filmPester");
        if (!file.exists()) {
            file.mkdirs();
        }
        //文件真实名称,需要设置请求头
        String header = part.getHeader("content-disposition");
        String realName=header.substring(header.indexOf("filename=")+10,header.length()-1);
        //避免文件重复  加入uuid
        UUID uuid = UUID.randomUUID();
        String newFileName = uuid+realName;

        //文件全路径 file.separator文件操作符
        String filePath=file.getPath()+file.separator+newFileName;
        //写入文件
        part.write(filePath);
        boolean b = false;
        try {
            b = serviceImpl.updateUserInformation(userName, password,newFileName,gender);
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }

        if (b) {
            //修改成功前往登录
            response.getWriter().print("<script>alert('修改成功！');location.href='front/index.jsp'</script>");
            request.getSession().removeAttribute("frontUser");
            PrintWriter out = response.getWriter();
            out.print("success");
            out.close();

        }
    }

    private void frontExit(HttpServletRequest request, HttpServletResponse response) throws IOException {
        //清除session信息
        request.getSession().removeAttribute("frontUser");
        PrintWriter out = response.getWriter();
        out.print("success");
        out.close();
    }

    private void frontLogin(HttpServletRequest request, HttpServletResponse response) throws IOException {
        //1.获取用户名和密码
        String userName = request.getParameter("uname");
        String password = request.getParameter("upwd");
        PrintWriter out = response.getWriter();
        //2.调用业务层
        User user = null;
        try {
            user = serviceImpl.login(userName, password);
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
        HashMap<String,Object> Map = new HashMap<String, Object>();
        //3.判断
        boolean flag=false;
        if (user!=null) {
            //4.用户名密码,判断其状态
            if (user.getUserState()==1) {
                //登录成功,存session
                //session.setAttribute("frontUser", user);
                //判断用户是否记住密码
                String re = request.getParameter("remember-me");
                flag=true;
                //System.out.println(re);//没有勾选,输出null
                if (re!=null) {
                    //System.out.println("用户选择记住密码"+re);
                    //存
                    Cookie cookie1 = new Cookie("userName", userName);
                    Cookie cookie2 = new Cookie("password", password);
                    Cookie cookie3 = new Cookie("checked", "checked");//选中状态

                    //设置过期时间
                    cookie1.setMaxAge(3600);//单位是秒
                    cookie2.setMaxAge(3600);
                    cookie3.setMaxAge(3600);

                    response.addCookie(cookie1);
                    response.addCookie(cookie2);
                    response.addCookie(cookie3);



                }
                HttpSession session = request.getSession();
                session.setAttribute("frontUser", user);
                session.setAttribute("users", user);


            }

        }
        Map.put("users", user);
        Map.put("flag", flag);
        Gson gson = new Gson();
        String json = gson.toJson(Map);
        out.print(json);
        out.close();
    }

    private void register(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //设置响应数据的格式
        response.setContentType("text/html;charset=utf-8");
        //获取用户信息
        String userName = request.getParameter("userName2");
        String password = request.getParameter("password2");
        Part part = request.getPart("userImg2");
        String gender = request.getParameter("sex");
        //创建目录 文件的存储位置
        File file = new File("D:\\TestSe\\cdbs1.0\\web\\backstage\\files\\images\\filmPester");
        if (!file.exists()) {
            file.mkdirs();
        }
        //文件真实名称,需要设置请求头
        String header = part.getHeader("content-disposition");
        String realName=header.substring(header.indexOf("filename=")+10,header.length()-1);
        //避免文件重复  加入uuid
        UUID uuid = UUID.randomUUID();
        String newFileName = uuid+realName;

        //文件全路径 file.separator文件操作符
        String filePath=file.getPath()+file.separator+newFileName;
        //写入文件
        part.write(filePath);
        //调用业务层的注册功能
        boolean b = false;
        try {
            b = serviceImpl.registerUser(userName, password, newFileName,gender);
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
        if (b) {
            //注册成功前往登录
            response.getWriter().print("<script>alert('注册成功！');location.href='front/index.jsp'</script>");
        }
    }

    private void checkName(HttpServletRequest request, HttpServletResponse response) throws IOException {
        //获取用户名
        String userName = request.getParameter("uname");
        PrintWriter out = response.getWriter();
        //System.out.println(userName);
        //调用业务层
        List<User> list = serviceImpl.getAllUsers();
        boolean flag=false;
        for (User user : list) {
            if(user.getUserName().equals(userName)) {
                flag=true;
                break;
            }
        }
        if (flag) {
            out.print("用户名已存在");
        } else {
            out.print("可用");//不能使用println()
        }
    }

    private void querySlice(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("application/json");
        String filmName = "";
        if (!"".equals(request.getParameter("filmName"))) {
            filmName = request.getParameter("filmName");
        }
        String dateTime = request.getParameter("dateTime");
        List<SliceArrangement> list = sliceService.queryArrangementByDateAndFilm(filmName, dateTime);
        Gson gson = new Gson();
        String json = gson.toJson(list);
        PrintWriter out = response.getWriter();
        out.print(json);
        out.close();
    }

    private void queryMovieById(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        Integer filmId = Integer.valueOf(request.getParameter("filmId"));
        Film film = filmService.queryFilmById(filmId);
        request.setAttribute("film", film);
        //response.sendRedirect("front/single.jsp");
        request.getRequestDispatcher("front/singleTest.jsp").forward(request, response);

    }

    private void queryMovies(HttpServletRequest request, HttpServletResponse response) throws IOException {
        List<Film> list = filmService.queryOnFilm();
        Gson gson = new Gson();
        String json = gson.toJson(list);
        PrintWriter out = response.getWriter();
        out.print(json);
        out.close();
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
