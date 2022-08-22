package com.etc.dao;

import com.etc.entity.Admin;
import com.etc.entity.User;
import com.etc.util.DButil;
import com.etc.util.PageData;

import javax.sql.rowset.CachedRowSet;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AdminDaoImpl implements AdminDao {
	/**
	 * 根据管理员名字及密码登录管理员账号
	 * @param adminName 管理员账号
	 * @param adminPassword	管理员密码
	 * @return 返回一个管理员账号信息
	 */
	@Override
	public Admin loginAdamin(String adminName, String adminPassword)  {
		String s=adminPassword;
		MessageDigest md = null;
		try{
			md= MessageDigest.getInstance("MD5");
		}catch (Exception e){
			e.printStackTrace();
		}
		md.update(s.getBytes());
		String str = new BigInteger(1,md.digest()).toString(16);
		System.out.println(str);
		String sql="select admin_id,admin_name,admin_password,admin_state from admin where admin_name=? and admin_password=?";
		CachedRowSet crs = DButil.executeQuery(sql, adminName,str);
		Admin admin =null;
		try {
			if (crs.next()) {
				int adminId = crs.getInt(1);
				String adminName2 = crs.getString(2);
				String adminPassword2 = crs.getString(3);
				int adminState = crs.getInt(4);
				admin = new Admin(adminId, adminName2, adminPassword2, adminState);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return admin;
	}
	/**
	 * 增加管理员
	 * @param admin 管理员实体类
	 * @return 布尔值
	 */
	@Override
	public boolean insertAdmin(Admin admin)  {
		System.out.println(admin.getAdminPassword());
		String s=admin.getAdminPassword();
		MessageDigest md = null;
		try{
			md= MessageDigest.getInstance("MD5");
		}catch (Exception e){
			e.printStackTrace();
		}
		md.update(s.getBytes());
		String str = new BigInteger(1,md.digest()).toString(16);
		String sql="insert into admin values(null,?,?,1)";
		boolean b = DButil.executeUpdate(sql,admin.getAdminName(),str);
		return b;
	}
	/**
	 * 根据管理员编号修改管理员修改账号密码
	 * @param admin 用户对象
	 * @return
	 */
	@Override
	public boolean updateAdamin(Admin admin)  {
		String s=admin.getAdminPassword();
		MessageDigest md = null;
		try{
			md= MessageDigest.getInstance("MD5");
		}catch (Exception e){
			e.printStackTrace();
		}
		md.update(s.getBytes());
		String str = new BigInteger(1,md.digest()).toString(16);
		String sql="update admin set admin_name=?,admin_password=?,admin_state=? where admin_id=?";
		boolean b = DButil.executeUpdate(sql, admin.getAdminName(),str,admin.getAdminState(),admin.getAdminId());
		return b;
	}
	/**
	 * 根据管理员编号修改管理员状态(1在职 0离职)
	 * @param adminId 管理员编号
	 * @return 布尔值
	 */
	@Override
	public boolean updateAdminState(int adminState,int adminId) {
		String sql="update admin set admin_state=? where admin_id=?";
		boolean b = DButil.executeUpdate(sql,adminId,adminState);
		return b;
	}
	/**
	 * 查询所有用户
	 * @return List<User>
	 */
	@Override
	public List<User> queryUser() {
		String sql="select user_id,user_name,user_password,user_img,user_gender,user_state,user_date from user";
		CachedRowSet crs = DButil.executeQuery(sql);
		List<User> list = new  ArrayList<User>();
		User user = null;
		try {
			while (crs.next()) {
				int userId=crs.getInt(1);
				String userName = crs.getString(2);
				String userPassword = crs.getString(3);
				String userImg = crs.getString(4);
				String userGender = crs.getString(5);
				int userState = crs.getInt(6);
				String userDate = crs.getString(7); 
				user = new User(userId, userName, userPassword, userImg, userGender, userState, userDate);
				list.add(user);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	/**
	 * 根据用户的用户名模糊查询及分页
	 * @param pageNo
	 * @param pageSize
	 * @param keyword
	 * @return PageData
	 */
	@Override
	public PageData queryUserBylike(Integer pageNo,Integer pageSize, String keyword) {
		String sql = "select user_id,user_name,user_password,user_img,user_gender,user_state,user_date from user where user_name like ? limit ?,?";
		CachedRowSet crs = DButil.executeQuery(sql, "%"+keyword+"%",(pageNo-1)*pageSize,pageSize);
		List<User> data = new  ArrayList<User>();
		User user = null;
		try {
			while (crs.next()) {
				int userId=crs.getInt(1);
				String userName = crs.getString(2);
				String userPassword = crs.getString(3);
				String userImg = crs.getString(4);
				String userGender = crs.getString(5);
				int userState = crs.getInt(6);
				String userDate = crs.getString(7); 
				user = new User(userId, userName, userPassword, userImg, userGender, userState, userDate);
				data.add(user);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String sql2 = "select COUNT(*) from (select user_id,user_name,user_password,user_img,\r\n" + 
				"user_gender,user_state,user_date from user where user_name like ?) a";
		CachedRowSet crs2 = DButil.executeQuery(sql2,"%"+keyword+"%");
		PageData pageData=null;
		int totalCount =0;
		try {
			while (crs2.next()) {
				totalCount = crs2.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		pageData = new PageData(data, pageNo, pageSize, totalCount);
		return pageData;
	}
	 /**
	  *	管理员根据用户编号修改用户信息 
	  * @param user 用户的实体类
	  * @return 布尔值
	  */
	@Override
	public boolean updateUserOnAdmin(User user)  {
		String s=user.getUserPassword();
		MessageDigest md = null;
		try{
			md= MessageDigest.getInstance("MD5");
		}catch (Exception e){
			e.printStackTrace();
		}
		md.update(s.getBytes());
		String str = new BigInteger(1,md.digest()).toString(16);
		String sql="update `user` set user_name=?,user_password=?,user_img=?,user_gender=? where user_id=?";
		boolean b = DButil.executeUpdate(sql, user.getUserName(),str,user.getUserImg(),user.getUserGender(),user.getUserId());
		return b;
	}
	/**
	  * 管理员根据用户编号注销用户
	  * @param userId 用户编号
	  * @return 布尔值
	  */
	@Override
	public boolean deleteUserOnAdmin(int userId) {
		String sql="update `user` set user_state=0 where user_id=?";
		boolean b = DButil.executeUpdate(sql, userId);
		return b;
	}
	 /**
	  * 查询所有管理员
	  * @return 所有管理员信息
	  */
	@Override
	public List<Admin> queryAdmins() {
		ArrayList<Admin> list = new ArrayList<Admin>();
		String sql="select admin_id,admin_name,admin_password,admin_state from admin";
		CachedRowSet crs = DButil.executeQuery(sql);
		Admin admin =null;
		try {
			while (crs.next()) {
				int adminId = crs.getInt(1);
				String adminName = crs.getString(2);
				String adminPassword = crs.getString(3);
				int adminState = crs.getInt(4);
				admin = new Admin(adminId, adminName, adminPassword, adminState);
				list.add(admin);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

}
