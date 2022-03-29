package net.koreate.watch.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import net.koreate.watch.utils.Criteria;
import net.koreate.watch.utils.PageMaker;
import net.koreate.watch.service.WatchService;
import net.koreate.watch.vo.WatchVO;

@Controller
@RequestMapping("/watch/*")
public class WatchController {
	
	@Inject
	WatchService ws;
	
	@GetMapping("register")
	public String register() {
		return "watch/register";
	}
	
	@PostMapping("register")
	public String register(WatchVO vo)throws Exception{
		System.out.println("regist : "+vo);
		// 게시글(원본) 등록
		ws.regist(vo);
		// 게시글 목록 페이지로 요청 변경
		return "redirect:/watch/listReply";
	}
	
	// 페이징 처리된 게시글 목록
	@GetMapping("listReply")
	public String listReply(
			Criteria cri,
			Model model
			)throws Exception{
		System.out.println(cri);
		
		model.addAttribute("list",ws.listReply(cri));
		PageMaker pm = ws.getPageMaker(cri);
		model.addAttribute("pm",pm);
		return "watch/listReply";
	}
	
	
	@GetMapping("readPage")
	public String readPage(
			Criteria cri,
			int bno,
			RedirectAttributes rttr
			) throws Exception{
		// 조회수 만 증가
		ws.updateCnt(bno);
		
		rttr.addAttribute("bno",bno);	// rttr.adda~는 파라미터로 bno 전달 즉 밑에 주석과 같음
		rttr.addFlashAttribute("cri",cri);
		return "redirect:/watch/read";
		//return "redirect:/board/read?bno="+bno; 위랑 같다
	}
	
	@GetMapping("read")
	public String read(
			int bno,
			Model model
			)throws Exception{
		WatchVO vo = ws.read(bno);
		model.addAttribute("watch",vo);
		return "watch/readPage";
	}
	
	// 답변글 작성 페이지 요청
	@GetMapping("replyRegister")
	public String replyRegister(
			@ModelAttribute("cri") Criteria cri,
			int bno ,// 원본글 번호
			Model model)throws Exception{
		WatchVO origin = ws.read(bno);
		model.addAttribute("original",origin);
		return "watch/replyRegister";
	}
	
	
	
	@GetMapping("modifyPage")
	public String modifyPage(
				int bno, 		// 수정할 게시글 번호
				@ModelAttribute("cri") Criteria cri, 	//수정완료 후 이동할 페이지 정보
				Model model
			)throws Exception{
		WatchVO vo = ws.read(bno);
		model.addAttribute("watch",vo);
		//model.addAttribute("watch",ws.read(bno));
		return "watch/modifyPage";
	}
	
	// 수정 완료 요청
	@PostMapping("modifyPage")
	public String modifyPage(
			WatchVO vo, // 수정할 게시글 정보
				Criteria cri, // 수정완료 후 이동할 페이지 정보
				RedirectAttributes rttr
			) throws Exception{
		// 게시글 수정 처리
		ws.modify(vo);
		
		rttr.addAttribute("bno",vo.getBno());
		rttr.addFlashAttribute("cri",cri);
		return "redirect:/watch/read";
	}
	
	// 게시글 삭제 요청 처리
	@PostMapping("remove")
	public String remove(
			int bno, // 삭제해야할 게시글 번호
			Criteria cri,
			RedirectAttributes rttr
			)throws Exception{
		// 삭제 처리
		ws.remove(bno);
	
		rttr.addAttribute("page",cri.getPage());
		rttr.addAttribute("perPageNum",cri.getPerPageNum());
		rttr.addAttribute("searchType",cri.getSearchType());
		rttr.addAttribute("keyword",cri.getKeyword());
		return "redirect:/watch/listReply";
	}
	
	

	
	
}

















