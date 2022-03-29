package net.koreate.user.service;

import java.util.List;

import net.koreate.user.vo.AuthVO;
import net.koreate.user.vo.UserVO;

public interface UserService {
	
	// 회원가입
	void signUp(UserVO vo)throws Exception;
	
	// 비밀번호 찾기
	void pwfind(UserVO vo)throws Exception;
	
	// 아이디 중복 체크
	boolean uidCheck(String uid) throws Exception;
	
	// 닉네임 중복 체크
	boolean unickCheck(String unick) throws Exception;
	
	// 비밀번호 찾기 아이디 체크
	boolean findUidCheck(String uid) throws Exception;
	
	// 휴대폰 번호 중복 체크
	boolean phoneCheck(String phone) throws Exception;

	// 로그인시 방문시간을 현재시간으로 수정 
	void updateVisteDate(String uid) throws Exception;
	
	// 아이디 체크
	boolean getMemberByID(String uid)throws Exception;
	
	// 회원 리스트 정보
	List<UserVO> getMemberList() throws Exception;

	// 서브밋 실행 전 확인
	boolean beforeSubmit(String uid, String upass) throws Exception;

	// 유저 차단하기
	void giveBan(String uid) throws Exception;

	// 차단된 유저인지 확인
	UserVO banCheck(String uid) throws Exception;

	// 차단된 유저인지 확인 전에 카운트 해주기
	UserVO loginBanCheck(String uid) throws Exception;

	// 밴 상태 취소
	void banCancel(String uid) throws Exception;

	// 비밀번호 변경
	void pwChangePost(String uid, String upass) throws Exception;

	// 회원 탈퇴
	void userDelete(String uid) throws Exception;

	// 탈퇴한 유저인지 확인 전에 카운트 해주기
	UserVO loginDeleteCheck(String uid) throws Exception;

	// 휴대폰 번호 변경
	void phoneChangePost(String uid, String phone) throws Exception;

	// 프로필 수정에서 프로필 사진 수정
	void ImageChange(String uid, String user_img) throws Exception;

	// 차단된 회원 카운트
	boolean getBanList() throws Exception;
	
}











