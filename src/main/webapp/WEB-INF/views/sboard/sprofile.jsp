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
<title>Insert title here</title>
<style>
	*{
		margin:0;
		padding:0;
	}
	h2{
	text-align:center;
	}
	.profile{
		text-align: center;
	}
	.userinfo{
		height: 40px;
		list-style: none;
		text-align: center;
		display: flex;
		justify-content: center;
		margin-right: 40px;
		padding-top: 20px;
	}
	.followBtn{
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
	.profileImage{
		width:150px;
		height:150px;
		border-radius:100%;
	}
	.write{
		position:absolute;
		border-radius: 5px;
		border:none;
		left:50%;
  		width:120px;
  		height:30px;
  		margin-top:-15px;
  		margin-left:-60px;
  		line-height:15px;
  		cursor:pointer;
	}
	.modal{ 
  		position:absolute; 
  		width:100%;
  		height:100%; 
  		background: rgba(0,0,0,0.8); 
  		top:0; left:0; 
  		display:none;
	}
	.modal_content{
 		width:400px;
 		height:500px;
  		background:#fff;
  		border-radius:10px;
  		position:relative;
  		top:50%;
  		left:50%;
  		margin-top:-100px;
  		margin-left:-200px;
  		text-align:center;
  		box-sizing:border-box;
  		padding:50px 5px;
  		line-height:23px;
  		cursor:pointer;
	}
	textarea{
		height: 169px;
		width: 315px;
		padding: 10px;
		box-sizing: border-box;
		border: solid 2px lightgray;
		border-radius: 5px;
		font-size: 16px;
		resize: none;
	}
	#viewImage{
		width:100px;
		height:100px;
		display:block;
		content: "";
		border:none;
	}
	
	
	
	
	li, ol, ul {
    list-style: none;
}
p{
    display: block;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
}

a{
	color: inherit;
    -webkit-tap-highlight-color: rgba(0,0,0,.1);
	text-decoration : none;
}
.posts{
	float:left;
	width:calc(25% - 21px);
	overflow:hidden;
	margin:10px;
}
.content{
	padding-top:20px;
	margin: 0 auto;
    max-width: 1280px;
    padding: 0 0 200px;
    /* display:flex; */
}
.social_feeds{
	padding:30px 30px;
}
.gutter_item{
	width:28px;
}
.feed_card{
	float:left;
	overflow:hidden;
	
}
.social_img_box{
	overflow:hidden;
}
.social_img{
	width:250px;
	height:250px;
	border-radius:10px;
	overflow:hidden;
}
.card_detail{
	padding:8px 4px 0;
	height:130px;
}
.user_box{
	display:flex;
	-webkit-box-align:center;
	align-items:center;
}
.img_profile{
	width:28px;
	height:28px;
	border-radius:100%;
	/* border:1px solid rgba(34,34,34,.1); */
	object-fit:cover;
}
.user_name{
	overflow:hidden;
	text-overflow:ellipsis;
	padding-left:4px;
	white-space:nowrap;
	font-size:15px;
	letter-spacing:-.15px;
	color:rgba(34,34,34,.8);
}
.text_box{
	margin-top: 4px;
    display: -webkit-box;
    -webkit-line-clamp: 2;
    -webkit-box-orient: vertical;
    line-height: 20px;
    font-size: 14px;
    letter-spacing: -.21px;
    max-height: 40px;
    overflow:hidden;
    text-overflow:ellipsis;
}
.btn{
	font-size:15px;
	color:rgba(34,34,34,.5);
}
.btn,.btn_box{
	display:flex;
	-webkit-box-align: center;
	align-items: center;
}
.btn_box{
	margin-top: 14px;
    height: 20px;
}
.social-like-gray-sm{
	width:20px;
	height:20px;
}
.like_count{
	padding-left:3px;
	margin-right:5px;
}
#removeImage{
	display: inline-block;
	border-radius:.25em;
	background-color: lightgray;
	line-height: normal;
	color: #fff;
	padding: .5em .75em;
	border-bottom-color: #2e6da4;
	border:none;
	font-size: inherit;
}
.imgreg label{
	display: inline-block;
	padding: .5em .75em;
	color: #fff;
	font-size: inherit;
	line-height: normal;
	/* vertical-align: middle; */
	background-color: #337ab7;
	cursor: pointer;
	border-bottom-color: #2e6da4;
	border-radius: .25em;
}
.imgreg input[type="file"]{
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip:rect(0,0,0,0);
	border: 0;
}
#writeBtn{
	display: inline-block;
	border-radius:.25em;
	background-color:#337ab7;
	line-height: normal;
	color: #fff;
	padding: .5em .75em;
	border-bottom-color: #2e6da4;
	border:none;
	font-size: inherit;
	cursor:pointer;
}
.closebtn{
	display: inline-block;
	border-radius:.25em;
	background-color: red;
	line-height: normal;
	color: #fff;
	padding: .5em .75em;
	border-bottom-color: #2e6da4;
	border:none;
	font-size: inherit;
	cursor:pointer;
}
#follow{
	background-color:lightgray;
	color:black;
}
#viewImage{
	display:center;
}
.followerModal{
	position:absolute; 
  	width:100%;
  	height:100%; 
  	background: rgba(0,0,0,0.8); 
  	top:0; left:0; 
  	display:none;
}
.followModal{
	position:absolute; 
  	width:100%;
  	height:100%; 
  	background: rgba(0,0,0,0.8); 
  	top:0; left:0; 
  	display:none;
  	
}
.followModal_list{
	width:448px;
 	height:500px;
  	background:#fff;
  	border-radius:10px;
  	position:relative;
  	top:30%;
  	left:50%;
  	margin-top:-100px;
  	margin-left:-200px;
  	/* text-align:center; */
  	box-sizing:border-box;
  	padding:0 20px 5px;
  	line-height:23px;
  	overflow:hidden;
}
.sboard{
	cursor:pointer;
}
.following{
	cursor:pointer;
}
.follower{
	cursor:pointer;
}

