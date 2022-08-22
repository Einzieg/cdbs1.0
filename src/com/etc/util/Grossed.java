package com.etc.util;

public class Grossed {
    private  String filmName;
    private  double ticketPrice;
    private  int count;
    private  double total;

    public String getFilmName() {
        return filmName;
    }

    public void setFilmName(String filmName) {
        this.filmName = filmName;
    }

    public double getTicketPrice() {
        return ticketPrice;
    }

    public void setTicketPrice(double ticketPrice) {
        this.ticketPrice = ticketPrice;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public Grossed() {
    }

    public Grossed(String filmName, double ticketPrice, int count, double total) {
        this.filmName = filmName;
        this.ticketPrice = ticketPrice;
        this.count = count;
        this.total = total;
    }

    @Override
    public String toString() {
        return "Grossed{" +
                "filmName='" + filmName + '\'' +
                ", ticketPrice=" + ticketPrice +
                ", countl=" + count +
                ", grossed=" + total +
                '}';
    }
}
