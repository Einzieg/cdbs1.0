package com.etc.dao;

import com.etc.entity.User;
import com.etc.util.DButil;

import javax.sql.rowset.CachedRowSet;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class UserDaoImpl implements UserDao {

	@Override
	public User queryUserByNameAndPwd(String userName, String password) throws NoSuchAlgorithmException {
		String s=password;
		MessageDigest md = MessageDigest.getInstance("MD5");
		md.update(s.getBytes());
		String str = new BigInteger(1,md.digest()).toString(16);
		CachedRowSet crs = DButil.executeQuery("select * from user where user_name=? and user_password=?",userName,str);
		User user =null;
		try {
			while (crs.next()) {
				int userId = crs.getInt(1);
				String userName2 = crs.getString(2);
				String password2 = crs.getString(3);
				String useriImg = crs.getString(4);
				String gender = crs.getString(5);
				int state = crs.getInt(6);
				String date = crs.getString(7);
				
				user = new User(userId,userName2, password2,useriImg,gender,state,date);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return user;
	}

	@Override
	public boolean insertUser(String userName, String password,String userImg) throws NoSuchAlgorithmException {
		String s=password;
		MessageDigest md = MessageDigest.getInstance("MD5");
		md.update(s.getBytes());
		String str = new BigInteger(1,md.digest()).toString(16);
		return DButil.executeUpdate("insert into user values(null,?,?,?,1,1,now())", userName,str,userImg);
	}

	@Override
	public boolean updateUser(String userName, String password) throws NoSuchAlgorithmException {
		String s=password;
		MessageDigest md = MessageDigest.getInstance("MD5");
		md.update(s.getBytes());
		String str = new BigInteger(1,md.digest()).toString(16);
		if (""!=userName) {
			return DButil.executeUpdate("update user set user_password=?  WHERE user_name=? ",userName,str);
		}
		return false;
	}

	@Override
	public List<User> queryAllUser() {
		CachedRowSet crs = DButil.executeQuery("select * from user");
		User user =null;
		List<User> list = new ArrayList<User>();
		try {
			while (crs.next()) {
				int userId = crs.getInt(1);
				String userName2 = crs.getString(2);
				String password2 = crs.getString(3);
				String useriImg = crs.getString(4);
				String gender = crs.getString(5);
				int state = crs.getInt(6);
				String date = crs.getString(7);
				
				user = new User(userId,userName2, password2,useriImg,gender,state,date);
				list.add(user);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public boolean updateUserInformation(String userName, String password, String userImg, String gender) throws NoSuchAlgorithmException {
		String s=password;
		MessageDigest md = MessageDigest.getInstance("MD5");
		md.update(s.getBytes());
		String str = new BigInteger(1,md.digest()).toString(16);
		if (""!=userName) {
			return DButil.executeUpdate("update user set user_password=?,user_img=?,user_gender=? WHERE user_name=? ",str,userImg,gender,userName);
		}
		
		return false;
	}
}
