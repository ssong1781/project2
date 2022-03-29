package net.koreate.watch.provider;

import org.apache.ibatis.jdbc.SQL;

import net.koreate.watch.utils.Criteria;

public class WatchQueryProvider {
	
	public String searchSelectSql(Criteria cri) {
		
		String queryString = "SELECT * FROM ";
		queryString += "watch_board";
		if(cri.getSearchType() != null && 
			!cri.getSearchType().equals("n")) {
			queryString += " WHERE ..";
		}
		
		/*
		SQL sql = new SQL();
		// SELECT ( * ) FROM 
		sql.SELECT("*");
		sql.FROM("re_tbl_board");
		if(cri.getSearchType().equals("t")) {
			sql.WHERE("title LIKE CONCAT('%',"+cri.getKeyword()+",'%')");
		}
		sql.ORDER_BY("origin desc , seq ASC");
		sql.LIMIT(cri.getPageStart()+","+cri.getPerPageNum());
		*/
		SQL sql = new SQL();
		sql.SELECT("*");
		sql.FROM("watch_board");
		/*
		sql.JOIN("tbl_user AS U");
		sql.WHERE("B.uno = U.uno");
		*/
		getSearchWhere(cri,sql);
		
		/* sql.ORDER_BY("B.origin DESC, B.seq ASC"); */
		sql.LIMIT(cri.getPageStart()+", "+cri.getPerPageNum());
		
		String query = sql.toString();
		System.out.println(query);
		return query;
	}
	
	public String searchSelectCount(Criteria cri) {
		return new SQL() {
			{
				SELECT("count(*)");
				FROM("watch_board");
				getSearchWhere(cri,this);
			}
		}.toString();
	}
	
	// WHERE 조건 절 추가
	public void getSearchWhere(Criteria cri, SQL sql) {
		if(cri.getSearchType() != null 
				&& 
		   !cri.getSearchType().equals("n")) {
		   String titleQuery
		   = "title LIKE CONCAT('%','"+cri.getKeyword()+"','%')";
		   String contentQuery
		   = "content LIKE CONCAT('%','"+cri.getKeyword()+"','%')";
		   String brandQuery
		   = "brand LIKE CONCAT('%','"+cri.getKeyword()+"','%')";
		   switch(cri.getSearchType()) {
			   case "t" :
				   sql.WHERE(titleQuery);
				   break;
			   case "c" :
				   sql.WHERE(contentQuery);
				   break;
			   case "b" :
				   sql.WHERE(brandQuery);
				   break;
			   case "tc" :
				   sql.WHERE(titleQuery).OR().WHERE(contentQuery);
				   break;
		   }
		}
	}
	
}









