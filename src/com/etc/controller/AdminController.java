package com.etc.controller;

import com.etc.entity.*;
import com.etc.service.AdminServiceImpl;
import com.etc.service.CinemaServiceImpl;
import com.etc.service.FilmServiceImpl;
import com.etc.service.SliceArrangementServiceImpl;
import com.etc.util.PageData;
import com.google.gson.Gson;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;
import java.util.List;
import java.util.UUID;

/**
 * Servlet implementation class adminController
 */
@WebServlet("/AdminController")
@MultipartConfig
public class AdminController extends HttpServlet {
    AdminServiceImpl asi = new AdminServiceImpl();
    private static final long serialVersionUID = 1L;
    CinemaServiceImpl csi = new CinemaServiceImpl();
    FilmServiceImpl filmService = new FilmServiceImpl();
    SliceArrangementServiceImpl sliceService = new SliceArrangementServiceImpl();
    CinemaServiceImpl cinemaService = new CinemaServiceImpl();

    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminController() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException,
			IOException {
        //设置响应格式

        response.setContentType("text/html;charset=utf-8");

        //接收请求
        String op = request.getParameter("op");

        switch (op) {
            case "queryMovies"://查询已上架电影
                queryMovies(request, response);
                break;
            case "addMovie"://增加电影
                addMovie(request, response);
                break;
            case "queryMovieById"://根据编号查询
                queryMovieById(request, response);
                break;
            case "queryMovieByStatus"://查询已下架电影
                queryMovieByStatus(request, response);
                break;
            case "updateMovie"://修改电影
                updateMovie(request, response);
                break;
            case "updateMovieStatus"://电影下架
                updateMovieStatus(request, response);
                break;
            case "queryFilmName"://查电影名
                queryFilmName(request, response);
                break;
            case "queryCinemaName"://查影厅
                queryCinemaName(request, response);
                break;
            case "querySlice"://查排片
                querySlice(request, response);
                break;
            case "updateSliceArr"://修改排片
                updateSliceArr(request, response);
                break;
            case "addSliceArrangement"://增加排片
                addSliceArrangement(request, response);
                break;
            case  "adminLogin":
                //调用登录的方法
                adminLogin(request, response);
                break;
            case "query":
                //调用查询所有用户的方法
                query(request, response);
                break;
            case  "userQueryAjxa":
                // 调用根据用户的用户名模糊查询及分页
                userQueryAjxa(request, response);
                break;
            case  "updateUser":
                updateUser(request, response);
            case "deleteUserOnAdmin":
                //调用注销用户的方法
                deleteUserOnAdmin(request, response);
                break;
            case  "queryCinemas":
                //调用查询所有影厅的方法
                queryCinemas(request, response);
                break;
            case "updateCinema":
                //调用修改影厅的方法
                updateCinema(request, response);
                break;
            case  "addCinema":
                //调用增加影厅的方法
                addCinema(request, response);
                break;
            case "queryAdmins":
                //查询所有管理员的方法
                queryAdmins(request,response);
                break;
            case "updateAdmin":
                //修改管理员的方法
                try {
                    updateAdmin(request,response);

                } catch (NoSuchAlgorithmException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                } catch (IOException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }
                break;
            case "addAdmin":
                try {
                    addAdmin(request,response);
                } catch (NoSuchAlgorithmException e) {
                    throw new RuntimeException(e);
                }
                break;
            case "deleteSlice"://删除排片
                deleteSlice(request, response);
                break;
        }


    }

    private void addCinema(HttpServletRequest request, HttpServletResponse response) throws IOException {
        //接收影厅数据
        String cinemaName = request.getParameter("cinemaName");
        String cinemaSeat = request.getParameter("cinemaSeat");
        int cinemaSeat1 = Integer.parseInt(cinemaSeat);
        //调用业务层
        Cinema cinema = new Cinema(cinemaName, cinemaSeat1);
        boolean b = csi.insertCinema(cinema);
        Gson gson = new Gson();
        String json = gson.toJson(b);
        PrintWriter out = response.getWriter();
        out.print(json);
        out.close();
    }

    private void updateCinema(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String cinemaStr = request.getParameter("cinema");
        //服务器通过第三方类库GSON.fromJSON() 解析json字符串
        Gson gson = new Gson();
        Cinema cinema = gson.fromJson(cinemaStr, Cinema.class);

        boolean b = csi.updateCinema(cinema);
        String json = gson.toJson(b);
        PrintWriter out = response.getWriter();
        out.print(json);
        out.close();
    }

    private void queryCinemas(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("application/json");
        List<Cinema> cinemas = csi.queryCinemas();
        //将数据存储到request作用域
        request.setAttribute("cinemas", cinemas);
        Gson gson = new Gson();
        String json = gson.toJson(cinemas);
        PrintWriter out = response.getWriter();
        out.print(json);
        out.close();
    }

