package com.etc.service;

import com.etc.entity.Cinema;

import java.util.List;

public interface CinemaService {
    /**
     * 查影厅
     * @return 数组
     */
    List<Cinema> queryCinemaName();

    /**
     * 增加影厅
     * @param cinema 影厅实体类
     * @return	布尔型
     */
    boolean insertCinema(Cinema cinema);
    /**
     * 根据影厅编号修改影厅信息
     * @param cinema 影厅实体类
     * @return 布尔型
     */
    boolean updateCinema(Cinema cinema);
    /**
     * 修改影厅状态(是否空闲 1空闲 0正在播放)
     * @param cinemaId 影厅状态
     * @param cinemaId 影厅编号
     * @return 布尔型
     */
    boolean updateCinemaState(int cinemaState,int cinemaId);
    /**
     * 查询所有影厅
     * @return 所有的影厅
     */
    List<Cinema> queryCinemas();
}
