package net.koreate.sec.security;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

public class CustomLoginFailHandler 
				implements AuthenticationFailureHandler {
	@Override
	public void onAuthenticationFailure(
			HttpServletRequest request, 
			HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		
		response.setContentType("text/html;charset=utf-8"); PrintWriter out =
		response.getWriter();
		out.print("<script>");
		out.print("alert('존재하지 않는 아이디 이거나 비밀번호가 올바르지 않습니다.');");
		out.print("history.go(-1);"); 
		out.print("</script>");
		
	}

}








