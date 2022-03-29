package net.koreate.user.vo;

import java.util.Date;
import java.util.List;

import lombok.Data;
import net.koreate.user.vo.AuthVO;

@Data
public class UserVO {
	
	private int uno;
	private String uname;
	private String uid;
	private String unick;
	private String upass;
	private String birth;
	private String gender;
	private String phone;
	private String addr;
	private String addr_detail;
	private String post;
	private String user_img;
	private String buyno;
	private String sellno;
	private Date regdate;
	private String deleted;
	private int follower;
	private int follow;
	private int sell_pro;
	private int buy_pro;
	private Date visit_date;
	private int report;
	private int bandate;
	private int defaultint;
	private String zzim;
	
	private List<AuthVO> authList;  // 권한 정보
}
