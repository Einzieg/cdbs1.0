package com.etc.entity;

public class Order {
    private String orderId;
    private Film film;
    private User user;
    private String placeOrderDate;
    private double ticketPrice;
    private int count;
    private double totalPrice;
    private int orderStatus;

    private String playNum;
    private String seatNum;
    private String info;

    public Order(String out_trade_no, Film film, User user, double ticketPrice, int count, String playNum, String setId, String info) {
        this.orderId = out_trade_no;
        this.film = film;
        this.user = user;
        this.ticketPrice = ticketPrice;
        this.count = count;
        this.totalPrice = ticketPrice*count;
        this.playNum =playNum;
        this.seatNum =setId;
        this.info =info;
    }

    public Order(String playId) {

        this.playNum =playId;

    }

    public Order(String orderId, Film film, double ticketPrice, int count, double totalPrice, int orderStatus, String orderDate, String info) {
        this.orderId=orderId;
        this.film=film;
        this.ticketPrice=ticketPrice;
        this.count=count;
        this.totalPrice=totalPrice;
        this.orderStatus=orderStatus;
        this.placeOrderDate=orderDate;
        this.info=info;

    }

    public void setTicketPrice(double ticketPrice) {
        this.ticketPrice = ticketPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public String getPlayNum() {
        return playNum;
    }

    public void setPlayNum(String playNum) {
        this.playNum = playNum;
    }

    public String getSeatNum() {
        return seatNum;
    }

    public void setSeatNum(String seatNum) {
        this.seatNum = seatNum;
    }

    public String getInfo() {
        return info;
    }

    public void setInfo(String info) {
        this.info = info;
    }

    public Order() {
    }

    public Order(String orderId, Film film, User user, String placeOrderDate, double ticketPrice, int count,int orderStatus) {
        this.orderId = orderId;
        this.film = film;
        this.user = user;
        this.placeOrderDate = placeOrderDate;
        this.ticketPrice = ticketPrice;
        this.count = count;
        this.totalPrice = ticketPrice*count;
        this.orderStatus = orderStatus;
    }

    public Order(String orderId, Film film, User user,  double ticketPrice, int count,int orderStatus) {
        this.orderId = orderId;
        this.film = film;
        this.user = user;
        this.ticketPrice = ticketPrice;
        this.count = count;
        this.totalPrice = ticketPrice*count;
        this.orderStatus = orderStatus;
    }

    public Order(String orderId, Film film, double ticketPrice, int count, double totalPrice, int orderStatus, String orderDate) {
        this.orderId = orderId;
        this.film = film;
        this.ticketPrice = ticketPrice;
        this.count = count;
        this.totalPrice = totalPrice;
        this.orderStatus = orderStatus;
        this.placeOrderDate = orderDate;
    }

    public Order(String orderId, Film film, User user, double ticketPrice, int count, double totalPrice, int orderStatus, String orderDate) {
        this.orderId = orderId;
        this.film = film;
        this.user = user;
        this.placeOrderDate = orderDate;
        this.ticketPrice = ticketPrice;
        this.count = count;
        this.totalPrice = totalPrice;
        this.orderStatus = orderStatus;

    }


    public Order(String id, Film film, User user, double v, int i) {
        this.orderId = id;
        this.film = film;
        this.user = user;
        this.count =  i;
        this.ticketPrice =  v;
        this.totalPrice = ticketPrice*count;

    }




    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    public Film getFilm() {
        return film;
    }

    public void setFilm(Film film) {
        this.film = film;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getPlaceOrderDate() {
        return placeOrderDate;
    }

    public void setPlaceOrderDate(String placeOrderDate) {
        this.placeOrderDate = placeOrderDate;
    }

    public double getTicketPrice() {
        return ticketPrice;
    }

    public void setTicketPrice(float ticketPrice) {
        this.ticketPrice = ticketPrice;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double ticketPrice, int count) {
        this.totalPrice = ticketPrice*count;
    }

    public int getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(int orderStatus) {
        this.orderStatus = orderStatus;
    }

    @Override
    public String toString() {
        return "Order{" +
                "orderId='" + orderId + '\'' +
                ", film=" + film +
                ", user=" + user +
                ", placeOrderDate='" + placeOrderDate + '\'' +
                ", ticketPrice=" + ticketPrice +
                ", count=" + count +
                ", totalPrice=" + totalPrice +
                ", orderStatus=" + orderStatus +
                ", playNum='" + playNum + '\'' +
                ", seatNum='" + seatNum + '\'' +
                ", info='" + info + '\'' +
                '}';
    }
}
