package com.etc.dao;

import com.etc.entity.Admin;
import com.etc.entity.User;
import com.etc.util.PageData;

import java.util.List;

public interface AdminDao {
	/**
	 * 根据管理员名字及密码登录管理员账号
	 * @param adminName 管理员账号
	 * @param adminPassword	管理员密码
	 * @return 返回一个管理员账号信息
	 */
	Admin loginAdamin(String adminName,String adminPassword) ;
	/**
	 * 增加管理员
	 * @param admin 管理员实体类
	 * @return 布尔值
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
	 * @param adminId 管理员编号
	 * @return 布尔值
	 */
	boolean updateAdminState(int adminState,int adminId);
	/**
	  * 查询所有用户
	  * @return List<User> 用户的集合
	  */
	 List<User> queryUser();
	/**
	 * 根据用户的用户名模糊查询及分页
	 * @param pageNo 页码
	 * @param pageSize 每页几条数据
	 * @param keyword 模糊查询关键字
	 * @return PageData 工具类
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

