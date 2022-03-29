package net.koreate.comment.controller;

import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import net.koreate.comment.service.CommentService;
import net.koreate.comment.vo.CommentVO;
import net.koreate.comment.utils.Criteria;

@RestController
@RequestMapping("/comments")
public class CommentController {
	
	@Inject
	CommentService cs;
	
	// 댓글 목록 출력
	@GetMapping("/{sno}/{page}")
	public ResponseEntity<Map<String,Object>> listPage(
				@PathVariable("sno") int sno,
				@PathVariable("page") int page
			){
		System.out.println("댓글 목록 sno : "+sno);
		ResponseEntity<Map<String,Object>> entity = null;
		try {
			Map<String, Object> map = cs.listPage(sno, page);
			entity = new ResponseEntity<>(map,HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	// 댓글 작성 요청 - JSON
	@PostMapping("/add")
	public ResponseEntity<String> addComment(
			@RequestBody CommentVO vo
				) throws Exception{
		ResponseEntity<String> entity = null;
		System.out.println(vo);
		//
		System.out.println("로그인한 댓글 작성자 "+vo.getUno());
		System.out.println("댓글 작성할 글 번호 "+vo.getSno());
		System.out.println("댓글 작성할 내용 "+vo.getContent());
		
		try {
			cs.addComment(vo);
			entity = new ResponseEntity<>("SUCCESS",HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@DeleteMapping(value="/remove/{rno}",
			produces="text/plain;charset=utf-8")
	public ResponseEntity<String> delete(
				@PathVariable("rno") int rno
			) throws Exception{
		ResponseEntity<String> entity = null;
		try {
			cs.removeComment(rno);
			entity = new ResponseEntity<>("삭제완료",HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@PostMapping("reply")
	public String reply(
			Criteria cri,
			CommentVO vo,
			RedirectAttributes rttr
			) throws Exception{
		cs.reply(vo);
		rttr.addAttribute("page",cri.getPage());
		rttr.addAttribute("perPageNum",cri.getPerPageNum());
		return "redirect:/details";
	}
	
}
