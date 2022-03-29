package net.koreate.user.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import net.koreate.user.service.UserService;
import net.koreate.user.vo.AuthVO;
import net.koreate.user.vo.UserVO;

@Controller
@RequestMapping("/mngt/*")
public class ManagementMemberController {
	@Inject
	UserService us;
	
	@GetMapping("main")
	public void main(Model model) throws Exception {
		List<UserVO> memberList
			= us.getMemberList();
		boolean banList = us.getBanList();
		model.addAttribute("memberList",memberList);
		model.addAttribute("banList",banList);
	}
	
	// 유저 차단하기
	@PostMapping("user/giveBan")
	@ResponseBody
	public boolean giveBan(
			String uid
			)throws Exception{
		us.giveBan(uid);
		return true;
	}
	
}