.layer_header .title{
	line-height: 22px;
    padding: 18px 50px 20px;
    min-height: 60px;
    font-size: 18px;
    letter-spacing: -.27px;
    font-weight: 700;
    letter-spacing: -.15px;
    color: #000;
    text-align: center;
    background-color: #fff;
    
}
.count{
    letter-spacing: -.09px;
    font-weight: 700;
    font-size: 18px;
}
.followModal_close{
	border:none;
	display:inline-block;
	background-color:white;
	float:right;
	position: relative;
	top:-80px;
	
}
.followModal_close_btn{
	background-color:white;
	cursor:pointer;
	border:none;
	
	
}
.layer_content{
	max-height: 388px;
    margin-bottom: 32px;
}
ul li{
	list-style: none;
}
.follow_list{
	overflow-y: auto;
    overflow-x: hidden;
    min-height: 388px;
    max-height: 388px;
    padding: 0 32px;
}
.follow_box{
	padding-top: 0;
	
}
.user_link{
	display:flex;
	-webkit-box-align: center;
	align-items: center;
    margin-right: 10px;
}
.img_box{
	overflow: hidden;
    position: relative;
    flex-shrink: 0;
    margin-right: 12px;
    width: 44px;
    height: 44px;
    border-radius: 100%;
}
.profile_img{
	width: 100%;
    height: 100%;
    border-radius:100%;
    object-fit: cover;
}
.info_box{
	display: flex;
    -webkit-box-orient: vertical;
    -webkit-box-direction: normal;
    flex-direction: column;
}
.user_name{
	display: inline-flex;
    -webkit-box-align: center;
    align-items: center;
    font-size: 14px;
    font-weight: 600;
    letter-spacing: -.33px;
}
.user_name_text{
	overflow: hidden;
    text-overflow: ellipsis;
    max-width: 200px;
}
.user_subname{
    margin-top: 2px;
    font-size: 12px;
    letter-spacing: -.33px;
    color: rgba(34,34,34,.5);
}
.btn.btn_follow.solid{
    line-height: 30px;
    border:none;
    border-radius:5px;
    position: relative;
    left:300px;
    top:-50px;
}

