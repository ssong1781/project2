<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<link href="${path}/resources/css/wishList.css" rel="stylesheet"/>    
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<style>
	.wish_item, .wish_product {
	    display: -webkit-box;
	    display: -ms-flexbox;
	    display: flex;
	}
	
	.wish_item {
	    padding: 20px 0 19px;
	    -webkit-box-align: center;
	    -ms-flex-align: center;
	    align-items: center;
	    border-bottom: 1px solid #ebebeb;
	}
	
	.wish_product {
	    margin-right: 30px;
	}
	
	.wish_product .product_box {
	    -webkit-box-flex: 0;
	    -ms-flex: none;
	    flex: none;
	    width: 80px;
	    height: 80px;
	}
	
	.product {
	    overflow: hidden;
	    position: relative;
	    padding-top: 100%;
	    border-radius: 8px;
	}
	
	.product_detail {
	    margin-left: 13px;
	    text-align: left;
	    display: -webkit-box;
	    display: -ms-flexbox;
	    display: flex;
	    -webkit-box-orient: vertical;
	    -webkit-box-direction: normal;
	    -ms-flex-direction: column;
	    flex-direction: column;
	}
	
	.product_detail .eng_name {
	    margin-top: 2px;
	    overflow: hidden;
	    -o-text-overflow: ellipsis;
	    text-overflow: ellipsis;
	    display: -webkit-box;
	    -webkit-line-clamp: 2;
	    -webkit-box-orient: vertical;
	    max-height: 36px;
	    font-size: 14px;
	    line-height: 18px;
	    letter-spacing: -.03px;
	}
	
	.product_detail .kor_name {
		font-size: 13px;
		color: rgba(34,34,34,.5);
	}
	
	.product_detail .size, .wish_buy {
	    display: -webkit-inline-box;
	    display: -ms-inline-flexbox;
	    display: inline-flex;
	}
	
	.wish_buy {
	    margin-left: auto;
	    -webkit-box-orient: vertical;
	    -webkit-box-direction: normal;
	    -ms-flex-direction: column;
	    flex-direction: column;
	    -ms-flex-negative: 0;
	    flex-shrink: 0;
	    text-align: right;
	}
	
	.product_img {
	    position: absolute;
	    top: 50%;
	    left: 50%;
	    -webkit-transform: translate(-50%,-50%);
	    -ms-transform: translate(-50%,-50%);
	    transform: translate(-50%,-50%);
	    width: 81.5%;
	    height: auto;
	}
	
	.product:after {
	    content: "";
	    position: absolute;
	    top: 0;
	    left: 0;
	    right: 0;
	    bottom: 0;
	    background: rgba(0,0,0,0);
	}
	
	.product_detail .name {
	    margin-top: 2px;
	    overflow: hidden;
	    -o-text-overflow: ellipsis;
	    text-overflow: ellipsis;
	    display: -webkit-box;
	    -webkit-line-clamp: 2;
	    -webkit-box-orient: vertical;
	    max-height: 36px;
	    font-size: 13px;
	    line-height: 18px;
	    letter-spacing: -.03px;
	}
	
	.product_detail .size {
		display: inline-block;
	    margin-top: auto;
	    font-size: 14px;
	    font-weight: 700;
	    line-height: 16px;
	}
	
	.my_interest .division_btn_box {
	    margin-top: 0;
	    width: 164px;
	    text-align: left;
	}
	
	.division_btn_box {
	    margin-top: 17px;
	    display: -webkit-box;
	    display: -ms-flexbox;
	    display: flex;
	    height: 60px;
	}
	
	.division_btn_box .btn_division.buy {
	    background-color: #ef6253;
	}
	
	.division_btn_box .btn_division {
	    position: relative;
	    display: -webkit-inline-box;
	    display: -ms-inline-flexbox;
	    display: inline-flex;
	    -webkit-box-flex: 1;
	    -ms-flex: 1;
	    flex: 1;
	    -webkit-box-align: center;
	    -ms-flex-align: center;
	    align-items: center;
	    border-radius: 10px;
	    color: #fff;
	}
	
	.division_btn_box .btn_division:before {
	    content: "";
	    position: absolute;
	    top: 0;
	    bottom: 0;
	    left: 55px;
	    width: 1px;
	    background-color: rgba(34,34,34,.1);
	}
	
	.division_btn_box .title {
	    width: 55px;
	    text-align: center;
	    font-size: 18px;
	    letter-spacing: -.27px;
	}
	
	.division_btn_box .price {
	    margin-left: 10px;
	    line-height: 15px;
	}
	
	.division_btn_box .amount {
	    display: block;
	    font-size: 0;
	}
	
	.division_btn_box .num, .division_btn_box .won {
	    display: inline-block;
	    font-weight: 700;
	}
	
	.division_btn_box .num {
		font-size: 15px;
	}
	
	.division_btn_box .desc {
	    display: block;
	    font-size: 11px;
	    font-weight: 600;
	    color: hsla(0,0%,100%,.8);
	}
	
	.wish_buy .status_link {
	    margin-top: 6px;
	    padding: 0 3px;
	    display: -webkit-inline-box;
	    display: -ms-inline-flexbox;
	    display: inline-flex;
	    font-size: 12px;
	    letter-spacing: -.06px;
	    color: rgba(34,34,34,.8);
	    text-decoration: underline;
	    cursor: pointer;
	}
	
	em {
	    font-style: normal;
	}
	
	.division_btn_box .won {
	    font-size: 14px;
	    letter-spacing: -.21px;
	}
	
	.brand-text {
	    overflow: hidden;
	    display: inline-block;
	    vertical-align: top;
	    height: 17px;
	    line-height: 17px;
	    padding-bottom: 2px;
	    font-size: 14px;
	    font-weight: 700;
	    color: #333;
	    white-space: nowrap;
	    -o-text-overflow: ellipsis;
	    text-overflow: ellipsis;
	    border-bottom: 1px solid #222;
	}
	
	#plus_wrap{
		display: flex;
		justify-content: center;
	}
	
	#plusBtn{
		display: flex;
		height: 40px;
		width: 1080px;
		border: 1px solid lightgray;
		justify-content: center;
		align-items: center;
		border-radius: 10px;
		cursor: pointer;
	}
	
	#plusBtn p{
		color: rgba(34,34,34,.8);
	}
	
