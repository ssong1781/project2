package net.koreate.user.controller;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;
import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletContext;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import net.koreate.sec.security.user.CustomMember;
import net.koreate.user.dao.UserDAO;
import net.koreate.user.service.UserService;
import net.koreate.user.vo.UserVO;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Inject
	JavaMailSender mailSender;
	
	@Inject
	UserService us;
	
	@Inject
	ServletContext context;
	
	@Inject
	UserDAO dao;
	
	@Resource(name="uploadPath")
	String uploadPath;
	
	String uploadFolder;
	
	
	@PostConstruct
	public void initPath() {
		uploadFolder = context.getRealPath(File.separator+uploadPath);
		System.out.println("init : " + uploadFolder);
		File file = new File(uploadFolder);
		if(!file.exists()) {
			file.mkdirs();
			System.out.println("경로 생성 완료");
		}
		System.out.println("controller 초기화 완료");
	}
	
	
	@PostMapping("/profileinfo")
	public String profileinfo(String uid, Model model) throws Exception {
		UserVO vo = dao.getMemberByID(uid);
		model.addAttribute("member",vo);
		System.out.println("프로파일 인포 포스트!!!");
		return "/user/profileinfo";
	}
	
	@PostMapping("/myPage")
	public String myPage(String uid, Model model) throws Exception {
		System.out.println("마이페이지!!!");
		UserVO vo = dao.getMemberByID(uid);
		model.addAttribute("member",vo);
		return "user/myPage";
	}
	
	@GetMapping("/login")
	public String login(String message, Model model) {
		model.addAttribute("message", message);
		return "user/login";
	}
	
	@GetMapping("/logout")
	public void logout() {
		System.out.println("겟 로그아웃");
	}
	
	@RequestMapping("/pwfind")
	public String pwfind() {
		return "user/pwfind";
	}

	@RequestMapping("/signUp")
	public String signUp() {
		return "user/signUp";
	}
	
	
	// 회원가입
	@PostMapping("/signUpPost")
	public String signUpPost(
			UserVO vo,
			RedirectAttributes rttr,
			MultipartFile profileImage 
			) throws Exception{
		
		System.out.println(profileImage.isEmpty());
		System.out.println(profileImage.getOriginalFilename());
		System.out.println(profileImage.getContentType());
		System.out.println(profileImage.getName()); // 입력태그의 네임
		System.out.println(vo);
		
		if(!profileImage.isEmpty()) {
			// src/main/webapp/upload/profile/uid
			String path = "upload"+File.separator
					+"profile"+File.separator
					+vo.getUid();
			String realPath = context.getRealPath(path);
			File file = new File(
					realPath,
					profileImage.getOriginalFilename());
			if(!file.exists()) {
				System.out.println("사인업 파일 : " + file);
				file.mkdirs();
			}
			profileImage.transferTo(file);
			System.out.println(file.getPath());
			System.out.println(file.getCanonicalPath());
			System.out.println(file.getAbsolutePath());
		}
		vo.setUser_img(profileImage.getOriginalFilename());
		
		
		// 회원가입 처리
		us.signUp(vo);
		rttr.addFlashAttribute("message","회원가입 성공");
		return "redirect:/user/login";
	}
	
	// 비밀번호 찾기 
	@PostMapping("/pwfindPost")
	public String pwfindPost(
			UserVO vo,
			RedirectAttributes rttr
			) throws Exception{
		us.pwfind(vo);
		rttr.addFlashAttribute("message","비밀번호 변경 성공");
		return "redirect:/user/login";
	}
	
	// 비밀번호 변경
	@PostMapping("/pwChangePost")
	public String pwChangePost(
			String upass,
			String uid
			) throws Exception{
		us.pwChangePost(uid,upass);
		return "redirect:/user/login";
	}
	
	// 아이디 중복
	@PostMapping("/uidCheck")
	@ResponseBody
	public boolean uidCheck(
			String uid
			) throws Exception{
		boolean result = us.uidCheck(uid);
		return result;
	}
	
	// 닉네임 중복
	@PostMapping("/unickCheck")
	@ResponseBody
	public boolean unickCheck(
			String unick
			) throws Exception{
		boolean result = us.unickCheck(unick);
		return result;
	}
	
	@PostMapping("/findUidCheck")
	@ResponseBody
	public boolean findUidCheck(
			String uid
			) throws Exception{
		System.out.println(uid);
		boolean result = us.findUidCheck(uid);
		
		return result;
	}
	
	// 이메일 인증
	@GetMapping("/checkEmail")
	@ResponseBody
	public String sendMail(@RequestParam("uid") String email) throws Exception{
		System.out.println(email);
		String code = "";
		MimeMessage message = mailSender.createMimeMessage();
		System.out.println("message : " + message);
		MimeMessageHelper messageHelper
		= new MimeMessageHelper(message,"UTF-8");
		messageHelper.setFrom("aazzc123@gmail.com");
		messageHelper.setTo(email);
		messageHelper.setSubject("이메일 인증 코드 확인");
		
		for(int i=0; i<5; i++) {
			// 0 ~ 0.99999
			code += (int)(Math.random()*10);
		}
		System.out.println(code);
		
		String msg = "다음 인증 코드를 입력해주세요.<h3>"+code+"</h3>";
		messageHelper.setText(msg,true);
		mailSender.send(message);
		return code;
	}
	
	// 휴대폰 번호 중복
	@PostMapping("/phoneCheck")
	@ResponseBody
	public boolean phoneCheck(
			String phone
			) throws Exception{
		System.out.println("폰체크");
		boolean result = us.phoneCheck(phone);
		System.out.println(result);
		return result;
	}
	
	// 로그인 전 아이디 비밀번호 체크
	@PostMapping("/beforeSubmit")
	@ResponseBody
	public boolean beforeSubmit(
			String uid, String upass
			) throws Exception{
		boolean result = us.beforeSubmit(uid,upass);
		return result;
	}
	
	@GetMapping("logOff")
	public String logOff() {
		return "/user/logOff";
	}
	
	
	// 회원 탈퇴
	@PostMapping("/userDelete")
	@ResponseBody
	public void userDelete(
			String uid
			) throws Exception{
		us.userDelete(uid);
	}
	
	// 로그인시 탈퇴 회원인지 체크
	@PostMapping("/loginDeleteCheck")
	@ResponseBody
	public boolean loginDeleteCheck(
			String uid
			) throws Exception{
		boolean result = false;
		try {
			UserVO vo = us.loginDeleteCheck(uid);
			System.out.println(vo.getDeleted());
			if(vo.getDeleted().equals("Y")) {
				result = true;
			}else if(vo.getDeleted().equals("N")) {
				result = false;
			}
		} catch (Exception e) {}
		System.out.println(result);
		return result;
	}
	
	// 로그인시 벤 체크
	@PostMapping("/loginBanCheck")
	@ResponseBody
	public Map<String, Object> loginBanCheck(String uid) throws Exception{
		Map<String,Object> map = new HashMap<String, Object>();
		boolean result = false;
		int date = 0;
		UserVO vo = us.loginBanCheck(uid);
		if(vo != null) {
			date = vo.getBandate();
			if(0 < vo.getBandate()) {
				result = false;
			}else if(0 >= vo.getBandate()) {
				us.banCancel(uid);
				result = true;
			}
		}
		map.put("result", result);
		map.put("date", date);
		return map;
	}

	// 휴대폰 번호 변경
	@PostMapping("/phoneChangePost")
	public String phoneChangePost(
				String uid,
				String phone,
				Model model
			) throws Exception{
		System.out.println("컨트롤러 폰 체인지  : " + uid + "," + phone);
		us.phoneChangePost(uid,phone);
		System.out.println("컨트롤러 폰 체인지  : " + uid + "," + phone);
		UserVO vo = dao.getMemberByID(uid);
		model.addAttribute("member",vo);
		return "user/profileinfo";
	}

	// 프로필 페이지에서 이미지 변경
	@PostMapping("/imageChangePost")
	public String imageChangePost(
				String uid,
				MultipartFile profileImage,
				Model model,
				RedirectAttributes rttr,
				Authentication auth
			) throws Exception{
		System.out.println(profileImage.isEmpty());
		System.out.println(profileImage.getOriginalFilename());
		System.out.println(profileImage.getContentType());
		System.out.println(profileImage.getName()); // 입력태그의 네임
		UserVO vo = dao.getMemberByID(uid);
		System.out.println(vo);
		System.out.println(auth);
		
		if(!profileImage.isEmpty()) {
			// src/main/webapp/upload/profile/uid
			String path = "upload"+File.separator
					+"profile"+File.separator
					+vo.getUid();
			String realPath = context.getRealPath(path);
			File file = new File(
					realPath,
					profileImage.getOriginalFilename());
			if(!file.exists()) {
				System.out.println("사인업 파일 : " + file);
				file.mkdirs();
			}
			profileImage.transferTo(file);
			System.out.println(file.getPath());
			System.out.println(file.getCanonicalPath());
			System.out.println(file.getAbsolutePath());
		}
		System.out.println(profileImage.getOriginalFilename());
		vo.setUser_img(profileImage.getOriginalFilename());
		String user_img = profileImage.getOriginalFilename();
		System.out.println(vo.getUser_img());
		us.ImageChange(uid, user_img);
		model.addAttribute("member",vo);
		
		((CustomMember)auth.getPrincipal()).getMember().setUser_img(profileImage.getOriginalFilename());
		
		rttr.addAttribute("uid",uid);
		
		return "/user/profileinfo";
	}
		
	@GetMapping("/login2")
	public String login2() {
		return "user/loginfail";
	}
	
	@PostMapping("/pay")
	   public String pay(String uid, Model model) throws Exception {
	      UserVO vo = dao.getMemberByID(uid);
	      model.addAttribute("member",vo);
	      return "/user/pay";
	   }
	   
	   @PostMapping("/point")
	   public String point(String uid, Model model) throws Exception {
	      UserVO vo = dao.getMemberByID(uid);
	      model.addAttribute("member",vo);
	      return "/user/point";
	   }
	   
	   @PostMapping("/wishList")
	   public String wishList(String uid, Model model) throws Exception {
	      UserVO vo = dao.getMemberByID(uid);
	      model.addAttribute("member",vo);
	      return "/user/wishList";
	   }
	   
	   @PostMapping("/buyPage")
	   public String buyPage(String uid, Model model) throws Exception {
	      UserVO vo = dao.getMemberByID(uid);
	      model.addAttribute("member",vo);
	      return "/user/buyPage";
	   }
	   
	   
}









