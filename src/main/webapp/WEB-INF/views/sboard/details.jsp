<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>   
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 
<c:set var="path" value="${pageContext.request.contextPath}" scope="session" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <meta name="viewport" content="width=device-width, initial-scale=1.0"> -->
<title>Insert title here</title>
<style>
	*:focus{
		outline:none;
	}
	*{
		margin:0;
		padding:0;
		box-sizing:border-box;
	}
	body{
		width:100%;
		background:#fafafa;
		position:relative;
	}
	a:link{
		text-decoration: none;
	}
 	a:visited{
 		text-decoration: none;
 	}
 	a:hover{
 		text-decoration: none;
 	}
	.main{
		width:100%;
		padding:40px 0;
		display:flex;
		justify-content:center;
		margin-top:50px;
	}
	.wrapper{
		width:50%;
		max-width:1000px;
		display:grid;
		grid-template-columns:60% 40%;
		grid-gap:30px;
	}
	.left-col{
		display:flex;
		flex-direction:column;
	}
	.post{
		width:100%;
		height:auto;
		background:#fff;
		border:1px solid #dfdfdf;
		margin-top:40px;
		margin-bottom:100px;
	}
	.info{
		width:100%;
		height:60px;
		display:flex;
		justify-content:space-between;
		align-items:center;
		padding:0 20px;
	}
	.username{
		width:100%;
		overflow:hidden;
		text-align:center;
		font-size:12px;
		margin-top:5px;
		color:rgba(0,0,0,0.5);
	}
	.info .username{
		width:auto;
		font-weight:bold;
		color:#000;
		font-size:14px;
		margin-left:10px;
	}
	.info .follow{
		cursor:pointer;
		background-color: #222;
    	color: #fff;
    	font-weight: 700;
    	border-radius: 20px;
    	border:none;
    	padding: 5px 10px;
    	min-width: 15px;
    	text-align: center;
    	font-size: 13px;
    	letter-spacing: -.27px;
	}
	
	.info .user{
		display:flex;
		align-items:center;
	}
	.profile-pic{
		width:70px;
		height:70px;
		border-radius:50%;
		overflow:hidden;
		padding:3px;
	}
	.profile-pic img{
		width:100%;
		height:100%;
		object-fit:cover;
		border-radius:50%;
		border:2px solid #fff;
	}
	.info .profile-pic{
		height:40px;
		width:40px;
		padding:0;
		background:none;
	}
	.info .profile-pic img{
		border:none;
	}
	.post-image{
		width:100%;
		height:600px;
		object-fit:contain;
	}
	.post-content{
		width:100%;
		padding:20px;
	}
	.likes{
		font-weight:bold;
		position: relative;
		top:-23px;
		right:-20px;
	}
	.description{
		margin:10px 0;
		font-size:14px;
		line-height:20px;
	}
	.description span{
		font-weight:bold;
		margin-right:10px;
	}
	.post-time{
		color:rgba(0,0,0,0.5);
		font-size:12px;
	}
	.comment-wrapper{
		width:100%;
		height:50px;
		border-radius:1px solid #dfdfdf;
		display:flex;
		justify-content:space-between;
		align-items:center;
	}
	.comment-wrapper .icon{
		height:30px;
	}
	.comment-box{
		width:80%;
		height:100%;
		border:none;
		outline:none;
		font-size:14px;
	}
	.comment-btn{
		width:70px;
		height:100%;
		background:none;
		border:none;
		outline:none;
		text-transform:capitalize;
		font-size:16px;
		color:rgb(0,162,255);
		opacity:0.5;
	}
	.reaction-wrapper{
		width:100%;
		height:50px;
		display:flex;
		margin-top:-20px;
		align-items:center;
	}
	.reaction-wrapper .icon{
		height:25px;
		margin:0;
		margin-right:20px;
	}
	.likeBtn{
		height:25px;
		width:25px;
		background-color:white;
		border:none;
		margin-right:15px;
	}
	.delete{
		cursor:pointer;
		background-color: rgba(255, 0, 0, 0.73);
    	color: #fff;
    	font-weight: 700;
    	border-radius: 20px;
    	border:none;
    	padding: 5px 10px;
    	min-width: 15px;
    	text-align: center;
    	font-size: 13px;
    	letter-spacing: -.27px;
	}
