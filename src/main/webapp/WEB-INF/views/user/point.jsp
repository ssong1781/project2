<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<link href="${path}/resources/css/point.css" rel="stylesheet"/>    
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
			<div class="point">
				<div class="content_title">
					<div class="title">
						<h3>포인트</h3>
					</div>
				</div>
				<div class="dashboard">
					<div class="point_summary">
						<div class="point_info">
							<p class="title">사용 가능한 포인트</p>
							<p class="point">
								<b>0P</b>
							</p>
						</div>
						<div class="divider">
							<div class="divider_line"></div>
						</div>
						<div class="point_info">	
							<p class="title">이번달 소멸예정 포인트</p>
							<p class="point">
								<b>0P</b>
							</p>
						</div>
					</div>
					<div class="register">
						<button type="button" id="openbtn" class="btn solid medium">+포인트 적립하기</button>
					</div>
				</div>			
				<p class="description">
					 포인트 유효기간은 적립일로부터 최대 1년까지이며, 유형에 따라 달라질 수 있습니다. 
				</p>
				<table class="point_history_table">
					<thead>
						<tr>
							<th class="point_history_header">상세 내용</th>
							<th class="point_history_header">적립/사용</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td colspan="2">
								<div class="point_empty">
									<p class="text">적립 또는 사용한 내역이 없습니다.</p>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
				
				<div class="layer md">
					<div class="layer_container">
						<div class="layer_header">
							<h2 class="title">포인트 적립</h2>
						</div>
						<div class="layer_content">
							<div class="register_point">
								<div class="input_box">
									<h4 class="input_title">포인트 코드</h4>
									<div class="input_item">
										<input type="h4" placeholder="쿠폰 코드를 입력하세요." autocomplete="off" class="input_txt">
									</div>
								</div>
								<p class="description">
									 • 유효기간이 지난 쿠폰 코드는 등록이 불가합니다.
									 <br/>
									 • 쿠폰에 따라 발급 수량 및 계정당 사용 횟수가 제한될 수 있습니다. 
								</p>
							</div>
							<div class="layer_btn">
								<button type="button" id="closebtn" class="btn outlinegrey medium">취소</button>
								<button type="button" id="pointplus" class="btn solid medium disabled" >적립하기</button>
							</div>
						</div>
						<button type="button" class="closebtn">
							<img src="${path}/resources/img/closebtn.png">
						</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(function(){ 
	
    $("#openbtn").click(function(){
       $(".layer").fadeIn();
    });
    
   $(".closebtn").click(function(){
      $(".layer").fadeOut();
      $(".input_txt").val("");
      $("#pointplus").css("background-color","#ebebeb");
    });
   
   $("#closebtn").click(function(){
	  $(".layer").fadeOut();
	  $(".input_txt").val("");
	  $("#pointplus").css("background-color","#ebebeb");
   });
   
   $(document).click(function(e){
       if($(".layer").is(e.target) || $(".closebtn").is(e.target)){
           $(".layer").css("display","none");
           $(".input_txt").val("");
           $("#pointplus").css("background-color","#ebebeb");
       }
	});

  
 	$(".input_txt").on("input", function(){
 		if($(".input_txt").val() != ""){
 			$("#pointplus").css("background-color","black");
 		}
 	})
});

	//포스트 방식으로 a 태그 데이터 넘겨주기
	function profileinfoView(uid){
			console.log("ddddd");
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