package com.etc.dao;

import com.etc.entity.User;

import java.security.NoSuchAlgorithmException;
import java.util.List;

public interface UserDao {
	
	/**
	 * 查询所有用户
	 * @return 返回所有用户集合
	 */
	 List<User> queryAllUser();
		
	/**
	 * 根据用户名和密码登录
	 * @param userName 用户名
	 * @param password 用户密码
	 * @return 返回用户信息
	 * @throws NoSuchAlgorithmException 
	 */
    User queryUserByNameAndPwd(String userName,String password) throws NoSuchAlgorithmException;
    
    /**
     * 根据用户名密码注册用户
     * @param userName 用户名
     * @param password 用户密码
     * @return true为成功 false为失败
     * @throws NoSuchAlgorithmException 
     */
    boolean insertUser(String userName,String password,String userImg) throws NoSuchAlgorithmException;
    
    /**
     * 根据用户名修改密码
     * @param userName 用户名
     * @param password 密码
     * @return true为成功 false为失败
     * @throws NoSuchAlgorithmException 
     */
    boolean updateUser(String userName,String password) throws NoSuchAlgorithmException;
    
    /**
     * 根据用户名修改个人信息
     * @param userName 用户名
     * @param password 密码
     * @param userImg 头像
     * @param gender 性别
     * @return true为成功 false为失败
     * @throws NoSuchAlgorithmException 
     */

	boolean updateUserInformation(String userName, String password, String userImg, String gender) throws NoSuchAlgorithmException;

    
}
