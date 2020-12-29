package com.kh.hllee.board.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class BoardReply implements java.io.Serializable {
	private static final long serialVersionUID = 30001L; 
	private String comment_id;
	private int board_num;
	private String comment_name;
	private String comment_pwd; 
	private String comments; 
	private Date regdate;
	
	public BoardReply() {}
	
	public BoardReply(String comment_id, String comment_pwd, String comments) { 
		super();
		this.comment_id = comment_id; 
		this.comment_pwd = comment_pwd; 
		this.comments = comments;
	}
	
	public BoardReply(String comment_id, String comment_pwd) { 
		this.comment_id = comment_id;
		this.comment_pwd = comment_pwd;
	}
	public BoardReply(String comment_id, int board_num, String comment_name, String comment_pwd, String comments, Date regdate) {
		this.comment_id = comment_id; 
		this.board_num = board_num; 
		this.comment_name = comment_name; 
		this.comment_pwd = comment_pwd; 
		this.comments = comments; 
		this.regdate = regdate;
	}
	
	public BoardReply(int board_num, String comment_name, String comment_pwd, String comments) {
		this.board_num = board_num; 
		this.comment_name = comment_name; 
		this.comment_pwd = comment_pwd; 
		this.comments = comments;
	}
	@Override //toString()메소드오버라이딩 
	public String toString() {
		return "BoardReply [comment_id=" + comment_id + ", board_num=" + board_num + ", comment_name=" + comment_name
				+ ", comment_pwd=" + comment_pwd + ", comments=" + comments + ", regdate=" + regdate + "]";
	}

	public String getComment_id() {
		return comment_id;
	}

	public void setComment_id(String comment_id) {
		this.comment_id = comment_id;
	}

	public int getBoard_num() {
		return board_num;
	}

	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}

	public String getComment_name() {
		return comment_name;
	}

	public void setComment_name(String comment_name) {
		this.comment_name = comment_name;
	}

	public String getComment_pwd() {
		return comment_pwd;
	}

	public void setComment_pwd(String comment_pwd) {
		this.comment_pwd = comment_pwd;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
}
