package net.koreate.sec.security.user;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import net.koreate.user.service.UserService;
import net.koreate.user.vo.UserVO;


public class LoginSuccessHandler implements AuthenticationSuccessHandler {

	
	@Inject 
	UserService us;
	 
	
	@Override
	public void onAuthenticationSuccess(
			HttpServletRequest request, 
			HttpServletResponse response,                                         
			Authentication auth) throws IOException, ServletException {
		CustomMember member = (CustomMember) auth.getPrincipal();
		System.out.println(member);
		 
		UserVO vo = member.getMember();
		System.out.println(vo);
		
		
		try {
			us.updateVisteDate(vo.getUid()); 
		} catch (Exception e) {}
		 
		String context = request.getServletContext().getContextPath();
		response.sendRedirect(context);
	}

}
