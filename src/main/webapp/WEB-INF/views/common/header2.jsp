<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Cute+Font&family=Gaegu:wght@300&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Gugi&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Gugi&family=Playfair+Display:wght@900&display=swap" rel="stylesheet">

<link rel="shortcut icon" href="${path}/resources/img/favicon.ico" type="image/x-icon">

<style>

	body{
		margin: 0;
		padding: 0;
	}
	
	a{
		text-decoration: none;
		
	}
	
	
	
	.navbar{
		font-family: 'Playfair Display', serif;
		display: flex;
		justify-content: space-between;
		align-items: center;
		background-color: black;
		padding: 8px 12px;
	}
	
	.navbar_logo{
		position: relative;
		left:350px;
	
	}
	

	.navbar_menu{
		
		display: flex;
		list-style: none;
		padding-left: 0;
		font-size: 20px;
		position: relative;
		left:280px;
		top:30px;
		
	}
	
	.navbar_menu li{
		padding: 8px 12px;
	}
	
	.navbar_menu li:hover{
		background-color: gray;
		border-radius: 4px;
		
	}
	
	.navbar_menu a {
		color: #cccccc;
	}
	
	.navbar_menu2{
		display: flex;
		list-style: none;
		padding-left: 0;
		position: relative;
		right: 290px;
		bottom: 20px;
		font-size: 17px;
	}
	
	.navbar_menu2 li{
		padding: 8px 12px;
		font-family: 'Gowun Dodum', sans-serif;
	}
	
	/* .navbar_menu2 li:hover{
		background-color: gray;
		border-radius: 4px;
	} */
	
	.navbar_menu2 a {
		color: white;
	}
	
	
	
	.navbar_search{
		position: relative;
		float:right;
		right:-300px;
		top:30px; 
		max-width:200px;
		width:100%;
		height:30px;
		display: flex;
		justify-content: center;
		align-items: center;
		

	}
	
	
	.search_bar{
		width: calc(100% - 25px);
		height: 30px;
		padding: 0 10px 0 15px;
		border-radius: 15px 0 0 15px;
		outline: none;
		border:1px solid #d3d3d3;
	}
	
	.search_btn{
		position: relative;
    	top: 0;
    	right: 0;
	    width: 35px;
	    height: 30px;
	    padding: 0;
	    background-color: #fff;
	    border:1px solid #d3d3d3;
	    border-radius: 0 15px 15px 0;
	    outline: none;
	    cursor: pointer
	}
	
	.navbar_toggleBtn {
		display:none;
		position: absolute;
		right: 32px;
		font-size: 24px;
		color:#d49466;
	}
	
	@media screen and (max-width: 768px) {
		.navbar {
			flex-direction: column;
			align-items: flex-start;
		}
		
		.navbar_logo{
			position:static;
			margin: 0 auto;
		}
		
		.navbar_menu{
			
			display:none;
			flex-direction: column;
			align-items: center;
			position:static;
			width:100%;
			
		}
		
		.navbar_menu li{
			color: white;
		}
		
		.navbar_menu li{
			width:100%;
			text-align: center;
		}
		
		.navbar_search{
			flex-direction: row;
			margin: 0 auto;
			width:100%;
			position: static;
			
		}
		
		.search_bar{
			position: static;	
		}
		
		.search_btn{
			
			position: static;
			
		}
		
		.navbar_menu2{
			display:none;
			position:static;
			flex-direction: row;
			margin: 0 auto;
			align-items: center;
		}
		
		.navbar_menu2 li{
			
			margin: 2px;
		}
	
		.navbar_toggleBtn{
			display: block;
		}
		
		.navbar_menu.active,
		.navbar_menu2.active{
			display: flex;
		}
	}
	
	.profile_img{
		width:25px;
		height:25px;
		border-radius:12.5px;
		position: relative;
		left:18px;
		top:2px;
	}
	
	.top-uname{
		position: relative;
		padding:0px;
		
	}
	
	/* .toppadding{
		position: relative;
		left:20px;
	} */
	
	li .top-name{
		padding:0px;
	}
