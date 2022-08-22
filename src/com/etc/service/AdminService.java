package com.etc.service;

import com.etc.entity.Admin;
import com.etc.entity.User;
import com.etc.util.PageData;

import java.util.List;

public interface AdminService {
	/**
	 * 根据管理员名字及密码登录管理员账号
	 * @param adminName
	 * @param adminPassword
	 * @return 返回一个管理员账号信息
	 */
	Admin loginAdamin(String adminName,String adminPassword) ;
	/**
	 * 增加管理员
	 * @param admin
	 * @return 

	 */
	boolean insertAdmin(Admin admin) ;
	/**
	 * 根据管理员编号修改管理员修改账号密码
	 * @param admin 管理员对象
	 * @return

	 */
	boolean updateAdamin(Admin admin) ;
	/**
	 * 根据管理员编号修改管理员状态(1在职 0离职)
	 * @param adminId
	 * @return
	 */
	boolean updateAdminState(int adminId,int adminState);
	/**
	  * 查询所有用户
	  * @return
	  */
	 List<User> queryUser();
	 /**
	  * 根据用户名模糊查询分页
	  * @return
	  */
	 PageData queryUserBylike( Integer pageNo,Integer pageSize, String keyword );
	 /**
	  *	管理员根据用户编号修改用户信息 
	  * @param user 用户的实体类
	  * @return 布尔值
	  */
	 boolean updateUserOnAdmin(User user) ;
	 /**
	  * 管理员根据用户编号注销用户
	  * @param userId 用户编号
	  * @return 布尔值
	  */
	 boolean deleteUserOnAdmin(int userId);
	 /**
	  * 查询所有管理员
	  * @return 所有管理员信息
	  */
	 List<Admin> queryAdmins();
}
