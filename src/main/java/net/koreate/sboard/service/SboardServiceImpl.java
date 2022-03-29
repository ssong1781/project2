package net.koreate.sboard.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import net.koreate.sboard.dao.SboardDAO;
import net.koreate.sboard.utils.Criteria;
import net.koreate.sboard.utils.PageMaker;
import net.koreate.sboard.vo.SboardVO;

@Service
public class SboardServiceImpl implements SboardService {
	
	@Inject
	SboardDAO dao;
	
	@Override
	public void register(SboardVO vo) throws Exception {
		dao.regist(vo);
	}

	@Override
	public List<SboardVO> userList(int uno) throws Exception {
		List<SboardVO> list = dao.userList(uno);
		System.out.println("service list"+list);
		return list;
	}

	@Override
	public List<SboardVO> allList() throws Exception {
		List<SboardVO> allList = dao.allList();
		return allList;
	}

	@Override
	public SboardVO details(int sno) throws Exception {
		SboardVO vo = dao.details(sno);
		return vo;
			
	}

	@Override
	public List<SboardVO> newList(Criteria cri) throws Exception {
		List<SboardVO> newList = dao.newList(cri);
		return newList;
	}
	//====================================================
	

	@Override
	public List<SboardVO> listCriteria(Criteria cri) throws Exception {
		
		// TODO Auto-generated method stub
		return dao.listCriteria(cri);
	}

	@Override
	public PageMaker getPagetMaker(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		PageMaker pm = new PageMaker();
		pm.setCri(cri);
		int totalCount = dao.listCount(cri);
		pm.setTotalCount(totalCount);
		return pm;
	}

	@Override
	public SboardVO userInfo(int uno) throws Exception {
		
		return dao.userInfo(uno);
	}

	@Override
	public int getUserUno(String uid) throws Exception {
		
		return dao.getUserUno(uid);
	}

	@Override
	public int profileTC(int uno) throws Exception {
		return dao.profileTC(uno);
	}

	@Override
	public void likeup(int sno) throws Exception {
		dao.likeup(sno);
	}

	@Override
	public void likedown(int sno) throws Exception {
		dao.likedown(sno);
	}

	//@Override
	//public List<SboardVO> followSboardList(int uno,Criteria cri) throws Exception {
//		return dao.followSboardList(uno,cri);
//	}

	@Override
	public List<SboardVO> followSboardList(Map<String, Object> map) throws Exception {
		System.out.println("followSboardList "+map);
		System.out.println(map.get("pm"));
		return dao.followSboardList(map);
	}

	@Override
	public String delete(Map<String, Object> map) throws Exception {
		
		return dao.delete(map) > 0 ? "Success" : "Failed";
	}



	
	

}
