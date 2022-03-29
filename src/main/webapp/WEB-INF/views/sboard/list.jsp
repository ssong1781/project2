<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>    
<c:set var="path" value="${pageContext.request.contextPath}" scope="session" />    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body, button, dd, div, dl, dt, fieldset, figcaption, figure, form, h1, h2, h3, h4, h5, h6, input, legend, li, ol, p, select, table, td, textarea, th, ul{
	margin:0;
	padding:0;
}
*{
	
}
body{
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
.style_tab_list{
	padding_bottom:17px;
	justify-content: center;
	display: flex;
	-webkit-box-pack: center;
	box-sizing: border-box;
}
.tab_item.tab_on{
	background-color: #222;
    color: #fff;
    font-weight: 700;
    border-radius: 19px;
}
.tab_item{
	padding: 8px 14px;
    min-width: 59px;
    text-align: center;
    font-size: 18px;
    letter-spacing: -.27px;
}
.content{
	padding-top:20px;
	margin: 0 auto;
    max-width: 1280px;
    padding: 0 0 200px;
}
.keyword_bind{
	padding-bottom:10px;
	text-align:center;
}
.trend_keyword{
	display: inline-block;
    padding: 8px 10px;
    border: 1px solid #ebebeb;
    border-radius: 12px;
    font-size: 15px;
    text-align: center;
}
.social_feeds{
	display:flex;
	padding:30px 40px 0;
}
.gutter_item{
	width:28px;
}
.feed_card {
    float: left;
    width: calc(25% - 21px);
    margin: 10px;
    overflow: hidden;
}
.card_box{
    margin-bottom: 3px;
}
.social_img_box{
}
.social_img{
	width:250px;
	height:250px;
	border-radius:10px;
}
.card_detail{
	padding:8px 4px 0;
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
	border:1px solid rgba(34,34,34,.1);
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
}
.product_list{
	padding-top:14px;
}
.product_item{
	
}
.product_link{
	display:flex;
	-webkit-box-align: center;
	align-items: center;
}
.product{
	background-color: rgb(246, 238, 237);
	margin-right: 10px;
    padding-top: 0!important;
    width: 48px;
    height: 48px;
    flex-shrink: 0;
    border-radius: 4px;
    overflow: hidden;
    position: relative;
}
.product_img{
	width:100%;
	position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%,-50%);
    height: auto;
}
.full_width{
	width:100%;
}
.product_name{
	overflow: hidden;
    text-overflow: ellipsis;
    display: -webkit-box;
    -webkit-box-orient: vertical;
    -webkit-line-clamp: 1;
    font-size: 13px;
    letter-spacing: -.07px;
}
.price_box{
	margin-top: 1px;
    font-size: 13px;
    
}
.btn+.btn{
	padding-left: 16px;
}
.icon{
	cursor:pointer;
}



</style>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
</head>
<body>
	<br/>
	<div class="container">
		<div class="social_feed_header">
			<br/>
			<div class="content_title">
			<br/>
				<div class="style_tab_list">
					<a href="list" class="tab_item list tab_on" onclick="" >인기</a>
					<a href="newPost" class="tab_item newPost" onclick="">최신</a>
					<a href="follow" class="tab_item follow" onclick="">팔로잉</a>
				</div>
			</div>
		</div>
		<br/>
		<div class="content">
			<div class="keyword_bind">
				<a href="#" class="trend_keyword">#럭셔리백챌린지</a>
				<a href="#" class="trend_keyword">#데일리룩</a>
				<a href="#" class="trend_keyword">#미니멀룩</a>
				<a href="#" class="trend_keyword">#오뭐신</a>
				<a href="#" class="trend_keyword">#꾸안꾸</a>
			</div>
			<div class="social_feeds">
				<div class="posts">
					<div class="gutter_item"></div>
					<c:forEach items="${allList}" var="vo" varStatus="vs">
					<div class="feed_card" id="feed_card">
						<a href="details?sno=${vo.sno}">
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
										<p class="user_name">${vo.unick}</p>
									</div>
									<p class="text_box">${vo.content}</p>
									<div class="btn_box" value="${vo.sno}">
										<a class="btn like">
											<img src="${path}/resources/img/heart.png"  alt="${vo.sno}" class="icon" id="likeImg">
											<span class="like_count">${vo.heart}</span>
										</a>
										<a href="#" class="btn comment">
											<img src="${path}/resources/img/comment.png" class="icon">
											<span class="comment_count">댓글</span>
										</a>
									</div>
									<!--<div>
										<ul class="product_list">
											<li class="product_item">
												<a href="#" class="product_link">
													<div class="product" style="background-color:rgb(246,238,237);">
														<picture class="product_img">
															<source>
															<source>
															<img src="#" alt="(W) Jordan 1 Retro High OG Lucky Green" class="full-width">
														</picture>
													</div>
													<div class="product_desc">
														<p class="product_name">(W) Jordan 1 Retro High OG Lucky Green</p>
														<div class="price_box">
															<span class="amount">419,000</span>
															<span class="unit">원</span>
														</div>
													</div>
												</a>
											</li>
										</ul>
									</div>-->
								</div>
							</div>
						</a>
					</div>
					</c:forEach>
				</div>
			</div>
		</div>
		<c:if test="${pm.more}">
			<a style="display:none;" href="list?perPageNum=${pm.cri.perPageNum+4}" class="moreView">더보기</a>
		</c:if>
	</div>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>

