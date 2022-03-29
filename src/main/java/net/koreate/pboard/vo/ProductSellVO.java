package net.koreate.pboard.vo;

import java.util.Date;

import lombok.Data;

@Data
public class ProductSellVO {

	private int psno;
	private int pno;
	private int uno;
	private int sell_price;
	private String size;
	private String sell_success;
	private Date regdate;
	private Date successdate;
	
}
