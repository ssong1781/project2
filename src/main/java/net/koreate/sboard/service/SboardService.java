package net.koreate.sboard.service;

import java.util.List;
import java.util.Map;

import net.koreate.sboard.utils.Criteria;
import net.koreate.sboard.utils.PageMaker;
import net.koreate.sboard.vo.SboardVO;

public interface SboardService {
	
	// 게시글 등록
	void register(SboardVO vo) throws Exception;
	
	// 게시글 목록
	List<SboardVO> userList(int uno) throws Exception;

	List<SboardVO> allList() throws Exception;

	SboardVO details(int sno) throws Exception;

	List<SboardVO> newList(Criteria cri) throws Exception;
	
	
	//===================================
	
	//
	List<SboardVO> listCriteria(Criteria cri) throws Exception;

	PageMaker getPagetMaker(Criteria cri) throws Exception;

	SboardVO userInfo(int uno) throws Exception;

	int getUserUno(String uid) throws Exception;

	int profileTC(int uno) throws Exception;

	void likeup(int sno)throws Exception;

	void likedown(int sno)throws Exception;

	//List<SboardVO> followSboardList(int uno, Criteria cri) throws Exception;

	List<SboardVO> followSboardList(Map<String, Object> map) throws Exception;

	String delete(Map<String, Object> map) throws Exception;
	
	
	
}
