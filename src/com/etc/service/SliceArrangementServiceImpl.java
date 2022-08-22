package com.etc.service;

import com.etc.dao.SliceArrangementDaoImpl;
import com.etc.entity.SliceArrangement;

import java.util.List;

public class SliceArrangementServiceImpl implements SliceArrangementService {
    SliceArrangementDaoImpl dao = new SliceArrangementDaoImpl();


    @Override
    public boolean insertArrangement(SliceArrangement slice) {
        return dao.insertArrangement(slice);

    }

    @Override
    public boolean deleteArrangement(Integer sliceId) {
        return dao.deleteArrangement(sliceId);
    }

    @Override
    public boolean updateArrangement(SliceArrangement slice) {
        return dao.updateArrangement(slice);
    }

    @Override
    public List<SliceArrangement> queryArrangementByCinema(String cinemaName) {
        return dao.queryArrangementByCinema(cinemaName);
    }

    @Override
    public List<SliceArrangement> queryArrangementByDate(String dateTime) {
        return dao.queryArrangementByDate(dateTime);
    }

    @Override
    public List<SliceArrangement> queryArrangementByDateAndCinema(String cinemaName, String dateTime) {
        return dao.queryArrangementByDateAndCinema(cinemaName,dateTime);
    }

    @Override
    public List<SliceArrangement> queryArrangementByDateAndFilm(String filmName, String dateTime) {
        return dao.queryArrangementByDateAndFilm(filmName,dateTime);
    }
}
