package com.etc.controller;

import com.etc.entity.Film;
import com.etc.entity.Order;
import com.etc.entity.User;
import com.etc.service.OrderServiceImpl;
import com.etc.util.PageData;
import com.google.gson.Gson;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.UUID;

@WebServlet(name = "OrderServlet", value = "/OrderServlet")
public class OrderServlet extends HttpServlet {


    //默认页码和条数
    Integer pageNo = 1;//默认值
    Integer pageSize=10;//默认值
    OrderServiceImpl osi = new OrderServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException,
            IOException {

        response.setContentType("text/html;charset=utf-8");
        //获取请求操作
        String op = request.getParameter("op");

        //执行操作
        switch (op) {
            //新增订单
            case "addOrder":
                inputOrder(request, response);
                break;
                //根据用户id查询订单
            case "queryByUserId":
                queryById(request, response);
                break;
                //根据用户名查询订单
            case "queryByUserName":
                queryByUName(request, response);
                break;
                //根据关键字模糊查询订单
            case "queryAllOrder":
                queryAll(request, response);
                break;
                //根据影片编号查询订单
            case "queryByFilmNum":
                queryByNum(request, response);
                break;
                //根据时间段查询订单
            case "queryByOrderDate":
                queryByDate(request, response);
                break;
                //根据订单状态查询订单
            case "queryByOrderStatus":
                queryByStatus(request, response);
                break;
                //根据订单编号修改订单状态
            case "updateByOrderId":
                updateById(request, response);
                break;
                //根据订单编号删除订单（修改状态，不在用户端展示）
            case "delByOrderId":
                delById(request, response);
                break;
                //根据用户名和时间区间查询订单
            case "queryByIdAndTime":

                queryByUIdAndTime(request, response);
                break;
                //票房查询
            case "queryGrossed":
                queryByGrossed(request, response);
                break;


        }
    }

    private void queryByGrossed(HttpServletRequest request, HttpServletResponse response) throws IOException {
        //设置电影名字默认值
        String  FilmName ="";
        if(request.getParameter("keyword")!=null&&!"".equals(request.getParameter("keyword"))){
            FilmName=(request.getParameter("keyword"));
        }
        if (request.getParameter("pageNo") != null) {
            pageNo = Integer.valueOf(request.getParameter("pageNo"));
        }
        if(request.getParameter("pageSize")!=null){
            pageSize = Integer.valueOf(request.getParameter("pageSize"));
        }

        PageData pageData=osi.queryByFilmName(FilmName,pageNo,pageSize);
        Gson gson = new Gson();

        String json = gson.toJson(pageData);

        PrintWriter out = response.getWriter();
        out.print(json);
        out.close();
    }

    private void queryByUIdAndTime(HttpServletRequest request, HttpServletResponse response) throws IOException,
            ServletException {

        //默认查询时间区间
        String startTime = "0000-00-00 00:00:00";
        String endTime = "9999-00-00 00:00:00";

        //获取前端用户id
        int userId = Integer.parseInt(request.getParameter("userId"));

        if (request.getParameter("pageNo") != null) {
            //获取前端页码
            pageNo = Integer.valueOf(request.getParameter("pageNo"));
        }
        if ("".equals(request.getParameter("startTime")) && "".equals(request.getParameter("endTime"))) {
            queryAll(request, response);
        } else {
            if (request.getParameter("startTime") != null) {
                startTime = request.getParameter("startTime");
            }
            if (request.getParameter("endTime") != null&&!"".equals(request.getParameter("endTime"))) {
                endTime = request.getParameter("endTime");
            }
            if (request.getParameter("pageSize") != null) {
                pageSize = Integer.valueOf(request.getParameter("pageSize"));
            }

            PageData pageData = osi.queryByOrderDateAndId(userId,startTime,endTime,pageNo, pageSize);
            //通过ajax返回数据
            Gson gson = new Gson();
            String json = gson.toJson(pageData);
            PrintWriter out = response.getWriter();
            out.print(json);

            out.close();
        }
    }

    private void queryByUName(HttpServletRequest request, HttpServletResponse response) throws IOException {
        //获取前端用户ids
        if (request.getParameter("userName")!=null&&!"".equals(request.getParameter("userName"))){
            String userName =request.getParameter("userName");

            if (request.getParameter("pageNo") != null) {
                pageNo = Integer.valueOf(request.getParameter("pageNo"));
            }

            if(request.getParameter("pageSize")!=null){
                pageSize = Integer.valueOf(request.getParameter("pageSize"));
            }
            PageData pageData = osi.queryByUserName(userName, pageNo, pageSize);
            //通过ajax返回数据
            Gson gson = new Gson();
            String json = gson.toJson(pageData);
            PrintWriter out = response.getWriter();
            out.print(json);

            out.close();
        }
    }

    private void inputOrder(HttpServletRequest request, HttpServletResponse response) {
        //生成订单号
        String uuid = String.valueOf(UUID.randomUUID());
        //获取前端回传的影片编号，
        int filmId = Integer.parseInt(request.getParameter("filmId"));
        //获取用户编号
        int userId = Integer.parseInt(request.getParameter("userId"));
        //获取票价
        double ticketPrice = Double.parseDouble(request.getParameter("ticketPrice"));
        //获取购买数量
        int count = Integer.parseInt(request.getParameter("count"));
        //获取订单状态
        int OrderStatus = Integer.parseInt(request.getParameter("OrderStatus"));
        //调用业务层新增订单
        boolean i = osi.addOrder(new Order(uuid, new Film(filmId), new User(userId), ticketPrice, count, OrderStatus));

    }

