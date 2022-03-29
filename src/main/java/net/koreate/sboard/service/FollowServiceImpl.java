package net.koreate.sboard.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import net.koreate.sboard.dao.FollowDAO;
import net.koreate.sboard.vo.FollowVO;

@Service
public class FollowServiceImpl implements FollowService {
	
	@Inject
	FollowDAO fd;
	
	@Override
	public String follow(FollowVO vo) throws Exception {
		int result = fd.follow(vo);
		return result > 0 ? "followOK" : "unfollowOK";
	}

	@Override
	public FollowVO fcheck(FollowVO vo) throws Exception {
		FollowVO fcheck = fd.fcheck(vo);
		System.out.println(fcheck);
		return fcheck;
	}

	@Override
	public String unfollow(FollowVO vo) throws Exception {
		int result = fd.unfollow(vo);
		System.out.println("unfollow service"+result);
		
		return result > 0 ? "unfollowOK" : "ffalse" ;
	}

	@Override
	public List<FollowVO> flist(int uno) throws Exception {
		List<FollowVO> flist = fd.flist(uno);
		System.out.println(flist);
		return flist;
	}

	@Override
	public int ftotalCount(int uno) throws Exception {
		return fd.ftotalCount(uno);
	}

	@Override
	public List<FollowVO> followerList(int uno) throws Exception {
		List<FollowVO> followerList = fd.followerList(uno);
		return followerList;
	}

	@Override
	public int followerTC(int uno) throws Exception {
		return fd.followerTC(uno);
	}

	@Override
	public Map<String, Object> followCheck(int uno) throws Exception {
		List<FollowVO> list = fd.flist(uno);
		Map<String,Object> map = new HashMap<>();
		map.put("list", list);
		return map;
	}

	@Override
	public String checkProfile(FollowVO vo) throws Exception {
		return fd.checkProfile(vo);
	}
	
	

}
