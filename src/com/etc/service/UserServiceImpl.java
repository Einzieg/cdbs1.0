package com.etc.service;

import com.etc.dao.UserDaoImpl;
import com.etc.entity.User;

import java.security.NoSuchAlgorithmException;
import java.util.List;


public class UserServiceImpl implements UserService {
	UserDaoImpl dao=new UserDaoImpl();

	@Override
	public List<User> getAllUsers() {
		// TODO Auto-generated method stub
		return dao.queryAllUser();
	}

	@Override
	public User login(String userName, String password) throws NoSuchAlgorithmException {
		// TODO Auto-generated method stub
		return dao.queryUserByNameAndPwd(userName, password);
	}

	@Override
	public boolean registerUser(String userName, String password,String userImg,String gender) throws NoSuchAlgorithmException {
		// TODO Auto-generated method stub
		return dao.insertUser(userName, password, userImg);

	}

	@Override
	public boolean updateUser(String userName, String password) throws NoSuchAlgorithmException {
		return dao.updateUser( password,userName);
		
	}

	@Override
	public boolean updateUserInformation(String userName, String password, String userImg, String gender) throws NoSuchAlgorithmException {
		// TODO Auto-generated method stub
		return dao.updateUserInformation(userName, password, userImg, gender);
	}
}
