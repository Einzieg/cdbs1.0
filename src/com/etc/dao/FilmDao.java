package com.etc.dao;

import com.etc.entity.Film;
import com.etc.util.PageData;

import java.util.List;

public interface FilmDao {

    /**
     * 增加影片-信息
     * @param film 电影类
     * @return boolean
     */
    boolean insertFilm(Film film);

    /**
     * 删除影片
     * @param filmId 电影编号
     * @return boolean
     */
    boolean deleteFilm(int filmId);

    /**
     * 修改影片信息(不用此方法/使用下架电影方法)
     * @return boolean
     */
    boolean updateFilm(Film film);

    /**
     * 下架电影
     * @param filmId 电影编号
     * @return boolean
     */
    boolean updateFilmStatus(Integer filmId);

    /**
     * 查询所有影片
     * @return 数组
     */
    List<Film> queryFilm();

    /**
     * 查询所有上架影片
     * @return 数组
     */
    List<Film> queryOnFilm();

    /**
     * 模糊查询电影信息
     * @param keyword 模糊查询关键字
     * @return 数组
     */
    List<Film> queryFilmByKey(String keyword);

    /**
     * 模糊查询上架的电影并且分页
     * @param pageNo 第几页
     * @param pageSize 每页几条
     * @param keyword 模糊查询关键字
     * @return 数组
     */
    PageData queryArticleByKwPage(Integer pageNo, Integer pageSize, String keyword);

    /**
     * 模糊查询下架的电影并且分页
     * @param pageNo 第几页
     * @param pageSize 每页几条
     * @param keyword 模糊查询关键字
     * @return 数组
     */
    PageData queryStatusByKwPage(Integer pageNo, Integer pageSize, String keyword);

    /**
     * 根据id查询
     * @param filmId 电影编号
     * @return 对象
     */
    Film queryFilmById(Integer filmId);

}
