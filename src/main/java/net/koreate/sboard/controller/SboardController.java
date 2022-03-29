package net.koreate.sboard.controller;


import java.io.File;
import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import net.koreate.sboard.service.FollowService;
import net.koreate.sboard.service.LikeService;
import net.koreate.sboard.service.SboardService;
import net.koreate.sboard.utils.Criteria;
import net.koreate.sboard.vo.LikeVO;
import net.koreate.sboard.vo.SboardVO;


@Controller
public class SboardController {
	
	@Resource(name="uploadPath")
	String uploadPath;
	
	@Inject
	SboardService ss;
	
	@Inject
	FollowService fs;
	
	@Inject
	LikeService ls;

	@Inject
	ServletContext context;
	
	
	
	@RequestMapping("/")
	public String home(Model model) throws Exception {
		model.addAttribute("allList",ss.allList());
		return "home";
	}
	
	@GetMapping("list")
	public String list(Criteria cri,Model model,Principal principal,HttpServletRequest request) throws Exception {
		model.addAttribute("allList",ss.listCriteria(cri));
		model.addAttribute("pm",ss.getPagetMaker(cri));
		
		String url = request.getServletPath();
		model.addAttribute("url",url);
		
		if(principal != null) {
			String uid = principal.getName();
			int uno = ss.getUserUno(uid);
			System.out.println("list: "+uno);
			model.addAttribute("uno",uno);
		}
		return "sboard/list";
	}
	
	@GetMapping("newPost")
	public String newPost(Model model,Criteria cri,Principal principal,HttpServletRequest request) throws Exception{
		List<SboardVO> list = ss.newList(cri);
		model.addAttribute("allList",list);
		model.addAttribute("pm",ss.getPagetMaker(cri));
		
		String url = request.getServletPath();
		model.addAttribute("url",url);
		
		if(principal != null) {
			String uid = principal.getName();
			int uno = ss.getUserUno(uid);
			System.out.println("list: "+uno);
			model.addAttribute("uno",uno);
		}
		return "sboard/list";
	}
	
	@GetMapping("follow")
	public String follow(Model model,Criteria cri,Principal principal,HttpServletRequest request) throws Exception{
		
		String url = request.getServletPath();
		model.addAttribute("url",url);
		
		String uid = principal.getName();
		int uno = ss.getUserUno(uid);
		System.out.println("list: "+uno);
		model.addAttribute("uno",uno);
		
		Map<String,Object> map = new HashMap<>();
		map.put("uno", uno);
		
		List<SboardVO> list = ss.followSboardList(map);
		model.addAttribute("allList",list);
		model.addAttribute("pm",ss.getPagetMaker(cri));
		System.out.println("follow list : "+uno);
		return "sboard/list";
	}
	
	@GetMapping("details")
	public String readPage(Principal principal,int sno,Model model,RedirectAttributes rttr) throws Exception{
		model.addAttribute("vo",ss.details(sno));
		//model.addAttribute("allList",ss.allList());
		System.out.println("sno : "+sno);
		model.addAttribute("sno",sno);
		
		if(principal != null) {
			String uid = principal.getName();
			int uno = ss.getUserUno(uid);
			System.out.println("details : "+uno);
			model.addAttribute("uno",uno);
			List<LikeVO> likeList = ls.likeList(uno);
			model.addAttribute("likeList",likeList);
		}
		return "sboard/details";
	}
	
	@GetMapping("sprofile/{uno}")
	public String userlist(@PathVariable("uno") int uno,Model model) throws Exception{
		System.out.println("uno : "+uno);
		model.addAttribute("list",ss.userList(uno));
		model.addAttribute("userInfo",ss.userInfo(uno));
		
		// 게시글 총 개수
		model.addAttribute("profileTC",ss.profileTC(uno));
		// 팔로워 목록 & 총 개수
		model.addAttribute("followerList",fs.followerList(uno));
		model.addAttribute("followerTC",fs.followerTC(uno));
		// 팔로잉 목록 & 총 개수
		model.addAttribute("flist",fs.flist(uno));
		model.addAttribute("followingTC",fs.ftotalCount(uno));
		

		
		return "sboard/sprofile";
	}
	
	@GetMapping("sprofile/{uno}/details")
	public String profileDetails(@PathVariable("uno") int uno,Principal principal,int sno,Model model)throws Exception{
		System.out.println(sno);
		System.out.println(uno);
		//model.addAttribute("allList",ss.userList(uno));
		model.addAttribute("vo",ss.details(sno));
		model.addAttribute("sno",sno);
		
		if(principal != null) {
			String uid = principal.getName();
			int uuno = ss.getUserUno(uid);
			model.addAttribute("uno",uuno);
			System.out.println("fkjdsaflksdajflksdajflksdajfklsdajfldaskjfaklsdjflkdsajfdsjflskdajfkls");
		}
		return "sboard/details";
	}
	
	
	
	@GetMapping("sprofile/register")
	public String register() throws Exception{
		return "register";
	}
	

	@PostMapping("register")
	public String register(SboardVO vo,int uno,MultipartFile uploadImage,RedirectAttributes rttr) throws Exception{
		System.out.println(uploadImage.isEmpty());
		System.out.println(uploadImage.getOriginalFilename());
		System.out.println(uploadImage.getContentType());
		System.out.println(uploadImage.getName()); 
		if(!uploadImage.isEmpty()) {
			String path = uploadPath+File.separator+"img"+File.separator+vo.getUid();
			String realPath = context.getRealPath(path); 
			File file = new File(realPath,uploadImage.getOriginalFilename()); 
			if(!file.exists()) {
				file.mkdirs();
			} 
			uploadImage.transferTo(file);
			System.out.println(file.getPath());
			System.out.println(file.getCanonicalPath());
			System.out.println(file.getAbsolutePath()); 
		}
		vo.setS_img(uploadImage.getOriginalFilename());
		System.out.println(vo);
		System.out.println("POST register : "+uno); 
		ss.register(vo);
		rttr.addAttribute("uno",uno);
	  
	 return "redirect:sprofile/{uno}"; 
	}
}