</style>
<div class="container">
	<div>
		<div class="snb_area">
			<a href="javascript:myPageView('${member.uid}')">
				<h2 class="sub_main_title">마이 페이지</h2>
			</a>
			<nav class="snb">
				<div class="snb_list">
					<strong class="snb_title">쇼핑 정보</strong>
					<ul class="snb_menu">
						<li class="menu_item"><a class="menu_link" href="javascript:buyPageView('${member.uid}')">구매 내역</a></li> 
						<li class="menu_item"><a class="menu_link" href="javascript:wishListView('${member.uid}')">관심 상품</a></li>
					</ul>
				</div>
				<div class="snb_list">
					<strong class="snb_title">내 정보</strong>
					<ul class="snb_menu">
						<li class="menu_item"><a class="menu_link" href="javascript:profileinfoView('${member.uid}')">프로필 정보</a></li> 
						<li class="menu_item"><a class="menu_link" href="javascript:payView('${member.uid}')">결제 정보</a></li> 
						<li class="menu_item"><a class="menu_link" href="javascript:pointView('${member.uid}')">포인트</a></li>	
					</ul>
				</div>
			</nav>
		</div>
		<div class="content_area">
			<div class="my_interest">
				<div class="content_title border">
					<div class="title">
						<h3>관심 상품</h3>
					</div>
				</div>
				
				<ul class="wish_List">

				</ul>
				<div id="plus_wrap">
					<div id="plusBtn">
						<p>더보기</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
	
	var uno = '${member.uno}';
	
	var count = 2;
	var page = 12;

	/* var pno = '${vo.pno}'
	var wishPage = 1;
	
	getwishPage(wishPage);
	
	function getwishPage(page){
		wishPage = page;
		$.getJSON('{path}/wishPage/'+pno+'/'+page, function(data){
			console.log(data);
			var str = "";
			$(data.list).each(function(){
				str +="<li>";
				str +=	"<div class='wish_item'>";
				str +=		"<div class='wish_product'>";
				str += 			"<div class='product_box'>";
				str +=				"<div class='product' style='background-color: rgb(246, 238, 237);'>";
				str +=					"<img src='${path}/resources/img/test.png' class='product_img'>";
				str +=				"</div>";
				str +=			"</div>";
				str +=			"<div class='product_detail'>";
				str +=				"<div class='brand'>";
				str +=					"<a class='brand-text'>Jorden</a>";
				str +=				"</div>";
				str +=				"<div class='name'>Jordan 1 Low Golf Wolf Grey</div>";
				str +=				"<span class='size'>260</span>";
				str +=			"</div>";
				str +=		"</div>";
				str +=		"<div class='wish_buy'>";
				str +=			"<div>";
				str +=				"<div class='division_btn_box lg'>";
				str +=					"<a href='#' class='btn_division buy'>";
				str +=						"<strong class='title'>구매</strong>";
				str +=						"<div class='price'>";
				str	+=							"<span class='amount'>";
				str +=								"<em class='num'>378,000</em>";
				str +=								"<span class='won'>원</span>";
				str +=							"</span>";
				str	+=							"<span class='desc'>즉시 구매가</span>";
				str +=						"</div>";
				str	+=					"</a>";
				str +=				"</div>";
				str	+=				"<a href='#' data-pno='"+this.pno+"' class='status_link'>삭제</a>";
				str +=			<"/div>";
				str +=		"</div>";
				str +=	"</div>";
				str +="</li>";
			});
			$("#wishPage").html(str);
			
			var pageBlock = "<div class='pagemaker'>";
			for(var i=data.pm.startPage; i<=data.pm.endPage; i++){
				pageBlock +="<li>";
				pageBlock +="<span class='paging' onclick='getListPage("+i+");'>"+i+"</span>";
				pageBlock +="</li>";
			}
			pageBlock += "</div>";
			
			$("#wishPage").append(pageBlock);
			
		});
		
	} */
	
	
	/* // 관심목록 삭제
	$("#wishPage").on("click",".status_link",function (){
		var isConfirm = confirm("관심목록에서 삭제하시겠습니까?");
		if(isConfirm){
			var pno = $(this).attr("data-pno");
			console.log(pno);
			$.ajax({
				type : "delete",
				url : '${path}/wishPage/remove/'+pno,
				dataType : "text",
				success : function(result){
					alert(result);
					getwishPage(wishPage);
				},
				error : function(res){
					alert(res.responseText);
				}
			});
		}
	}); */
	
	listPage(count,page);

	function listPage(count, page){
		//유저 관심상품 목록
		$.ajax({
			type : "POST",
			url : '${path}/pboard/zzimFind',
			data : {
				uno : uno,
				'${_csrf.parameterName}' : '${_csrf.token}'
			},
			dataType : "json",
			success : function(result){
				console.log(result);
				var str = "";
				var wish_List = $(".wish_List");
				if(result != null || result != ''){
					if(result.length < page){
						page = result.length;
					}
					for(var i=count;i<page; i=i+2) {
						console.log(result[i]);
						str +="<li>";
						str +=	"<div class='wish_item' data-pno="+result[i]+">";
						str +=		"<div class='wish_product'>";
						str += 			"<div class='product_box'>";
						str +=				"<div class='product' style='background-color: rgb(246, 238, 237);'>";
						str +=					"<img src='' class='product_img'>";
						str +=				"</div>";
						str +=			"</div>";
						str +=			"<div class='product_detail'>";
						str +=				"<div class='brand'>";
						str +=					"<a class='brand-text'></a>";
						str +=				"</div>";
						str +=				"<div class='eng_name'></div>";
						str +=				"<div class='kor_name'></div>";
						str +=			"</div>";
						str +=		"</div>";
						str +=		"<div class='wish_buy'>";
						str +=			"<div>";
						str +=				"<div class='division_btn_box lg'>";
						str +=					"<a href='#' class='btn_division buy'>";
						str +=						"<strong class='title'>구매</strong>";
						str +=						"<div class='price'>";
						str	+=							"<span class='amount'>";
						str +=								"<em class='num'></em>";
						str +=								"<span class='won'>원</span>";
						str +=							"</span>";
						str	+=							"<span class='desc'>즉시 구매가</span>";
						str +=						"</div>";
						str	+=					"</a>";
						str +=				"</div>";
						str	+=				"<a data-pno='"+result[i]+"' class='status_link'>삭제</a>";
						str +=			"</div>";
						str +=		"</div>";
						str +=	"</div>";
						str +="</li>";
						wish_List.append(str);
						str = "";
						wishList(result[i]);
					}
				}	
			},
			error : function(res){
				console.log("에러임");
			}
		});
	}
	
	function wishList(num){
		$.ajax({
			url : "${path}/pboard/readOneImg",
			type : "POST",
			data : {
				pno : num,
				'${_csrf.parameterName}' : '${_csrf.token}'
			},
			dataType : "text",
			success : function(result){
				console.log(result);
				var src = "../resources/product_img/";
				var wish_item = $(".wish_item[data-pno="+num+"]");
				console.log(wish_item.attr("data-pno"));
				wish_item.children(".wish_product").children(".product_box").children().children().attr("src",src+result);
			},
			error : function(res){
				alert(res.responseText);
			}
		});
		
		$.ajax({
			url : "${path}/pboard/wishContent",
			type : "POST",
			data : {
				pno : num,
				'${_csrf.parameterName}' : '${_csrf.token}'
			},
			dataType : "json",
			success : function(result){
				console.log(result);
				var wish_item = $(".wish_item[data-pno="+num+"]");
				wish_item.children(".wish_product").children(".product_detail").children(".brand").children().attr("href","${path}/pboard/listPage?keyword="+result.brand);
				wish_item.children(".wish_product").children(".product_detail").children(".brand").children().html(result.brand);
				wish_item.children(".wish_product").children(".product_detail").children(".eng_name").html(result.model_eng_name);
				wish_item.children(".wish_product").children(".product_detail").children(".kor_name").html(result.model_kor_name);
			},
			error : function(res){
				alert(res.responseText);
			}
		});
		
		$.ajax({
			url : "${path}/pboard/minPriceNoSize",
			type : "POST",
			data : {
				pno : num,
				'${_csrf.parameterName}' : '${_csrf.token}'
			},
			dataType : "json",
			success : function(result){
				var wish_item = $(".wish_item[data-pno="+num+"]");
				var price = result.sell_price;
				price = price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
				console.log("price : " + price);
				wish_item.children(".wish_buy").children("div").children("div").children("a").children(".price").children(".amount").children(".num").html(price);
				wish_item.children(".wish_buy").children("div").children("div").children("a").attr("href","${path}/pboard/readPage?pno="+num);
			},
			error : function(res){
				var wish_item = $(".wish_item[data-pno="+num+"]");
				wish_item.children(".wish_buy").children("div").children("div").children("a").children(".price").children(".amount").children(".num").html("품절");
				wish_item.children(".wish_buy").children("div").children("div").children("a").children(".price").children(".amount").children(".won").html("");
				wish_item.children(".wish_buy").children("div").children("div").children("a").attr("href","${path}/pboard/readPage?pno="+num);
			}
		});
		
	}
	
	$(".wish_List").on("click",".status_link",function(){
		var pno = $(this).attr("data-pno");
		
		$(".wish_item[data-pno="+pno+"]").remove();
		
		
		console.log(pno);
		
		$.ajax({
			url : "${path}/pboard/zzimCancel",
			type : "POST",
			data : {
				pno : pno,
				uno : uno,
				'${_csrf.parameterName}' : '${_csrf.token}'
			},
			success : function(result){
				console.log("관심상품 취소  ok~!");
			},
			error : function(res){
				alert(res.responseText);
			}
		});
	});
	
	$("#plusBtn").click(function(){
		count = count + 10;
		page = page + 10;
		listPage(count,page);
	});
		
		
	
	
	
	// 포스트 방식으로 a 태그 데이터 넘겨주기
	function profileinfoView(uid){
	    let f = document.createElement('form');
	    
	    let obj;
	    obj = document.createElement('input');
	    obj.setAttribute('type', 'hidden');
	    obj.setAttribute('name', 'uid');
	    obj.setAttribute('value', uid);
	    let obj1;
	    obj1 = document.createElement('input');
	    obj1.setAttribute('name', '${_csrf.parameterName}');
	    obj1.setAttribute('value', '${_csrf.token}');
	    
	    f.appendChild(obj);
	    f.appendChild(obj1);
	    f.setAttribute('method', 'Post');
	    f.setAttribute('action', 'profileinfo');
	    document.body.appendChild(f);
	    f.submit();
	}
	
	function payView(uid){
	    let f = document.createElement('form');
	    
	    let obj;
	    obj = document.createElement('input');
	    obj.setAttribute('type', 'hidden');
	    obj.setAttribute('name', 'uid');
	    obj.setAttribute('value', uid);
	    let obj1;
	    obj1 = document.createElement('input');
	    obj1.setAttribute('name', '${_csrf.parameterName}');
	    obj1.setAttribute('value', '${_csrf.token}');
	    
	    f.appendChild(obj);
	    f.appendChild(obj1);
	    f.setAttribute('method', 'Post');
	    f.setAttribute('action', 'pay');
	    document.body.appendChild(f);
	    f.submit();
	}
	
	function pointView(uid){
	    let f = document.createElement('form');
	    
	    let obj;
	    obj = document.createElement('input');
	    obj.setAttribute('type', 'hidden');
	    obj.setAttribute('name', 'uid');
	    obj.setAttribute('value', uid);
	    let obj1;
	    obj1 = document.createElement('input');
	    obj1.setAttribute('name', '${_csrf.parameterName}');
	    obj1.setAttribute('value', '${_csrf.token}');
	    
	    f.appendChild(obj);
	    f.appendChild(obj1);
	    f.setAttribute('method', 'Post');
	    f.setAttribute('action', 'point');
	    document.body.appendChild(f);
	    f.submit();
	}
	
	function wishListView(uid){
	    let f = document.createElement('form');
	    
	    let obj;
	    obj = document.createElement('input');
	    obj.setAttribute('type', 'hidden');
	    obj.setAttribute('name', 'uid');
	    obj.setAttribute('value', uid);
	    let obj1;
	    obj1 = document.createElement('input');
	    obj1.setAttribute('name', '${_csrf.parameterName}');
	    obj1.setAttribute('value', '${_csrf.token}');
	    
	    f.appendChild(obj);
	    f.appendChild(obj1);
	    f.setAttribute('method', 'Post');
	    f.setAttribute('action', 'wishList');
	    document.body.appendChild(f);
	    f.submit();
	}
	
	function buyPageView(uid){
	    let f = document.createElement('form');
	    
	    let obj;
	    obj = document.createElement('input');
	    obj.setAttribute('type', 'hidden');
	    obj.setAttribute('name', 'uid');
	    obj.setAttribute('value', uid);
	    let obj1;
	    obj1 = document.createElement('input');
	    obj1.setAttribute('name', '${_csrf.parameterName}');
	    obj1.setAttribute('value', '${_csrf.token}');
	    
	    f.appendChild(obj);
	    f.appendChild(obj1);
	    f.setAttribute('method', 'Post');
	    f.setAttribute('action', 'buyPage');
	    document.body.appendChild(f);
	    f.submit();
	}
	
	function myPageView(uid){
	    let f = document.createElement('form');
	    
	    let obj;
	    obj = document.createElement('input');
	    obj.setAttribute('type', 'hidden');
	    obj.setAttribute('name', 'uid');
	    obj.setAttribute('value', uid);
	    let obj1;
	    obj1 = document.createElement('input');
	    obj1.setAttribute('name', '${_csrf.parameterName}');
	    obj1.setAttribute('value', '${_csrf.token}');
	    
	    f.appendChild(obj);
	    f.appendChild(obj1);
	    f.setAttribute('method', 'Post');
	    f.setAttribute('action', 'myPage');
	    document.body.appendChild(f);
	    f.submit();
	}
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>