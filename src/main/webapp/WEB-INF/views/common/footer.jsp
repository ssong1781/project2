<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Batang:wght@700&display=swap" rel="stylesheet">
<style>
	*{
		margin: 0;
		padding: 0;
	}
	
	hr{
	  border-width: 1px 0px 0px 0px;
	  height: 0.1px;
	  color: red;
	}

	
	footer {
	height: 200px;
	align-items: center;
	justify-content: left;
	border-top: 1px solid #ccc;
	padding:50px 40px;

	}

	.business{
		padding:50px 40px;
		width:100%;
		height:500px;
		font-family: 'Gowun Batang', serif;
	}
	
	

	.b_top{
		width:950px;
		height:200px;
		display: flex;
		justify-content: space-between;
	}
	
	.b_bottom{
		width:950px;
		height:100px;
		margin-top: 30px;
	}
	

	
	.b_ul{
		display: inline-flex;
		padding-bottom: 16px;
		
	}
	.b_ul li{
		margin-right: 20px;
	}
	
	.b_left li{
		position:relative;
		left:7px;
		font-size: 14px;
		color: rgba(34,34,34,.5);
	}
	
	.b_left2 li{
		position:relative;
		left:7px;
		font-size: 14px;
		color: rgba(34,34,34,.5);
	}
	
	.b_right{
		position: relative;
		left:750px;
	}
	
	.b_right p{
		font-size: 14px;
		color: rgba(34,34,34,.5);
		position:relative;
		left:7px;
	}
	
	.b_b2 p{
		font-size: 14px;
		color: rgba(34,34,34,.5);
	}
	
	.b_btn{
		width:130px;
	    background-color: black;
	    border: none;
	    border-radius:10px;
	    color:#fff;
	    padding: 10px 0;
	    text-align: center;
	    text-decoration: none;
	    display: inline-block;
	    position:relative;
	    bottom:-10px;
	    font-size: 15px;
	    margin: 4px;
	    cursor: pointer;
	}
	
	.b_b3{
		float:right;
		position: relative;
		left:650px;
		top:-90px;
		width:200px;
		height:200px;
		font-size: 50px;
		letter-spacing: 5px;
		
	}
	

	
</style>
</head>
<body>

<footer> 
	<div class="business">
	
		<div class="b_top">
		
			<div class="b_left">
				<ul>
					<h3>이용안내</h3>
					<li>검수기준</li>
					<li>이용정책</li>
					<li>페널티 정책</li>
					<li>커뮤니티 가이드라인</li>
				</ul>
			</div>
			
			<div class="b_left2">
				<ul>
					<h3>고객지원</h3>
					<li>공지사항</li>
					<li>서비스 소개</li>
					<li>쇼룸 안내</li>
					<li>판매자 방문접수</li>
				</ul>
			</div>
			
			<div class="b_right">
				<h2>고객센터 1588-1588</h2>
				<div class="b_right_p">
					<p>운영시간 평일 09:00 - 17:30 (토·일, 공휴일 휴무)</p>
					<p>점심시간 평일 12:50 - 13:40 (토·일, 공휴일 휴무)</p>
					<p>1:1 문의하기는 곧 찾아뵙겠습니다.</p>
				</div>
				<button class="b_btn">자주 묻는 질문</button>
			</div>
			
		</div>
		
		<div class="b_bottom">
		
			<div class="b_b1">
				<ul class="b_ul">
					<li>회사소개</li>
					<li>인재채용</li>
					<li>제휴제안</li>
					<li>이용약관</li>
					<li><h4>개인정보처리방침</h4></li>
				</ul>
			</div>
			
			<div class="b_right">
			</div>
			
			<div class="b_b2">
				<p>플렉스 주식회사 · 대표 최기근 사업자등록번호 : 123-45-6789 사업자정보확인  통신판매업 : 제 2022-KTE-902호
				</p>
				<p>
					사업장소재지 : 부산 동래구       호스팅 서비스 : 한국기술교육직업전문학교 
				</p>
			</div>
			
			<div class="b_b3">
				<i class="fa-brands fa-instagram-square"></i>
				<i class="fa-brands fa-facebook-square"></i>
				<i class="fa-brands fa-youtube"></i>
			</div>
			
		</div>
		
	</div>
	
	
	
	
	
 </footer>
 
 		

</body>
</html>