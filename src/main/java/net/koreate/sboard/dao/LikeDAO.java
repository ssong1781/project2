package net.koreate.sboard.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import net.koreate.sboard.vo.LikeVO;

public interface LikeDAO {
	
	@Insert("INSERT INTO board_like(sno,uno) VALUES(#{sno},#{uno})")
	int likeAdd(LikeVO vo) throws Exception;

	@Select("SELECT * FROM board_like WHERE sno = #{sno} AND uno = #{uno}")
	LikeVO likeCheck(LikeVO vo) throws Exception;
	
	@Delete("DELETE FROM board_like WHERE sno = #{sno} AND uno = #{uno}")
	int likeRemove(LikeVO vo) throws Exception;

	@Select("SELECT * FROM board_like WHERE uno = #{uno}")
	List<LikeVO> likeFind(int uno) throws Exception;

	@Select("SELECT * FROM board_like WHERE uno = #{uno}")
	List<LikeVO> likeList(int uno) throws Exception;

	@Select("SELECT heart FROM style_board_tbl WHERE sno = #{sno}")
	String likeCount(int sno) throws Exception;

}
