package com.etc.entity;

public class User {
    private int userId;
    private String userName;
    private String userPassword;
    private String userImg;
    private String userGender;
    private int userState;
    private String userDate;

    public User(int userId, String userName, String userPassword, String userImg, String userGender, int userState, String userDate) {
        this.userId = userId;
        this.userName = userName;
        this.userPassword = userPassword;
        this.userImg = userImg;
        this.userGender = userGender;
        this.userState = userState;
        this.userDate = userDate;
    }

    public User() {
    }

    public User(int id) {
        this.userId=id;
    }

    public User(String userName) {
        this.userName=userName;
    }

    public User(int userId, String userName, String userImg) {
        this.userId = userId;
        this.userName = userName;
        this.userImg = userImg;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }

    public String getUserImg() {
        return userImg;
    }

    public void setUserImg(String userImg) {
        this.userImg = userImg;
    }

    public String getUserGender() {
        return userGender;
    }

    public void setUserGender(String userGender) {
        this.userGender = userGender;
    }

    public int getUserState() {
        return userState;
    }

    public void setUserState(int userState) {
        this.userState = userState;
    }

    public String getUserDate() {
        return userDate;
    }

    public void setUserDate(String userDate) {
        this.userDate = userDate;
    }

    @Override
    public String toString() {
        return "User{" +
                "userId=" + userId +
                ", userName='" + userName + '\'' +
                ", userPassword='" + userPassword + '\'' +
                ", userImg='" + userImg + '\'' +
                ", userGender=" + userGender +
                ", userState=" + userState +
                ", userDate='" + userDate + '\'' +
                '}';
    }
}
