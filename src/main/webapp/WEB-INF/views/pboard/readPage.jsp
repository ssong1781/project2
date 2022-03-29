<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<c:set var="path" value="${pageContext.request.contextPath}"/>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="//cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<link rel="stylesheet" href="//cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<style>

	#headers{
		width: 100%;
		height: 120px;
		border-bottom: 1px solid lightgray; 
		text-align: center;
		margin-bottom: 60px;
	}

	#productWrap{
		display: flex;
		justify-content:center;
	}

	.images{
		background-color:#EFF5FB;
	} 
	
	.bx-wrapper{
		max-height: 500px;
	}
	
	#contentWrap{
		width: 560px;
		height: 1050px;
		border-left: 1px solid lightgray;
		margin-left: 30px;
		padding-left: 30px;
	}
	
	#product_size_wrap{
		display: flex;
		justify-content: space-between;
		border-bottom: 1px solid lightgray;
		padding:12px 0;
	}
	
	#product_price_wrap{
		display: flex;
		justify-content: space-between;
		padding:12px 0;
	}
	
	#buy_sell_btn_wrap{
		margin-top:10px; 
		width: 100%;
	}
	
	.btns{
		width: 275px;
		height: 60px;
		border: none;
		border-radius: 10px;
		font-size: 20px;
		color: white;
		cursor: pointer;
	}

	#buyBtn{
		background-color: #FA5858;
		opacity: 0.9;
	}
	
	#sellBtn{
		background-color: #41b979;
		margin-left: 4px;
	}
	
	#heart_btn{
		width:100%;
		display: flex;
		justify-content:center;
		padding:20px 0;
		border: 1px solid lightgray;
		border-radius: 10px;
		margin-top: 12px;
		cursor: pointer;
	}
	
	#product_info_wrap{
		width: 100%;
		margin-top: 30px;
	}
	
	#product_detail_wrap{
		display: flex;
		width: 100%;
		padding: 20px 0;
		border: solid lightgray;
		border-width: 1px 0;
		margin-bottom: 20px;
	}
	
	.product_detail{
		width: 121.25px;
		height: 60px;
		word-wrap: break-word;
	}
	
	.product_detail p{
		padding: 0;
		margin: 0;
	}
	
	
	#product_num{
		padding-right: 12px;
	}
	
	#product_rd{
		padding: 0 12px;
		border-left: 1px solid lightgray;
	}
	
	#product_color{
		padding: 0 12px;
		border-left: 1px solid lightgray;
	}
	
	#product_origin_price{
		padding-left: 12px;
		border-left: 1px solid lightgray;
	}
	
	.product_detail_title{
		color:#A4A4A4;
		font-size: 12px;
	}
	
	.product_detail_content{
		font-size: 14px;
	}
	
	.modal_quote{
		position: absolute;
		width: 100%;
		height: 100%;
		background: rgba(34,34,34,.5);
		display: none;
	}
	
	#modal_quote_table_wrap{
		position:relative; 
		top:27%; 
		left:38%;
		width:480px; 
		height:500px;
		background-color: white;
		border-radius: 20px;
		z-index: 10000;
	}
	
	#modal_xBtn{
		position: absolute;
		top:5%; 
		left:92%;
		cursor: pointer;
	}
	
	#modal_flex_div{
		display: flex;
		align-items: center;
		justify-content: center;
		flex-direction: column;
	}
	
	#modal_product_name{
		padding-top: 5px;
	}
	
	#modal_product_name p{
		margin: 0;
	}
	
	#modal_product_content{
		display: flex;
		width: 420px;
		justify-content: flex-start;
		margin:0 20px 15px 0;
	}
	

	.modal_quote_table{
		width: 420px;
		max-height: 200px;
		font-size: 14px;
		
	}
	
	#modal_quote_table_div{
		display: flex;
		align-items: center;
		justify-content: center;
		height: 240px;
		overflow-y:scroll;
	}
	
	#modal_quote_table_head{
		display: flex;
		justify-content: space-between;
		width: 420px;
		border-bottom: 1px solid lightgray;
		padding-bottom: 10px;
		margin-right: 20px;
	}
	
	#modal_product_img{
		width: 80px;
		height: 80px;
		background-color:#EFF5FB;
		margin-right: 10px;
		border-radius: 10px;
	}
	
	#images{
		width: 80px;
		height: 80px;
	}
	
	#modal_quote_tablist{
		display: flex;
		justify-content: center;
		align-items: center;
		width: 420px;
		height: 34px;
		border-radius: 10px;
		background-color: #f4f4f4;
		margin: 0 20px 10px 0;
	}
	
	.modal_quote_tablist_ele{
		display: flex;
		justify-content: center;
		align-items: center;
		width: 206px;
		height: 26px;
		border-radius: 10px;
		cursor: pointer;
	}
	
	.modal_quote_tablist_ele span{
		font-size: 13px;
	}
	
	#modal_quote_tablist_ele_click{
		background-color: #fff;
	}
	
	#modal_quote_tablist_ele_click span{
		font-weight: bold;
	}
	
	#modal_eng_name{
		font-size: 15px;
	}
	
	#modal_kor_name{
		font-size: 12px;
		color: rgba(34,34,34,.5);
	}
	
	#modal_quote_table_head div{
		font-size: 13px;
		color: rgba(34,34,34,.8);
	}
	
	
	
	.modal{
		position: absolute;
		width: 100%;
		height: 100%;
		background: rgba(34,34,34,.5);
		top: 0;
		left: 0;
		display: none;
	}
	
	#modal_content{
		position:relative; 
		top:36%; 
		left:39%;
		width:400px; height:200px;
		background-color: white;
		border-radius: 20px;
		display: flex;
		align-items: center;
		justify-content: space-evenly;
		flex-direction: column;
		z-index: 10000;
	}
	
	#modal_content H2{
		margin: 10px 0 0 0;
	}
	
	#modal_btn_ok{
		width: 100px;
		height: 42px;
		border-radius: 10px;
		background-color: #1C1C1C;
		color:white;
		border: none;
	}
	
	#delivery_wrap{
		padding-bottom: 20px;
		border: solid lightgray;
		border-width: 0 0 1px 0;
	}
	
	#delivery_info_wrap{
		display: flex;
	}
	
	#delivery_info p{
		margin: 0;
	}
	
	#delivery_img{
		margin-right: 10px;
	}
	
	#quote_tablist{
		display: flex;
		justify-content: center;
		align-items: center;
		height: 42px;
		border-radius: 10px;
		background-color: #f4f4f4;
	}
	
	.quote_tablist_ele{
		display: flex;
		justify-content: center;
		align-items: center;
		width: 275px;
		height: 34px;
		border-radius: 10px;
		cursor: pointer;
	}
	
	.quote_tablist_ele span{
		font-size: 14px;
	}
	
	#quote_tablist_ele_click{
		background-color: #fff;
	}
	
	#quote_tablist_ele_click span{
		font-weight: bold;
	}
	
	#quote_table{
		width: 100%;
	}
	
	.td_1{
		padding: 10px 0;
		border-bottom: 1px solid lightgray;
	}
	
	td:nth-child(2),td:nth-child(3){
		text-align: right;
	}
	
	#brandA{
		text-decoration:none;
		color:black;
		font-weight: bold;
		font-size:18px;
		border-bottom: 2px solid #222;
	}
	
	#eng_name{
		font-size: 18px;
		margin: 14px 0 0 0;
	}
	
	#kor_name{
		font-size: 14px;
		color: rgba(34,34,34,.5);
		margin: 0 0 14px 0;
	}
	
	#quote_btn{
		display: flex;
		justify-content: center;
		align-items: center;
		margin-top: 14px;
		width: 100%;
		height: 36px;
		border: 1px solid lightgray;
		border-radius: 10px;
		cursor: pointer;
	}
	
	#quote_btn p{
		margin: 0;
		font-size: 14px;
		color: rgba(34,34,34,.8);
	}
	
	#modal_product_content{
		display: flex;
	}
	
	.size_price_span{
		font-size: 13px;
		color: rgba(34,34,34,.8);
	}
	
	#allsize_span{
		font-size: 16px;
		font-weight: bold;
	}
	
	#price_span{
		font-size: 20px;
		font-weight: 600;
	}
	
	#delivery_message_p{
		font-size: 14px;
		color: rgba(34,34,34,.8);
	}
	
	#delivery_span{
		font-size: 14px;
		font-weight: 600;
	}
	
	#delivery_p{
		font-size: 14px;
		color: rgba(34,34,34,.5);
	}
	
	.td_1{
		font-size: 13px;
		color: rgba(34,34,34,.5);
	}
	
	#quote_table tbody{
		font-size: 15px;
	}
	
	.bx-viewport{
		height: 500px;
	}
	
	
	#quote_title_wrap{
		margin: 10px 0;
	}
	
	