    private void delById(HttpServletRequest request, HttpServletResponse response) throws IOException {
        //获取前端订单编号
        String orderId = request.getParameter("orderId");
        //调用业务层
        boolean i = osi.delByOrderId(orderId);
        Gson gson = new Gson();
        String json = gson.toJson( i);
        PrintWriter out = response.getWriter();
        out.print(json);
        out.close();

    }

    private void updateById(HttpServletRequest request, HttpServletResponse response) throws ServletException,
            IOException {
        //获取前端订单编号

        String orderId = request.getParameter("inputOrderId");

        //获取前端订单状态
        if (request.getParameter("inputOrderStatus") != null&& !"".equals(request.getParameter("inputOrderStatus"))) {
            int OrderStatus = Integer.parseInt(request.getParameter("inputOrderStatus"));

            //调用业务层修改订单
            boolean i = osi.updateByOrderId(OrderStatus, orderId);
            if(i){

                response.sendRedirect("/cdbs1.0/backstage/adminOrderManage.jsp");
            }
        }
    }
    private void queryByStatus(HttpServletRequest request, HttpServletResponse response) throws IOException {

        if (request.getParameter("pageNo") != null) {
            //获取前端页码
            pageNo = Integer.valueOf(request.getParameter("pageNo"));
        }
        //获取前端条数
        if(request.getParameter("pageSize")!=null){
            pageSize = Integer.valueOf(request.getParameter("pageSize"));
        }

        //获取前端订单状态
        if(request.getParameter("OrderStatus")!=null&&!"".equals(request.getParameter("OrderStatus"))){
            int  orderStatus= Integer.parseInt(request.getParameter("OrderStatus"));
        //调用查询
        PageData pageData = osi.queryByOrderStatus(orderStatus, pageNo, pageSize);
        //通过AJAX返回数据
        Gson gson = new Gson();
        String json = gson.toJson(pageData);
        PrintWriter out = response.getWriter();
        out.print(json);
        out.close();
        }
    }

    private void queryByDate(HttpServletRequest request, HttpServletResponse response) throws IOException,
            ServletException {

        //默认查询时间区间
        String startTime = "0000-00-00 00:00:00";
        String endTime = "9999-00-00 00:00:00";

        if ("".equals(request.getParameter("startTime")) && "".equals(request.getParameter("endTime"))) {
            queryAll(request, response);
        } else {
            if (request.getParameter("startTime") != null) {
                startTime = request.getParameter("startTime");
            }
            if (request.getParameter("endTime") != null) {
                endTime = request.getParameter("endTime");
            }
            if(request.getParameter("pageSize")!=null){
                pageSize = Integer.valueOf(request.getParameter("pageSize"));
            }

            //获取前端页码
            if (request.getParameter("pageNo") != null) {
                pageNo = Integer.valueOf(request.getParameter("pageNo"));
            }
            //调用查询
            PageData pageData = osi.queryByOrderDate(startTime, endTime, pageNo, pageSize);
            //通过ajax返回数据
            Gson gson = new Gson();
            String json = gson.toJson(pageData);
            PrintWriter out = response.getWriter();
            out.print(json);
            out.close();
        }

    }

    private void queryByNum(HttpServletRequest request, HttpServletResponse response) throws IOException,
            ServletException {
        //获取电影编号

        if (request.getParameter("filmNum")==null||"".equals(request.getParameter("filmNum"))) {
            queryAll(request, response);
        } else {

            int filmNum = Integer.parseInt(request.getParameter("filmNum"));

            //获取前端页码
            if (request.getParameter("pageNo") != null) {
                pageNo = Integer.valueOf(request.getParameter("pageNo"));
            }
            //获取前端条数
            pageSize = Integer.valueOf(request.getParameter("pageSize"));
            //调用查询
            PageData pageData = osi.queryByFilmNum(filmNum, pageNo, pageSize);

            //通过ajax返回数据
            Gson gson = new Gson();
            String json = gson.toJson(pageData);
            PrintWriter out = response.getWriter();
            out.print(json);
            out.close();
        }

    }

    private void queryAll(HttpServletRequest request, HttpServletResponse response) throws IOException,
            ServletException {
        //设置默认查询关键字
        String keyword = "";
        if (request.getParameter("keyword") != null)
            keyword = request.getParameter("keyword");
        if (request.getParameter("pageNo") != null) {
            //获取前端页码
            pageNo = Integer.valueOf(request.getParameter("pageNo"));
        }
        //获取前端条数
        if(request.getParameter("pageSize")!=null){
            pageSize = Integer.valueOf(request.getParameter("pageSize"));
        }

        //调用查询
        PageData pageData = osi.queryAllOrder(keyword, pageNo, pageSize);
        //通过ajax返回数据
        Gson gson = new Gson();
        String json = gson.toJson(pageData);
        PrintWriter out = response.getWriter();
        out.print(json);
        out.close();
    }

    private void queryById(HttpServletRequest request, HttpServletResponse response) throws IOException {
        //获取前端用户id


           int userId = Integer.parseInt(request.getParameter("userId"));
           if (request.getParameter("pageNo") != null) {
               //获取前端页码
               pageNo = Integer.valueOf(request.getParameter("pageNo"));
           }
           //获取前端条数
           if(request.getParameter("pageSize")!=null){
               pageSize = Integer.valueOf(request.getParameter("pageSize"));

           }
           PageData pageData = osi.queryByUserId(userId, pageNo, pageSize);
           //通过ajax返回数据
           Gson gson = new Gson();
           String json = gson.toJson(pageData);
           PrintWriter out = response.getWriter();
           out.print(json);

           out.close();
       }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,
            IOException {
        doGet(request, response);
    }
}
