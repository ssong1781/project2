package net.koreate.watch.service;

import java.util.List;



import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import net.koreate.watch.utils.Criteria;
import net.koreate.watch.utils.PageMaker;
import net.koreate.watch.dao.WatchDAO;
import net.koreate.watch.vo.WatchVO;

@Service
public class WatchServiceImpl implements WatchService {
	
	@Inject
	WatchDAO dao;


	@Transactional	// 전처리 후처리 해주는 어노테이션. 전처리로 오토커밋을 off시키고, 메소드들이 정상적으로 실행되면 후처리로 커밋을 on으로
					// 서블릿 콘테스트xml에서 드라이븐이 이 어노테이션을 찾고 매니지먼트가 이걸 실행시켜 전,후처리한다
	@Override
	public void regist(WatchVO vo) throws Exception {
		// INSERT title, content, uno
		dao.regist(vo);
		// 업로드 된 파일 정보 저장

	}



	@Override
	public PageMaker getPageMaker(Criteria cri) throws Exception {
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setDisplayPageNum(5);
		int totalCount = dao.listCount(cri);
		pageMaker.setTotalCount(totalCount);
		return pageMaker;
	}









	@Override
	public void updateCnt(int bno) throws Exception {
		dao.updateCnt(bno);
	}

	@Override
	public WatchVO read(int bno) throws Exception {
		WatchVO vo = dao.read(bno);
		System.out.println(vo);
		return vo;
	}



	@Override
	public void modify(WatchVO vo) throws Exception {
		// re_tbl_board 정보 수정
		dao.modify(vo);
		
	}

	@Override
	public void remove(int bno) throws Exception {
		// 게시글 삭제
		dao.remove(bno);	
	}



	@Override
	public List<WatchVO> listReply(Criteria cri) throws Exception {
		List<WatchVO> list = dao.listReply(cri);
		return list;
	}

}
