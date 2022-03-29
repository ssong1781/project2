package net.koreate.watch.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectProvider;
import org.apache.ibatis.annotations.Update;

import net.koreate.watch.utils.Criteria;
import net.koreate.watch.provider.WatchQueryProvider;
import net.koreate.watch.vo.WatchVO;

public interface WatchDAO {
	
	@Insert("INSERT INTO watch_board(title, writer, content, player, brand) "
			+ " VALUES(#{title},#{writer},#{content},#{player},#{brand})")
	void regist(WatchVO vo) throws Exception;

	
	
	  @SelectProvider(type=WatchQueryProvider.class, method="searchSelectSql")
	  List<WatchVO> listReply(Criteria cri)throws Exception;
	 

	
	

	// 조회수 증가
	@Update("UPDATE watch_board SET viewcnt = viewcnt + 1 "
		  + " WHERE bno = #{bno}")
	void updateCnt(int bno)throws Exception;

	// 게시글 번호가 일치하는 한개의 게시글 정보 검색
	@Select("SELECT * FROM watch_board"
			+ " WHERE bno = #{bno}")
	WatchVO read(int bno) throws Exception;


	@SelectProvider(type=WatchQueryProvider.class, method = "searchSelectCount")
	int listCount(Criteria cri) throws Exception;
	
	// re_tbl_board title, content, updatedate 수정
	@Update("UPDATE watch_board SET "
			+ " title = #{title} , "
			+ " writer = #{writer} , "
			+ " content = #{content} ,"
			+ " player = #{player} , "
			+ " brand = #{brand} , "
			+ " updatedate = now() "
			+ " WHERE bno = #{bno}")
	void modify(WatchVO vo) throws Exception;
	

	/*
	 * // 게시글 삭제 처리 showboard = 'N'
	 * 
	 * @Update("UPDATE watch_board SET showboard = 'N' " + " WHERE bno = #{bno}")
	 */
	@Delete("DELETE FROM watch_board WHERE bno = #{bno}")
	void remove(int bno) throws Exception;

	

	
}












