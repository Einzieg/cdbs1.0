package com.etc.service;

import com.etc.dao.FilmDaoImpl;
import com.etc.entity.Film;
import com.etc.util.PageData;

import java.util.List;

public class FilmServiceImpl implements FilmService {
    FilmDaoImpl dao = new FilmDaoImpl();
    @Override
    public boolean insertFilm(Film film) {
        return dao.insertFilm(film);
    }

    @Override
    public boolean deleteFilm(int filmId) {
        return dao.deleteFilm(filmId);
    }

    @Override
    public boolean updateFilmStatus(Integer filmId) {
        return dao.updateFilmStatus(filmId);
    }

    @Override
    public boolean updateFilm(Film film) {
        return dao.updateFilm(film);
    }

    @Override
    public List<Film> queryFilm() {
        return dao.queryFilm();
    }

    @Override
    public List<Film> queryOnFilm() {
        return dao.queryOnFilm();
    }

    @Override
    public List<Film> queryFilmByKey(String keyword) {
        return dao.queryFilmByKey(keyword);
    }

    @Override
    public PageData queryArticleByKwPage(Integer pageNo, Integer pageSize, String keyword) {
        return dao.queryArticleByKwPage(pageNo, pageSize, keyword);
    }

    @Override
    public PageData queryStatusByKwPage(Integer pageNo, Integer pageSize, String keyword) {
        return dao.queryStatusByKwPage(pageNo, pageSize,keyword);
    }

    @Override
    public Film queryFilmById(Integer filmId) {
        return dao.queryFilmById(filmId);
    }
}
