package net.koreate.pboard.provider;


import org.apache.ibatis.jdbc.SQL;
import net.koreate.pboard.util.Criteria;

public class PboardQueryProvider {
	
	
	public String searchSelectSql(Criteria cri){
		System.out.println("Provider searchSelectSql()  시작");
		System.out.println("keyword : " + cri.getKeyword());
		System.out.println("category : " + cri.getCategory());
		System.out.println("brand : " + cri.getBrand());
		System.out.println("price : " + cri.getPrice());
		SQL sql = new SQL();
		sql.SELECT("*");
		sql.FROM("product_tbl");
		getSearchWhere(cri,sql);
		sql.ORDER_BY("heart DESC");
		sql.LIMIT(cri.getPageStart() + ", " + cri.getPerPageNum());
		
		String query = sql.toString();
		
		if(cri.getKeyword() != null || cri.getCategory() != null ||
				cri.getBrand() != null || cri.getPrice() != 0) {	
			StringBuffer sb = new StringBuffer(query);
			int index1 = sb.indexOf("(");
			sb.deleteCharAt(index1);
			int index2 = sb.lastIndexOf(")");
			sb.deleteCharAt(index2);
			System.out.println(sb.toString());
			return sb.toString();
		}
		System.out.println(query);
		return query;
	}
	
	public String searchSelectCount(Criteria cri){
		return new SQL() {
			{
				SELECT("count(*)");
				FROM("product_tbl");
				getSearchWhere(cri, this);
			}
		}.toString();
	}

	public void getSearchWhere(Criteria cri, SQL sql){

		if(cri.getKeyword() != null) {
			sql.WHERE("(brand LIKE CONCAT('%','"+cri.getKeyword()+"','%') "
					+ "OR model_eng_name LIKE CONCAT('%','"+cri.getKeyword()+"','%') "
					+ "OR model_kor_name LIKE CONCAT('%','"+cri.getKeyword()+"','%'))");
		}
		if(cri.getCategory() != null) {
			sql.WHERE("(category LIKE CONCAT('%','"+cri.getCategory()+"','%'))");
		}
		if(cri.getBrand() != null) {
			String brand = cri.getBrand();
			String[] brands = brand.split(",");
			String wheres = "";
			for(int i=0;i<brands.length;i++) {		
				wheres += "brand LIKE CONCAT('%','"+brands[i]+"','%') OR ";	
			}
			wheres = wheres.substring(0, wheres.length() - 3);
			wheres = "("+wheres+")";
			sql.WHERE(wheres);
		}
		if(cri.getPrice() != 0) {	
			if(cri.getPno().length != 0) {	
				String wheres = "";
				int[] pno = cri.getPno();
				for(int i=0;i<pno.length;i++) {		
					wheres += "pno = "+pno[i]+" OR ";	
				}
				wheres = wheres.substring(0, wheres.length() - 3);
				wheres = "("+wheres+")";
				System.out.println("getPrice() where : " + wheres);
				sql.WHERE(wheres);
			}
		}
	}
	
	
	public String calPrice(int price) {
		SQL sql = new SQL();
		sql.SELECT("pno");
		sql.FROM("product_sell_tbl");
		sql.GROUP_BY("pno");
		if(price == 1) {
			sql.HAVING("MIN(sell_price) < 100000");
		}else if(price == 2) {
			sql.HAVING("MIN(sell_price) >= 100000 AND MIN(sell_price) < 300000");
		}else if(price == 3) {
			sql.HAVING("MIN(sell_price) >= 300000 AND MIN(sell_price) < 500000");
		}else if(price == 4) {
			sql.HAVING("MIN(sell_price) > 500000");
		}
		String query = sql.toString();
		System.out.println(query);
		return query;
	}
	
	
	
	
	

}