</style>
</head>
<body>
	
	<div id="readWrap">
		<br/><br/><br/><br/><br/>
		<div id="productWrap">
			<div id="imgWrap" class="slider">
				
			</div>
			<div id="contentWrap">
				<div id="main_title_wrap">
					<a id="brandA" href="${path}/pboard/listPage?brand=${product.brand}">${product.brand}</a>
					<p id="eng_name">${product.model_eng_name}</p>
					<p id="kor_name">${product.model_kor_name}</p>
				</div>
				<div id="product_size_price_wrap">
					<div id="product_size_wrap">
						<span class="size_price_span">사이즈</span>
						<span id="allsize_span">모든 사이즈</span>
					</div>
					<div id="product_price_wrap">
						<span class="size_price_span">최근 거래가</span>
						<span id="price_span">원</span>
					</div>
				</div>
				<div id="buy_sell_btn_wrap">
					<button class="btns" id="buyBtn">구매</button>
					<button class="btns" id="sellBtn">판매</button>
				</div>
				<sec:authorize access="isAuthenticated()">
					<div id="heart_btn">
						<span><img id="heart_img" width="13px" src="../resources/other/star1.png"/> 관심상품</span>
					</div>
				</sec:authorize>
				<sec:authorize access="isAnonymous()">
					<div id="heart_btn" onclick="zzimClick()">
						<span><img id="heart_img" width="13px" src="../resources/other/star1.png"/> 관심상품</span>
					</div>
				</sec:authorize>
				<div id="product_info_wrap">
					<h3>상품정보</h3>
					<div id="product_detail_wrap">
						<div class="product_detail" id="product_num">
							<p class="product_detail_title">모델번호</p>
							<p class="product_detail_content"><b>${product.model_no}</b></p>
						</div>
						<div class="product_detail" id="product_rd">
							<p class="product_detail_title">출시일</p>
							<p class="product_detail_content">
								<f:formatDate value="${product.release_date}" pattern="yy/MM/dd"/>
							</p>
						</div>
						<div class="product_detail" id="product_color">
							<p class="product_detail_title">컬러</p>
							<p class="product_detail_content">${product.model_color}</p>
						</div>
						<div class="product_detail" id="product_origin_price">
							<p class="product_detail_title">발매가</p>
							<p class="product_detail_content">
								<f:formatNumber value="${product.price}" pattern="#,###"/>원
							</p>
						</div>
					</div>
				</div>
				<div id="delivery_wrap">
					<div id="delivery_message">
						<p id="delivery_message_p">배송 정보</p>
					</div>
					<div id="delivery_info_wrap">
						<div id="delivery_img">
							<img width="40px" height="40px" src="../resources/other/a_8b54cbca40e945f4abf1ee24bdd031f7.png">
						</div>
						<div id="delivery_info">
							<p>
								<span id="delivery_span">배송비</span>
								<span>2,500원</span>
							</p>
							<p id="delivery_p">검수 후 배송 ・ 5-7일 내 도착 예정</p>
						</div>
					</div>
				</div>
				<div id="quote_wrap">
					<div id="quote_title_wrap">
						<h3>시세</h3>
					</div>
					<div id="quote_table_wrap">
						<div id="quote_tablist">
							<div class="quote_tablist_ele" id="quote_tablist_ele_click">
								<span>체결 거래</span>
							</div>
							<div class="quote_tablist_ele">
								<span>판매 입찰</span>
							</div>
						</div>
						<table id="quote_table">
							<thead>
								<tr>
									<td class="td_1" id="td_1_1">사이즈</td>
									<td class="td_1" id="td_1_2">거래가</td>
									<td class="td_1" id="td_1_3">거래일</td>
								</tr>	
							</thead>
							<tbody>
							
							</tbody>
						</table>
						<div id="quote_btn">
							<p>체결 내역 더보기</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
	<div class="modal_quote">
		<div id="modal_quote_table_wrap">
			<div id="modal_flex_div">
				<div id="modal_product_title">
					<h3>시세</h3>
					<span id="modal_xBtn">X</span>
				</div>
				<div id="modal_product_content">
					<div id="modal_product_img">
					
					</div>
					<div id="modal_product_name">
						<p id="modal_eng_name">${product.model_eng_name}</p>
						<p id="modal_kor_name">${product.model_kor_name}</p>
					</div>
				</div>
				<div id="modal_quote_tablist">
					<div class="modal_quote_tablist_ele" id="modal_quote_tablist_ele_click">
						<span>체결 거래</span>
					</div>
					<div class="modal_quote_tablist_ele">
						<span>판매 입찰</span>
					</div>
				</div>
				<div id="modal_quote_table_head">
					<div>사이즈</div>
					<div>거래가</div>
					<div>거래일</div>
				</div>
			</div>
			<div id="modal_quote_table_div">	
				<table class="modal_quote_table">
					<tbody>
								
					</tbody>
				</table>
			</div>
		</div>
	</div>
	
	<div class="modal">
		<div id="modal_content">
			<H2></H2>
			<div>
				<button class="modal_btn" id="modal_btn_ok">확인</button>
			</div>
		</div>
	</div>
	
	
	<form id="buysellForm" method="get">
		<input type="hidden" name="pno" value="${pno}"/>
	</form>

	
