package net.koreate.sec.security.user;


import javax.inject.Inject;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;

import net.koreate.user.dao.UserDAO;
import net.koreate.user.vo.UserVO;

public class CustomUserDetailService implements UserDetailsService {

	@Inject
	UserDAO dao;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		System.out.println(username);
		UserVO vo = null; 
		try {
			vo = dao.getMemberByID(username);
			System.out.println(vo.getAuthList());
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println(username);
		System.out.println(vo);
		return vo == null ? null : new CustomMember(vo);
	}

}
