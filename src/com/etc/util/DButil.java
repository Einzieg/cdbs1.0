package com.etc.util;

import com.sun.rowset.CachedRowSetImpl;

import javax.sql.rowset.CachedRowSet;
import java.sql.*;

public class DButil {

	/*
	 * ①驱动类,数据库连接用户名,密码,地址这4个变量其实在程序中几乎不会改变, 
	 * 可以将该4个变量设置成final,static静态常量
	 */
	private static final String DRIVER="com.mysql.jdbc.Driver";
	private static final String URL="jdbc:mysql://localhost:3306/cdbs1.0";
	private static final String USER="root";
	private static final String PASSWORD="root";


	/**
	 * ②获取连接对象
	 * @return 返回连接对象
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 */
	public static Connection getConn() throws ClassNotFoundException, SQLException {
		//加载驱动(可省略)
		Class.forName(DRIVER);
		return DriverManager.getConnection(URL, USER, PASSWORD);
	}

	/**
	 * ③如果做查询,   创建预编译处理对象  执行executeQuery()
	 */
	public static CachedRowSet executeQuery(String sql,Object...params ) {
		
		Connection conn =null;
		PreparedStatement ps =null;
		CachedRowSet crs =null;
		ResultSet rs =null;
		try {
			//1.获取连接对象
			conn = getConn();
			//2.使用 connection连接对象得到一个执行sql语句的对象
			ps = conn.prepareStatement(sql);
			//3.给?赋值
			setParams(ps,params);
			//4.执行查询
			rs = ps.executeQuery();
			//5.创建一个CachedRowSet对象
			crs= new CachedRowSetImpl();
			//6. 使用取自给定 ResultSet 对象的数据填充此 CachedRowSet 对象。
			crs.populate(rs);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			//关闭资源
			closeAll(conn, ps, rs);
		}
		return crs;
	}
	
	
	/**
	 * ④如果做增删改, 创建预编译处理对象  执行executeUpdate()
	 * @param sql 语句
	 * @param params 可变参数数组,补齐?,可以0~n个参数
	 * @return n true:成功, false:失败
	 */
	public static boolean executeUpdate(String sql,Object... params ) {
		Connection conn =null;
		PreparedStatement ps =null;
		int n=0;
		try {
			//1.获取连接对象
			conn = getConn();
			//2.使用 connection连接对象得到一个执行sql语句的对象
			ps = conn.prepareStatement(sql);
			//3.补齐?参数的值
			setParams(ps,params);
			//4.执行增删改sql
			n = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			//5.关闭资源 ,写成一个方法
			closeAll(conn, ps, null);

		}
		//处理结果
		return n>0;
	}

	/**
	 * 补齐?参数的值
	 */
	public static void setParams(PreparedStatement ps,Object... params) {
		if (ps!=null && params !=null) {
			for (int i = 0; i < params.length; i++) {
				//补齐?参数的值,索引从1开始
				try {
					ps.setObject(i+1, params[i]);
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
	}
	


	/**
	 * 释放资源的方法
	 */
	public static void closeAll(Connection conn,PreparedStatement ps,ResultSet rs) {
		try {
			if (ps!=null)
				ps.close();
			if (rs!=null)
				rs.close();
			if (conn!=null)
				conn.close();
		}catch (SQLException e) {
			e.printStackTrace();
		}

	}

}
