package net.koreate.sboard.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import net.koreate.sboard.utils.Criteria;
import net.koreate.sboard.vo.SboardVO;

public interface SboardDAO {
	
	@Insert("INSERT INTO style_board_tbl(uno,s_img,content,product_tag) VALUES(#{uno},#{s_img},#{content},#{product_tag})")
	void regist(SboardVO vo) throws Exception;
	
	//@Select("SELECT * FROM style_board_tbl WHERE uno = #{uno} ORDER BY regdate DESC;")
	//@Select("SELECT S.*, U.unick, U.user_img FROM style_board_tbl S, user_tbl U WHERE #{uno} = U.uno ORDER BY regdate DESC")
	@Select("SELECT S.*,U.uid, U.unick, U.user_img FROM style_board_tbl S, user_tbl U WHERE S.uno = U.uno AND S.uno = #{uno} ORDER BY regdate DESC")
	List<SboardVO> userList(int uno) throws Exception;
	
	@Select("SELECT count(*) AS totalCount FROM style_board_tbl WHERE uno = #{uno}")
	int profileTC(int uno) throws Exception;
	
	@Select("SELECT S.*,U.uid, U.unick, U.user_img FROM style_board_tbl S, user_tbl U WHERE S.uno = U.uno ORDER BY heart DESC")
	List<SboardVO> allList() throws Exception;
	
	@Select("SELECT S.*,U.uid, U.unick, U.user_img FROM style_board_tbl S,  user_tbl U WHERE S.uno = U.uno AND S.sno = #{sno}")
	SboardVO details(int sno) throws Exception;
	
	@Select("SELECT S.*,U.uid, U.unick, U.user_img FROM style_board_tbl S, user_tbl U WHERE S.uno = U.uno ORDER BY regdate DESC limit #{pageStart},#{perPageNum}")
	List<SboardVO> newList(Criteria cri) throws Exception;

	//=============================================
	
	
	@Select("SELECT S.*,U.uid, U.unick, U.user_img FROM style_board_tbl S, user_tbl U WHERE S.uno = U.uno ORDER BY heart DESC limit #{pageStart},#{perPageNum}")
	List<SboardVO> listCriteria(Criteria cri) throws Exception;
	
	@Select("SELECT count(*) FROM style_board_tbl")
	int listCount(Criteria cri) throws Exception;
	
	@Select("SELECT * FROM user_tbl WHERE uno = #{uno}")
	SboardVO userInfo(int uno) throws Exception;
	
	@Select("SELECT uno FROM user_tbl WHERE uid=#{uid}")
	int getUserUno(String uid) throws Exception;
	
	@Update("UPDATE style_board_tbl SET heart = heart +1 WHERE sno = #{sno}")
	void likeup(int sno) throws Exception;
	
	@Update("UPDATE style_board_tbl SET heart = heart -1 WHERE sno = #{sno}")
	void likedown(int sno)throws Exception;

	//@Select("SELECT S.*,U.uid,U.unick,U.user_img,F.ufollower FROM style_board_tbl S, user_tbl U, user_follow F WHERE S.uno = F.ufollower AND U.uno = F.ufollower AND F.uno = #{uno} ORDER BY heart DESC limit #{pageStart},#{perPageNum}")
	//List<SboardVO> followSboardList(int uno, Criteria cri) throws Exception;
	
	@Select("SELECT S.*,U.uid,U.unick,U.user_img,F.ufollower FROM style_board_tbl S, user_tbl U, user_follow F WHERE S.uno = F.ufollower AND U.uno = F.ufollower AND F.uno = #{uno} ORDER BY heart DESC")
	List<SboardVO> followSboardList(Map<String, Object> map);

	@Delete("DELETE FROM style_board_tbl WHERE sno = #{sno} AND uno = #{uno}")
	int delete(Map<String, Object> map) throws Exception;

	
}