/* <a href="list" class="tab_item tab_on" onclick="" >인기</a>
	<a href="newPost" class="tab_item" onclick="">최신</a>
	<a href="#" class="tab_item" onclick="">팔로잉</a>
 */
 	
 	urlCheck();
	
	function urlCheck(){
		var url = '${url}';
		console.log(url);
		if(url == '/list'){
			
		}else if(url == '/newPost'){
			$(".list").removeClass("tab_item list tab_on").addClass("tab_item list");
			$(".newPost").removeClass("tab_item newPost").addClass("tab_item newPost tab_on");
			$(".moreView").attr("href","newPost?perPageNum=${pm.cri.perPageNum+4}");
		}else if(url == '/follow'){
			$(".list").removeClass("tab_item list tab_on").addClass("tab_item list");
			$(".follow").removeClass("tab_item follow").addClass("tab_item follow tab_on");
			$(".moreView").attr("href","follow?perPageNum=${pm.cri.perPageNum+4}");
			$(".moreView").removeClass("moreView")
		}
	}
	

	if("${uno}"){
	checkLike();
	
		
	
	// 로그인 유저 좋아요 체크
	function checkLike(){
		
		var uno = '${uno}';	
		
		
		$.ajax({
			type : "POST",
 			url : "like/find",
 			dataType : "json",
 			data : JSON.stringify({
 				uno :uno,
 
 			}),
 			headers : {
 				"Content-Type": "application/json",
 				"${_csrf.headerName}" : "${_csrf.token}"
 			},
 			success : function(data){
 				console.log(data);
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
	
	
	
	$(".like").click(function(){
		var uno = '${uno}';
		var sno = $(this).parent().attr("value");
		var img = $(this).children('img');
		var span = $(this).children('span');
		var count = null;
		
		if(img.attr("src") == "${path}/resources/img/heart.png"){
			$.ajax({
				type : "POST",
 	 			url : "like/add",
 	 			dataType : "text",
 	 			data : JSON.stringify({
 	 				sno : sno, 
 	 				uno : uno
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
 	 			url : "like/remove",
 	 			dataType : "text",
 	 			data : JSON.stringify({
 	 				sno : sno, 
 	 				uno : uno
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
	
	
	var count = "";
	
	
	function likeCount(sno){
		
		$.ajax({
			type : "POST",
			url : "like/count",
			dataType : "text",
			data : JSON.stringify({
				sno : sno
			}),
			headers: {
				"Content-Type": "application/json",
				"${_csrf.headerName}" : "${_csrf.token}"
			},
			success : function(result){
				var size = $(".btn_box").length;
				console.log(result);
				count += result;
				console.log('likeCount console ' +sno);
				for(i=0;i<size;i++){
					if($(".btn_box").eq(i).attr("value") == sno){
						$(".btn_box").eq(i).find(".like_count").text(result)
					}
				}
			}
		});
	}
	}
	
		
	
	$(".moreView").click(function(){
		window.scrollTo();
	});
	
	
	$(window).scroll(function(){
		var dh = $(document).height();
		var wh = $(window).height();
		var st = $(window).scrollTop();
	
		if((wh + st) >= (dh - 10)){
			if($(".moreView").length){
				$(".moreView").get(0).click();	
			}
			
		}
	});
	
</script>	
</body>
</html>