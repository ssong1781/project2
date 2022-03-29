<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<link href="${path}/resources/css/pay.css" rel="stylesheet"/>    
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
		<div class="content_area">
			<div class="my_payment">
				<div class="content_title border has_sub">
					<div class="title">
						<h3>결제 정보</h3>
						<p class="sub_title">수수료(페널티, 착불배송비 등)가 정산되지 않을 경우, 별도 고지 없이 해당 금액을 결제 시도할 수 있습니다.</p>
					</div>
					<div class="btn_box">
						<a href="#" class="btn btn_add">
							<span>+ 새카드 추가하기</span>
						</a>
					</div>
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