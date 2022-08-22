package com.etc.service;

import com.etc.dao.AdminDao;
import com.etc.dao.AdminDaoImpl;
import com.etc.entity.Admin;
import com.etc.entity.User;
import com.etc.util.PageData;

import java.util.List;

public class AdminServiceImpl implements AdminService {
	//根据管理员账号密码登录管理员账号
	AdminDao dao=new AdminDaoImpl();
	@Override
	public Admin loginAdamin(String adminName, String adminPassword)  {
		return dao.loginAdamin(adminName, adminPassword);
	}
	//增加管理员
	@Override
	public boolean insertAdmin(Admin admin)  {
		boolean b = dao.insertAdmin(admin);
		return b;
	}
	//根据管理员编号修改账号密码
	@Override
	public boolean updateAdamin(Admin admin)  {
		boolean b = dao.updateAdamin(admin);
		return b;
	}
	//根据员工编号更改员工状态(1在职 0离职)
	@Override
	public boolean updateAdminState(int adminId,int adminState) {
		boolean b = dao.updateAdminState(adminId,adminState);
		return b;
	}
	//查询所有用户
	 @Override
	 public List<User> queryUser() {
	  
	  return dao.queryUser();
	 }
	 //根据用户名模糊查询分页
	 @Override
	 public PageData queryUserBylike(Integer pageNo, Integer pageSize, String keyword) {
	  
	  return dao.queryUserBylike(pageNo, pageSize, keyword);
	 }
	 /**
	  *	管理员根据用户编号修改用户信息 
	  * @param user 用户的实体类
	  * @return 布尔值

	  */
	@Override
	public boolean updateUserOnAdmin(User user) {
		return dao.updateUserOnAdmin(user);
	}
	 /**
	  * 管理员根据用户编号注销用户
	  * @param userId 用户编号
	  * @return 布尔值
	  */
	@Override
	public boolean deleteUserOnAdmin(int userId) {
		return dao.deleteUserOnAdmin(userId);
	}
	/**
	  * 查询所有管理员
	  * @return 所有管理员信息
	  */
	@Override
	public List<Admin> queryAdmins() {
		return dao.queryAdmins();
	}
	
}
