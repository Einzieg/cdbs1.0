package com.etc.service;

import com.etc.entity.SliceArrangement;

import java.util.List;

public interface SliceArrangementService {

    /**
     * 排片
     * @param slice 对象
     * @return boolean
     */
    boolean insertArrangement(SliceArrangement slice);

    /**
     * 根据id删除此排片记录
     * @param sliceId id
     * @return boolean
     */
    boolean deleteArrangement(Integer sliceId);

    /**
     * 根基id修改此排片记录
     * @param slice
     * @return boolean
     */
    boolean updateArrangement(SliceArrangement slice);

    /**
     * 根据影厅查排片
     * @param cinemaName 影厅
     * @return list
     */
    List<SliceArrangement> queryArrangementByCinema(String cinemaName);

    /**
     * 根据时间查排片
     * @param dateTime 日期
     * @return 数组
     */
    List<SliceArrangement> queryArrangementByDate(String dateTime);

    /**
     * 根据影厅及时间查询
     * @param cinemaName 影厅名
     * @param dateTime 日期
     * @return 数组
     */
    List<SliceArrangement> queryArrangementByDateAndCinema(String cinemaName,String dateTime);

    /**
     * 根据电影及时间查询
     * @param filmName 影片名
     * @param dateTime 日期
     * @return 数组
     */
    List<SliceArrangement> queryArrangementByDateAndFilm(String filmName,String dateTime);
}
