package net.koreate.pboard.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import net.koreate.pboard.service.PboardService;
import net.koreate.pboard.vo.ProductBuyVO;
import net.koreate.pboard.vo.ProductImgVO;
import net.koreate.pboard.vo.ProductSellVO;
import net.koreate.pboard.vo.ProductVO;
import net.koreate.sec.security.user.CustomMember;
import net.koreate.user.vo.UserVO;
import net.koreate.pboard.util.Criteria;
import net.koreate.pboard.util.PageMaker;

@Controller
@RequestMapping("pboard/*")
public class PboardController {
	
	@Inject
	PboardService ps;
	
	@GetMapping("listPage")
	public String listPage(Criteria cri, Model model, Authentication auth) throws Exception {
		System.out.println("listPage 호출");
		if(cri.getPrice() != 0) {
			int[] pno = ps.calPrice(cri.getPrice());
			cri.setPno(pno);
		}		
		List<ProductVO> pList = ps.listPage(cri);
		model.addAttribute("pList",pList);
		PageMaker pm = ps.getPageMaker(cri);
		model.addAttribute("pm",pm);
		System.out.println("-----------------------listpage auth : " + auth);
		if(auth != null) {
			int uno = ((CustomMember)auth.getPrincipal()).getMember().getUno();
			model.addAttribute("uno",uno);
		}
		
		
		System.out.println("listPage 종료");
		return "pboard/listPage";
	}
	
	@GetMapping("readPage")
	public String readPage(int pno, Model model, Authentication auth) throws Exception {
		System.out.println("readPage 호출");
		ProductVO vo = ps.readPage(pno);
		model.addAttribute("product",vo);
		model.addAttribute("pno",pno);	
		
		if(auth != null) {
			int uno = ((CustomMember)auth.getPrincipal()).getMember().getUno();
			model.addAttribute("uno",uno);
		}
		
		System.out.println("readPage 종료");
		return "pboard/readPage";
	}
	
	@PostMapping("readImg")
	@ResponseBody
	public ResponseEntity<List<String>> readImg(int pno) throws Exception {
		System.out.println("readImg 호출");
		List<String> list = ps.readImg(pno);
		System.out.println("list : " + list);
		System.out.println("readImg 종료");
		return new ResponseEntity<>(list,HttpStatus.OK);
	}
	
	@PostMapping("readOneImg")
	@ResponseBody
	public ResponseEntity<String> readOneImg(int pno) throws Exception {
		System.out.println("readOneImg 호출");
		String imgName = ps.readOneImg(pno);
		System.out.println("imgName : " + imgName);
		System.out.println("readOneImg 종료");
		return new ResponseEntity<>(imgName,HttpStatus.OK);
	}
	
	@PostMapping("getBrand")
	@ResponseBody
	public ResponseEntity<List<String>> getBrand() throws Exception{
		ResponseEntity<List<String>> entity = null;
		List<String> list = ps.getBrand();
		entity = new ResponseEntity<>(list, HttpStatus.OK);
		return entity;
	}
	
	@GetMapping("buyPage")
	public String buyPage(int pno, Model model) throws Exception {
		System.out.println("buyPage 호출");
		ProductVO vo = ps.readPage(pno);
		model.addAttribute("product",vo);
		model.addAttribute("pno",pno);
		System.out.println("buyPage 종료");
		return "pboard/buyPage";
	}
	
	@GetMapping("buyDetailPage")
	public String buyDetailPage(int pno, String size, int psno, Model model) throws Exception {
		System.out.println("buyDetailPage 호출");
		System.out.println("buyDetailPage size : " + size);
		ProductVO vo = ps.readPage(pno);
		model.addAttribute("product",vo);
		model.addAttribute("size",size);
		model.addAttribute("psno",psno);
		System.out.println("buyDetailPage 종료");
		return "pboard/buyDetailPage";
	}
	
	@PostMapping("buyFinish")
	public String buyFinish(ProductBuyVO vo, RedirectAttributes rttr) throws Exception {
		System.out.println("buyFinish 호출");
		ps.buyFinish(vo);
		ps.soldout(vo.getPsno());
		rttr.addAttribute("pno", vo.getPno());
		rttr.addFlashAttribute("msg","구매 성공");
		System.out.println("buyFinish 종료");
		return "redirect:/pboard/readPage";
	}
	
	@GetMapping("sellPage")
	public String sellPage(int pno, Model model) throws Exception {
		System.out.println("sellPage 호출");
		ProductVO vo = ps.readPage(pno);
		model.addAttribute("product",vo);
		model.addAttribute("pno",pno);
		System.out.println("sellPage 종료");
		return "pboard/sellPage";
	}
	
