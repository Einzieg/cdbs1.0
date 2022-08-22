package com.etc.entity;

public class MessageBoard {
	private int messageId;//评论编号
    private Film film;//影片编号
    private User user;//用户编号
    private String evaluateContent; //评论内容
    private String evaluateDate;//评论的时间
    private int parentMessageId;//父级id

    public MessageBoard() {
    }

    public int getMessageId() {
		return messageId;
	}

	public void setMessageId(int messageId) {
		this.messageId = messageId;
	}

	

	public MessageBoard(Film film, User user, String evaluateContent, String evaluateDate) {
        this.film = film;
        this.user = user;
        this.evaluateContent = evaluateContent;
        this.evaluateDate = evaluateDate;
    }
	
    public MessageBoard(int messageId, Film film, User user, String evaluateContent,int parentMessageId, String evaluateDate
			) {
		super();
		this.messageId = messageId;
		this.film = film;
		this.user = user;
		this.evaluateContent = evaluateContent;
		this.evaluateDate = evaluateDate;
		this.parentMessageId = parentMessageId;
	}

	public MessageBoard(Film film, User user, String evaluateContent) {
		super();
		this.film = film;
		this.user = user;
		this.evaluateContent = evaluateContent;
	}

	public MessageBoard(int messageId) {
		super();
		this.messageId = messageId;
	}

	public Film getFilm() {
        return film;
    }

    public void setFilm(Film film) {
        this.film = film;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getEvaluateContent() {
        return evaluateContent;
    }

    public void setEvaluateContent(String evaluateContent) {
        this.evaluateContent = evaluateContent;
    }

    public String getEvaluateDate() {
        return evaluateDate;
    }

    public void setEvaluateDate(String evaluateDate) {
        this.evaluateDate = evaluateDate;
    }

    public MessageBoard(User user) {
		super();
		this.user = user;
	}

	public MessageBoard(Film film) {
		super();
		this.film = film;
	}



	public MessageBoard(int messageId, Film film, User user, String evaluateContent, String evaluateDate) {
		super();
		this.messageId = messageId;
		this.film = film;
		this.user = user;
		this.evaluateContent = evaluateContent;
		this.evaluateDate = evaluateDate;
	}




	public MessageBoard(int messageId, Film film, User user, String evaluateContent, String evaluateDate,
			int parentMessageId) {
		super();
		this.messageId = messageId;
		this.film = film;
		this.user = user;
		this.evaluateContent = evaluateContent;
		this.evaluateDate = evaluateDate;
		this.parentMessageId = parentMessageId;
	}

	public int parentMessageId() {
		return parentMessageId;
	}

	public int getParentMessageId() {
		return parentMessageId;
	}



	public MessageBoard(Film film, User user, String evaluateContent, int parentMessageId) {
		super();
		this.film = film;
		this.user = user;
		this.evaluateContent = evaluateContent;
		this.parentMessageId = parentMessageId;
	}

	public void setParentMessageId(int parentMessageId) {
		this.parentMessageId = parentMessageId;
	}

	public void setParent_message_id(int parentMessageId) {
		this.parentMessageId = parentMessageId;
	}

	@Override
    public String toString() {
        return "MessageBoard{" +
                "filmNum=" + film +
                ", userId=" + user +
                ", evaluateContent='" + evaluateContent + '\'' +
                ", evaluateDate='" + evaluateDate + '\'' +
                '}';
    }
}
