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
		height: 730px;
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
	
	#sell_price_detail{
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
		background-color: #41b979;
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
		outline: none;
		margin-top: 12px;
	}
	
	#warning_input{
		position: absolute;
		right:636px;
		margin: 0;
		font-size: 13px;
		color: red;
		text-align: right;
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
	
	#final_price_wrap{
		display: flex;
		justify-content:space-between;
	}
	
	#final_price_wrap p{
		margin: 16px 0;
	}
	
	#final_price{
		font-size: 20px;
		font-weight: 600;
	}
	
	#sell_btn_wrap{
		width: 100%;
		height: 60px;
	}
	
	#sell_btn{
		width: 100%;
		height: 100%;
		border-radius: 10px;
		background-color: #ebebeb;
		color: white;
		font-size: 15px;
		font-weight: bold;
		border: none;
		margin-top: 10px;
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
	
	#modal_content_p{
		color: rgba(34,34,34,.8);
		margin: 6px 0 20px 0;
	}
	
	#kor_name{
		font-size: 13px;
		color: rgba(34,34,34,.5);
	}
	
	#hope_price{
		font-size: 14px;
		font-weight: bold;
	}
	
	.lowAndhigh_p_1{
		font-size: 13px;
		color: rgba(34,34,34,.5);
	}
	
	.lowAndhigh_p_2{
		font-size: 18px;
	}
	
	.price_bind{
		font-size: 14px;
	}
	
	.price_bind_p{
		color: rgba(34,34,34,.5);
	}
	
	#final_price_p{
		font-weight: bold;
	}
	
</style>
</head>
<body>
	
	<div id="sell_wrap">
		
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
					<div id="sell_content_wrap">
						<div id="sell_price_detail">
							<div class="lowAndhigh" id="low">
								<p class="lowAndhigh_p_1">최저 판매가</p>
								<p class="lowAndhigh_p_2">원</p>
							</div>
							<div class="lowAndhigh" id="high">
								<p class="lowAndhigh_p_1">최고 판매가</p>
								<p class="lowAndhigh_p_2">원</p>
							</div>
						</div>
						<div id="deco_wrap_1">
							<div id="deco_wrap_2">
								<span>판매 입찰</span>
							</div>
						</div>
						<div id="price_input_wrap">
							<div>
								<span id="hope_price">판매 희망가</span>
							</div>
							<div>
								<p id="warning_input"></p>
								<input type="text" id="price_input"  oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1').replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');" placeholder="희망가 입력" maxlength="13"/><span id="won">원</span>
							</div>
						</div>
						<div id="price_bind_wrap">
							<div class="price_bind">
								<p class="price_bind_p">검수비</p><p>무료</p>
							</div>
							<div class="price_bind">
								<p class="price_bind_p">판매수수료</p><p>무료</p>
							</div>
							<div class="price_bind">
								<p class="price_bind_p">배송비</p><p>판매자 부담</p>
							</div>
						</div>
					</div>
					<div id="sell_btn_wrap">
						<div id="final_price_wrap">
							<p id="final_price_p">총 정산금액</p><p id="final_price">-</p>
						</div>
						<button id="sell_btn">상품 판매</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="modal">
		<div id="modal_content">
			<H2>판매 등록 확인</H2>
			<p id="modal_content_p">정말로 판매 등록하시겠습니까?</p>
			<div>
				<button class="modal_btn" id="modal_btn_ok">판매</button>
				<button class="modal_btn" id="modal_btn_no">취소</button>
			</div>
		</div>
	</div>
	
	<sec:authorize access="isAuthenticated()">
		<sec:authentication var="member" property="principal.member"/>
		<form id="sellForm" action="${path}/pboard/sellFinish" method="post">
			<input type="hidden" name="pno" value="${product.pno}"/>
			<input type="hidden" name="sell_price" id="sell_price_input"/>
			<input type="hidden" name="size" value="${size}"/>
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
				var pi = $("#product_img")
				var src = "../resources/product_img/";
				var str = "<img id='images' src='"+src+result+"'/>";
				pi.append(str);
			},
			error : function(res){
				alert(res.responseText);
			}
		});
		
		
		var low = $("#low").children(":last");
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
				var price = result.sell_price;
				price = price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
				low.prepend(price);
			},
			error : function(res){
				low.prepend("- ");
			}
		});
		
		
		var high = $("#high").children(":last");
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
				var price = result.sell_price;
				price = price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
				high.prepend(price);
			},
			error : function(res){
				high.prepend("- ");
			}
		});
		
	});
	
	$("#price_input").focus(function(){
		$("#price_input_wrap").css("border-bottom","2px solid #222");
		$("#price_input").attr("placeholder","");
	});
	$("#price_input").blur(function(){
		var thisval = $(this).val();
		thisval = thisval.replace(/[^\d]+/g, '');
		thisvalSlice = thisval.slice(-3);
		$("#price_input_wrap").css("border-bottom","1px solid lightgray");
		$("#price_input").attr("placeholder","희망가 입력");
		if(thisval < 30000 || thisvalSlice != '000'){
			$(this).val("");
		}
	});
	$("#price_input").keyup(function(e) {
		var thisval = $(this).val();
		thisval = thisval.replace(/[^\d]+/g, '');
		thisvalSlice = thisval.slice(-3);
		if(thisval < 30000 || thisvalSlice != '000'){
			$("#warning_input").html("3만원 부터 천원단위로 입력하세요.");
			$("#sell_btn").removeAttr("class");
			$("#sell_btn").css("background-color","#ebebeb");
			$("#price_input_wrap").css("border-bottom","2px solid red");
			$("#hope_price").css("color","red");
		}else{
			$("#warning_input").html("");
			$("#sell_btn").attr("class","ok");
			$("#sell_btn").css("background-color","#222");
			$("#price_input_wrap").css("border-bottom","2px solid #222");
			$("#hope_price").css("color","black");
			$("#final_price").html($(this).val()+"원").css("color","#31b46e");
			$("#sell_btn").css("cursor","pointer");
		}	
	});

	
	
	$("#sell_btn").click(function(){
		if($(this).attr("class") == "ok"){
			$(".modal").css("display","block");	
		}
		
	});
	
	$(document).click(function(e){
			if($(".modal").is(e.target) || $("#modal_btn_no").is(e.target)){
				 $(".modal").css("display","none");
			}	
	});
	
	$("#modal_btn_ok").click(function(){
		var sell_price = $("#price_input").val();	
		sell_price = sell_price.replaceAll(",","");
		$("#sell_price_input").val(sell_price);
		$("#sellForm").submit();
		
	});
	
	
	
</script>	
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>