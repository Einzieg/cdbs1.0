package com.etc.service;

import com.etc.dao.MessageBoardDaoImpl;
import com.etc.entity.MessageBoard;
import com.etc.util.PageData;

import java.util.List;

public class MessageBoardServiceimpl  implements MessageBoardService {
	MessageBoardDaoImpl dao = new MessageBoardDaoImpl();
	/**
	 * 根据影片名模糊查询留言及分页
	 * @param pageNo
	 * @param pageSize
	 * @param keyword
	 * @return PageData
	 */
	@Override
	public PageData queryMessageBoardBylike(Integer pageNo, Integer pageSize, String keyword) {
		// TODO Auto-generated method stub
		return dao.queryMessageBoardBylike(pageNo, pageSize, keyword);
	}
	/**
	 * 评论编号删除评论

	 * @return
	 */
	@Override
	public boolean deleteMessageBoard(int messageId) {
		return dao.deleteMessageBoard(messageId);
	}
	//新增评论
	@Override
	public boolean addMessageBoard(MessageBoard messageBoard) {

		return dao.addMessageBoard(messageBoard);
	}
	//根据影片编号查询一级评论级并分页
	@Override
	public PageData queryMessageBoardLimit(Integer pageNo, Integer pageSize, Integer fileNum,Integer  parentMessageId) {

		return dao.queryMessageBoardLimit(pageNo, pageSize, fileNum,parentMessageId);
	}
	/**
	 * 根据评论编号查询某条评论
	 * @param messageId
	 * @return
	 */
	@Override
	public MessageBoard queryMessageById(int messageId) {
		// TODO Auto-generated method stub
		return dao.queryMessageById(messageId);
	}
	/**
	 * 根据父级评论Id查询评论
	 * @param parentMessageId
	 * @return
	 */
	@Override
	public List<MessageBoard> queryMessageBoardById(int parentMessageId) {
		
		return dao.queryMessageBoardById(parentMessageId);
	}

}
