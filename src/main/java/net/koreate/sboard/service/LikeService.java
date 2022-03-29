package net.koreate.sboard.service;

import java.util.List;
import java.util.Map;

import net.koreate.sboard.vo.LikeVO;

public interface LikeService {

	String likeAdd(LikeVO vo) throws Exception;

	LikeVO likeCheck(LikeVO vo) throws Exception;

	String likeRemove(LikeVO vo) throws Exception;

	Map<String, Object> likeFind(int uno) throws Exception;

	List<LikeVO> likeList(int uno) throws Exception;

	String likeCount(int sno) throws Exception;

}
