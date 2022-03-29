package net.koreate.sboard.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import net.koreate.sboard.dao.LikeDAO;
import net.koreate.sboard.vo.LikeVO;

@Service
public class LikeServiceImpl implements LikeService {
	
	@Inject
	LikeDAO ldao;
	
	@Override
	public String likeAdd(LikeVO vo) throws Exception {
		
		
		int result = ldao.likeAdd(vo);
		System.out.println("like service : "+result);
		return result > 0 ? "Success like" : "failed";
	}

	@Override
	public LikeVO likeCheck(LikeVO vo) throws Exception {
		LikeVO check = ldao.likeCheck(vo);
		System.out.println("like Check : "+check);
		return check;
	}

	@Override
	public String likeRemove(LikeVO vo) throws Exception {
		int result = ldao.likeRemove(vo);
		System.out.println("like Remove : "+result );
		return result > 0 ? "Success Removelike" : "failed";
	}

	@Override
	public Map<String, Object> likeFind(int uno) throws Exception {
		List<LikeVO> list = ldao.likeFind(uno);
		
		Map<String,Object> map = new HashMap<>();
		map.put("list", list);
		return map;
	}

	@Override
	public List<LikeVO> likeList(int uno) throws Exception {
		return ldao.likeList(uno);
	}

	@Override
	public String likeCount(int sno) throws Exception {
		
		return ldao.likeCount(sno);
	}

}
