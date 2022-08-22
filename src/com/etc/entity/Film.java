package com.etc.entity;

//影片信息
public class Film {
    private int filmId;//影片编号
    private String filmType;//影片类型
    private String filmName;//影片名
    private String filmPoster;//影片海报
    private String directorName;//影片导演
    private String performerName;//影片主演
    private String filmIntroduce;//影片介绍
    private String filmLanguage;//影片语言
    private String filmTime;//电影时长
    private String movieShowtime;//电影上映时间
    private double ticketPrice;//票价

    private int filmStatus;//电影上架/下架状态(1/0)

    public Film() {
    }

    public Film(String filmName) {
        this.filmName = filmName;
    }

    public Film(int filmId) {
        this.filmId = filmId;
    }

    public Film(int filmId, String filmName) {
        this.filmId = filmId;
        this.filmName = filmName;
    }

    /**
     * 增加电影的构造
     */
    public Film(String filmType, String filmName, String filmPoster, String directorName, String performerName, String filmIntroduce, String filmLanguage, String filmTime, String movieShowtime, double ticketPrice) {
        this.filmType = filmType;
        this.filmName = filmName;
        this.filmPoster = filmPoster;
        this.directorName = directorName;
        this.performerName = performerName;
        this.filmIntroduce = filmIntroduce;
        this.filmLanguage = filmLanguage;
        this.filmTime = filmTime;
        this.movieShowtime = movieShowtime;
        this.ticketPrice = ticketPrice;
    }

    /**
     * 修改电影信息的构造
     */
    public Film(String filmType, String filmName, String filmPoster, String directorName, String performerName, String filmIntroduce, String filmLanguage, String filmTime, String movieShowtime, double ticketPrice, int filmId) {
        this.filmId = filmId;
        this.filmType = filmType;
        this.filmName = filmName;
        this.filmPoster = filmPoster;
        this.directorName = directorName;
        this.performerName = performerName;
        this.filmIntroduce = filmIntroduce;
        this.filmLanguage = filmLanguage;
        this.filmTime = filmTime;
        this.movieShowtime = movieShowtime;
        this.ticketPrice = ticketPrice;
    }

    /**
     * 默认构造
     *
     * @param filmId        电影编号
     * @param filmType      电影类型
     * @param filmName      电影名
     * @param filmPoster    海报
     * @param directorName  导演
     * @param performerName 主演
     * @param filmIntroduce 介绍
     * @param filmLanguage  语种
     * @param filmTime      时长
     * @param movieShowtime 上映时间
     * @param ticketPrice   票价
     */
    public Film(int filmId, String filmType, String filmName, String filmPoster, String directorName, String performerName, String filmIntroduce, String filmLanguage, String filmTime, String movieShowtime, double ticketPrice) {
        this.filmId = filmId;
        this.filmType = filmType;
        this.filmName = filmName;
        this.filmPoster = filmPoster;
        this.directorName = directorName;
        this.performerName = performerName;
        this.filmIntroduce = filmIntroduce;
        this.filmLanguage = filmLanguage;
        this.filmTime = filmTime;
        this.movieShowtime = movieShowtime;
        this.ticketPrice = ticketPrice;
    }

    public int getFilmStatus() {
        return filmStatus;
    }

    public void setFilmStatus(int filmStatus) {
        this.filmStatus = filmStatus;
    }

    public int getFilmId() {
        return filmId;
    }

    public void setFilmId(int filmId) {
        this.filmId = filmId;
    }

    public String getFilmType() {
        return filmType;
    }

    public void setFilmType(String filmType) {
        this.filmType = filmType;
    }

    public String getFilmName() {
        return filmName;
    }

    public void setFilmName(String filmName) {
        this.filmName = filmName;
    }

    public String getFilmPoster() {
        return filmPoster;
    }

    public void setFilmPoster(String filmPoster) {
        this.filmPoster = filmPoster;
    }

    public String getDirectorName() {
        return directorName;
    }

    public void setDirectorName(String directorName) {
        this.directorName = directorName;
    }

    public String getPerformerName() {
        return performerName;
    }

    public void setPerformerName(String performerName) {
        this.performerName = performerName;
    }

    public String getFilmIntroduce() {
        return filmIntroduce;
    }

    public void setFilmIntroduce(String filmIntroduce) {
        this.filmIntroduce = filmIntroduce;
    }

    public String getFilmLanguage() {
        return filmLanguage;
    }

    public void setFilmLanguage(String filmLanguage) {
        this.filmLanguage = filmLanguage;
    }

    public String getFilmTime() {
        return filmTime;
    }

    public void setFilmTime(String filmTime) {
        this.filmTime = filmTime;
    }

    public String getMovieShowtime() {
        return movieShowtime;
    }

    public void setMovieShowtime(String movieShowtime) {
        this.movieShowtime = movieShowtime;
    }

    public double getTicketPrice() {
        return ticketPrice;
    }

    public void setTicketPrice(double ticketPrice) {
        this.ticketPrice = ticketPrice;
    }

    public void setTicketPrice(float ticketPrice) {
        this.ticketPrice = ticketPrice;
    }

    @Override
    public String toString() {
        return "Film{" +
                "directorName='" + directorName + '\'' +
                ", filmId=" + filmId +
                ", filmIntroduce='" + filmIntroduce + '\'' +
                ", filmLanguage='" + filmLanguage + '\'' +
                ", filmName='" + filmName + '\'' +
                ", filmPoster='" + filmPoster + '\'' +
                ", filmTime='" + filmTime + '\'' +
                ", filmType='" + filmType + '\'' +
                ", movieShowtime='" + movieShowtime + '\'' +
                ", performerName='" + performerName + '\'' +
                ", ticketPrice=" + ticketPrice +
                '}';
    }
}
