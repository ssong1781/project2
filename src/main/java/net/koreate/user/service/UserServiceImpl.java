package net.koreate.user.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import net.koreate.user.dao.UserDAO;
import net.koreate.user.vo.AuthVO;
import net.koreate.user.vo.UserVO;

@Service
public class UserServiceImpl implements UserService {
	
	@Inject
	UserDAO dao;
	
	@Inject
	PasswordEncoder encoder;

	// 회원가입
	@Transactional
	@Override
	public void signUp(UserVO vo) throws Exception {
		String upass = vo.getUpass();
		vo.setUpass(encoder.encode(upass));
		
		dao.signUp(vo);
		dao.insertAuth(vo.getUid());
	}

	// 비밀번호 변경
	@Transactional
	@Override
	public void pwChangePost(String uid, String upass) throws Exception{
		System.out.println(uid);
		upass = encoder.encode(upass);
		
		dao.pwChangePost(uid, upass);
	}

	// 비밀번호 찾기
	@Override
	public void pwfind(UserVO vo) throws Exception {
		dao.pwfind(vo);
	}

	// 아이디 중복 체크
	@Override
	public boolean uidCheck(String uid) throws Exception {
		int result = dao.uidcount(uid);
		boolean isCheck = false;
		if(result > 0) {
			isCheck = false;
		}else {
			isCheck = true;
		}
		return isCheck;
	}

	// 비번찾기?
	@Override
	public boolean findUidCheck(String uid) throws Exception {
		int result = dao.uidcount(uid);
		boolean isCheck = false;
		if(result > 0) {
			isCheck = true;
		}else {
			isCheck = false;
		}
		return isCheck;
	}
	
	// 닉네임 중복체크
	@Override
	public boolean unickCheck(String unick) throws Exception {
		int result = dao.unickCheck(unick);
		boolean isCheck = false;
		if(result > 0) {	
			isCheck = false;
		}else {
			isCheck = true;
		}
		return isCheck;
	}

	// 휴대폰 번호 중복체크
	@Override
	public boolean phoneCheck(String phone) throws Exception {
		int result = dao.phoneCheck(phone);
		boolean isCheck = false;
		if(result > 0) {
			isCheck = false;
		}else {
			isCheck = true;
		}
		return isCheck;
	}

	// 최근 방문 시간
	@Override
	public void updateVisteDate(String uid) throws Exception {
		dao.updateVisitDate(uid);
	}

	// input 값과 동일한 아이디 불러오기
	@Override
	public boolean getMemberByID(String uid) throws Exception {
		UserVO vo = dao.getMemberByID(uid);
		System.out.println("서비스 겟멤버 : " + vo);
		return vo == null ? true : false;
	}


	// 회원목록
	@Override
	public List<UserVO> getMemberList() throws Exception {
		return dao.getMemberList();
	}

	// 로그인 전 아이디 비밀번호 확인
	@Override
	public boolean beforeSubmit(String uid, String upass) throws Exception {
		UserVO vo = dao.uidall(uid);
		boolean result = false;
		if(vo != null) {
			result = encoder.matches(upass, vo.getUpass());
		}
		return result;
	}

	// 정지버튼 클릭시 정지 부여
	@Override
	public void giveBan(String uid) throws Exception {
		dao.giveBan(uid);
	}

	// 벤 상태 체크
	@Override
	public UserVO banCheck(String uid) throws Exception {
		UserVO vo = dao.uidall(uid);
		return vo;
	}

	// 벤 상태 취소
	@Override
	public void banCancel(String uid) throws Exception {
		dao.banCancel(uid);
	}

	// 회원 탈퇴
	@Override
	public void userDelete(String uid) throws Exception {
		dao.userDelete(uid);
	}

	// 로그인 전 벤상태 체크
	@Override
	public UserVO loginBanCheck(String uid) throws Exception{
		int result = dao.uidcount(uid);
		UserVO vo = null;
		if(result > 0) {
			vo = dao.uidall(uid);
		}
		
		return vo;
	}
	
	// 탈퇴한 유저인지 확인 전에 카운트 해주기
	@Override
	public UserVO loginDeleteCheck(String uid) throws Exception {
		int result = dao.uidcount(uid);
		UserVO vo = null;
		if(result > 0) {
			vo = dao.uidall(uid);
		}
		return vo;
	}

	// 휴대폰 번호 변경
	@Override
	public void phoneChangePost(String uid, String phone) throws Exception {
		System.out.println("서비스 폰 체인지  : " + uid + "," + phone);
		dao.phoneChangePost(uid,phone);
		System.out.println("서비스 폰 체인지  : " + uid + "," + phone);
	}

	// 마이페이지 프로필 사진 변경
	@Override
	public void ImageChange(String uid, String user_img) throws Exception {
		dao.ImageChange(uid, user_img);
	}

	// 벤 리스트 카운트
	@Override
	public boolean getBanList() throws Exception {
		boolean isCheck = false;
		int result = dao.getBanList();
		if(result > 0) {
			isCheck = true;
		}
		
		return isCheck;
	}


}





