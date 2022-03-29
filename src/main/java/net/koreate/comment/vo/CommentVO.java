package net.koreate.comment.vo;

import java.util.Date;

import lombok.Data;
@Data
public class CommentVO {
	
	private int rno;
	private int sno;
	private String content;
	private String commentAuth;
	private Date regdate;
	private Date updatedate;
	private int uno;
	private int origin;
	private int seq;
	private int depth;
	
	
	private String user_img;
	private String uid;
}
