package net.koreate.sboard.controller;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import net.koreate.sboard.service.LikeService;
import net.koreate.sboard.service.SboardService;
import net.koreate.sboard.vo.LikeVO;
import net.koreate.sboard.vo.SboardVO;

@RestController
@RequestMapping("like/*")
public class LikeController {
	
	@Inject
	LikeService ls;
	
	@Inject
	SboardService ss;
	
	@PostMapping("add")
	public ResponseEntity<String> likeAdd(@RequestBody LikeVO vo){
		System.out.println("like Con sno :"+vo.getSno());
		System.out.println("like Con uno : "+vo.getUno());
		ResponseEntity<String> entity = null;
		try {
			ss.likeup(vo.getSno());
			LikeVO lcheck = ls.likeCheck(vo);
			System.out.println(lcheck);
			if(lcheck == null) {
				
				String result = ls.likeAdd(vo);
				System.out.println("like Con result : "+result);
				entity = new ResponseEntity<>(result,HttpStatus.OK);
			}
		} catch (Exception e) {
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@PostMapping("remove")
	public ResponseEntity<String> likeRemove(@RequestBody LikeVO vo){
		ResponseEntity<String> entity = null;
		try {
			LikeVO lcheck = ls.likeCheck(vo);
			System.out.println(lcheck);
			if(lcheck != null) {
				ss.likedown(vo.getSno());
				String result = ls.likeRemove(vo);
				System.out.println("like Con result : "+result);
				entity = new ResponseEntity<>(result,HttpStatus.OK);
			}
		} catch (Exception e) {
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@PostMapping("find")
	public ResponseEntity<Map<String,Object>> likeFind(@RequestBody LikeVO vo){
		ResponseEntity<Map<String,Object>> entity = null;
		System.out.println("Find" +vo.getUno());
		try {
			Map<String,Object> map = ls.likeFind(vo.getUno()); 
			System.out.println("Find map list : "+map);
			entity = new ResponseEntity<>(map,HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return entity;
	}
	
	@PostMapping("count")
	public ResponseEntity<String> likeCount(@RequestBody SboardVO vo){
		ResponseEntity<String> entity = null;
		try {
			String result = ls.likeCount(vo.getSno());
			entity = new ResponseEntity<>(result,HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return entity;
	}
	
	@PostMapping("delete")
	public ResponseEntity<String> delete(@RequestBody SboardVO vo){
		ResponseEntity<String> entity = null;
		System.out.println(vo.getSno());
		System.out.println(vo.getUno());
		
		try {
			Map<String,Object> map = new HashMap<>();
			map.put("sno", vo.getSno());
			map.put("uno", vo.getUno());
			String result = ss.delete(map);
			entity = new ResponseEntity<>(result,HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
}
