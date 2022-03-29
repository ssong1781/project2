package net.koreate.comment.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import net.koreate.comment.vo.CommentVO;
import net.koreate.comment.utils.Criteria;

public interface CommentDAO {
	
	// 게시물 전체 리스트
	@Select("SELECT * FROM style_board_re_tbl"
			+ " WHERE sno = #{sno} "
			+ " ORDER BY rno DESC")
	List<CommentVO> commentList(int sno) throws Exception;
	
	// 댓글삽입
	@Insert("INSERT INTO style_board_re_tbl(uno,content,sno) "
		+ " VALUES(#{uno},#{content},#{sno})")
	void addComment(CommentVO vo)throws Exception;
	
	 // 댓글 삭제
	  
	 @Delete("DELETE FROM style_board_re_tbl WHERE rno = #{rno}") void
	 removeComment(int rno) throws Exception;
	  
	 // 해당 게시글에 등록 된 모든 댓글 삭제
	 
	 @Delete("DELETE FROM style_board_re_tbl WHERE sno = #{sno}") void
	 deleteComment(int sno) throws Exception;
	 
	 
	 // 페이징 블럭 처리를 위한 전체 댓글 개수
	 
	 @Select("SELECT count(rno) FROM style_board_re_tbl " + "WHERE sno = #{sno}") int
	 totalCount(int sno) throws Exception;
	 
	 
	// 페이징 처리된 댓글 리스트
	 
	@Select("SELECT C.* ,U.uid,U.user_img, U.unick AS commentAuth FROM " + " style_board_re_tbl AS C "
			+ " JOIN " + " user_tbl AS U " + " WHERE C.uno = U.uno AND sno = #{sno} " +
			" ORDER BY rno DESC " + " LIMIT #{cri.pageStart} , #{cri.perPageNum}")
	 List<CommentVO> listPage(  
				 @Param("sno") int sno,
				 @Param("cri") Criteria cri)throws Exception;

	// 대댓글 정렬값 수정
	@Update("UPDATE style_board_re_tbl SET seq = seq + 1 "
			+ " WHERE orgin = #{origin} AND seq > #{seq}")
	void updateReply(CommentVO vo);

	// 대댓글 등록
	@Insert("INSERT INTO style_board_re_tbl(sno,content,origin,seq,uno) "
			+ " VALUES(#{sno},#{content},#{origin},#{seq},#{uno})")
	void replylist(CommentVO vo);

	
}