<script>
	var pno = "${pno}";
	var msg = '${msg}';
	var uno = "${uno}";
	
	
	$(document).ready(function(){
		
		$.ajax({
			url : "${path}/pboard/readImg",
			type : "POST",
			data : {
				pno : pno,
				'${_csrf.parameterName}' : '${_csrf.token}'
			},
			success : function(result){
				var str = "";
				var iw = $("#imgWrap");
				$(result).each(function(index){
					console.log(result[index]);
					var src = "../resources/product_img/";
					str = "<div class='image'>";
					str += "<img class='images' src='"+src+result[index]+"'/>";
					str += "</div>";
					iw.append(str);
				});		
				
				$('.slider').bxSlider({
					auto : true,
					speed : 800, //애니메이션 속도
			        pause : 1700, //애니메이션 유지시간(1000 = 1초)
			        autoHover : true,
					slideWidth: 500,
					onSliderLoad: function(){ 
						$("#imgWrap").parent().css("height","500");
						$("#imgWrap").find(".image").css("width","500");
					}
				});
			},
			error : function(res){
				alert(res.responseText);
			}
		});
		
		$.ajax({
			url : "${path}/pboard/mostRecentDeal",
			type : "POST",
			data : {
				pno : pno,
				'${_csrf.parameterName}' : '${_csrf.token}'
			},
			dataType : "text",
			success : function(result){
				console.log("price : " + result);
				var price = '';
				if(result == "0"){
					price = "- ";
				}else{
					price = result;
					price = price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
				}	
				var ppw = $("#product_price_wrap").children("span:eq(1)");
				ppw.prepend(price);
			},
		});
		
		$.ajax({
			url : "${path}/pboard/quoteList",
			type : "POST",
			data : {
				pno : pno,
				'${_csrf.parameterName}' : '${_csrf.token}'
			},
			dataType : "json",
			success : function(result){
				console.log(result);
				console.log(result.length);
				var str = "";
				$.each(result, function(index, item) { // 데이터 =item
					price = item.sell_price;
					price = price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
					str += "<tr>";
					str += "<td>"+item.size+"</td>";
					str += "<td>"+price+"원</td>";
					str += "<td>"+dateFormat(item.successdate)+"</td>";
					str += "<tr>";
					if(result.length > 4 && index == 4){
						$("#quote_table tbody").html(str);
					}
				});
				if(result.length <= 4){
					$("#quote_table tbody").html(str);
				}
				$(".modal_quote_table tbody").html(str);
			},
		});
		
		$.ajax({
			url : "${path}/pboard/readOneImg",
			type : "POST",
			data : {
				pno : pno,
				'${_csrf.parameterName}' : '${_csrf.token}'
			},
			dataType : "text",
			success : function(result){
				var mpi = $("#modal_product_img");
				var src = "../resources/product_img/";
				var str = "<img id='images' src='"+src+result+"'/>";
				mpi.append(str);
			},
			error : function(res){
				alert(res.responseText);
			}
		});
		if(uno != ""){
			$.ajax({
				url : "${path}/pboard/zzimFindOne",
				type : "POST",
				data : {
					uno : uno,
					pno : pno,
					'${_csrf.parameterName}' : '${_csrf.token}'
				},
				dataType : "json",
				success : function(result){
					console.log(result);
					var img = $("#heart_img");
					if(result){
						img.attr("src","../resources/other/star2.png");
					}
				},
				error : function(res){
					alert(res.responseText);
				}
			});
		}

		msgModal();
	});
	
	function dateFormat(date) {
		let dates = new Date(date);
        let month = dates.getMonth() + 1;
        let day = dates.getDate();

        month = month >= 10 ? month : '0' + month;
        day = day >= 10 ? day : '0' + day;
        
        let dateStr = dates.getFullYear() + '/' + month + '/' + day;
        
        dateStr = dateStr.slice(2);

        return dateStr;
	}
	
	function msgModal(){
		if (msg != '') {
			$("#modal_content H2").html(msg);
			$(".modal").css("display","block");
			$("body").css("overflow","hidden");
		}
	}
	
	$(document).click(function(e){
		if($(".modal").is(e.target) || $("#modal_btn_ok").is(e.target)){
			 $(".modal").css("display","none");
			 $("body").css("overflow","visible");
		}	
		if($(".modal_quote").is(e.target) || $("#modal_xBtn").is(e.target)){
			 $(".modal_quote").css("display","none");
			 $("body").css("overflow","visible");
		}	
	});

	$("#quote_btn").click(function(){
		var div = $('.modal_quote');
		div.css("position", "absolute");
		div.css("top", Math.max(0, (($(window).height() - div.outerHeight()) / 2) + $(window).scrollTop()) + -10 + "px");
		div.css("left", Math.max(0, (($(window).width() - div.outerWidth()) / 2) + $(window).scrollLeft()) + "px");
		$(".modal_quote").css("display","block");
		$("body").css("overflow","hidden");
		
	});
	
	
	$(".quote_tablist_ele").click(function(){
		if($(this).attr("id") != "quote_tablist_ele_click" && $(this).children("span").html() == "판매 입찰"){
			$(".quote_tablist_ele").removeAttr("id");
			$(this).attr("id","quote_tablist_ele_click");
			$(".modal_quote_tablist_ele").removeAttr("id");
			$(".modal_quote_tablist_ele:last").attr("id","modal_quote_tablist_ele_click");
			$.ajax({
				url : "${path}/pboard/quoteList_sell",
				type : "POST",
				data : {
					pno : pno,
					'${_csrf.parameterName}' : '${_csrf.token}'
				},
				dataType : "json",
				success : function(result){
					console.log(result);
					$("#td_1_2").html("판매가");
					$("#td_1_3").html("등록일");
					var str = "";
					$.each(result, function(index, item) { // 데이터 =item
						price = item.sell_price;
						price = price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
						str += "<tr>";
						str += "<td>"+item.size+"</td>";
						str += "<td>"+price+"원</td>";
						str += "<td>"+dateFormat(item.regdate)+"</td>";
						str += "<tr>";
						if(result.length > 4 && index == 4){
							$("#quote_table tbody").html(str);
						}
					});
					if(result.length <= 4){
						$("#quote_table tbody").html(str);
					}
					$(".modal_quote_table tbody").html(str);
				},
			});
		}
		if($(this).attr("id") != "quote_tablist_ele_click" && $(this).children("span").html() == "체결 거래"){
			$(".quote_tablist_ele").removeAttr("id");
			$(this).attr("id","quote_tablist_ele_click");
			$(".modal_quote_tablist_ele").removeAttr("id");
			$(".modal_quote_tablist_ele:first").attr("id","modal_quote_tablist_ele_click");
			$.ajax({
				url : "${path}/pboard/quoteList",
				type : "POST",
				data : {
					pno : pno,
					'${_csrf.parameterName}' : '${_csrf.token}'
				},
				dataType : "json",
				success : function(result){
					$("#td_1_2").html("거래가");
					$("#td_1_3").html("거래일");
					var str = "";
					$.each(result, function(index, item) { // 데이터 =item
						price = item.sell_price;
						price = price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
						str += "<tr>";
						str += "<td>"+item.size+"</td>";
						str += "<td>"+price+"원</td>";
						str += "<td>"+dateFormat(item.successdate)+"</td>";
						str += "<tr>";
						if(result.length > 4 && index == 4){
							$("#quote_table tbody").html(str);
						}
					});
					if(result.length <= 4){
						$("#quote_table tbody").html(str);
					}
					$(".modal_quote_table tbody").html(str);
				},
			});
		}
	});
	
	
	$(".modal_quote_tablist_ele").click(function(){
		if($(this).attr("id") != "modal_quote_tablist_ele_click" && $(this).children("span").html() == "판매 입찰"){
			$(".modal_quote_tablist_ele").removeAttr("id");
			$(this).attr("id","modal_quote_tablist_ele_click");
			$(".quote_tablist_ele:last").trigger("click");
		}
		if($(this).attr("id") != "modal_quote_tablist_ele_click" && $(this).children("span").html() == "체결 거래"){
			$(".modal_quote_tablist_ele").removeAttr("id");
			$(this).attr("id","modal_quote_tablist_ele_click");
			$(".quote_tablist_ele:first").trigger("click");
		}
	});
	
	$("#heart_btn").click(function(){
		
		var img = $("#heart_img");
		
		if(uno != ""){
			if(img.attr("src") == "../resources/other/star1.png"){
				img.attr("src","../resources/other/star2.png");
				
				$.ajax({
					url : "${path}/pboard/zzimSuccess",
					type : "POST",
					data : {
						pno : pno,
						uno : uno,
						'${_csrf.parameterName}' : '${_csrf.token}'
					},
					success : function(result){
						console.log("관심상품 등록  ok~!");
					},
					error : function(res){
						alert(res.responseText);
					}
				});
				
			}else if(img.attr("src") == "../resources/other/star2.png"){
				img.attr("src","../resources/other/star1.png");
				
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
				
			}
		}

	});
	
	
	
	$("#buyBtn").click(function(){
		$("#buysellForm").attr("action","${path}/pboard/buyPage");
		$("#buysellForm").submit();
	});
	
	$("#sellBtn").click(function(){
		 $("#buysellForm").attr("action","${path}/pboard/sellPage");
		 $("#buysellForm").submit();
	});
	
	function zzimClick(){
		alert("로그인 후 이용 가능합니다.");
		location.href="${path}/user/login";
	}
	
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>
