</style>
</head>
<body>
		
		<nav class="navbar">
			
			<div class="navbar_logo">
				<a href="${pageContext.request.contextPath}">
				<img src="${path}/resources/img/flexlogo.png">
				</a>
			</div> <!-- logo -->
			
			
				
				<ul class="navbar_menu">
						<li><a href="${pageContext.request.contextPath}">HOME</a></li>
						<li><a href="${path}/list">STYLE</a></li>
						<li><a href="${path}/pboard/listPage">SHOP</a></li>
						<li><a href="${path}/watch/listReply">WATCH</a></li>
				</ul><!-- menu1 -->
		
			
			<div class="navbar_search">
				<input class="search_bar">
				<button class="search_btn">
					<i class="fa-solid fa-magnifying-glass"></i>
				</button>
			</div> <!-- search -->
			
			
				<ul class="navbar_menu2">
					<li class="toppadding"><a href="#">고객센터</a></li> 
						<sec:authorize access="isAuthenticated()">
							<sec:authentication var="member" property="principal.member"/>
							<li class="toppadding"><a href="javascript:wishListView('${member.uid}')">관심상품</a></li> 
							<li class="top-name">
							<a href="javascript:myPageView('${member.uid}')">
								<c:choose>
									<c:when test="${!empty member.user_img}">
										<img class="profile_img" src="${path}/upload/profile/${member.uid}/${member.user_img}"/>
									</c:when>
									<c:otherwise>
										<img class="profile_img" src="${path}/resources/img/profile.jpg"/>
									</c:otherwise>
								</c:choose>
								<li class="top-uname">
									${member.uname}
								</li>
							</a>
							</li>
							<sec:authorize access="hasAnyRole('ROLE_MASTER')">
								<li><a href="${path}/mngt/main">회원 목록</a></li>
							</sec:authorize>
							<li><a href="${path}/user/logout">로그아웃</a></li>
							<%-- <li><a href="javascript:logout('${member.uid}')">로그아웃</a></li> --%>
						</sec:authorize>
						<!-- 익명 사용자 -->
						<sec:authorize access="isAnonymous()">
							<li class="toppadding"><a href="javascript:wishListView('${member.uid}')">관심상품</a></li>
							<li><a href="${path}/user/login">로그인</a></li>
							<li><a href="${path}/user/signUp">회원가입</a></li>
					</sec:authorize>	
				</ul><!-- menu2 -->
		
			
			<a href="#" class="navbar_toggleBtn">
				<i class="fa-solid fa-bars"></i>
			</a>
		</nav> <!-- end -->
		
		
		
<script src="http://code.jquery.com/jquery-latest.min.js"></script>	
<script src="https://kit.fontawesome.com/3492c7f710.js" crossorigin="anonymous"></script>
		
<script>
	// 햄버거 토글
	const toggleBtn = document.querySelector('.navbar_toggleBtn');
	const menu = document.querySelector('.navbar_menu');
	const menu2 = document.querySelector('.navbar_menu2');
	toggleBtn.addEventListener('click', () => {
		menu.classList.toggle('active');
		menu2.classList.toggle('active');
	});
	
	// 포스트 방식으로 a 태그 데이터 넘겨주기
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
	    f.setAttribute('action', '${path}/user/myPage');
	    document.body.appendChild(f);
	    f.submit();
	}
	

	$(".search_btn").click(function(){
		var keyword = $(".search_bar").val();
		location.href="${path}/pboard/listPage?keyword="+keyword;
	});
	
	$(".search_bar").keypress(function(e) { 
		 if (e.keyCode == 13){
			 $(".search_btn").trigger("click");
	    }    
	});

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
	    f.setAttribute('action', '${path}/user/wishList');
	    document.body.appendChild(f);
	    f.submit();
	}
	
</script>

</body>
</html>