ul{
	margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    padding-inline-start: 40px;
}
.following .follower .sboard{
    margin-right: 4px;
    font-size: 16px;
    letter-spacing: -.16px;
    letter-spacing: -.24px;
}
.menu_count{
    font-size: 16px;
    font-weight: 700;
}

</style>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<sec:authorize access="isAuthenticated()">
	<sec:authentication var="member" property="principal.member"/>
</sec:authorize>
</head>
<br/>
<br/>
<body>
	<div>
		<div class="profile">
			<div>
				<c:choose>
					<c:when test="${!empty userInfo.user_img}">
						<img id="profileImage" class="profileImage" src="${path}/upload/profile/${userInfo.uid}/${userInfo.user_img}"/>
					</c:when>
					<c:otherwise>
						<img id="profileImage" class="profileImage" src="${path}/resources/img/profile.jpg"/>
					</c:otherwise>
				</c:choose>
			</div>
			<div>
				<input type="hidden" value="${userInfo.uno}" id="mynum"/> <!-- 로그인한 번호 -->
				${userInfo.unick}
			</div>
			<br/>
			<div>
				<c:choose>
					<c:when test="${userInfo.uno ne member.uno}">
						<button type="button"  class="followBtn" value="${userInfo.uno}">팔로우</button>
					</c:when>
					<c:otherwise>
					</c:otherwise>
				</c:choose>
			</div>
			<div>
				<ul class="userinfo">
					<li>
						<span class="sboard">게시글</span><span class="menu_count">${profileTC}&nbsp;</span>
					</li>
					<li>
						<span class="follower">팔로워</span><span class="menu_count">${followerTC}&nbsp;</span>
					</li>
					<li>
						<span class="following">팔로잉</span><span class="menu_count">${followingTC}&nbsp;</span>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<c:if test="${member.uno eq userInfo.uno}">
		<button class="write">피드 등록</button>
	</c:if>
	<div class="modal">
		<div class="modal_content" title="전송시 창이 닫힙니다.">
			<div>
				<div><h2>피드등록</h2></div>
				<br/>
    			<form action="${path}/register" id="registerForm" enctype="multipart/form-data" method="POST">
    				<input type="hidden" name="uid" value="${member.uid}"/><!-- 여기에 sessionScope 넣어둔 유저아이디 -->
					<input type="hidden" name="uno" value="${member.uno}"/><!-- 유저번호 -->
					<sec:csrfInput/>
    				<div class="imgreg">
    					<div class="imgbox"><img src="" alt="" id="viewImage" style="display:none;" ></div>
    					<div>
    						<label for="uploadImage">이미지</label>
    						<input type="file" id="uploadImage" name="uploadImage" accept="image/*" multiple = "multiple" required/>
							<input type="button" id="removeImage" value="지우기" />
    					</div>
    				</div>
        			<div>
        				
        			</div>
        			<div>
            			<textarea name="content" id="content" rows="10" cols="20"></textarea>
        			</div>
        			<div>
        				<label for="product">태그제품</label>
            				<input type="text" name="product" id="product" list="product_tag"/>
            				<datalist id="product_tag">
            					<option value="덩크로우"/>
            					<option value="덩크하이"/>
            				</datalist>
        			</div>
        			<br/>
       				<div>
        				<input type="submit" id="writeBtn" value="등록"/>
						<input type="button" class="closebtn" value="취소"/> 
        			</div>
    			</form>
			</div>
		</div>
	</div>
	<div class="followModal">
		<div class="followModal_list">
			<div class="layer_header">
				<h2 class="title">팔로잉 ${followingTC}<span class="count"></span></h2>
				<button class="followModal_close">
					<img class="followModal_close_btn" src="${path}/resources/img/x.png">
				</button>
				
			</div>
			<div class="layer_content">
				<div class="user_list_content">
					<ul class="follow_list">
					<c:choose>
						<c:when test="${!empty flist && followingTC != 0}">
						<c:forEach items="${flist}" var="fo">
						
						<li class="follow_user">
							<div class="follow_box">
								<a class="user_link" href="${path}/sprofile/${fo.ufollower}">
									<div class="img_box">
									<c:choose>
										<c:when test="${!empty fo.user_img}">
											<img class="profile_img" src="${path}/upload/profile/${fo.uid}/${fo.user_img}"/>
										</c:when>
										<c:otherwise>
											<img class="profile_img" src="${path}/resources/img/profile.jpg"/>
										</c:otherwise>
									</c:choose>
									</div>
									<div class="info_box">
										<span class="user_name">
											<span class="user_name_text">${fo.unick}</span>
										</span>
										<span class="user_subname">닉네임밑에 소개</span>
									</div>
								</a>
								<%-- <button class="btn btn_follow solid small" value="${fo.ufollower}">팔로우</button> --%>
							</div>	
						</li>
						</c:forEach>
						</c:when>
						<c:otherwise>
							<li>
								팔로우하는 사용자가 없다.
							</li>
						</c:otherwise>
						</c:choose>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div class="followerModal">
		<div class="followModal_list">
			<div class="layer_header">
				<h2 class="title">팔로워 ${followerTC}<span class="count"></span></h2>
				<button class="followModal_close">
					<img class="followModal_close_btn" src="${path}/resources/img/x.png">
				</button>
				
			</div>
			<div class="layer_content">
				<div class="user_list_content">
					<ul class="follow_list">
					<c:choose>
						<c:when test="${!empty followerList && totalCount != 0}">
						<c:forEach items="${followerList}" var="fo">
						
						<li class="follow_user">
							<div class="follow_box">
								<a class="user_link" href="${path}/sprofile/${fo.uno}">
									<div class="img_box">
									<c:choose>
										<c:when test="${!empty fo.user_img}">
											<img class="profile_img" src="${path}/upload/profile/${fo.uid}/${fo.user_img}"/>
										</c:when>
										<c:otherwise>
											<img class="profile_img" src="${path}/resources/img/profile.jpg"/>
										</c:otherwise>
									</c:choose>
									</div>
									<div class="info_box">
										<span class="user_name">
											<span class="user_name_text">${fo.unick}</span>
										</span>
										<span class="user_subname">닉네임밑에 소개</span>
									</div>
								</a>
								<%-- <button class="btn btn_follow solid small" value="${fo.ufollower}">팔로우</button> --%>
							</div>	
						</li>
						</c:forEach>
						</c:when>
						<c:otherwise>
							<li>
								팔로우하는 사용자가 없다.
							</li>
						</c:otherwise>
						</c:choose>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<br/>
	<hr/>
	<div class="container">
		<div class="social_feed_header">
		<br/>
			<div class="content_title">
			<br/>
			</div>
		</div>
		<br/>
		<div class="content">
			<div class="social_feeds">
				<c:forEach items="${list}" var="vo" varStatus="vs">
				<div class="posts">
					<div class="gutter_item"></div>
					
					<div class="feed_card" id="feed_card">
						<%-- <a href="${path}/details?sno=${vo.sno}"> --%>
						<a href="${path}/sprofile/${vo.uno}/details?sno=${vo.sno}">
							<div class="card_box">
								<div class="social_img_box">
									<img src="${path}/resources/upload/img/${vo.uid}/${vo.s_img}" alt="이미지" class="social_img">
								</div>
								<div class="card_detail">
									<div class="user_box">
										<c:choose>
											<c:when test="${empty vo.user_img}">
												<img src="${path}/resources/img/profile.jpg" alt="사용자 프로필" class="img_profile">
											</c:when>
											<c:otherwise>
												<img src="${path}/upload/profile/${vo.uid}/${vo.user_img}" alt="사용자 프로필" class="img_profile">	
											</c:otherwise>
										</c:choose>
										<%-- <img src="${path}/resources/img/profile.jpg" alt="사용자 프로필" class="img_profile"> --%>
										<p class="user_name">${vo.unick}</p>
									</div>
									<p class="text_box">${vo.content}</p>
									<div class="btn_box" value="${vo.sno}">
										<a class="btn like">
											<img src="${path}/resources/img/heart.png" class="icon" id="likeImg">
											<span class="like_count">${vo.heart}</span>
										</a>
										<a href="#" class="btn comment">
											<img src="${path}/resources/img/comment.png" class="icon">
											<span class="comment_count">댓글 수</span>
										</a>
									</div>
								</div>
							</div>
						</a>
					</div>
				</div>
				</c:forEach>
			</div>
		</div>
	</div>
	
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script>var contextPath = '${path}';</script>
	<script>
		followCheck();
		checkLike();
	
		$(function(){
			$(".following").click(function(){
				$(".followModal").fadeIn();
			});
			$(".followModal_close").click(function(){
				$(".followModal").fadeOut();
			});
		});
		
		$(function(){
			$(".follower").click(function(){
				$(".followerModal").fadeIn();
			});
			$(".followModal_close").click(function(){
				$(".followerModal").fadeOut();
			});
		});
	
	
		$(function(){ 
		  $(".write").click(function(){
		  	$(".modal").fadeIn();
		  });
		  
		  $(".closebtn").click(function(){
		    $(".modal").fadeOut();
		  });
		  
		});
		
		$("#uploadImage").on("change",function(){
			var files = $(this)[0].files[0];
			console.log(files.type);
			if(!files.type.startsWith("image/")){
				console.log("이미지 아님");
				alert('이미지를 선택해주세요.');
				removeImage();
			}else{
				console.log("이미지 맞음");
				var path = window.URL.createObjectURL(files);
				$("#viewImage").attr("src",path);
			}
		});
		
		$("#removeImage").click(function(){
			removeImage();
			$("#viewImage").attr("style",'display:none;');
		});
		
		function removeImage(){
			$("#uploadImage").val("");
			$("#viewImage").attr("src","");
		}
		
		if("${member.uno}"){
		$(".followBtn").click(function(){
	 		
	 		if($(this).html() == '팔로우'){
	 			var check = true;
	 		}else{
	 			var check = false;
	 		}
	 		
	 		follow(check);
	 	});
		}
	 	
	 	
	 	function follow(check){
	 		var ufollower = '${userInfo.uno}';
	 		var uno = '${member.uno}';
	 		console.log(ufollower+'팔로우 당할 회원번호');
	 		console.log(uno+'팔로우 신청한 로그인한 회원번호');
	 		if(check){
	 			$.ajax({
	 				type : 'POST',
	 				url : '${path}/fo/follow',
	 				data : JSON.stringify({
	 					uno : uno, 
	 					ufollower : ufollower,
	 					'${_csrf.parameterName}' : '${_csrf.token}'
	 				}),
	 				dataType : "text", 
	 				headers: {
	 					"Content-Type": "application/json","${_csrf.headerName}" : "${_csrf.token}"
	 				},
	 				success : function(result){
	 					console.log("result : "+result);
	 					if(result == "followOK"){
	 						$(".followBtn").html("언팔로우");
	 						$(".followBtn").attr("id","follow");
	 						/* location.href="details?sno=${sno}" */
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
	 					ufollower : ufollower,
	 					'${_csrf.parameterName}' : '${_csrf.token}'
	 				}),
	 				dataType : "text", 
	 				headers: {
	 					"Content-Type": "application/json","${_csrf.headerName}" : "${_csrf.token}",
	 				},
	 				success : function(result){
	 					console.log("result : "+result);
	 					if(result == "unfollowOK"){
	 						$(".followBtn").html("팔로우");
	 						$(".followBtn").attr("id","");
	 						/* location.href="details" */
	 					}
	 				}
	 			});
	 		}
	 	}
	 	
	 	
	 	$(function(){
	 		$("#uploadImage").change(function(){
	 			$("#viewImage").attr("style","display=''");
	 		});
	 	});
	 	
	 	
	 	function followCheck(){
	 		var loginuno =  '${member.uno}';
	 		console.log('loginnuo'+ loginuno);
	 		
	 		var postuno =  $(".followBtn").val();
	 		console.log('postuno '+postuno);
	 		$.ajax({
	 			type : "POST",
	 			url : "${path}/fo/checkProfile",
	 			dataType : "text",
	 			data : JSON.stringify({
	 				uno : loginuno, 
	 				ufollower : postuno,
	 				'${_csrf.parameterName}' : '${_csrf.token}'
	 			}),
	 			headers : {"Content-Type": "application/json","${_csrf.headerName}" : "${_csrf.token}"},
	 			success : function(data){
	 				console.log(data);
	 				if(data > 0){
	 					$(".followBtn").html("언팔로우");
	 				}
	 			}
	 		});
	 		
	 	}
	 	
	 	function checkLike(){
			var uno = '${member.uno}';
			$.ajax({
				type : "POST",
	 			url : "${path}/like/find",
	 			dataType : "json",
	 			data : JSON.stringify({
	 				uno :uno,
	 				'${_csrf.parameterName}' : '${_csrf.token}'
	 			}),
	 			headers : {"Content-Type": "application/json","${_csrf.headerName}" : "${_csrf.token}"},
	 			success : function(data){
	 				console.log('????????????  '+data);
	 				var size = $(".btn_box").length;
	 				
	 				$(data.list).each(function(){
	 					for(i=0;i<size;i++){
	 						if($(".btn_box").eq(i).attr("value") == this.sno){
	 							$(".btn_box").eq(i).find("#likeImg").attr("src","${path}/resources/img/fullheart.png");
	 						}
	 					}
	 				});
	 			}
			});
		}
	 	
	 	function likeCount(sno){
			
			$.ajax({
				type : "POST",
				url : "${path}/like/count",
				dataType : "text",
				data : JSON.stringify({
					sno : sno,
					'${_csrf.parameterName}' : '${_csrf.token}'
				}),
				headers: {"Content-Type": "application/json","${_csrf.headerName}" : "${_csrf.token}"},
				success : function(result){
					var size = $(".btn_box").length;
					console.log(result);
					//count += result;
					console.log('likeCount console ' +sno);
					for(i=0;i<size;i++){
						if($(".btn_box").eq(i).attr("value") == sno){
							$(".btn_box").eq(i).find(".like_count").text(result)
						}
					}
				}
			});
		}
	 	
	 	if("${member.uno}"){
	 		console.log("${member.uno}"+"asdasjdklasfnlsafnsalkfdsf");
	 	$(".like").click(function(){
			var uno = '${member.uno}';
			var sno = $(this).parent().attr("value");
			var img = $(this).children('img');
			var span = $(this).children('span');
			var count = null;
			
			if(img.attr("src") == "${path}/resources/img/heart.png"){
				$.ajax({
					type : "POST",
	 	 			url : "${path}/like/add",
	 	 			dataType : "text",
	 	 			data : JSON.stringify({
	 	 				sno : sno, 
	 	 				uno : uno,
	 	 				'${_csrf.parameterName}' : '${_csrf.token}'
	 	 			}),
	 	 			headers: {
	 						"Content-Type": "application/json",
	 						"${_csrf.headerName}" : "${_csrf.token}"
	 				},
	 				success : function(data){
	 					console.log(data);
	 					img.attr("src","${path}/resources/img/fullheart.png");
						likeCount(sno); 					
	 					
	 					
	 				}
				});
			}else{
				$.ajax({
					type : "POST",
	 	 			url : "${path}/like/remove",
	 	 			dataType : "text",
	 	 			data : JSON.stringify({
	 	 				sno : sno, 
	 	 				uno : uno,
	 	 				'${_csrf.parameterName}' : '${_csrf.token}'
	 	 			}),
	 	 			headers: {
	 						"Content-Type": "application/json",
	 						"${_csrf.headerName}" : "${_csrf.token}"
	 				},
	 				success : function(data){
	 					console.log(data);
	 					img.attr("src","${path}/resources/img/heart.png");
	 					likeCount(sno);
	 					
	 				}
				});
			}
		});
	 	}
	 	
		
		
	</script>
	
</body>
</html>