	@GetMapping("sellDetailPage")
	public String sellDetailPage(int pno, String size, Model model) throws Exception {
		System.out.println("sellDetailPage 호출");
		System.out.println("sellDetailPage size : " + size);
		ProductVO vo = ps.readPage(pno);
		model.addAttribute("product",vo);
		model.addAttribute("size",size);
		System.out.println("sellDetailPage 종료");
		return "pboard/sellDetailPage";
	}
	
	@PostMapping("sellFinish")
	public String sellFinish(ProductSellVO vo,  RedirectAttributes rttr) throws Exception {
		System.out.println("sellFinish 호출");
		ps.sellFinish(vo);
		rttr.addAttribute("pno", vo.getPno());
		rttr.addFlashAttribute("msg","판매 등록 성공");
		System.out.println("sellFinish 종료");
		return "redirect:/pboard/readPage";
	}
	
	@PostMapping("minPrice")
	@ResponseBody
	public ProductSellVO minPrice(ProductSellVO vo) throws Exception {
		System.out.println("minPrice 호출");
		System.out.println("minPrice vo : " + vo);
		ProductSellVO pVO = ps.minPrice(vo);
		System.out.println("minPrice pVO : " + pVO);
		System.out.println("minPrice 종료");
		return pVO;
	}
	
	@PostMapping("maxPrice")
	@ResponseBody
	public ProductSellVO maxPrice(ProductSellVO vo) throws Exception {
		System.out.println("maxPrice 호출");
		System.out.println("minPrice vo : " + vo);
		ProductSellVO pVO = ps.maxPrice(vo);
		System.out.println("maxPrice pVO : " + pVO);
		System.out.println("maxPrice 종료");
		return pVO;
	}
	
	@PostMapping("minPriceNoSize")
	@ResponseBody
	public ProductSellVO minPriceNoSize(int pno) throws Exception {
		System.out.println("minPriceNoSize 호출");
		ProductSellVO pVO = ps.minPriceNoSize(pno);
		System.out.println("minPriceNoSize pVO : " + pVO);
		System.out.println("minPriceNoSize 종료");
		return pVO;
	}
	
	@PostMapping("mostRecentDeal")
	@ResponseBody
	public String mostRecentDeal(int pno) {
		System.out.println("mostRecentDeal 호출");
		
		String Price;
		try {
			int psno  = ps.mostRecentDeal(pno);
			Price = ps.dealPrice(psno);
			System.out.println("mostRecentDeal 종료");
			return Price;
		} catch (Exception e) {
			return "0";
		}	
	}
	
	@PostMapping("quoteList")
	@ResponseBody
	public List<ProductSellVO> quoteList(int pno) throws Exception{
		List<ProductBuyVO> bList = ps.psnoFind(pno);
		List<ProductSellVO> sList = new ArrayList<>();
		for(int i=0;i<bList.size();i++) {
			sList.add(ps.quoteList(bList.get(i).getPsno()));
			sList.get(i).setSuccessdate(bList.get(i).getRegdate());
		}
		
		
		return sList;
	}
	
	@PostMapping("quoteList_sell")
	@ResponseBody
	public List<ProductSellVO> quoteList_sell(int pno) throws Exception{
		List<ProductSellVO> sList = ps.quoteList_sell(pno);
		return sList;
	}
	
	
	@PostMapping("zzimSuccess")
	@ResponseBody
	public void zzimSuccess(UserVO vo, int pno) throws Exception {
		ps.zzimSuccess(vo,pno);
	}
	
	
	@PostMapping("zzimCancel")
	@ResponseBody
	public void zzimCancel(UserVO vo, int pno) throws Exception {
		ps.zzimCancel(vo,pno);
	}
	
	@PostMapping("zzimFind")
	@ResponseBody
	public String[] zzimFind(int uno) throws Exception {
		String zzim = ps.zzimFind(uno);
		System.out.println("-----------------------------zzimFind zzim : " + zzim);
		String[] zzims = null;
		
		if(zzim != null) {
			zzims = zzim.split("'");
			return zzims;
		}else {
			return zzims;
		}	
	}
	
	@PostMapping("zzimFindOne")
	@ResponseBody
	public boolean zzimFindOne(int uno, int pno) throws Exception {
		boolean check = ps.zzimFindOne(uno, pno);
		return check;
	}
	
	
	
	@PostMapping("wishContent")
	@ResponseBody
	public ProductVO wishContent(int pno) throws Exception {
		ProductVO vo = ps.readPage(pno);
		return vo;
	}
	
	
	
	@PostMapping("buyCnt")
	@ResponseBody
	public int buyCnt(int uno) throws Exception {
		return ps.buyCnt(uno);
	}
	
	
}















