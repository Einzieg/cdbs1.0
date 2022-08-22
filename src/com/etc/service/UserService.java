package com.etc.service;

import com.etc.entity.User;

import java.security.NoSuchAlgorithmException;
import java.util.List;

public interface UserService {
	
	List<User> getAllUsers();
	
	User login(String userName,String password) throws NoSuchAlgorithmException;

	boolean registerUser(String userName,String password,String userImg,String gender) throws NoSuchAlgorithmException;
	
	boolean updateUser(String userName,String password) throws NoSuchAlgorithmException;
	
	boolean updateUserInformation(String userName, String password, String userImg, String gender) throws NoSuchAlgorithmException;
}