    private void deleteUserOnAdmin(HttpServletRequest request, HttpServletResponse response) throws IOException {
        //从前端获取用户编号
        String userId = request.getParameter("userId");
        //将用户编号转成int类型(前端获取过来时是String类型)
        int userId2 = Integer.parseInt(userId);

        //调用业务层
        boolean b = asi.deleteUserOnAdmin(userId2);
        //将返回值通过Gson传回前端
        Gson gson = new Gson();
        String json = gson.toJson(b);
        PrintWriter out = response.getWriter();
        out.print(json);
        out.close();
    }

    private void updateUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
        //1.获取文章数据
        String userStr = request.getParameter("user");
        //服务器通过第三方类库GSON.fromJSON() 解析json字符串
        Gson gson = new Gson();
        User user = gson.fromJson(userStr, User.class);
        boolean b = asi.updateUserOnAdmin(user);
        String json = gson.toJson(b);
        PrintWriter out = response.getWriter();
        out.print(json);
        out.close();
    }

    private void userQueryAjxa(HttpServletRequest request, HttpServletResponse response) throws IOException,
			ServletException {
        //响应的编码格式
        response.setContentType("application/json");
        //1.默认页码和显示条数
        int pageNo = 1;//默认值
        int pageSize = 5;//默认值
        String titlekey = "";//如果没有传递,默认查所有

        //2.如果前端有指定值就使用前端传过来的数据,否则憨默认显示
        if (request.getParameter("pageNo") != null) {
            pageNo = Integer.parseInt(request.getParameter("pageNo"));
        }
        if (request.getParameter("pageSize") != null) {
            pageSize = Integer.parseInt(request.getParameter("pageSize"));
        }
        if (request.getParameter("titlekey") != null) {
            titlekey = request.getParameter("titlekey");
        }
        //3.调用业务层
        PageData pageData = asi.queryUserBylike(pageNo, pageSize, titlekey);// 根据用户的用户名模糊查询及分页
        //4.通过ajax放回json数据
        Gson gson = new Gson();
        String json = gson.toJson(pageData);
        response.getWriter().print(json);
    }

    private void query(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/adminUserManage.jsp").forward(request, response);

    }

    private void adminLogin(HttpServletRequest request, HttpServletResponse response) throws IOException,
			ServletException {
        //接收前端传回来的账号和密码
        String adminName = request.getParameter("adminName");
        String adminPassword = request.getParameter("adminPassword");
        //调用业务层的登录方法
        Admin admin = asi.loginAdamin(adminName, adminPassword);

        //判断管理员是否存在
        if (admin != null) {
            //判断管理员是否离职 1在职 0离职
            if (admin.getAdminState() == 1) {
                //提升:加入访问控制 存储用户得到session作用域
                //得到session对象
                String reme = request.getParameter("rememberMe");
                if (reme != null) {
                    Cookie cookie1 = new Cookie("adminName", adminName);
                    Cookie cookie2 = new Cookie("adminPassword", adminPassword);
                    //选中状态
                    Cookie cookie3 = new Cookie("checked", "checked");

                    //设置cookie的过期时间
                    cookie1.setMaxAge(1800);
                    cookie2.setMaxAge(1800);
                    cookie3.setMaxAge(1800);

                    response.addCookie(cookie1);
                    response.addCookie(cookie2);
                    response.addCookie(cookie3);
                }
                HttpSession session = request.getSession();
                session.setAttribute("Admin", admin);
                // 跳转到后台管理界面
//				request.getRequestDispatcher("AdminController?op=query").forward(request, response);
                response.sendRedirect("backstage/adminMovieManage.jsp");
            }
        } else {
            // 用户名和密码错误,跳转到登录页面
            // 1.转发
            // 2.重定向

            response.getWriter().print("<script>alert('用户名或密码错误');location.href='backstage/adminLogin.jsp" +
                    "'</script>");


        }
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */

    private void addSliceArrangement(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String filmName = request.getParameter("schedule-movie-input");
        String cinemaName = request.getParameter("schedule-hall-input");
        String startingTime = request.getParameter("schedule-start-date-input");
        String endTime = request.getParameter("schedule-end-date-input");
        boolean b = sliceService.insertArrangement(new SliceArrangement(new Film(filmName), new Cinema(cinemaName),
				startingTime, endTime));
        if (b) {
            response.getWriter().print("<script>alert('添加成功');location.href='backstage/adminScheduleManage" +
					".jsp'</script>");
        } else {
            response.getWriter().print("<script>alert('添加失败');location.href='backstage/adminScheduleManage" +
					".jsp'</script>");
        }
    }

    private void updateSliceArr(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Integer sliceId = Integer.valueOf(request.getParameter("sliceId"));
        String filmName = request.getParameter("schedule-edit-movie-input");
        String cinemaName = request.getParameter("schedule-edit-hall-input");
        String startingTime = request.getParameter("schedule-edit-start-date-input");
        String endTime = request.getParameter("schedule-edit-end-date-input");
        boolean b = sliceService.updateArrangement(new SliceArrangement(new Film(filmName), new Cinema(cinemaName),
				startingTime, endTime, sliceId));
        if (b) {
            response.getWriter().print("<script>alert('修改成功');location.href='backstage/adminScheduleManage" +
					".jsp'</script>");
        } else {
            response.getWriter().print("<script>alert('修改失败');location.href='backstage/adminScheduleManage" +
					".jsp'</script>");
        }
    }

    private void querySlice(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("application/json");
        String cinemaName = "";
        if (!"default".equals(request.getParameter("cinemaName"))) {
            cinemaName = request.getParameter("cinemaName");
        }
        String dateTime = request.getParameter("dateTime");

        List<SliceArrangement> list = sliceService.queryArrangementByDateAndCinema(cinemaName, dateTime);
        Gson gson = new Gson();
        String json = gson.toJson(list);
        PrintWriter out = response.getWriter();
        out.print(json);
        out.close();
    }

    private void queryFilmName(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("application/json");
        List<Film> list = filmService.queryFilm();
        Gson gson = new Gson();
        String json = gson.toJson(list);
        PrintWriter out = response.getWriter();
        //System.out.println(json);
        out.print(json);
        out.close();
    }

    private void queryCinemaName(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("application/json");
        List<Cinema> list = cinemaService.queryCinemaName();
        Gson gson = new Gson();
        String json = gson.toJson(list);
        PrintWriter out = response.getWriter();
        out.print(json);
        out.close();
    }

    private void updateMovieStatus(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html; charset=UTF-8");
        Integer filmId = Integer.valueOf(request.getParameter("filmId"));
        boolean b = filmService.updateFilmStatus(filmId);
    }

    private void updateMovie(HttpServletRequest request, HttpServletResponse response) throws ServletException,
			IOException {
        Integer filmId = Integer.valueOf(request.getParameter("filmId"));
        String filmType = request.getParameter("filmType");//类型
        String filmName = request.getParameter("filmName");//名称
        String movieShowtime = request.getParameter("movieShowtime");//上映时间
        String filmIntroduce = request.getParameter("filmIntroduce");//介绍
        String filmTime = request.getParameter("filmTime");//时长
        String filmLanguage = request.getParameter("filmLanguage");//语言
        String directorName = request.getParameter("directorName");//导演
        String performerName = request.getParameter("performerName");//主演
        Double ticketPrice = Double.valueOf(request.getParameter("ticketPrice"));//票价
        Part part = request.getPart("filmPester");//海报
        File file = new File("D:\\TestSe\\cdbs1.0\\web\\backstage\\files\\images\\filmPester");
        if (!file.exists()) {
            file.mkdir();
        }
        String header = part.getHeader("content-disposition");
        String realName = header.substring(header.indexOf("filename=") + 10, header.length() - 1);
        UUID uuid = UUID.randomUUID();
        String newFileName = uuid + realName;
        String filePath = file.getPath() + File.separator + newFileName;
        part.write(filePath);
        boolean b = filmService.updateFilm(new Film(filmType, filmName, newFileName, directorName, performerName,
				filmIntroduce, filmLanguage, filmTime, movieShowtime, ticketPrice, filmId));
        if (b) {
            //response.getWriter().print("<script>alert('修改成功');location.href='backstage/adminMovieManage
			// .jsp'</script>");
            queryMovieById(request, response);
            //request.getRequestDispatcher("/backstage/adminMovieDetail.jsp").forward(request, response);
        }
    }

    private void queryMovieByStatus(HttpServletRequest request, HttpServletResponse response) throws IOException {
        //默认页面和显示条数
        Integer pageNo = 1;
        Integer pageSize = 10;
        String titleKey = "";

        if (request.getParameter("pageNo") != null) {
            pageNo = Integer.valueOf(request.getParameter("pageNo"));
        }
        if (request.getParameter("pageSize") != null) {
            pageSize = Integer.valueOf(request.getParameter("pageSize"));
        }
        if (request.getParameter("titleKey") != null) {
            titleKey = request.getParameter("titleKey");
        }
        PageData pageData = filmService.queryStatusByKwPage(pageNo, pageSize, titleKey);
        //System.out.println(pageData.getTotalCount());
        Gson gson = new Gson();
        String json = gson.toJson(pageData);
        PrintWriter out = response.getWriter();
        out.print(json);
        out.close();

    }

    private void queryMovieById(HttpServletRequest request, HttpServletResponse response) throws ServletException,
			IOException {
        request.setCharacterEncoding("utf-8");
        Integer filmId = Integer.valueOf(request.getParameter("filmId"));
        Film film = filmService.queryFilmById(filmId);
        request.setAttribute("film", film);
        request.getRequestDispatcher("/backstage/adminMovieDetail.jsp").forward(request, response);
    }

    private void queryMovies(HttpServletRequest request, HttpServletResponse response) throws IOException {
        //默认页面和显示条数
        Integer pageNo = 1;
        Integer pageSize = 10;
        String titleKey = "";
        if (request.getParameter("pageNo") != null) {
            pageNo = Integer.valueOf(request.getParameter("pageNo"));
        }
        if (request.getParameter("pageSize") != null) {
            pageSize = Integer.valueOf(request.getParameter("pageSize"));
        }
        if (request.getParameter("titleKey") != null) {
            titleKey = request.getParameter("titleKey");
        }
        PageData pageData = filmService.queryArticleByKwPage(pageNo, pageSize, titleKey);
        Gson gson = new Gson();
        String json = gson.toJson(pageData);
        PrintWriter out = response.getWriter();
        out.print(json);
        out.close();
    }

    /**
     * 添加电影的方法
     */
    private void addMovie(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String filmType = request.getParameter("filmType");//类型
        String filmName = request.getParameter("filmName");//名称
        String movieShowtime = request.getParameter("movieShowtime");//上映时间
        String filmIntroduce = request.getParameter("filmIntroduce");//介绍
        String filmTime = request.getParameter("filmTime");//时长
        String filmLanguage = request.getParameter("filmLanguage");//语言
        String directorName = request.getParameter("directorName");//导演

        String performerName = request.getParameter("performerName");//主演

        Double ticketPrice = Double.valueOf(request.getParameter("ticketPrice"));//票价
        Part part = request.getPart("filmPester");//海报
        File file = new File("D:\\TestSe\\cdbs1.0\\web\\backstage\\files\\images\\filmPester");
        if (!file.exists()) {
            file.mkdir();
        }
        String header = part.getHeader("content-disposition");
        String realName = header.substring(header.indexOf("filename=") + 10, header.length() - 1);
        UUID uuid = UUID.randomUUID();
        String newFileName = uuid + realName;
        String filePath = file.getPath() + File.separator + newFileName;
        part.write(filePath);
        boolean b = filmService.insertFilm(new Film(filmType, filmName, newFileName, directorName, performerName, filmIntroduce, filmLanguage, filmTime, movieShowtime, ticketPrice));
        if (b) {
            response.getWriter().print("<script>alert('添加成功');location.href='backstage/adminMovieManage.jsp'</script>");
        } else {
            response.getWriter().print("<script>alert('添加失败');location.href='backstage/adminMovieManage.jsp'</script>");
        }
    }
    private void addAdmin(HttpServletRequest request, HttpServletResponse response) throws IOException, NoSuchAlgorithmException {
        //接收影厅数据
        String adminName = request.getParameter("adminName");
        String adminPassword = request.getParameter("adminPassword");
        //调用业务层
        Admin admin = new Admin(adminName, adminPassword);
        boolean b = asi.insertAdmin(admin);
        Gson gson = new Gson();
        String json = gson.toJson(b);
        PrintWriter out = response.getWriter();
        out.print(json);
        out.close();
    }

    private void updateAdmin(HttpServletRequest request, HttpServletResponse response) throws IOException, NoSuchAlgorithmException {
        //1.获取文章数据
        String adminStr = request.getParameter("admin");
        //服务器通过第三方类库GSON.fromJSON() 解析json字符串
        Gson gson = new Gson();
        Admin admin = gson.fromJson(adminStr,Admin.class);

        boolean b = asi.updateAdamin(admin);
        String json = gson.toJson(b);
        PrintWriter out = response.getWriter();
        out.print(json);
        out.close();
    }

    private void queryAdmins(HttpServletRequest request, HttpServletResponse response) throws IOException {
        List<Admin> admins = asi.queryAdmins();
        //将数据存储到request作用域
        request.setAttribute("admins", admins);
        Gson gson = new Gson();
        String json = gson.toJson(admins);
        PrintWriter out = response.getWriter();
        out.print(json);
        out.close();
    }
    private void deleteSlice(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Integer sliceId = Integer.valueOf(request.getParameter("sliceId"));
        boolean b=sliceService.deleteArrangement(sliceId);
        //querySlice(request, response);
        PrintWriter out = response.getWriter();
        out.print(b);
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
