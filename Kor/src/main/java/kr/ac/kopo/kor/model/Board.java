package kr.ac.kopo.kor.model;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class Board {

	private int boardId; // 게시판 번호
	private String bWriter; // 작성자
	private String bSubject; // 제목
	private String bContent; //내용
	
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
	private Date bDate;// 작성일자
	
	private int viewCnt; //좋아요
	private int bLike; //좋아요
	private int bReply; //댓글
	private String id; //회원번호
	
	
	public int getBoardId() {
		return boardId;
	}
	public void setBoardId(int boardId) {
		this.boardId = boardId;
	}
	public String getbWriter() {
		return bWriter;
	}
	public void setbWriter(String bWriter) {
		this.bWriter = bWriter;
	}
	public String getbSubject() {
		return bSubject;
	}
	public void setbSubject(String bSubject) {
		this.bSubject = bSubject;
	}
	public String getbContent() {
		return bContent;
	}
	public void setbContent(String bContent) {
		this.bContent = bContent;
	}
	public Date getbDate() {
		return bDate;
	}
	public void setbDate(Date bDate) {
		this.bDate = bDate;
	}
	public int getViewCnt() {
		return viewCnt;
	}
	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}
	public int getbLike() {
		return bLike;
	}
	public void setbLike(int bLike) {
		this.bLike = bLike;
	}
	public int getbReply() {
		return bReply;
	}
	public void setbReply(int bReply) {
		this.bReply = bReply;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
}