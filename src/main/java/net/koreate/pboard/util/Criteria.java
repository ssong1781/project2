package net.koreate.pboard.util;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

// 전체 필드 정보를 넘겨 받는 생성자 추가
@AllArgsConstructor
@ToString
public class Criteria {
	
	@Getter
	private int page;			// 요청 페이지 번호
	@Getter
	private int perPageNum;  	// 한페이지에 출력할 게시물 수
	@Getter @Setter
	private String keyword;		//검색창에서 검색
	@Getter @Setter
	private String category;	//필터 카테고리 or 화면 위쪽 카테고리
	@Getter @Setter
	private String brand;		//필터 브랜드
	@Getter @Setter
	private int price;		//필터 가격
	@Getter @Setter
	private int[] pno;
	
	
	
	public Criteria() {
		this(1,20);
	}
	
	public Criteria(int page, int perPageNum) {
		this.page = page;
		this.perPageNum = perPageNum;
	}
	
	public void setPage(int page) {
		if(page <= 0) {
			this.page = 1;
			return;
		}
		this.page = page;
	}
	
	public void setPerPageNum(int perPageNum) {
		if(perPageNum <= 0 || perPageNum > 100) {
			this.perPageNum = 10;
			return;
		}
		this.perPageNum = perPageNum;
	}
	
	// limit pageStart , perPageNum;
	public int getPageStart() {
		return (this.page-1) * this.perPageNum;
	}

	
	
}








