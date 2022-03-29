<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>  
<jsp:include page="/WEB-INF/views/common/header.jsp"/>     
<c:set var="path" value="${pageContext.request.contextPath}"/>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

	#headers{
		width: 100%;
		height: 120px;
		border-bottom: 1px solid lightgray; 
		text-align: center;
	}
	
	#content_wrap{
		width: 100%;
		height:	900px;
		background-color: #FAFAFA;
		padding-top: 40px;
	}
	
	#main_out_wrap{
		width: 700px;
		height: 700px;
		margin: 0 auto;
		border: 1px solid lightgray;
		background-color:white;
	}
	
	#main_in_wrap{
		width: 638px;
		height: 598px;
		margin: 30px;
	}
	
	#product_info_wrap{
		width: 100%;
		height: 120px;
		display: flex;
		padding-bottom: 20px;
		
	}
	
	#product_img{
		width: 120px;
		height: 100%;
		background-color: #EFF5FB;
		border-radius: 10px;
	}
	
	#images{
		width: 100%;
		height: 100%;
	}
	
	#product_content{
		padding: 6px 10px;
	}
	
	#product_content p{
		margin: 4px 0;
		font-size: 14px;
	}
	
	#product_content_size{
		padding-top: 20px;
	}
	
	#buy_price_detail{
		width: 100%;
		height: 100px;
		display: flex;
		align-items: center;
		justify-content: center;
		border: solid lightgray;
		border-width: 1px 0;
	}
	
	.lowAndhigh{
		display: flex;
		align-items: center;
		justify-content: center;
		flex-direction: column;
		width: 318px;	
	}
	
	.lowAndhigh p{
		margin: 3px 0;
	}
	
	#low{
		border-right: 1px solid lightgray;
	}
	
	#deco_wrap_1{
		display: flex;
		align-items: center;
		justify-content: center;
		border-radius: 30px;
		height:66px;
		background:#F2F2F2;
		margin-top: 6px;
	}
	
	#deco_wrap_2{	
		display: flex;
		align-items: center;
		justify-content: center;
		width: 98.2%;
		border-radius: 30px;
		height:54px;
		background-color: #ef6253;
	}
	
	#deco_wrap_2 span{	
		color:white;
	}
	
	#price_input_wrap{
		display: flex;
		justify-content: space-between;
		width: 100%;
		height: 60px;
		margin-top: 20px;
		border-bottom: 1px solid lightgray;
	}
	
	#price_input{
		width: 240px;
		height: 38px;
		text-align: right;
		font-size: 20px;
		border: none;
		margin-top: 20px;
		outline: none;
	}

	#won{
		font-size: 20px;
		font-weight: bold;
	}
	
	#price_bind_wrap{
		padding: 10px 0;
		border-bottom: 1px solid lightgray;
	}
	
	.price_bind{
		display: flex;
		justify-content:space-between;
	}
	
	.price_bind p{
		margin: 6px 0;
	}
	
	#final_price{
		display: flex;
		justify-content:space-between;
	}
	
	#final_price p{
		margin: 16px 0;
	}
	
	#buy_btn_wrap{
		width: 100%;
		height: 60px;
	}
	
	#buy_btn{
		width: 100%;
		height: 100%;
		border-radius: 10px;
		background-color: #222;
		opacity: 0.9;
		color: white;
		font-size: 15px;
		font-weight: bold;
		border: none;
		margin-top: 20px;
		cursor: pointer;
	}
	
	
	.modal{
		position: absolute;
		width: 100%;
		height: 100%;
		background: rgba(0,0,0,0.5);
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
		justify-content: center;
		flex-direction: column;
	}
	
	#modal_content H2{
		margin:0;
		margin-bottom:10px;
	}
	
	.modal_btn{
		width: 100px;
		height: 42px;
		border-radius: 10px;
	}
	
	#modal_btn_ok{
		background-color: #1C1C1C;
		color:white;
		border: none;
		cursor: pointer;
	}
	
	#modal_btn_no{
		background-color: #FAFAFA;
		border:1px solid lightgray;
		cursor: pointer;
	}
	
	#kor_name{
		font-size: 13px;
		color: rgba(34,34,34,.5);
	}
	
	.lowAndhigh_p_1{
		font-size: 13px;
		color: rgba(34,34,34,.5);
	}
	
	.lowAndhigh_p_2{
		font-size: 18px;
		
	}
	
	#now_price_span{
		font-size: 14px;
		font-weight: bold;
	}
	
	.price_bind{
		font-size: 14px;
	}
	
	.price_bind_p{
		color: rgba(34,34,34,.5);
	}
	
	#modal_content_p{
		color: rgba(34,34,34,.8);
		margin: 6px 0 20px 0;
	}
	
	#f_price_p_1{
		font-weight: bold;
	}
	
	#f_price_p_2{
		font-size: 20px;
		font-weight: 600;
		color: #f15746;
	}
	
