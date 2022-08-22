package com.etc.service;

import com.etc.dao.OrderDaoImpl;
import com.etc.entity.Order;
import com.etc.util.PageData;

import java.util.List;


public class OrderServiceImpl implements OrderService{
    OrderDaoImpl dao=new OrderDaoImpl();
    @Override
    public boolean addOrder(Order order) {
        return dao.addOrder(order);
    }

    @Override
    public PageData queryByUserId(int userId, Integer pageNo, Integer pageSize) {
        return dao.queryByUserId(userId, pageNo, pageSize);
    }

    @Override
    public PageData queryAllOrder(String keyword, Integer pageNo, Integer pageSize) {
        return dao.queryAllOrder(keyword, pageNo,  pageSize);
    }

    @Override
    public PageData queryByFilmNum(int filmNum, Integer pageNo, Integer pageSize) {
        return dao.queryByFilmNum(filmNum,pageNo,pageSize);
    }

    @Override
    public PageData queryByOrderDate(String startTime, String endTime, Integer pageNo, Integer pageSize) {
        return dao.queryByOrderDate(startTime,endTime,pageNo,pageSize);
    }

    @Override
    public PageData queryByOrderStatus(int status, Integer pageNo, Integer pageSize) {
        return dao.queryByOrderStatus(status,pageNo,pageSize);
    }

    @Override
    public boolean updateByOrderId(int status, String orderId) {
        return dao.updateByOrderId(status,orderId);
    }

    @Override
    public boolean delByOrderId(Object... orderId) {
        return dao.delByOrderId(orderId);
    }

    @Override
    public PageData queryByUserName(String userName, Integer pageNo, Integer pageSize) {
        return dao.queryByUserName(userName,pageNo,pageSize);
    }

    @Override
    public PageData queryByOrderDateAndId(int userId, String startTime, String endTime, Integer pageNo,
                                          Integer pageSize) {
        return dao.queryByOrderDateAndId(userId, startTime, endTime, pageNo, pageSize);
    }

    @Override
    public PageData queryByFilmName(String filmName, Integer pageNo, Integer pageSize) {
        return dao.queryByFilmName(filmName, pageNo, pageSize);
    }

    @Override
    public List<Order> queryByPlay(String playNum) {
        return dao.queryByPlay(playNum);
    }
}
