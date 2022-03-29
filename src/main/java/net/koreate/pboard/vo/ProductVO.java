package net.koreate.pboard.vo;

import java.util.Date;

import lombok.Data;

@Data
public class ProductVO {
	
	private int pno;
	private String brand;
	private String category;
	private String model_eng_name;
	private String model_kor_name;
	private String model_no;
	private String model_color;
	private String model_size;
	private Date release_date;
	private int price;
	private int heart;

}
