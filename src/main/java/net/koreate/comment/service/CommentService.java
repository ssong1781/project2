package net.koreate.comment.service;

import java.util.List;
import java.util.Map;

import net.koreate.comment.vo.CommentVO;

public interface CommentService {
	
	// 게시물 전체 리스트
	List<CommentVO> commentList(int sno) throws Exception;
	
	// 댓글 삽입
	void addComment(CommentVO vo)throws Exception;
	
	// 댓글 리스트 및 페이징 정보
	Map<String,Object> listPage(int sno, int page) throws Exception;
	
	// 댓글 삭제
	void removeComment(int rno)throws Exception;
	
	// 대댓글
	void reply(CommentVO vo) throws Exception;
	
}
