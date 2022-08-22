package com.etc.entity;

public class Cinema {
    private int cinemaId;
    private String cinemaName;
    private int cinemaSeat;
    private int cinemaState;

    public Cinema(int cinemaId, String cinemaName, int cinemaSeat, int cinemaState) {
        this.cinemaId = cinemaId;
        this.cinemaName = cinemaName;
        this.cinemaSeat = cinemaSeat;
        this.cinemaState = cinemaState;
    }

    public Cinema(String cinemaName) {
        this.cinemaName = cinemaName;
    }

    public Cinema() {
    }

    public Cinema(String cinemaName, int cinemaSeat1) {
        this.cinemaName = cinemaName;
        this.cinemaSeat = cinemaSeat1;
    }

    public Cinema(int cinemaId, String cinemaName, int cinemaState) {
        this.cinemaId = cinemaId;
        this.cinemaName = cinemaName;
        this.cinemaSeat = cinemaState;
    }

    public int getCinemaId() {
        return cinemaId;
    }

    public void setCinemaId(int cinemaId) {
        this.cinemaId = cinemaId;
    }

    public String getCinemaName() {
        return cinemaName;
    }

    public void setCinemaName(String cinemaName) {
        this.cinemaName = cinemaName;
    }

    public int getCinemaSeat() {
        return cinemaSeat;
    }

    public void setCinemaSeat(int cinemaSeat) {
        this.cinemaSeat = cinemaSeat;
    }

    public int getCinemaState() {
        return cinemaState;
    }

    public void setCinemaState(int cinemaState) {
        this.cinemaState = cinemaState;
    }

    @Override
    public String toString() {
        return "Cinema{" +
                "cinemaId=" + cinemaId +
                ", cinemaName='" + cinemaName + '\'' +
                ", cinemaSeat=" + cinemaSeat +
                ", cinemaDate='" + cinemaState + '\'' +
                '}';
    }
}
