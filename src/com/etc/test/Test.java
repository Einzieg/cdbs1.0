package com.etc.test;

import com.etc.dao.OrderDaoImpl;
import com.etc.entity.Cinema;
import com.etc.entity.Film;
import com.etc.entity.Order;
import com.etc.entity.SliceArrangement;
import com.etc.service.FilmServiceImpl;
import com.etc.service.SliceArrangementServiceImpl;
import com.etc.util.PageData;

import java.util.List;

public class Test {
    FilmServiceImpl fsi = new FilmServiceImpl();
    SliceArrangementServiceImpl ssi=new SliceArrangementServiceImpl();


    @org.junit.Test
    public void insertFilm() {
        boolean b = fsi.insertFilm(new Film("测试", "测试", "测试", "测试", "测试", "测试", "测试", "测试", "2001/1/11", 1));
        System.out.println(b);
    }

    @org.junit.Test
    public void deleteFilm() {
        boolean b = fsi.deleteFilm(4);
        System.out.println(b);
    }

    @org.junit.Test
    public void updateFilmStatus() {
        boolean b = fsi.updateFilmStatus(21);
        System.out.println(b);
    }

    @org.junit.Test
    public void updateFilm() {
        boolean b = fsi.updateFilm(new Film("电影类型3", "电影名3", "海报3", "导演3", "主演3", "电影介绍3", "电影语种3", "电影时长3", "2022/7/16", 22, 2));
        System.out.println(b);
    }

    @org.junit.Test
    public void queryFilm() {
        List<Film> list = fsi.queryFilm();
        for (Film film : list) {
            System.out.println(film);
        }
    }

    @org.junit.Test
    public void queryFilmByKey() {
        List<Film> list = fsi.queryFilmByKey("电");
        for (Film film : list) {
            System.out.println(film);
        }
    }

    @org.junit.Test
    public void queryFilmBuKeyPage(){
        PageData pageData= fsi.queryArticleByKwPage(1,2,"");
        List<Film>list= pageData.getData();
        for (Film film :
                list) {
            System.out.println(film);
        }
    }

    @org.junit.Test
    public void queryFilmById() {
        Film film = fsi.queryFilmById(9);
        System.out.println(film);
    }

    @org.junit.Test
    public void insertSliceArrange(){
        boolean b =ssi.insertArrangement(new SliceArrangement(new Film("长江七号"),new Cinema("二号厅"),"2022/6/15 12:30:00","2022/6/15 14:30:00"));
        System.out.println(b);
    }

    @org.junit.Test
    public void deleteSliceArrange(){
        boolean b =ssi.deleteArrangement(1);
        System.out.println(b);
    }

    @org.junit.Test
    public void updateSliceArrange(){
        boolean b=ssi.updateArrangement(new SliceArrangement(new Film("测试"),new Cinema("test"),"2000/01/01 00:00","2000/01/01 02:30",2));
        System.out.println(b);
    }

    @org.junit.Test
    public void queryArrByCinema(){
        List<SliceArrangement>list=ssi.queryArrangementByCinema("二号厅");
        for (SliceArrangement slice :
                list) {
            System.out.println(slice);
        }
    }

    @org.junit.Test
    public void queryArrByDate(){
        List<SliceArrangement>list=ssi.queryArrangementByDate("2022-07-18");
        for (SliceArrangement slice :
                list) {
            System.out.println(slice);
        }
    }

    @org.junit.Test
    public void queryArrByCinemaAndDate(){
        List<SliceArrangement>list=ssi.queryArrangementByDateAndCinema("" ,"2022-07-18");
        for (SliceArrangement slice :
                list) {
            System.out.println(slice);
        }
    }
    @org.junit.Test
    public  void queryByPlay(){
        OrderDaoImpl OrderDaoImpl=new OrderDaoImpl();
        List<Order> list=OrderDaoImpl.queryByPlay("12:30");
        for (int i = 0; i < list.size(); i++) {
            System.out.println(list.get(i).getPlayNum());
        }

    }
}