</style>
</head>
<body>
	
	<div id="buy_wrap">
		<div id="content_wrap">
			<div id="main_out_wrap">
				<div id="main_in_wrap">
					<div id="product_info_wrap">
						<div id="product_img">
						
						</div>
						<div id="product_content">
							<p><b>${product.model_no}</b></p>
							<p>${product.model_eng_name}</p>
							<p id="kor_name">${product.model_kor_name}</p>
							<p id="product_content_size">사이즈 - ${size}</p>
						</div>
					</div>
					<div id="buy_content_wrap">
						<div id="buy_price_detail">
							<div class="lowAndhigh" id="low">
								<p class="lowAndhigh_p_1">최저 구매가</p>
								<p class="lowAndhigh_p_2">원</p>
							</div>
							<div class="lowAndhigh" id="high">
								<p class="lowAndhigh_p_1">최고 구매가</p>
								<p class="lowAndhigh_p_2">원</p>
							</div>
						</div>
						<div id="deco_wrap_1">
							<div id="deco_wrap_2">
								<span>상세 금액</span>
							</div>
						</div>
						<div id="price_input_wrap">
							<div>
								<span id="now_price_span">즉시 구매가</span>
							</div>
							<div>
								<input type="text" id="price_input" readonly/><span id="won">원</span>
							</div>
						</div>
						<div id="price_bind_wrap">
							<div class="price_bind">
								<p class="price_bind_p">검수비</p><p>무료</p>
							</div>
							<div class="price_bind">
								<p class="price_bind_p">배송비</p><p>2,500원</p>
							</div>
						</div>
					</div>
					<div id="buy_btn_wrap">
						<div id="final_price">
							<p id="f_price_p_1">총 결제금액</p><p id="f_price_p_2"></p>
						</div>
						<button id="buy_btn">상품 구매</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="modal">
		<div id="modal_content">
			<H2>구매 확인</H2>
			<p id="modal_content_p">정말로 구매하시겠습니까?</p>
			<div>
				<button class="modal_btn" id="modal_btn_ok">구매</button>
				<button class="modal_btn" id="modal_btn_no">취소</button>
			</div>
		</div>
	</div>
	
	
	<sec:authorize access="isAuthenticated()">
		<sec:authentication var="member" property="principal.member"/>
		<form id="buyForm" action="${path}/pboard/buyFinish" method="post">
			<input type="hidden" name="pno" value="${product.pno}"/>
			<input type="hidden" name="psno" value="${psno}"/>
			<input type="hidden" name="uno" value="${member.uno}"/>
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		</form>
	</sec:authorize>
	
	
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	var pno = ${product.pno};
	console.log(pno);
	var size = '${size}';
	console.log(size);
	

	$(document).ready(function(){
		$.ajax({
			url : "${path}/pboard/readOneImg",
			type : "POST",
			data : {
				pno : pno,
				'${_csrf.parameterName}' : '${_csrf.token}'
			},
			dataType : "text",
			success : function(result){
				var pi = $("#product_img");
				var src = "../resources/product_img/";
				var str = "<img id='images' src='"+src+result+"'/>";
				pi.append(str);
			},
			error : function(res){
				alert(res.responseText);
			}
		});
		
		$.ajax({
			url : "${path}/pboard/minPrice",
			type : "POST",
			data : {
				pno : pno,
				size : size,
				'${_csrf.parameterName}' : '${_csrf.token}'
			},
			dataType : "json",
			success : function(result){
				var low = $("#low").children(":last");
				var price = result.sell_price;
				var final_price = price + 2500;
				final_price = final_price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
				price = price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
				$("#price_input").val(price);
				$("#final_price").children(":last").html(final_price+"원");
				low.prepend(price);
			},
			error : function(res){
				
			}
		});
		
		$.ajax({
			url : "${path}/pboard/maxPrice",
			type : "POST",
			data : {
				pno : pno,
				size : size,
				'${_csrf.parameterName}' : '${_csrf.token}'
			},
			dataType : "json",
			success : function(result){
				var high = $("#high").children(":last");
				var price = result.sell_price;
				price = price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
				high.prepend(price);
			},
			error : function(res){
				alert(res.responseText);
			}
		});
	});

	
	
	$("#buy_btn").click(function(){
		$(".modal").css("display","block");	
	});
	
	$(document).click(function(e){
			if($(".modal").is(e.target) || $("#modal_btn_no").is(e.target)){
				 $(".modal").css("display","none");
			}	
	});
	
	$("#modal_btn_ok").click(function(){
		$("#buyForm").submit();		
	});
	
	
	
</script>	
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>