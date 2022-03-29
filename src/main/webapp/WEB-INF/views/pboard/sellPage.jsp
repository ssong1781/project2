<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
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
		height: 670px;
		margin: 0 auto;
		border: 1px solid lightgray;
		background-color:white;
	}
	
	#main_in_wrap{
		width: 638px;
		height: 538px;
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
	
	#size_btn_wrap{
		display:flex;
		flex-wrap: wrap;
		justify-content: space-between;
		padding-top: 20px;
		border:solid lightgray;
		border-width: 1px 0;
		padding-bottom: 10px;
	}
	
	.sizeBtn{
		display:flex;
		justify-content:center;
		align-items:center;
		width: 200px;
		height: 60px;
		background-color: white;
		border: 1px solid lightgray;
		border-radius: 10px;
		margin-bottom: 10px;
		text-align: center;	 
		cursor: pointer;
	}
	
	#sell_btn_wrap{
		display:none;
		width: 100%;
		height: 60px;
		margin-top: 18px;
	}
	
	#sell_btn{
		width: 100%;
		height: 100%;
		border-radius: 10px;
		background-color: #41b979;
		color: white;
		font-size: 14px;
		font-weight: bold;
		border: none;
	}
	
	#kor_name{
		font-size: 13px;
		color: rgba(34,34,34,.5);
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
						</div>
					</div>
					<div id="size_btn_wrap">
						<c:if test="${product.category eq '신발'}">
							<div class="sizeBtn"><p>230</p></div>
							<div class="sizeBtn"><p>235</p></div>
							<div class="sizeBtn"><p>240</p></div>
							<div class="sizeBtn"><p>245</p></div>
							<div class="sizeBtn"><p>250</p></div>
							<div class="sizeBtn"><p>255</p></div>
							<div class="sizeBtn"><p>260</p></div>
							<div class="sizeBtn"><p>265</p></div>
							<div class="sizeBtn"><p>270</p></div>
							<div class="sizeBtn"><p>275</p></div>
							<div class="sizeBtn"><p>280</p></div>
							<div class="sizeBtn"><p>285</p></div>
							<div class="sizeBtn"><p>290</p></div>
							<div class="sizeBtn"><p>295</p></div>
							<div class="sizeBtn"><p>300</p></div>
						</c:if>
						<c:if test="${product.category eq '의류'}">
							<div class="sizeBtn"><p>XS</p></div>
							<div class="sizeBtn"><p>S</p></div>
							<div class="sizeBtn"><p>M</p></div>
							<div class="sizeBtn"><p>L</p></div>
							<div class="sizeBtn"><p>XL</p></div>
							<div class="sizeBtn"><p>XXL</p></div>
						</c:if>
						<c:if test="${product.category eq '패션잡화'}">
							<div class="sizeBtn" id="pjsizeBtn"><p>ONE SIZE</p></div>
						</c:if>
					</div>
					<div id="sell_btn_wrap">
						<button id="sell_btn">상품 판매</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	var pno = ${pno};
	console.log(pno);
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
	});
	
	$(".sizeBtn").click(function(){	
		$(".sizeBtn").each(function(){
			$(".sizeBtn").css("border-color","lightgray");
			$('.sizeBtn').removeAttr('id', 'realSize');
		});
		$(this).css("border-color","black");
		$(this).attr('id', 'realSize');
		$("#sell_btn_wrap").css("display","block");
		console.log($("#realSize p").html());
	});
	
	
	
	$("#sell_btn").click(function(){
		 var size = $("#realSize p").html();
		 location.href = "${path}/pboard/sellDetailPage?pno="+pno+"&size="+size;
	});
	
	
	
</script>	
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>