package com.etc.dao;

import com.etc.entity.Film;
import com.etc.util.DButil;
import com.etc.util.PageData;

import javax.sql.rowset.CachedRowSet;
import java.math.BigDecimal;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class FilmDaoImpl implements FilmDao {
    @Override
    public boolean insertFilm(Film film) {
        return DButil.executeUpdate("INSERT INTO film VALUES(NULL,?,?,?,?,?,?,?,?,?,?,1)",
                film.getFilmType(), film.getFilmName(), film.getFilmPoster(), film.getDirectorName(), film.getPerformerName(), film.getFilmIntroduce(), film.getFilmLanguage(), film.getFilmTime(), film.getMovieShowtime(), film.getTicketPrice());
    }

    @Override
    public boolean deleteFilm(int filmId) {
        return DButil.executeUpdate("DELETE FROM film WHERE film_id = ?", filmId);
    }

    @Override
    public boolean updateFilm(Film film) {
        return DButil.executeUpdate("UPDATE film SET film_type=?,film_name=?,film_poster=?,director_name=?,performer_name=?,film_introduce=?,film_language=?,film_time=?,movie_showtime=?,ticket_price=? WHERE film_id=?"
                , film.getFilmType(), film.getFilmName(), film.getFilmPoster(), film.getDirectorName(), film.getPerformerName(), film.getFilmIntroduce(), film.getFilmLanguage(), film.getFilmTime(), film.getMovieShowtime(), film.getTicketPrice(), film.getFilmId());
    }

    @Override
    public boolean updateFilmStatus(Integer filmId) {
        return DButil.executeUpdate("UPDATE film SET film_status=0 WHERE film_id = ?", filmId);
    }

    @Override
    public List<Film> queryFilm() {
        List<Film> list = new ArrayList<>();
        Film film;
        CachedRowSet crs = DButil.executeQuery("SELECT film_id,film_type,film_name,film_poster,director_name,performer_name,film_introduce,film_language,film_time,movie_showtime,ticket_price FROM film");
        try {
            while (crs.next()) {
                int filmId = crs.getInt(1);
                String filmType = crs.getString(2);
                String filmName = crs.getString(3);
                String filmPoster = crs.getString(4);
                String directorName = crs.getString(5);
                String performerName = crs.getString(6);
                String filmIntroduce = crs.getString(7);
                String filmLanguage = crs.getString(8);
                String filmTime = crs.getString(9);
                String movieShowtime = crs.getString(10);
                float ticketPrice = crs.getFloat(11);
                BigDecimal bg = new BigDecimal(ticketPrice);//只保留两位小数
                double f1 = bg.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
                film = new Film(filmId, filmType, filmName, filmPoster, directorName, performerName, filmIntroduce, filmLanguage, filmTime, movieShowtime, f1);
                list.add(film);
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
    public List<Film> queryOnFilm() {
        List<Film> list = new ArrayList<>();
        Film film;
        CachedRowSet crs = DButil.executeQuery("SELECT film_id,film_type,film_name,film_poster,director_name,performer_name,film_introduce,film_language,film_time,movie_showtime,ticket_price FROM film WHERE film_status=1");
        try {
            while (crs.next()) {
                int filmId = crs.getInt(1);
                String filmType = crs.getString(2);
                String filmName = crs.getString(3);
                String filmPoster = crs.getString(4);
                String directorName = crs.getString(5);
                String performerName = crs.getString(6);
                String filmIntroduce = crs.getString(7);
                String filmLanguage = crs.getString(8);
                String filmTime = crs.getString(9);
                String movieShowtime = crs.getString(10);
                float ticketPrice = crs.getFloat(11);
                BigDecimal bg = new BigDecimal(ticketPrice);//只保留两位小数
                double f1 = bg.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
                film = new Film(filmId, filmType, filmName, filmPoster, directorName, performerName, filmIntroduce, filmLanguage, filmTime, movieShowtime, f1);
                list.add(film);
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
    public List<Film> queryFilmByKey(String keyword) {
        List<Film> list = new ArrayList<>();
        Film film;
        CachedRowSet crs = DButil.executeQuery("SELECT film_id,film_type,film_name,film_poster,director_name,performer_name,film_introduce,film_language,film_time,movie_showtime,ticket_price FROM film WHERE film_name LIKE ?", "%" + keyword + "%");
        try {
            while (crs.next()) {
                int filmId = crs.getInt(1);
                String filmType = crs.getString(2);
                String filmName = crs.getString(3);
                String filmPoster = crs.getString(4);
                String directorName = crs.getString(5);
                String performerName = crs.getString(6);
                String filmIntroduce = crs.getString(7);
                String filmLanguage = crs.getString(8);
                String filmTime = crs.getString(9);
                String movieShowtime = crs.getString(10);
                float ticketPrice = crs.getFloat(11);
                BigDecimal bg = new BigDecimal(ticketPrice);
                double f1 = bg.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
                film = new Film(filmId, filmType, filmName, filmPoster, directorName, performerName, filmIntroduce, filmLanguage, filmTime, movieShowtime, f1);
                list.add(film);
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
    public PageData queryArticleByKwPage(Integer pageNo, Integer pageSize, String keyword) {
        List<Film> data = new ArrayList<>();
        Film film;
        CachedRowSet crs = DButil.executeQuery("SELECT film_id,film_type,film_name,film_poster,director_name,performer_name,film_introduce,film_language,film_time,movie_showtime,ticket_price FROM film WHERE film_name LIKE ? AND film_status=1 LIMIT ?,?", "%" + keyword + "%",(pageNo - 1) * pageSize, pageSize);
        try {
            while (crs.next()) {
                int filmId = crs.getInt(1);
                String filmType = crs.getString(2);
                String filmName = crs.getString(3);
                String filmPoster = crs.getString(4);
                String directorName = crs.getString(5);
                String performerName = crs.getString(6);
                String filmIntroduce = crs.getString(7);
                String filmLanguage = crs.getString(8);
                String filmTime = crs.getString(9);
                String movieShowtime = crs.getString(10);
                float ticketPrice = crs.getFloat(11);
                BigDecimal bg = new BigDecimal(ticketPrice);
                double f1 = bg.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
                film = new Film(filmId, filmType, filmName, filmPoster, directorName, performerName, filmIntroduce, filmLanguage, filmTime, movieShowtime, f1);
                data.add(film);
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
        CachedRowSet crs1 = DButil.executeQuery("SELECT count(*) FROM(SELECT film_id,film_type,film_name,film_poster,director_name,performer_name,film_introduce,film_language,film_time,movie_showtime,ticket_price FROM film WHERE film_name LIKE ? AND film_status=1)as c", "%" + keyword + "%");
        int totalCount = 0;
        try {
            if (crs1.next()) {
                totalCount = crs1.getInt(1);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return new PageData(data, pageNo, pageSize, totalCount);
    }

    @Override
    public PageData queryStatusByKwPage(Integer pageNo, Integer pageSize, String keyword) {
        List<Film> data = new ArrayList<>();
        Film film;
        CachedRowSet crs = DButil.executeQuery("SELECT film_id,film_type,film_name,film_poster,director_name,performer_name,film_introduce,film_language,film_time,movie_showtime,ticket_price FROM film WHERE film_name LIKE ? AND film_status=0 LIMIT ?,?", "%" + keyword + "%",(pageNo - 1) * pageSize, pageSize);
        try {
            while (crs.next()) {
                int filmId = crs.getInt(1);
                String filmType = crs.getString(2);
                String filmName = crs.getString(3);
                String filmPoster = crs.getString(4);
                String directorName = crs.getString(5);
                String performerName = crs.getString(6);
                String filmIntroduce = crs.getString(7);
                String filmLanguage = crs.getString(8);
                String filmTime = crs.getString(9);
                String movieShowtime = crs.getString(10);
                float ticketPrice = crs.getFloat(11);
                BigDecimal bg = new BigDecimal(ticketPrice);
                double f1 = bg.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
                film = new Film(filmId, filmType, filmName, filmPoster, directorName, performerName, filmIntroduce, filmLanguage, filmTime, movieShowtime, f1);
                data.add(film);
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
        CachedRowSet crs1 = DButil.executeQuery("SELECT count(*) FROM(SELECT film_id,film_type,film_name,film_poster,director_name,performer_name,film_introduce,film_language,film_time,movie_showtime,ticket_price FROM film WHERE film_name LIKE ? AND film_status=0)as c", "%" + keyword + "%");
        int totalCount = 0;
        try {
            if (crs1.next()) {
                totalCount = crs1.getInt(1);

            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return new PageData(data, pageNo, pageSize, totalCount);
    }

    @Override
    public Film queryFilmById(Integer filmId) {
        Film film = null;
        CachedRowSet crs = DButil.executeQuery("SELECT film_id,film_type,film_name,film_poster,director_name,performer_name,film_introduce,film_language,film_time,movie_showtime,ticket_price FROM film WHERE film_id=?", filmId);
        try {
            while (crs.next()) {
                int filmId1 = crs.getInt(1);
                String filmType = crs.getString(2);
                String filmName = crs.getString(3);
                String filmPoster = crs.getString(4);
                String directorName = crs.getString(5);
                String performerName = crs.getString(6);
                String filmIntroduce = crs.getString(7);
                String filmLanguage = crs.getString(8);
                String filmTime = crs.getString(9);
                String movieShowtime = crs.getString(10);
                float ticketPrice = crs.getFloat(11);
                BigDecimal bg = new BigDecimal(ticketPrice);
                double f1 = bg.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
                film = new Film(filmId1, filmType, filmName, filmPoster, directorName, performerName, filmIntroduce, filmLanguage, filmTime, movieShowtime, f1);

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
        return film;
    }

}
