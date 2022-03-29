package net.koreate.sboard.controller;

import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import net.koreate.sboard.service.FollowService;
import net.koreate.sboard.vo.FollowVO;
import net.koreate.sboard.vo.LikeVO;

@RestController
@RequestMapping("fo/*")
public class FollowController {
	
	@Inject
	FollowService fs;
	
	@PostMapping("follow")
	public ResponseEntity<String> follow(@RequestBody FollowVO vo){
		System.out.println("Controller follow uno :"+vo.getUno());
		System.out.println("Controller follow ufollower :"+vo.getUfollower());
		
		ResponseEntity<String> entity = null;
		try {
			FollowVO fcheck = fs.fcheck(vo);
			if(fcheck == null) {
				System.out.println("Controller follow fcheck :"+fcheck);
				System.out.println("Controller follow 2 uno :"+vo.getUno());
				System.out.println("Controller follow 2 ufollower :"+vo.getUfollower());
				String result = fs.follow(vo);
				entity = new ResponseEntity<>(result,HttpStatus.OK);
			}
			
		} catch (Exception e) {
			entity = new ResponseEntity<>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@PostMapping("unfollow")
	public ResponseEntity<String> unfollow(@RequestBody FollowVO vo){
		System.out.println("Controller unfollow uno :"+vo.getUno());
		System.out.println("Controller unfollow ufollower :"+vo.getUfollower());
		ResponseEntity<String> entity = null;
		try {
			String result = fs.unfollow(vo);
			System.out.println("unfollow controller : "+result);
			entity = new ResponseEntity<>(result,HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@PostMapping("check")
	public ResponseEntity<Map<String,Object>> followCheck(@RequestBody FollowVO vo){
		ResponseEntity<Map<String,Object>> entity = null;
		System.out.println("Find" +vo.getUno());
		try {
			Map<String,Object> map = fs.followCheck(vo.getUno());
			System.out.println("Check map list : "+map);
			entity = new ResponseEntity<>(map,HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return entity;
	}
	
	@PostMapping("checkProfile")
	public ResponseEntity<String> checkProfile(@RequestBody FollowVO vo){
		ResponseEntity<String> entity = null;
		try {
			String result = fs.checkProfile(vo);
			System.out.println("checkProfile : "+result);
			entity = new ResponseEntity<>(result,HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	
}
