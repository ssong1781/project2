package net.koreate.watch.vo;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class WatchVO {
	
	private int bno;
	private String title;
	private String content;
	private String writer;
	private String player;
	private String brand;
	private Date regdate;
	private Date updatedate;
	private int viewcnt;
	private String showboard;


	
}
