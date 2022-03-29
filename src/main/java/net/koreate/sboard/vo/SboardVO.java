package net.koreate.sboard.vo;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class SboardVO {
	private int sno;			// 게시물 번호
	private int	uno;			// 유저 번호
	private String s_img; // 첨부파일 목록
	private String content;		// 게시물 내용
	private String product_tag; // 태그할 제품
	private int heart;			// 좋아요 수
	private Date regdate;		// 게시물 작성 시간
	private Date updatedate;	// 게시물 수정 시간
	
	private int comments;		// 해당 게시물 등록 댓글 수
	
	private String uid;
	private String unick;
	private String user_img;
	
	private int ufollower;
}
