package net.koreate.pboard.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import net.koreate.pboard.dao.PboardDAO;
import net.koreate.pboard.vo.ProductBuyVO;
import net.koreate.pboard.vo.ProductImgVO;
import net.koreate.pboard.vo.ProductSellVO;
import net.koreate.pboard.vo.ProductVO;
import net.koreate.user.vo.UserVO;
import net.koreate.pboard.util.Criteria;
import net.koreate.pboard.util.PageMaker;

@Service
public class PboardService {

	@Inject
	PboardDAO dao;

	public List<ProductVO> listPage(Criteria cri) throws Exception {	
		return dao.listPage(cri);
	}
	
	public PageMaker getPageMaker(Criteria cri) throws Exception {
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setDisplayPageNum(5);	
		int totalCount = dao.listCount(cri);
		pageMaker.setTotalCount(totalCount);
		return pageMaker;
	}

	public ProductVO readPage(int pno) throws Exception {
		return dao.readPage(pno);
	}
	
	public List<String> readImg(int pno) throws Exception {
		return dao.readImg(pno);
	}

	public String readOneImg(int pno) throws Exception {	
		return dao.readOneImg(pno);
	}

	public List<String> getBrand() throws Exception {
		return dao.getBrand();
	}

	public void sellFinish(ProductSellVO vo) throws Exception {
		dao.sellFinish(vo);
		int psno = dao.selectPsno();
		UserVO uVO = new UserVO();
		uVO.setUno(vo.getUno());
		uVO.setSellno(psno+"/");
		dao.updateSellno(uVO);
	}

	public ProductSellVO minPrice(ProductSellVO vo) throws Exception {		
		return dao.minPrice(vo);
	}

	public ProductSellVO maxPrice(ProductSellVO vo) throws Exception {
		return dao.maxPrice(vo);
	}

	public void buyFinish(ProductBuyVO vo) throws Exception {
		dao.buyFinish(vo);
		UserVO uVO = new UserVO();
		uVO.setUno(vo.getUno());
		uVO.setBuyno(vo.getPsno()+"/");
		dao.updateBuyno(uVO);
	}

	public ProductSellVO minPriceNoSize(int pno) throws Exception {
		return dao.minPriceNoSize(pno);
	}

	public void soldout(int psno) throws Exception {
		dao.soldout(psno);
	}

	public int mostRecentDeal(int pno) throws Exception {
		return dao.mostRecentDeal(pno);
	}

	public String dealPrice(int psno) throws Exception {
		return dao.dealPrice(psno);
	}

	public int[] calPrice(int price) throws Exception  {
		return dao.calPrice(price);
	}

	public List<ProductBuyVO> psnoFind(int pno) throws Exception{
		return dao.psnoFind(pno);
	}

	public ProductSellVO quoteList(int psno) throws Exception {
		return dao.quoteList(psno);
	}
	
	public List<ProductSellVO> quoteList_sell(int pno) throws Exception {
		return dao.quoteList_sell(pno);
	}

	public void zzimSuccess(UserVO vo,int pno) throws Exception {
		vo.setZzim("\'"+pno+"\'");
		System.out.println("service zzimSuccess vo : " + vo);
		dao.zzimUser(vo);
		dao.zzimProduct(pno);
	}

	public void zzimCancel(UserVO vo, int pno) throws Exception {
		String myzzim = dao.userZzimSelect(vo);
		String zzim = "'"+pno+"'";
		myzzim = myzzim.replace(zzim, "");
	    vo.setZzim(myzzim);
	    dao.zzimUserCancel(vo);
	    dao.zzimProductCancel(pno);
		
	}

	public String zzimFind(int uno) throws Exception {
		UserVO vo = new UserVO();
		vo.setUno(uno);
		return dao.userZzimSelect(vo);
	}

	public boolean zzimFindOne(int uno, int pno) throws Exception {
		UserVO vo = new UserVO();
		vo.setUno(uno);
		String zzim = dao.userZzimSelect(vo);
		int index = zzim.indexOf("'"+pno+"'");
		if(index == -1) {
			return false;
		}else {
			return true;
		}
	}

	public int buyCnt(int uno) {
		return dao.buyCnt(uno);
	}


	
	

	

	
	
}
