package net.koreate.sboard.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import net.koreate.sboard.vo.FollowVO;

public interface FollowDAO {
	
	@Insert("INSERT INTO user_follow(uno,ufollower) VALUES(#{uno},#{ufollower})")
	int follow(FollowVO vo) throws Exception;

	@Select("SELECT * FROM user_follow WHERE uno = #{uno} AND ufollower = #{ufollower}")
	FollowVO fcheck(FollowVO vo);

	@Delete("DELETE FROM user_follow WHERE uno = #{uno} AND ufollower = #{ufollower}")
	int unfollow(FollowVO vo) throws Exception;

	@Select("SELECT F.*, U.uid,U.unick,U.user_img FROM user_follow AS F INNER JOIN user_tbl AS U ON F.ufollower = U.uno WHERE F.uno = #{uno}")
	List<FollowVO> flist(int uno) throws Exception;
	
	@Select("SELECT count(*) AS totalCount FROM user_follow WHERE uno = #{uno}")
	int ftotalCount(int uno) throws Exception;

	@Select("SELECT F.*, U.uid,U.unick,U.user_img  FROM user_follow AS F INNER JOIN user_tbl AS U ON F.uno = U.uno WHERE F.ufollower = #{uno}")
	List<FollowVO> followerList(int uno) throws Exception;
	
	@Select("SELECT count(*) AS totalCount FROM user_follow WHERE ufollower = #{uno}")
	int followerTC(int uno) throws Exception;

	@Select("SELECT * FROM user_follow WHERE uno = #{uno} AND ufollower = #{ufollower}")
	String checkProfile(FollowVO vo) throws Exception;

	/*
	 * @Select("") List<FollowVO> followCheck(int uno) throws Exception;
	 */
	
	
}
