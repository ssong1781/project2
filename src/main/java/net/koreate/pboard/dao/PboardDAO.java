package net.koreate.pboard.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectProvider;
import org.apache.ibatis.annotations.Update;

import net.koreate.pboard.provider.PboardQueryProvider;
import net.koreate.pboard.vo.ProductBuyVO;
import net.koreate.pboard.vo.ProductImgVO;
import net.koreate.pboard.vo.ProductSellVO;
import net.koreate.pboard.vo.ProductVO;
import net.koreate.user.vo.UserVO;
import net.koreate.pboard.util.Criteria;

public interface PboardDAO {
	
	//@Select("SELECT * FROM product_tbl")
	@SelectProvider(type = PboardQueryProvider.class, method = "searchSelectSql")
	List<ProductVO> listPage(Criteria cri) throws Exception;

	@Select("SELECT * FROM product_tbl WHERE pno = #{pno}")
	ProductVO readPage(int pno) throws Exception;
	
	@SelectProvider(type = PboardQueryProvider.class, method = "searchSelectCount")
	int listCount(Criteria cri) throws Exception;

	@Select("SELECT img_name FROM product_img_tbl WHERE pno = #{pno}")
	List<String> readImg(int pno) throws Exception;
	
	@Select("SELECT img_name FROM product_img_tbl WHERE pno = #{pno} LIMIT 1")
	String readOneImg(int pno) throws Exception;

	@Select("SELECT distinct brand FROM product_tbl")
	List<String> getBrand() throws Exception;

	@Insert("INSERT INTO product_sell_tbl(pno,uno,sell_price,size) "
			+ "VALUES(#{pno},#{uno},#{sell_price},#{size})")
	void sellFinish(ProductSellVO vo) throws Exception;
	
	@Select("SELECT psno FROM product_sell_tbl ORDER BY regdate DESC LIMIT 1")
	int selectPsno() throws Exception;

	@Select("SELECT * FROM product_sell_tbl WHERE pno = #{pno} AND size = #{size} AND sell_success = 'N' "
			+ "ORDER BY sell_price LIMIT 1")
	ProductSellVO minPrice(ProductSellVO vo) throws Exception;

	@Select("SELECT * FROM product_sell_tbl WHERE pno = #{pno} AND size = #{size}  AND sell_success = 'N' "
			+ "ORDER BY sell_price DESC LIMIT 1")
	ProductSellVO maxPrice(ProductSellVO vo) throws Exception;

	@Insert("INSERT INTO product_buy_tbl(psno,pno,uno) VALUES(#{psno},#{pno},#{uno})")
	void buyFinish(ProductBuyVO vo) throws Exception;

	@Select("SELECT * FROM product_sell_tbl WHERE pno = #{pno} AND sell_success = 'N' "
			+ "ORDER BY sell_price LIMIT 1")
	ProductSellVO minPriceNoSize(int pno) throws Exception;

	@Update("UPDATE product_sell_tbl SET sell_success = 'Y' WHERE psno = #{psno}")
	void soldout(int psno) throws Exception;

	@Select("SELECT psno FROM product_buy_tbl WHERE pno = #{pno} ORDER BY regdate DESC LIMIT 1")
	int mostRecentDeal(int pno) throws Exception;

	@Select("SELECT sell_price FROM product_sell_tbl WHERE psno = #{psno}")
	String dealPrice(int psno) throws Exception;

	@Update("UPDATE user_tbl SET sellno = concat(sellno,#{sellno}) WHERE uno = #{uno}")
	void updateSellno(UserVO uVO) throws Exception;

	@Update("UPDATE user_tbl SET buyno = concat(buyno,#{buyno}) WHERE uno = #{uno}")
	void updateBuyno(UserVO uVO) throws Exception;
	
	@SelectProvider(type = PboardQueryProvider.class, method = "calPrice")
	int[] calPrice(int price) throws Exception;

	@Select("SELECT * FROM product_buy_tbl WHERE pno = #{pno} ORDER BY regdate DESC")
	List<ProductBuyVO> psnoFind(int pno) throws Exception;

	@Select("SELECT * FROM product_sell_tbl WHERE psno = #{psno}")
	ProductSellVO quoteList(int psno) throws Exception;

	@Select("SELECT * FROM product_sell_tbl WHERE pno = #{pno} AND sell_success = 'N' ORDER BY regdate DESC")
	List<ProductSellVO> quoteList_sell(int pno) throws Exception;

	@Update("UPDATE user_tbl SET zzim = concat(zzim,#{zzim}) WHERE uno = #{uno}")
	void zzimUser(UserVO vo) throws Exception;

	@Update("UPDATE product_tbl SET heart = heart + 1 WHERE pno = #{pno}")
	void zzimProduct(int pno) throws Exception;

	@Select("SELECT zzim FROM user_tbl WHERE uno = #{uno}")
	String userZzimSelect(UserVO vo) throws Exception;

	@Update("UPDATE user_tbl SET zzim = #{zzim} WHERE uno = #{uno}")
	void zzimUserCancel(UserVO vo) throws Exception;

	@Update("UPDATE product_tbl SET heart = heart - 1 WHERE pno = #{pno}")
	void zzimProductCancel(int pno) throws Exception;

	@Select("SELECT count(*) FROM product_sell_tbl WHERE uno = #{uno} AND sell_success = 'Y'")
	int buyCnt(int uno);

	
	

	


}