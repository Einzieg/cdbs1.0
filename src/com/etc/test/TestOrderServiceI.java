package com.etc.test;


import com.etc.dao.OrderDaoImpl;
import com.etc.entity.Order;
import com.etc.util.PageData;
import org.junit.Test;

import java.util.List;

public class TestOrderServiceI {
    OrderDaoImpl dao =new OrderDaoImpl();
//    @Test
//    public void add(){
//
//        UUID uuid=UUID.randomUUID();
//        String id= String.valueOf(uuid);
//        System.out.println(id);
//        Order order=new Order(id,new Film(1),new User(1),30.12,3);
//        System.out.println(dao.addOrder(order));
//    }

    @Test
   public void  queryAll(){
        PageData list=dao.queryAllOrder("",1,10);
        for (Object o:list.getData()) {
            System.out.println(o);

        }


    }

    @Test
    public void queryByUserId(){
        PageData data =dao.queryByUserId(1,1,10);
        for (Object o:data.getData()) {
            System.out.println(o);
        }
    }

    @Test
    public  void  queryByFilmNum(){
        PageData data =dao.queryByFilmNum(1,1,10);
        List<Order> list=data.getData();
        for (Order o:list) {
            System.out.println(o);
        }
    }

    @Test
    public  void  queryByOrderDate(){
        PageData data =dao.queryByOrderDate("0000-00-00 00:00:00","2023-00-00 00:00:00",1,10);
        List<Order> list=data.getData();
        for (Order o:list) {
            System.out.println(o);
        }
    }

    @Test
    public  void  queryByOrderStatus(){
        PageData data =dao.queryByOrderStatus(2,1,10);
        List<Order> list=data.getData();
        for (Order o:list) {
            System.out.println(o);
        }
    }

    @Test
    public  void  queryByName(){
        PageData data =dao.queryByUserName("1",1,10);
        List<Order> list=data.getData();
        for (Order o:list) {
            System.out.println(o);
        }
    }

    @Test
    public  void  updateByOrderId(){
        System.out.println(dao.updateByOrderId(3,"c75318c6-7bcf-49e9-a63e-86f7b880a871"));

    }

    @Test
    public  void  delByOrderId(){
        System.out.println(dao.delByOrderId("c75318c6-7bcf-49e9-a63e-86f7b880a871"));

    }

    @Test
    public  void queryByOrderDateAndId(){
        System.out.println(dao.queryByOrderDateAndId(1,"2016-01-18 00:00:00","2023-00-00 00:00:00",1,10).getData());
    }

    @Test
    public  void queryByGrossed(){
        System.out.println(dao.queryByFilmName("",0,10).getGrossed());
    }
}
