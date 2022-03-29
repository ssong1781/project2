package net.koreate.user.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import net.koreate.user.vo.AuthVO;
import net.koreate.user.vo.UserVO;

public interface UserDAO {

	// 회원가입
	void signUp(UserVO vo) throws Exception;
	
	// 비밀번호 변경
	void pwChangePost(@Param("uid") String uid,@Param("upass") String upass) throws Exception;
	
	// 회원가입시 권한 부여
	void insertAuth(String uid) throws Exception;

	// 로그인시 방문시간을 현재시간으로 수정 
	void updateVisitDate(String uid) throws Exception;

	// 아이디 권한 가져오기
	UserVO getMemberByID(String uid) throws Exception;

	// 활성화 여부 수정
	void deleteYN(UserVO vo) throws Exception;

	// 회원 리스트
	List<UserVO> getMemberList() throws Exception;

	// 유저 차단하기
	void giveBan(String uid) throws Exception;
	
	// 닉네임 중복 체크
	@Select("SELECT count(*) FROM user_tbl"
			+ " WHERE unick = #{unick}")
	int unickCheck(String unick) throws Exception;
	
	// 비밀번호 변경
	@Update("UPDATE user_tbl SET "
			+ " upass = #{upass} WHERE uid = #{uid}")
	void pwfind(UserVO vo) throws Exception;
	
	// 휴대폰 번호 중복 체크
	@Select("SELECT count(*) FROM user_tbl"
			+ " WHERE phone = #{phone}")
	int phoneCheck(String phone) throws Exception;
	
	// 아이디 중복 체크
	@Select("SELECT count(*) FROM user_tbl"
			+ " WHERE uid = #{uid}")
	int uidcount(String uid) throws Exception;
	
	// 로그인 전 아이디 비밀번호 체크
	@Select("SELECT * FROM user_tbl"
			+ " WHERE uid = #{uid}")
	UserVO uidall(String uid) throws Exception;

	// 회원 탈퇴
	@Update("UPDATE user_tbl SET deleted = 'N' "
			+ " WHERE uid = #{uid}")
	void userDelete(String uid) throws Exception;

	// 휴대폰 번호 변경
	@Update("UPDATE user_tbl SET phone = #{phone} "
			+ " WHERE uid = #{uid}")
	void phoneChangePost(@Param("uid") String uid,@Param("phone") String phone) throws Exception;

	// 프로필 페이지 이미지 변경
	@Update("UPDATE user_tbl SET user_img = #{user_img} "
			+ " WHERE uid = #{uid}")
	void ImageChange(@Param("uid") String uid,@Param("user_img") String user_img) throws Exception;
	
	// 시간 지나면 밴 상태 취소
	@Update("UPDATE user_tbl SET bandate = 0, defaultint = 0"
			+ " WHERE uid = #{uid}")
	void banCancel(String uid) throws Exception;

	// 벤 리스트 카운트
	@Select("SELECT count(*) FROM user_tbl "
			+ " WHERE bandate > 0")
	int getBanList() throws Exception;
	
}








