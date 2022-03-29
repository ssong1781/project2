<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>   
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>플렉스 FLEX </title>
<link href="${path}/resources/css/myPage.css" rel="stylesheet"/>
</head>
<body>
<% 
	response.setHeader("Cache-Control","no-store"); 
	response.setHeader("Pragma","no-cache"); 
	response.setDateHeader("Expires",0); 
	if (request.getProtocol().equals("HTTP/1.1")) response.setHeader("Cache-Control", "no-cache"); 
%>

<form action="myPage" id="myPage" method="POST">
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
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
	</div>
	<div class="content_area">
		<div class="my_home">
			<div class="user_membership">
				<div class="user_detail">
					<div class="user_thumb">
						<%-- <img src="${path}/resources/img/profile.jpg" class="thumb_img" alt="사용자 이미지"> --%>
						<c:choose>
							<c:when test="${!empty member.user_img}">
								<img class="thumb_img" src="${path}/upload/profile/${member.uid}/${member.user_img}"/>
							</c:when>
							<c:otherwise>
								<img class="thumb_img" src="${path}/resources/img/profile.jpg"/>
							</c:otherwise>
						</c:choose>
					</div>
					<div class="user_info">
						<div class="info_box">
							<strong class="name">${member.unick}</strong>
							<p class="email">${member.uid}</p>
							<a class="btn btn outlinegrey small" type="button" href="javascript:profileinfoView('${member.uid}')">프로필 수정</a>
							<a href="${path}/sprofile/${member.uno}" class="btn btn btn_my_style outlinegrey small" type="button">내 스타일</a>
						</div>
					</div>
				</div>
				<div class="membership_detail">
					<a href="#" class="membership_item disabled">
						<strong class="info">일반 회원</strong>
						<p class="title">회원 등급</p>
					</a>
					<a href="#" id="openbtn" class="membership_item">
						<strong class="info">0P</strong>
						<p class="title">포인트</p>
					</a>
				</div>
			</div>
			<div class="inventory_box">
				<!-- 빈칸 -->
			</div>
			<div class="my_home_title">
				<h3 class="title">구매 내역</h3>
				<a href="#" class="btn_more">
					<span class="btn_txt">더보기</span>
				</a>
			</div>
			<div class="recent_purchase">
				<div class="purchase_list_tab">
					<div class="tab_item total">
						<a href="#" class="tab_link">
							<dl class="tab_box">
								<dt class="title">전체</dt>
								<dd class="count" id="buyCnt"></dd>
							</dl>
						</a>
					</div>
					<div class="tab_item">
						<a href="#" class="tab_link">
							<dl class="tab_box">
								<dt class="title">진행 중</dt>
								<dd class="count">0</dd>
							</dl>
						</a>
					</div>
					<div class="tab_item">
						<a href="#" class="tab_link">
							<dl class="tab_box">
								<dt class="title">종료</dt>
								<dd class="count" id="buyCntFinish"></dd>
							</dl>
						</a>
					</div>
				</div>
				<div>
					<div>
						<div class="buylist">
							
						</div>
					</div>
				</div>
			</div>
						<div class="my_home_title">
				<h3 class="title">판매 내역</h3>
				<a href="#" class="btn_more">
					<span class="btn_txt">더보기</span>
				</a>
			</div>
			<div class="recent_purchase">
				<div class="purchase_list_tab">
					<div class="tab_item total">
						<a href="#" class="tab_link">
							<dl class="tab_box">
								<dt class="title">전체</dt>
								<dd class="count" id="sellCnt"></dd>
							</dl>
						</a>
					</div>
					<div class="tab_item">
						<a href="#" class="tab_link">
							<dl class="tab_box">
								<dt class="title">진행 중</dt>
								<dd class="count" id="sellingCnt"></dd>
							</dl>
						</a>
					</div>
					<div class="tab_item">
						<a href="#" class="tab_link">
							<dl class="tab_box">
								<dt class="title">종료</dt>
								<dd class="count" id="sellCntFinish"></dd>
							</dl>
						</a>
					</div>
				</div>
				<div>
					<div>
						<div class="buylist">
							
						</div>
					</div>
				</div>
			</div>
			<div class="my_home_title">
				<h3 class="title">관심 상품</h3>
			</div>
			<div class="interest_product">
				<div class="interest_product_area">
					<p class="desc">추가하신 관심상품이 없습니다.</p>
					<a href="${path}/board/listReply" class="btn outlinegrey small">SHOP 바로가기</a>
				</div>
			</div>
		</div>
	</div>
	<div class="modal">
		<div class="layer_container">
			<div class="layer_header">
				<h2 class="title">이용안내</h2>
			</div>
			<div class="layer_content">
				<div class="usable_wrap">
					<div class="usable_point">
						<h3 class="title">사용 가능한 포인트</h3>
						<p class="point_box"> 
							<span class="point">0</span>
							<span class="unit">P</span>
						</p>
						<div class="point_info">
							<p class="info_item">이번달 소멸 예정 포인트 0P</p>
							<p class="info_item"> 포인트 유효기간은 적립일로부터 최대 1년까지이며, 유형에 따라 달라질 수 있습니다.</p>
						</div>
					</div>
					<ul class="usable_list">
						<li class="usable_item">1,000P 이상부터 구매금액 제한 없이 사용하실 수 있습니다.</li>
						<li class="usable_item">입찰 삭제, 거래 취소 시 사용한 포인트는 환불됩니다.</li>
						<li class="usable_item">먼저 적립된 포인트부터 순서대로 사용되며, 사용하지 않으실 경우 유효기간이 지나면 자동 소멸됩니다.</li>
						<li class="usable_item">유효기간이 지난 후 환불받은 포인트는 다시 사용하실 수 없습니다.</li>
					</ul>
				</div>
				<div class="layer_btn">
					<button class="btn outline medium">확인</button>
				</div>
			</div>
			<button type="button" class="closebtn">X</button> 
		</div>
	</div>
</div>
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
</form>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
<script>

	var uno = "${member.uno}";

	$(function(){ 
		
	    $("#openbtn").click(function(){
	       $(".modal").fadeIn();
	    });
	    
	   $(".closebtn").click(function(){
	      $(".modal").fadeOut();
	    });
	  
	});
	
	$(document).ready(function(){
		
		var bCount = "${member.buyno}";
		console.log(bCount);
		if(bCount != ""){
			var bCounts = bCount.split("/");
			for(i=0;i<bCounts.length;i++){
				console.log(bCounts[i]);
			}
	            
			$("#buyCnt").html(bCounts.length-2);
			$("#buyCntFinish").html(bCounts.length-2);     
		}
			
		var sCount = "${member.sellno}";
		console.log(sCount);
		if(sCount != ""){
			var sCounts = sCount.split("/");
			for(i=0;i<sCounts.length;i++){
				console.log(sCounts[i]);
			}
		            
			$("#sellCnt").html(sCounts.length-2);
			 
		}		 
	
		$.ajax({
			url : "${path}/pboard/buyCnt",
			type : "POST",
			data : {
				uno : uno,
				'${_csrf.parameterName}' : '${_csrf.token}'
			},
			dataType : "text",
			success : function(result){
				console.log(result);
				var all = $("#sellCnt").html();
				var cnt = parseInt(all) - parseInt(result);
				$("#sellCntFinish").html(result);  	
				$("#sellingCnt").html(cnt);
			},
			error : function(res){
				alert(res.responseText);
			}
		});
			
	

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
</body>
</html>