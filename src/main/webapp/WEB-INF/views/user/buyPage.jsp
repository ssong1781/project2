<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>    
<link href="${path}/resources/css/buyPage.css" rel="stylesheet"/>

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
	<div>
		<div class="content_area">
			<div class="my_purchase">
				<div class="content_title">
					<div class="title">
						<h3>구매 내역</h3>
					</div>
				</div>
				<div class="purchase_list_tab detail_tab">
					<div class="tab_item total">
						<a href="#" class="tab_link">
							<dl class="tab_box">
								<dt class="title">구매 입찰</dt>
								<dd class="content">0</dd>
							</dl>
						</a>
					</div>
					<div class="tab_item">
						<a href="#" class="tab_link">
							<dl class="tab_box">
								<dt class="title">진행중</dt>
								<dd class="content">0</dd>
							</dl>
						</a>
					</div>
					<div class="tab_item">
						<a href="#" class="tab_link">
							<dl class="tab_box">
								<dt class="title">종료</dt>
								<dd class="content">0</dd>
							</dl>
						</a>
					</div>
				</div>
				<div class="period_search">
					<div class="period_month">
						<ul class="month_list">
							<li class="month_item">
								<a href="#" class="month_link">최근 2개월</a>
							</li>
							<li class="month_item">
								<a href="#" class="month_link">최근 4개월</a>
							</li>
							<li class="month_item">
								<a href="#" class="month_link">최근 6개월</a>
							</li>
							<div class="period_btn_box">
								<button class="btn_search is_active">조회</button>
							</div>
						</ul>
					</div>
				</div>
				<ul class="search_info">
					<li class="info_item">
						<p>한 번에 조회 가능한 기간은 최대 6개월입니다.</p>
					</li>
					<li class="info_item">
						<p>기간별 조회 결과는 입찰일 기준으로 노출됩니다.</p>
					</li>
				</ul>
				<div class="purchase_list bidding bid">
					<div class="purchase_head">
						<div class="head_product">
							<a href="#" class="btn_filter">전체</a>
						</div>
						<div class="head_status">
							<div class="status_box field_price">
								<a href="#" class="status_link">
									<span class="status_txt">구매 희망가</span>
								</a>
							</div>
							<div class="status_box field_date_purchased">
								<a href="#" class="status_link">
									<span class="status_txt">구매일</span>
								</a>
							</div>
							<div class="status_box field_date_paid">
								<a href="#" class="status_link">
									<span class="status_txt">정산일</span>
								</a>
							</div>
							<div class="status_box field_expires_at">
								<a href="#" class="status_link">
									<span class="status_txt">만료일</span>
								</a>
							</div>
							<div class="status_box field_status ascending">
								<a href="#" class="status_link">
									<span class="status_txt">상태</span>
								</a>
							</div>
						</div>
					</div>
					<c:choose>
						<c:when test="${!empty product}">
						</c:when>
						<c:otherwise>
							<div class="empty_area">
								<p class="desc">구매 입찰 내역이 없습니다.</p>
								<a href="${path}/list" class="btn outlinegrey small">SHOP 바로가기</a>
							</div>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
	//포스트 방식으로 a 태그 데이터 넘겨주기
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