package com.etc.dao;

import com.etc.entity.Cinema;
import com.etc.util.DButil;

import javax.sql.rowset.CachedRowSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CinemaDaoImpl implements CinemaDao {
    @Override
    public List<Cinema> queryCinemaName() {
        Cinema cinema;
        List<Cinema> list = new ArrayList<>();
        CachedRowSet crs= DButil.executeQuery("SELECT cinema_name FROM cinema");
        try {
            while (crs.next()) {
                String cinemaName = crs.getString(1);
                cinema=new Cinema(cinemaName);
                list.add(cinema);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }finally {
            if (null!=crs) {
                try {
                    crs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        return list;
    }
    /**
     * 增加影厅
     * @param cinema 影厅实体类
     * @return	布尔型
     */
    @Override
    public boolean insertCinema(Cinema cinema) {
        String sql="insert into cinema values(null,?,?,1)";
        boolean b = DButil.executeUpdate(sql, cinema.getCinemaName(),cinema.getCinemaSeat());
        return b;
    }
    /**
     * 根据影厅编号修改影厅信息
     * @param cinema 影厅实体类
     * @return 布尔型
     */
    @Override
    public boolean updateCinema(Cinema cinema) {
        String sql="update cinema set cinema_name=?,cinema_seat=?,cinema_State=? where cinema_id=?";
        boolean b = DButil.executeUpdate(sql, cinema.getCinemaName(),cinema.getCinemaSeat(),cinema.getCinemaState(),cinema.getCinemaId());
        return b;
    }
    /**
     * 修改影厅状态(是否空闲 1空闲 0正在播放)
     * @param cinemaId 影厅状态
     * @param cinemaId 影厅编号
     * @return 布尔型
     */
    @Override
    public boolean updateCinemaState(int cinemaState,int cinemaId) {
        String sql="update cinema set cinema_state=? where cinema_id=?";
        boolean b = DButil.executeUpdate(sql, cinemaState,cinemaId);
        return b;
    }
    /**
     * 查询所有影厅
     * @return 所有的影厅
     */
    @Override
    public List<Cinema> queryCinemas() {
        List<Cinema> list = new ArrayList<Cinema>();
        String sql="select cinema_id,cinema_name,cinema_seat,cinema_state from cinema";
        CachedRowSet crs = DButil.executeQuery(sql);
        Cinema cinema =null;
        try {
            while (crs.next()) {
                int cinemaId = crs.getInt(1);
                String cinemaName = crs.getString(2);
                int cinemaSeat = crs.getInt(3);
                int cinemaState = crs.getInt(4);
                cinema = new Cinema(cinemaId, cinemaName, cinemaSeat, cinemaState);
                list.add(cinema);
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return list;
    }
}
