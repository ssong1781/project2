package net.koreate.watch.service;

import java.util.List;

import net.koreate.watch.utils.Criteria;
import net.koreate.watch.utils.PageMaker;
import net.koreate.watch.vo.WatchVO;

public interface WatchService {
	
	// 게시글(원본) 작성
	void regist(WatchVO vo) throws Exception;
	
	// 게시글 조회수 증가
	void updateCnt(int bno)throws Exception;
	
	// 게시글 상세 정보
	WatchVO read(int bno)throws Exception;
	
	// 게시글 수정
	void modify(WatchVO vo)throws Exception;
	
	// 게시글 삭제
	void remove(int bno) throws Exception;
	
	
	// 게시글 목록
	List<WatchVO> listReply(Criteria cri)throws Exception;
	
	// 게시글 페이징 블럭 정보
	PageMaker getPageMaker(Criteria cri)throws Exception;
	
}







