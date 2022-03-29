package net.koreate.comment.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import net.koreate.comment.dao.CommentDAO;
import net.koreate.comment.vo.CommentVO;
import net.koreate.comment.utils.Criteria;
import net.koreate.comment.utils.PageMaker;

@Service
public class CommentServiceImpl implements CommentService {

	@Inject
	CommentDAO dao;
	
	@Override
	public List<CommentVO> commentList(int sno) throws Exception {
		return dao.commentList(sno);
	}
	
	@Override
	public void addComment(CommentVO vo) throws Exception {
		/* vo.setUno(1); */
		dao.addComment(vo);
	}

	@Override
	public Map<String, Object> listPage(int sno, int page) throws Exception {
		Criteria cri = new Criteria(); 
		cri.setPage(page);
		cri.setPerPageNum(7); 
		List<CommentVO> list = dao.listPage(sno, cri); 
		// 해당게시글에 작성된 전체 댓글 수 
		int totalCount = dao.totalCount(sno); 
		PageMaker pm = new PageMaker(); 
		pm.setCri(cri); 
		pm.setDisplayPageNum(5);
		pm.setTotalCount(totalCount);
		  
		Map<String,Object> map = new HashMap<>(); 
		map.put("list", list);
		map.put("pm", pm); 
		return map;
	}

	@Override
	public void removeComment(int rno) throws Exception {
		dao.removeComment(rno);
	}

	@Transactional
	@Override
	public void reply(CommentVO vo) throws Exception {
		dao.updateReply(vo);
		vo.setSeq(vo.getSeq()+1);
		System.out.println("등록된 댓글 정보 : " + vo);
		dao.replylist(vo);
		
	}

	

}
