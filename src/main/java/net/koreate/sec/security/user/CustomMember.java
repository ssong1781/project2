package net.koreate.sec.security.user;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import lombok.Getter;
import net.koreate.user.vo.AuthVO;
import net.koreate.user.vo.UserVO;

public class CustomMember extends User {

	private static final long serialVersionUID = 1L;
	
	@Getter
	private UserVO member;
	
	public CustomMember(String username, String password, Collection<? extends GrantedAuthority> authorities) {
		super(username, password, authorities);
	}
	
	// 데이터 베이스의 아이디 비밀번호와 입벽받은 값을 비교하기위함
	public CustomMember(UserVO vo) {
		super(vo.getUid(),vo.getUpass(),authorities(vo.getAuthList()));
		this.member = vo;
	}
	
	public static Collection<? extends GrantedAuthority> authorities(List<AuthVO> authList){
		
		System.out.println(authList);
		List<GrantedAuthority> gList = new ArrayList<>();
		for(AuthVO vo : authList) {
			gList.add(new SimpleGrantedAuthority(vo.getUauth()));
		}
		return gList;
	}
}
