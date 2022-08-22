package com.etc.entity;

public class SliceArrangement {
    private int id;
    private Film film;//外键电影名称
    private Cinema cinema;//外键影厅
    private String startingTime;//开始时间
    private String endTime;//结束时间


    public SliceArrangement() {
    }

    public SliceArrangement(Film film, Cinema cinema, String startingTime, String endTime,int id) {
        this.id = id;
        this.film = film;
        this.cinema = cinema;
        this.startingTime = startingTime;
        this.endTime = endTime;
    }
    public SliceArrangement(Film film, Cinema cinema, String startingTime, String endTime) {
        this.film = film;
        this.cinema = cinema;
        this.startingTime = startingTime;
        this.endTime = endTime;
    }

    public SliceArrangement(int id, Film film, Cinema cinema, String startingTime, String endTime) {
        this.id = id;
        this.film = film;
        this.cinema = cinema;
        this.startingTime = startingTime;
        this.endTime = endTime;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Film getFilm() {
        return film;
    }

    public void setFilm(Film film) {
        this.film = film;
    }

    public Cinema getCinema() {
        return cinema;
    }

    public void setCinema(Cinema cinema) {
        this.cinema = cinema;
    }

    public String getStartingTime() {
        return startingTime;
    }

    public void setStartingTime(String startingTime) {
        this.startingTime = startingTime;
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }

    @Override
    public String toString() {
        return "SliceArrangement{" +
                "cinema=" + cinema +
                ", endTime='" + endTime + '\'' +
                ", film=" + film +
                ", id=" + id +
                ", startingTime='" + startingTime + '\'' +
                '}';
    }
}
