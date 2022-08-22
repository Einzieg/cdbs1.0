package com.etc.dao;

import com.etc.entity.Cinema;
import com.etc.entity.Film;
import com.etc.entity.SliceArrangement;
import com.etc.util.DButil;

import javax.sql.rowset.CachedRowSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class SliceArrangementDaoImpl implements SliceArrangementDao {
    @Override
    public boolean insertArrangement(SliceArrangement slice) {
        return DButil.executeUpdate("INSERT INTO slice_arrangement VALUES(null,?,?,?,?)", slice.getFilm().getFilmName(), slice.getCinema().getCinemaName(), slice.getStartingTime(), slice.getEndTime());
    }

    @Override
    public boolean deleteArrangement(Integer sliceId) {
        return DButil.executeUpdate("DELETE FROM slice_arrangement WHERE id = ?", sliceId);
    }

    @Override
    public boolean updateArrangement(SliceArrangement slice) {
        return DButil.executeUpdate("UPDATE slice_arrangement SET film_name =?,cinema_name=?,starting_time=?,end_time=? WHERE id = ?", slice.getFilm().getFilmName(), slice.getCinema().getCinemaName(), slice.getStartingTime(), slice.getEndTime(), slice.getId());
    }

    @Override
    public List<SliceArrangement> queryArrangementByCinema(String cinemaName) {
        List<SliceArrangement> list = new ArrayList<>();
        SliceArrangement slice;
        CachedRowSet crs = DButil.executeQuery("SELECT id,film_name,cinema_name,starting_time,end_time FROM slice_arrangement WHERE cinema_name LIKE ?", "%" + cinemaName + "%");
        try {
            while (crs.next()) {
                int id = crs.getInt(1);
                String filmName = crs.getString(2);
                String cinemaName1 = crs.getString(3);
                String staringTime = crs.getString(4);
                String endTime = crs.getString(5);
                slice = new SliceArrangement(id, new Film(filmName), new Cinema(cinemaName1), staringTime, endTime);
                list.add(slice);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            if (null != crs) {
                try {
                    crs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        return list;
    }

    @Override
    public List<SliceArrangement> queryArrangementByDate(String dateTime) {
        List<SliceArrangement> list = new ArrayList<>();
        SliceArrangement slice;
        CachedRowSet crs = DButil.executeQuery("SELECT id,film_name,cinema_name,DATE_FORMAT(starting_time,'%Y-%m-%d %H:%i') AS starting_time,DATE_FORMAT(end_time,'%Y-%m-%d %H:%i') AS end_time FROM slice_arrangement WHERE starting_time LIKE ?", "%" + dateTime + "%");
                //"DATE_FORMAT(starting_time,'%Y-%m-%d %H:%i:%s') AS starting_time," +
                //"DATE_FORMAT(end_time,'%Y-%m-%d %H:%i:%s') AS end_time," +

        try {
            while (crs.next()) {
                int id = crs.getInt(1);
                String filmName = crs.getString(2);
                String cinemaName1 = crs.getString(3);
                String staringTime = crs.getString(4);
                String endTime = crs.getString(5);
                slice = new SliceArrangement(id, new Film(filmName), new Cinema(cinemaName1), staringTime, endTime);
                list.add(slice);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            if (null != crs) {
                try {
                    crs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        return list;
    }

    @Override
    public List<SliceArrangement> queryArrangementByDateAndCinema(String cinemaName, String dateTime) {
        List<SliceArrangement> list = new ArrayList<>();
        SliceArrangement slice;
        CachedRowSet crs = DButil.executeQuery("SELECT id,film_name,cinema_name,DATE_FORMAT(starting_time,'%Y-%m-%d %H:%i') AS 'starting_time',DATE_FORMAT(end_time,'%Y-%m-%d %H:%i') AS 'end_time' FROM slice_arrangement WHERE cinema_name LIKE ? AND starting_time LIKE ?", "%" + cinemaName + "%", "%" + dateTime + "%");
        try {
            while (crs.next()) {
                int id = crs.getInt(1);
                String filmName = crs.getString(2);
                String cinemaName1 = crs.getString(3);
                String staringTime = crs.getString(4);
                String endTime = crs.getString(5);
                slice = new SliceArrangement(id, new Film(filmName), new Cinema(cinemaName1), staringTime, endTime);
                list.add(slice);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            if (null != crs) {
                try {
                    crs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        return list;
    }

    @Override
    public List<SliceArrangement> queryArrangementByDateAndFilm(String filmName, String dateTime) {
        List<SliceArrangement> list = new ArrayList<>();
        SliceArrangement slice;
        CachedRowSet crs = DButil.executeQuery("SELECT a.id,a.film_name,a.cinema_name,DATE_FORMAT(a.starting_time,'%H:%i') " +
                "AS" +
                " 'starting_time',DATE_FORMAT(a.end_time,'%H:%i') AS 'end_time',b.film_id FROM slice_arrangement a " +
                "INNER JOIN " +
                "film b on a.film_name=b.film_name " +
                "WHERE " +
                "a.film_name LIKE ? AND a.starting_time LIKE ?", "%" + filmName + "%", "%" + dateTime + "%");
        try {
            while (crs.next()) {
                int id = crs.getInt(1);
                String filmName1 = crs.getString(2);
                String cinemaName1 = crs.getString(3);
                String staringTime = crs.getString(4);
                String endTime = crs.getString(5);
                int filmId =crs.getInt(6);
                slice = new SliceArrangement(id, new Film(filmId, filmName1), new Cinema(cinemaName1), staringTime, endTime);
                list.add(slice);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            if (null != crs) {
                try {
                    crs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        return list;
    }
}
