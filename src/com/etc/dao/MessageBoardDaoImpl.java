package com.etc.dao;

import com.etc.entity.Film;
import com.etc.entity.MessageBoard;
import com.etc.entity.User;
import com.etc.util.DButil;
import com.etc.util.PageData;

import javax.sql.rowset.CachedRowSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MessageBoardDaoImpl implements MessageBoardDao {
	/**
	 * 根据影片名模糊查询留言及分页
	 * @param pageNo
	 * @param pageSize
	 * @param keyword
	 * @return PageData
	 */
	@Override
	public PageData queryMessageBoardBylike(Integer pageNo, Integer pageSize, String keyword) {
		String sql = "select a.message_id,a.film_num,a.user_id,b.film_name,a.evaluate_content,\r\n" + 
				"DATE_FORMAT(a.evaluate_date,'%Y-%m-%d %H:%i:%S') AS 'a.evaluate_date',a.parent_message_id from message_board a INNER JOIN \r\n" + 
				"film b on a.film_num=b.film_id where b.film_name like ? limit ?,?";
		CachedRowSet crs = DButil.executeQuery(sql, "%"+keyword+"%",(pageNo-1)*pageSize,pageSize);
		List<MessageBoard> data = new ArrayList<MessageBoard>();
		MessageBoard messageBoard=null;
		try {
			while (crs.next()) {
				int messageId = crs.getInt(1);
				int filmNum = crs.getInt(2);
				int userId = crs.getInt(3);
				String filmName = crs.getString(4);
				String evaluateContent = crs.getString(5);
				String evaluateDate = crs.getString(6);
				int parentMessageId= crs.getInt(7);
				messageBoard=new MessageBoard(messageId, new Film(filmNum,filmName), new User(userId), evaluateContent, evaluateDate, parentMessageId);	
				
				data.add(messageBoard);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String sql2 = "select COUNT(*) from (select a.message_id,a.film_num,a.user_id,b.film_name,a.evaluate_content,\r\n" + 
				"a.evaluate_date,a.parent_message_id from message_board a INNER JOIN \r\n" + 
				"film b on a.film_num=b.film_id where b.film_name like ?) a";
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
	//根据评论编号删除评论

	@Override
	public boolean deleteMessageBoard(int messageId) {
		String sql="DELETE from message_board where message_id=?";		
		return DButil.executeUpdate(sql, messageId);
	}

	//新增评论
		@Override
		public boolean addMessageBoard(MessageBoard messageBoard) {
			String sql="INSERT  INTO message_board values(null,?,?,?,now(),?)";
			
			return DButil.executeUpdate(sql, messageBoard.getFilm().getFilmId(),messageBoard.getUser().getUserId(),messageBoard.getEvaluateContent(),messageBoard.getParentMessageId());
		}

		//根据影片编号查询一级评论级并分页
		@Override
		

		public PageData queryMessageBoardLimit(Integer pageNo, Integer pageSize, Integer fileNum,Integer parentMessageId) {
			String sql="SELECT a.message_id,a.film_num,a.user_id,b.user_name,b.user_img,\r\n" + 
					"a.evaluate_content,DATE_FORMAT(a.evaluate_date,'%Y-%m-%d %H:%i:%S') AS 'a.evaluate_date',a.parent_message_id from message_board a\r\n" + 
					"INNER JOIN user b on a.user_id=b.user_id INNER JOIN film c \r\n" + 
					"on a. film_num=c.film_id where a.film_num=? and\r\n" + 
					" a.parent_message_id =? ORDER BY a.evaluate_date desc LIMIT ?,?";
			CachedRowSet crs = DButil.executeQuery(sql, fileNum,parentMessageId,(pageNo-1)*pageSize,pageSize);
			List<MessageBoard> data = new ArrayList<MessageBoard>();
			MessageBoard messageBoard=null;
			try {
				while (crs.next()) {
					int messageId = crs.getInt(1);
					int filmNum = crs.getInt(2);
					int userId = crs.getInt(3);
					String userName = crs.getString(4);
					String userImg = crs.getString(5);
					String evaluateContent = crs.getString(6);
					String evaluateDate = crs.getString(7);
					int parentMessageId1= crs.getInt(8);
					
					messageBoard = new MessageBoard(messageId, new Film(filmNum), new User(userId,userName,userImg), evaluateContent, evaluateDate,parentMessageId1 );
					data.add(messageBoard);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			String sql2 = "select COUNT(*) FROM (SELECT a.message_id,a.film_num,a.user_id,b.user_name,b.user_img,\r\n" + 
					"a.evaluate_content,DATE_FORMAT(a.evaluate_date,'%Y-%m-%d %H:%i:%S') AS 'a.evaluate_date',a.parent_message_id from message_board a\r\n" + 
					"INNER JOIN user b on a.user_id=b.user_id INNER JOIN film c \r\n" + 
					"on a. film_num=c.film_id where a.film_num=? and\r\n" + 
					" a.parent_message_id =?) a";
			CachedRowSet crs2= DButil.executeQuery(sql2, fileNum,parentMessageId);
			int totalCount=0;
			PageData pageData=null;
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
		 * 根据评论编号查询某条评论
		 * @param messageId
		 * @return
		 */
		@Override
		public MessageBoard queryMessageById(int messageId) {
			String sql = "SELECT a.message_id,a.film_num,a.user_id,b.user_name,b.user_img,\r\n" + 
					"a.evaluate_content,DATE_FORMAT(a.evaluate_date,'%Y-%m-%d %H:%i:%S') AS 'a.evaluate_date',a.parent_message_id from message_board a \r\n" + 
					"INNER JOIN user b on a.user_id=b.user_id INNER JOIN film c \r\n" + 
					"on a. film_num=c.film_id where a.message_id=?";
			CachedRowSet crs = DButil.executeQuery(sql, messageId);
			
			MessageBoard messageBoard=null;
			try {
				while (crs.next()) {
					int messageId1 = crs.getInt(1);
					int filmNum = crs.getInt(2);
					int userId = crs.getInt(3);
					String userName = crs.getString(4);
					String userImg = crs.getString(5);
					String evaluateContent = crs.getString(6);
					String evaluateDate = crs.getString(7);
					int parentMessageId= crs.getInt(8);
						
					messageBoard = new MessageBoard(messageId1, new Film(filmNum), new User(userId,userName,userImg), evaluateContent, evaluateDate, parentMessageId);
					
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return messageBoard;
		}
		
		/**
		 * 根据父级评论Id查询评论
		 * @param parentMessageId
		 * @return
		 */
		@Override
		public List<MessageBoard> queryMessageBoardById(int parentMessageId) {
			String sql="SELECT a.message_id,a.film_num,a.user_id,b.user_name,b.user_img,\r\n" + 
					"a.evaluate_content,DATE_FORMAT(a.evaluate_date,'%Y-%m-%d %H:%i:%S') AS 'a.evaluate_date',a.parent_message_id from message_board a\r\n" + 
					"INNER JOIN user b on a.user_id=b.user_id INNER JOIN film c \r\n" + 
					"on a. film_num=c.film_id where a.parent_message_id =?";
			CachedRowSet crs = DButil.executeQuery(sql, parentMessageId);
			List<MessageBoard> data = new ArrayList<MessageBoard>();
			MessageBoard messageBoard=null;
			try {
				while (crs.next()) {
					int messageId = crs.getInt(1);
					int filmNum = crs.getInt(2);
					int userId = crs.getInt(3);
					String userName = crs.getString(4);
					String userImg = crs.getString(5);
					String evaluateContent = crs.getString(6);
					String evaluateDate = crs.getString(7);
					int parentMessageId1= crs.getInt(8);
					
					messageBoard = new MessageBoard(messageId, new Film(filmNum), new User(userId,userName,userImg), evaluateContent, evaluateDate,parentMessageId1 );
					data.add(messageBoard);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return data;
		}	

	
	
	
}
