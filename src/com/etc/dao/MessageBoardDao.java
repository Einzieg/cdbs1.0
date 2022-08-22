package com.etc.dao;

import com.etc.entity.MessageBoard;
import com.etc.util.PageData;

import java.util.List;

public interface MessageBoardDao {
	/**
	 * 根据影片名模糊查询留言及分页
	 * @param pageNo
	 * @param pageSize
	 * @param keyword
	 * @return PageData
	 */
	PageData queryMessageBoardBylike(Integer pageNo,Integer pageSize, String keyword);
	
	/**
	 * 评论编号删除评论

	 * @return
	 */
	boolean deleteMessageBoard(int messageId);
	
	//(---------------------------上面后台管理---------------------------------------)
	/**
	 * 新增评论
	 * @param messageBoard
	 * @return
	 */
	boolean addMessageBoard(MessageBoard messageBoard );
	/**
	 * 根据影片编号查询一级评论级并分页
	 * @param pageNo
	 * @param pageSize
	 * @param fileNum
	 * @return PageData
	 */
	PageData queryMessageBoardLimit(Integer pageNo,Integer pageSize,Integer fileNum,Integer parentMessageId);
	
	/**
	 * 根据评论编号查询某条评论
	 * @param messageId
	 * @return
	 */
	MessageBoard queryMessageById(int messageId);
	/**
	 * 根据父级评论Id查询评论
	 * @param parentMessageId
	 * @return
	 */
	List<MessageBoard> queryMessageBoardById(int parentMessageId);
	
	
}
