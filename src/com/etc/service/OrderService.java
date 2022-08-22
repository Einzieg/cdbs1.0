package com.etc.service;

import com.etc.entity.Order;
import com.etc.util.PageData;

import java.util.List;

public interface OrderService {
    /**
     * 新增订单
     * @return true 为成功 false 失败
     */
    boolean addOrder(Order order);


    /**
     * 根据用户id查询订单
     * @param userId 用户id
     * @return 返回查询结果
     */
    PageData queryByUserId(int userId, Integer pageNo, Integer pageSize);

    /**
     * 根据订单编号分页模糊查询
     * @param keyword 订单编号关键字
     * @param pageNo 页数
     * @param pageSize 每页条数
     * @return 查询结果
     */

    PageData queryAllOrder(String keyword, Integer pageNo, Integer pageSize);

    /**
     * 根据影片编号分页查询订单
     * @param filmNum 影片编号
     * @param pageNo 页数
     * @param pageSize 每页条数
     * @return 返回查询结果
     */
    PageData queryByFilmNum(int filmNum,Integer pageNo,Integer pageSize);

    /**
     * 根据时间段分页查询订单
     * @param startTime 开始时间
     * @param endTime 结束时间
     * @param pageNo 页数
     * @param pageSize 每页条数
     * @return 返回查询结果
     */
    PageData queryByOrderDate(String startTime,String endTime,Integer pageNo, Integer pageSize);

    /**
     * 根据订单状态分页查询订单
     * @param status 订单状态
     * @param pageNo 页数
     * @param pageSize 每页条数
     * @return 查询结果
     */
    PageData queryByOrderStatus(int status,Integer pageNo, Integer pageSize);

    /**
     * 根据订单编号修改订单状态
     * @param orderId 订单编号
     * @return true修改成功  false修改失败
     */
    boolean updateByOrderId(int status,String orderId);

    /**
     * 根据订单编号删除订单（前端不展示）
     * @param orderId 订单编号
     * @return true删除成功  false删除失败
     */
    boolean delByOrderId(Object ... orderId);


    /**
     * 根据用户名字查询订单
     * @param userName 用户名字
     * @return 返回查询结果
     */
    PageData queryByUserName(String userName,Integer pageNo, Integer pageSize);

    /**
     * 根据用户id和时间段分页查询订单
     * @param userId 用户ID
     * @param startTime 开始时间
     * @param endTime 结束时间
     * @param pageNo 页数
     * @param pageSize 每页条数
     * @return 返回查询结果
     */
    PageData queryByOrderDateAndId(int userId,String startTime,String endTime,Integer pageNo, Integer pageSize);

    /**
     * 根据影片名字分页查询订单
     * @param filmName 影片名字
     * @param pageNo 页数
     * @param pageSize 每页条数
     * @return 返回查询结果
     */
    PageData queryByFilmName(String filmName,Integer pageNo,Integer pageSize);

    /**
     * 根据场次查询座位号
     * @param playNum 场次
     * @return
     */
    List<Order> queryByPlay(String playNum);
}