</style>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
</head>
<body>
	<sec:authorize access="isAuthenticated()">
		<sec:authentication var="member" property="principal.member"/>
	</sec:authorize>
	<section class="main">
		<div class="wrapper">
			<div class="left-col">
			<%-- <c:forEach items="${allList}" var="vo"> --%>
				<c:choose>
				<c:when test="${sno eq vo.sno}">
					<div class="post" id="viewPostCard">
				</c:when>
				<c:otherwise>
					<div class="post" >
				</c:otherwise>
				
				</c:choose>
					<input type="hidden" value="${vo.sno}" id="viewPost"/>
					<input type="hidden" value="${vo.uno}" id="fonum"/>
					<div class="info">
						<a href="${path}/sprofile/${vo.uno}">
						<div class="user">
							<c:choose>
								<c:when test="${empty vo.user_img}">
									<div class="profile-pic"><img src="${path}/resources/img/profile.jpg" alt="사용자 프로필" class="img_profile"></div>
								</c:when>
								<c:otherwise>
									<div class="profile-pic"><img src="${path}/upload/profile/${vo.uid}/${vo.user_img}" alt="사용자 프로필" class="img_profile">	</div>
								</c:otherwise>
							</c:choose>
							<p class="username">${vo.unick}</p>
						</div>
						</a>
						<c:choose>
							<c:when test="${uno eq vo.uno && !empty member.uno}">
								<button class="delete" id="deleteBtn" value="${vo.sno}">삭제</button>
							</c:when>
							<c:otherwise>
								<button class="follow" id="followBtn" value="${vo.uno}">팔로우</button>
							</c:otherwise>
						</c:choose>
					</div>
					<img src="${path}/resources/upload/img/${vo.uid}/${vo.s_img}" alt="피드이미지" class="post-image">
					<div class="post-content">
						<div class="reaction-wrapper">
							<button class="likeBtn" value="${vo.sno}">
								<img src="${path}/resources/img/heart.png" class="icon likeImg" >
									<p class="likes"> ${vo.heart}</p>
							</button>
							<button class="commentBtn" value="${vo.sno}">
								<img src="${path}/resources/img/comment.png" class="icon commentImg">
							</button>
						</div>
						<p class="description"><span>${vo.unick}</span>${vo.content}</p>
						<p class="post-time"><f:formatDate value="${vo.regdate}" pattern="yyyy.MM.dd"/></p>
					</div>
					<jsp:include page="/WEB-INF/views/comment/comment.jsp"/>

					<%-- <div class="comment-wrapper">
						<img src="${path}/resources/img/inputcomment.png" class="icon" alt="?">
						<input type="text" class="comment-box" placeholder="Add a comment">
						<button class="comment-btn">post</button>
					</div> --%>
				</div>
				<%-- </c:forEach> --%>
			</div>
		</div>
	</section>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script>
	
	
	if("${member.uno}"){
		
		
	checkLike();
	followCheck();
	
	console.log($(".content").val());
	
	
	$(".delete").click(function(){
		var sno = $(this).val();
		var uno = '${uno}';
		$.ajax({
			type : "POST",
			url : "${path}/like/delete",
			dataType : "text",
			data : JSON.stringify({
				sno : sno, 
				uno : uno
			}),
			headers : {
				"Content-Type": "application/json",
				"${_csrf.headerName}" : "${_csrf.token}"
			},
			success : function(result){
				if(result == 'Success'){
					alert('삭제가 완료되었습니다.');
					history.go(-1);
				}else{
					alert('삭제 실패하였습니다.');
				}
				
			}
		});
	});
	
	
 	window.onload = function(){
		$("#viewPostCard").attr("tabindex", -1);
		$("#viewPostCard").focus();
	}
 	
 	$(".follow").click(function(){
 		$(this).attr("id","foll");
 		
 		if($(this).html() == '팔로우'){
 			var check = true;
 		}else{
 			var check = false;
 		}
 		
 		follow(check);
 	});
 	
 	function followCheck(){
 		var loginuno =  '${uno}';
 		var postuno =  $(".follow").val();
 		$.ajax({
 			type : "POST",
 			url : "${path}/fo/check",
 			dataType : "json",
 			data : JSON.stringify({
 				uno : loginuno
 			}),
 			headers : {
 				"Content-Type": "application/json",
 				"${_csrf.headerName}" : "${_csrf.token}"
 			},
 			success : function(data){
 				var size = $(".follow").length;
 				$(data.list).each(function(){
 					for(i=0;i<size;i++){
 						if($(".follow").eq(i).attr("value") == this.ufollower){
 							$(".follow").eq(i).html("언팔로우");	 							
 						}
 					}
 				});
 			}
 		});
 		
 	}
 	
 	
 	
 	function follow(check){
 		var ufollower = $("#foll").val();
 		var uno = '${uno}';
 		if(check){
 			$.ajax({
 				type : 'POST',
 				url : '${path}/fo/follow',
 				data : JSON.stringify({
 					uno : uno, 
 					ufollower : ufollower
 				}),
 				dataType : "text", 
 				headers: {
 					"Content-Type": "application/json",
 					"${_csrf.headerName}" : "${_csrf.token}"
 				},
 				success : function(result){
 					if(result == "followOK"){
 						$("#foll").html("언팔로우");
 						var foll = $("#foll").val();
 						var fol = $(".follow").val();
 						if(foll == fol){
 							$(".follow").html("언팔로우");
 						}
 					}
 				},
 				error : function(res){
 					console.log(res.responseText);
 				}
 			});
 		} else{
 			$.ajax({
 				type : "POST",
 				url : "${path}/fo/unfollow",
 				data : JSON.stringify({
 					uno : uno, 
 					ufollower : ufollower
 				}),
 				dataType : "text", 
 				headers: {
 					"Content-Type": "application/json",
 					"${_csrf.headerName}" : "${_csrf.token}"
 				},
 				success : function(result){
 					if(result == "unfollowOK"){
 						$("#foll").html("팔로우");
 						if($(".follow").val() == $("#foll").val()){
 							$(".follow").html("팔로우");	
 						}
 					}
 				}
 			});
 			
 		}
 		
 	}
 	
 	// 좋아요 버튼 확인 (로그인 유저) 
 	function checkLike(){
 		var uno = '${uno}';	
 		$.ajax({
 			type : "POST",
 			url : "${path}/like/find",
 			dataType : "json",
 			data : JSON.stringify({
 				uno :uno
 			}),
 			headers : {
 				"Content-Type": "application/json",
 				"${_csrf.headerName}" : "${_csrf.token}"
 			},
 			success : function(data){
 				var size = $(".likeBtn").length;
 				
 				$(data.list).each(function(){
 					for(i=0;i<size;i++){
 						if($(".likeBtn").eq(i).attr("value") == this.sno){
 							$(".likeBtn").eq(i).find("img").attr("src","${path}/resources/img/fullheart.png");
 						}
 					}
 				});
 			}
 		});
 	}
 	
 	
 	// 좋아요 | 좋아요 취소 
 	$(".likeBtn").click(function(){
 		let no = $(this).val();
 		let uno = '${uno}';
 		var child = $(this).children('img');
 		var find = $(this).find('p');
 		
 		if(child.attr("src") == "${path}/resources/img/heart.png"){
 			$.ajax({
 	 			type : "POST",
 	 			url : "${path}/like/add",
 	 			dataType : "text",
 	 			data : JSON.stringify({
 	 				sno : no, 
 	 				uno : uno
 	 			}),
 	 			headers: {
 					"Content-Type": "application/json",
 					"${_csrf.headerName}" : "${_csrf.token}"
 				},
 	 			success : function(data){
 	 				child.attr("src","${path}/resources/img/fullheart.png");
 	 				likeCount(no);
 	 			}
 	 		})
 		}else{
 			$.ajax({
 				type : "POST",
 				url : "${path}/like/remove",
 				dataType : "text",
 				data : JSON.stringify({
 	 				sno : no, 
 	 				uno : uno
 	 			}),
 	 			headers: {
					"Content-Type": "application/json",
					"${_csrf.headerName}" : "${_csrf.token}"
				},
				success : function(data){
					child.attr("src","${path}/resources/img/heart.png");
					likeCount(no);
				}
 			})
 			
 		}
 	});
 	
 	
	function likeCount(sno){
		
		$.ajax({
			type : "POST",
			url : "${path}/like/count",
			dataType : "text",
			data : JSON.stringify({
				sno : sno
			}),
			headers: {
				"Content-Type": "application/json",
				"${_csrf.headerName}" : "${_csrf.token}"
			},
			success : function(result){
				var size = $(".likeBtn").length;
				
				for(i=0;i<size;i++){
					if($(".likeBtn").eq(i).attr("value") == sno){
						$(".likeBtn").eq(i).find(".likes").text(result)
					}
				}
			}
		});
	}
	}
	</script>
</body>
</html>