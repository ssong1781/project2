package net.koreate.sec.security;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.access.AccessDeniedHandler;

// 아직 안함
// 접근 요청 거부(권한 불충분) 
public class CustomAccessDeniedHandler 
						implements AccessDeniedHandler {

	@Override
	public void handle(
			HttpServletRequest request, 
			HttpServletResponse response,
			AccessDeniedException accessDeniedException) throws IOException, ServletException {
		System.out.println(request.getRequestURI());
		System.out.println(accessDeniedException.getMessage());
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print("<script>");
		out.print("alert('전급권한이 없습니다. 관리자에게 문의 하세요.');");
		out.print("history.go(-1);");
		out.print("</script>");
	}

}




