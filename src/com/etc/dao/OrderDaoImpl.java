package com.etc.dao;

import com.etc.entity.Film;
import com.etc.entity.Order;
import com.etc.entity.User;
import com.etc.util.DButil;
import com.etc.util.Grossed;
import com.etc.util.PageData;

import javax.sql.rowset.CachedRowSet;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class OrderDaoImpl implements OrderDao {
    @Override
    public boolean addOrder(Order order) {
        String sql = "INSERT INTO `order` VALUES(?,?,?,now(),?,?," + order.getTotalPrice() + ",0,?,?,?)";
        return DButil.executeUpdate(sql, order.getOrderId(), order.getFilm().getFilmId(), order.getUser().getUserId(),
                order.getTicketPrice(), order.getCount(),order.getPlayNum(),order.getSeatNum(),order.getInfo());
    }

    @Override
    public PageData queryByUserId(int userId, Integer pageNo, Integer pageSize) {
//       1、获取分页数据
        String sql = "SELECT a.order_id,b.film_name,a.ticket_price,a.count,a.total_price,a.order_status,DATE_FORMAT(a" +
                ".place_order_date,'%Y-%m-%d %H:%i:%S') " +
                ",a.info FROM `order` a INNER JOIN `film` b ON b.film_id=a.film_num WHERE a.user_id=? and a" +
                ".order_status!=2 " +
                "  ORDER BY a.place_order_date  desc LIMIT ?,? ";
        List<Order> list = new ArrayList<>();
        Order order;
        try {
            CachedRowSet result = DButil.executeQuery(sql, userId, (pageNo - 1) * pageSize, pageSize);
            while (result.next()) {
                String orderId = result.getString(1);
                String filmName = result.getString(2);
                double ticketPrice = result.getDouble(3);
                int count = result.getInt(4);
                double totalPrice = result.getDouble(5);
                int orderStatus = result.getInt(6);
                String orderDate = result.getString(7);
                String info = result.getString(8);
                order = new Order(orderId, new Film(filmName), ticketPrice, count, totalPrice, orderStatus, orderDate,info);
                list.add(order);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
//       2、获取分页数据总条数
        String sql2 = "SELECT COUNT(*) FROM(SELECT a.order_id,b.film_name,a.ticket_price,a.count,a.total_price," +
                "a.order_status,a.place_order_date,a.info FROM `order` a INNER JOIN`film` b ON b.film_id=a.film_num " +
                "WHERE " +
                "user_id=? and a.order_status!=2)as c";
        return getPageData(userId, pageNo, pageSize, list, sql2);
    }

    @Override
    public PageData queryByUserName(String userName, Integer pageNo, Integer pageSize) {
        String sql = "SELECT a.order_id,c.user_name,b.film_name,a.ticket_price,a.count,a.total_price,a.order_status," +
                " DATE_FORMAT(a.place_order_date,'%Y-%m-%d %H:%i:%S') AS 'article.article_date' FROM `order` a LEFT  " +
                "JOIN`film` b ON b.film_id=a.film_num LEFT JOIN `user` c on" +
                " a.user_id=c.user_id WHERE c.user_name like ?   ORDER BY a.place_order_date  desc LIMIT ?,? ";
        List<Order> list = new ArrayList<>();
        try {
            CachedRowSet result = DButil.executeQuery(sql, "%" + userName + "%", (pageNo - 1) * pageSize, pageSize);
            setList(list, result);
        } catch (Exception e) {
            e.printStackTrace();
        }
        //       2、获取分页数据总条数
        String sql2 = "SELECT COUNT(*) FROM(SELECT a.order_id,c.user_name,b.film_name,a.ticket_price,a.count,a" +
                ".total_price," +
                "a.order_status,a.place_order_date FROM `order` a LEFT  JOIN`film` b ON b.film_id=a.film_num LEFT " +
                "JOIN " +
                "`user` c on a.user_id=c.user_id WHERE c.user_name like ?)as c";

        CachedRowSet crs2 = DButil.executeQuery(sql2, "%" + userName + "%");
        int totalCount = 0;
        try {
            if (crs2.next()) {
                totalCount = crs2.getInt(1);
            }
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return new PageData(list, pageNo, pageSize, totalCount);

    }


    @Override
    public PageData queryAllOrder(String keyword, Integer pageNo, Integer pageSize) {
        String sql = "SELECT a.order_id,c.user_name,b.film_name,a.ticket_price,a.count,a.total_price,a.order_status," +
                " DATE_FORMAT(a.place_order_date,'%Y-%m-%d %H:%i:%S') AS 'article.article_date' FROM `order` a LEFT  " +
                "JOIN`film` b ON b.film_id=a.film_num LEFT JOIN `user` c on" +
                " a.user_id=c.user_id WHERE a.order_id like ?   ORDER BY a.place_order_date  desc LIMIT ?,? ";


        List<Order> list = new ArrayList<>();
        try {
            CachedRowSet result = DButil.executeQuery(sql, "%" + keyword + "%", (pageNo - 1) * pageSize, pageSize);
            setList(list, result);
        } catch (Exception e) {
            e.printStackTrace();
        }
        //       2、获取分页数据总条数
        String sql2 = "SELECT COUNT(*) FROM(SELECT a.order_id,c.user_name,b.film_name,a.ticket_price,a.count,a" +
                ".total_price," +
                "a.order_status,a.place_order_date FROM `order` a LEFT  JOIN`film` b ON b.film_id=a.film_num LEFT " +
                "JOIN " +
                "`user` c on a.user_id=c.user_id WHERE a.order_id like ?)as c";
        CachedRowSet crs2 = DButil.executeQuery(sql2, "%" + keyword + "%");
        int totalCount = 0;
        try {
            if (crs2.next()) {
                totalCount = crs2.getInt(1);
            }
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return new PageData(list, pageNo, pageSize, totalCount);
    }

    @Override
    public PageData queryByFilmNum(int filmNum, Integer pageNo, Integer pageSize) {
        //获取分页数据
        String sql = "SELECT a.order_id,c.user_name,b.film_name,a.ticket_price,a.count,a.total_price,a.order_status," +
                "DATE_FORMAT(a.place_order_date,'%Y-%m-%d %H:%i:%S') FROM `order` a LEFT  JOIN `film` b ON b" +
                ".film_id=a.film_num LEFT JOIN `user` c " +
                "on a.user_id=c.user_id WHERE a.film_num =?  ORDER BY a.place_order_date  desc LIMIT ?,?";
        List<Order> list = new ArrayList<>();
        try {
            CachedRowSet result = DButil.executeQuery(sql, filmNum, (pageNo - 1) * pageSize, pageSize);
            setList(list, result);
        } catch (Exception e) {
            e.printStackTrace();
        }
        //       2、获取分页数据总条数
        String sql2 = "SELECT COUNT(*) FROM(SELECT a.order_id,c.user_name,b.film_name,a.ticket_price,a.count," +
                "a.total_price,a.order_status,a.place_order_date FROM `order` a LEFT  JOIN `film` b ON b.film_id=" +
                "a.film_num LEFT JOIN `user` c on a.user_id=c.user_id WHERE a.film_num =? )as c";
        return getPageData(filmNum, pageNo, pageSize, list, sql2);
    }

    @Override
    public PageData queryByFilmName(String filmName, Integer pageNo, Integer pageSize) {
        Grossed grossed;
        List<Grossed> list = new ArrayList<>();
        String sql = "SELECT b.film_name,a.ticket_price,SUM(a.count),(a.ticket_price*SUM(a.count))as grossed FROM " +
                "`order` a INNER JOIN `film` b\n" +
                " ON b.film_id=a.film_num WHERE order_status=1 and film_name LIKE ? GROUP BY  b.film_name  ORDER " +
                "BY grossed desc  LIMIT ?,? ";
        CachedRowSet result = DButil.executeQuery(sql, "%" + filmName + "%", (pageNo - 1) * pageSize, pageSize);
        try {
            while (result.next()) {
                String Name = result.getString(1);
                double ticketPrice = result.getDouble(2);
                int count = result.getInt(3);
                double total = new BigDecimal(result.getDouble(4)).setScale(2, RoundingMode.DOWN).doubleValue();
                grossed = new Grossed(Name, ticketPrice, count, total);
                list.add(grossed);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        //       2、获取分页数据总条数
        String sql2 = "SELECT COUNT(*) FROM (SELECT b.film_name,a.ticket_price,SUM(a.count),(a.ticket_price*SUM(a" +
                ".count))as grossed FROM `order` a INNER JOIN `film` b  ON b.film_id=a.film_num WHERE order_status=1 " +
                "and film_name LIKE ? GROUP BY  b.film_name  ORDER BY grossed desc  )as d ";
        CachedRowSet crs2 = DButil.executeQuery(sql2, "%" + filmName + "%");
        int totalCount = 0;
        try {
            if (crs2.next()) {
                totalCount = crs2.getInt(1);
            }
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return new PageData(pageNo, pageSize, totalCount, list);
    }


    @Override
    public PageData queryByOrderDate(String startTime, String endTime, Integer pageNo, Integer pageSize) {
        String sql = "SELECT a.order_id,c.user_name,b.film_name,a.ticket_price,a.count,a.total_price,a.order_status," +
                "DATE_FORMAT(a.place_order_date,'%Y-%m-%d %H:%i:%S') FROM `order` a LEFT  JOIN `film` b ON b" +
                ".film_id=a.film_num LEFT JOIN `user` c on " +
                "a.user_id=c.user_id WHERE a.place_order_date BETWEEN ? and ?  ORDER BY a.place_order_date  desc " +
                "LIMIT ?,?";

        List<Order> list = new ArrayList<>();

        try {
            CachedRowSet result = DButil.executeQuery(sql, startTime, endTime, (pageNo - 1) * pageSize, pageSize);
            setList(list, result);
        } catch (Exception e) {
            e.printStackTrace();
        }
        //       2、获取分页数据总条数
        String sql2 = "SELECT COUNT(*) FROM(SELECT a.order_id,c.user_name,b.film_name,a.place_order_date," +
                "a.ticket_price,a.count,a.total_price,a.order_status FROM `order` a LEFT  JOIN `film` b ON" +
                " b.film_id=a.film_num LEFT JOIN `user` c on a.user_id=c.user_id WHERE a.place_order_date" +
                " BETWEEN ? and ? )as c";
        CachedRowSet crs2 = DButil.executeQuery(sql2, startTime, endTime);
        int totalCount = 0;
        try {
            if (crs2.next()) {
                totalCount = crs2.getInt(1);
            }
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return new PageData(list, pageNo, pageSize, totalCount);
    }

    @Override
    public PageData queryByOrderDateAndId(int userId, String startTime, String endTime, Integer pageNo,
                                          Integer pageSize) {
        String sql = "SELECT a.order_id,c.user_name,b.film_name,a.ticket_price,a.count,a.total_price,a.order_status," +
                "DATE_FORMAT(a.place_order_date,'%Y-%m-%d %H:%i:%S') FROM `order` a LEFT  JOIN `film` b ON b" +
                ".film_id=a.film_num LEFT JOIN `user` c on " +
                "a.user_id=c.user_id WHERE a.user_id =? and a.place_order_date   BETWEEN  ? and ? and a" +
                ".order_status!=2 ORDER BY a" +
                ".place_order_date  desc LIMIT ?,?";

        List<Order> list = new ArrayList<>();

        try {
            CachedRowSet result = DButil.executeQuery(sql, userId, startTime, endTime, (pageNo - 1) * pageSize,
                    pageSize);
            setList(list, result);
        } catch (Exception e) {
            e.printStackTrace();
        }
        //       2、获取分页数据总条数
        String sql2 = "SELECT COUNT(*) FROM(SELECT a.order_id,c.user_name,b.film_name,a.place_order_date," +
                "a.ticket_price,a.count,a.total_price,a.order_status FROM `order` a LEFT  JOIN `film` b ON" +
                " b.film_id=a.film_num LEFT JOIN `user` c on a.user_id=c.user_id WHERE a.user_id=? and a" +
                ".place_order_date" +
                " BETWEEN ? and ? and a.order_status!=2 )as c";
        CachedRowSet crs2 = DButil.executeQuery(sql2, userId, startTime, endTime);
        int totalCount = 0;
        try {
            if (crs2.next()) {
                totalCount = crs2.getInt(1);
            }
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return new PageData(list, pageNo, pageSize, totalCount);
    }

    @Override
    public PageData queryByOrderStatus(int status, Integer pageNo, Integer pageSize) {
        String sql = "SELECT a.order_id,c.user_name,b.film_name,a.ticket_price,a.count,a.total_price," +
                "a.order_status,DATE_FORMAT(a.place_order_date,'%Y-%m-%d %H:%i:%S') FROM `order` a LEFT  JOIN `film` " +
                "b ON b.film_id=a.film_num LEFT JOIN `user` c on " +
                "a.user_id=c.user_id WHERE  a.order_status =?  ORDER BY a.place_order_date  desc LIMIT ?,?";
        List<Order> list = new ArrayList<>();
        try {
            CachedRowSet result = DButil.executeQuery(sql, status, (pageNo - 1) * pageSize, pageSize);
            setList(list, result);
        } catch (Exception e) {
            e.printStackTrace();
        }
        String sql2 = "SELECT COUNT(*) FROM(SELECT a.order_id,c.user_name,b.film_name,a.ticket_price,a.count,a" +
                ".total_price," +
                "a.order_status,a.place_order_date FROM `order` a LEFT  JOIN `film` b ON b.film_id=a.film_num LEFT " +
                "JOIN " +
                "`user` c on a.user_id=c.user_id WHERE  a.order_status =?)as c";
        return getPageData(status, pageNo, pageSize, list, sql2);

    }

    private void setList(List<Order> list, CachedRowSet result) throws SQLException {
        Order order;
        while (result.next()) {
            String orderId = result.getString(1);
            String userName = result.getString(2);
            String filmName = result.getString(3);
            double ticketPrice = result.getDouble(4);
            int count = result.getInt(5);
            double totalPrice = result.getDouble(6);
            int orderStatus = result.getInt(7);
            String orderDate = result.getString(8);
            order = new Order(orderId, new Film(filmName), new User(userName), ticketPrice, count, totalPrice,
                    orderStatus, orderDate);
            list.add(order);
        }
    }

    @Override
    public boolean updateByOrderId(int status, String orderId) {
        String sql = "UPDATE `order` SET order_status =? WHERE order_id=? ";
        return DButil.executeUpdate(sql, status, orderId);
    }

    @Override
    public boolean delByOrderId(Object... orderId) {
        String sql = "UPDATE `order` SET order_status =2 WHERE order_id=? ";
        return DButil.executeUpdate(sql, orderId);
    }

    @Override
    public List<Order> queryByPlay(String playNum) {
        String sql = "SELECT seat_number FROM `order` where  play_Num=? and order_status =1";
        CachedRowSet crs=DButil.executeQuery(sql,playNum);
        List<Order> list=new ArrayList<>();
        Order order;
        try{
            while (crs.next()){
                String playId= crs.getString(1);

                order=new Order(playId);
                list.add(order);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return list;
    }

    private PageData getPageData(int obj, Integer pageNo, Integer pageSize, List<Order> list, String sql2) {
        CachedRowSet crs2 = DButil.executeQuery(sql2, obj);
        int totalCount = 0;
        try {
            if (crs2.next()) {
                totalCount = crs2.getInt(1);
            }
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return new PageData(list, pageNo, pageSize, totalCount);
    }
}
