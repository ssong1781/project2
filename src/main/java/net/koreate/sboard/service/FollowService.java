package net.koreate.sboard.service;

import java.util.List;
import java.util.Map;

import net.koreate.sboard.vo.FollowVO;

public interface FollowService {
	//팔로우 등록
	String follow(FollowVO vo)throws Exception;
	
	// 중복값 확인
	FollowVO fcheck(FollowVO vo) throws Exception;
	
	// 언팔
	String unfollow(FollowVO vo) throws Exception;
	
	// 팔로우 리스트 불러오기
	List<FollowVO> flist(int uno) throws Exception;

	int ftotalCount(int uno) throws Exception;
	
	// 팔로워 리스트 불러오기
	List<FollowVO> followerList(int uno) throws Exception;

	int followerTC(int uno) throws Exception;

	Map<String, Object> followCheck(int uno) throws Exception;

	String checkProfile(FollowVO vo) throws Exception;
	
	
	
}
