<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>플렉스 FLEX </title>
<%-- <link href="${path}/resources/css/lightslider.css" rel="stylesheet"/>
<script src="${path}/resources/js/lightslider.js"></script> --%>
<link href="${path}/resources/css/brand.css?after" rel="stylesheet"/>
<link href="${path}/resources/css/slidebox.css?after" rel="stylesheet"/>
<link href="${path}/resources/css/product.css?after" rel="stylesheet"/>
<link href="${path}/resources/css/style.css" rel="stylesheet"/>
<link rel="shortcut icon" href="${path}/resources/img/favicons.ico" type="image/x-icon">
<style>
	
	section{
		padding-top:60px; 
	}
	
	a{
	
		text-decoration: none;
	}
	
	header{
		position: fixed;
		width:100%;
		z-index:100;
		top:0;
		left:0;
		right:0;
	}
	
/*  	div{
		border:1px solid black;
	}    */

	* {
	margin:0;
	padding:0; 
	box-sizing:border-box;
}
	
	ul, li{
		list-style:none;
		
	}
	
	
	.sub_title{
		padding-left: 60px;
	}
	
	.btn_add{
		
		height: 42px;
		line-height: 40px;
		border-radius: 12px;
		font-size: 14px;
		border:1px solid #d3d3d3;
		color: rgba(34,34,34,.8);
		padding:0 30px;
	}

	.prev{
		
		position:relative;
		bottom:350px;
		float:left;
		left:10px;
		background-color:#5F5F5F;
		background-image: url('${path}/resources/img/left-arrow.png');
		background-position:center center;
		background-size: 50%;
		background-repeat: no-repeat; 
		border-radius:50px;
		width:50px;
		height: 50px;
		cursor:pointer;
	
	}
	
	.next{
		
		position:relative;
		bottom:350px;
		float:right;
		right:10px;
		background-color:#5F5F5F;
		background-image: url('${path}/resources/img/right-arrow.png');
		background-position:center center;
		background-size: 50%;
		background-repeat: no-repeat; 
		border-radius:50px;
		width:50px;
		height: 50px;
		cursor:pointer;
		border: none;
	}
	
	.banner{
		width:100%;
		justify-content: center;
		align-items:center; 
	}
	
	.banner1{
		width:100%;
		height:450px;
/* 		background-image:url("${path}/resources/img/banner_img1.jpg");
		background-size:100%;
		position:relative; */
		/* left:350px;  */

	}
	
	.banner1 img{
		width:100%;
		height: 450px;
	}
	
	.banner2 img{
		width:100%;
		height: 450px;
	}
	
	.banner3 img{
		width:100%;
		height: 450px;
	}
	
	.banner_box{
	
		width:100%;
	}
	
	.banner2{
		width:100%;
		height:450px;
/* 		background-image:url("${path}/resources/img/banner_img2.PNG");
		background-size:100%;	 */
		
	}
	
	.banner3{
		width:100%;
		height:450px;
	/* 	background-image:url("${path}/resources/img/banner_img3.png");
		background-size:100%;	
		background-repeat: 90% */

	}
	
	.imgs{
		width: 297px;
		height: 259px;
		background-color: #EFF5FB;
	}
	

	
</style>
</head>
<body>		
			<header>
			<jsp:include page="/WEB-INF/views/common/header.jsp"/>
			
			</header>
			

			
			<main>
			<section>
					
			<br/>
			<br/>
			<br/>
			<!-- slide -->
			<div class="slidebox">
				<input type="radio" name="slide" id="slide01" checked/>
				<input type="radio" name="slide" id="slide02" />
				<input type="radio" name="slide" id="slide03" />
				<input type="radio" name="slide" id="slide04" />
				<ul class="slidelist">
					<li class="slideitem">
						<div>
							<label for="slide04" class="left"></label>
							<label for="slide02" class="right"></label>
							<a><div class="img1"></div></a>
						</div>
					</li>
					<li class="slideitem">
						<div>
							<label for="slide01" class="left"></label>
							<label for="slide03" class="right"></label>
							<a><div class="img2"></div></a>
						</div>
					</li>
					<li class="slideitem">
						<div>
							<label for="slide02" class="left"></label>
							<label for="slide04" class="right"></label>
							<a><div class="img3"></div></a>
						</div>
					</li>
					<li class="slideitem">
						<div>
							<label for="slide03" class="left"></label>
							<label for="slide01" class="right"></label>
							<a><div class="img4"></div></a>
						</div>
					</li>
				</ul>
			</div>
			
			<br/>
			<br/>
			<br/>
			
			<div>
				<div class="banner">
					<a href="#"><div class="banner1">
					<img src="${path}/resources/img/banner_img1.jpg" alt="1">
					</div></a>
				</div>		
			</div>
			
				
				<div>
					<div class="sub_title">
						<h1>모두의 신발</h1>
						<h3>shoes</h3>
					</div>
				</div>
			<div class="product_box">
				<div class="product_list">
					<div class="product_inner1">
						<div class="product1">
							<img class="imgs" src="${path}/resources/product_img/Jordan 1 x Travis Scott x Fragment Retro Low OG SP Military Blue_1.png">
						</div>
						<div class="product_ex">
							<div class="product_brand"><p class="brand_text">Jordan</p></div>
							<div class="product_name"><p class="brand_name">Jordan 1 x Travis Scott x Fragment Retro Low OG SP Military Blue</p></div>
							<div class="product_price">
								<p class="product_num">2,300,000</p>
								<span class="product_won">원</span>
							</div>
						<div class="product_now"><p class="brand_gumae">즉시 구매가</p></div>
						
						</div>
					</div>
					<div class="product_inner2">
						<div class="product2">
							<img class="imgs" src="${path}/resources/product_img/Nike x Kasina Dunk Low 80s Bus_1.png">
						</div>
					<div class="product_ex">
						<div class="product_brand"><p class="brand_text">Nike</p></div>
						<div class="product_name"><p class="brand_name">Nike x Kasina Dunk Low 80's Bus</p></div>
						<div class="product_price">
							<p class="product_num">1,700,000</p>
							<span class="product_won">원</span>
						</div>
							<div class="product_now"><p class="brand_gumae">즉시 구매가</p></div>
						
						</div>
					</div>
					<div class="product_inner3">
						<div class="product3">
							<img class="imgs" src="${path}/resources/product_img/Y-3 Yohji Star Black White_1.png">
						</div>
					<div class="product_ex">
						<div class="product_brand"><p class="brand_text">Y-3</p></div>
						<div class="product_name"><p class="brand_name">Y-3 Yohji Star Black White</p></div>
						<div class="product_price">
							<p class="product_num">640,000</p>
							<span class="product_won">원</span>
						</div>
							<div class="product_now"><p class="brand_gumae">즉시 구매가</p></div>
						
						</div>
					</div>
					<div class="product_inner4">
						<div class="product4">
							<img class="imgs" src="${path}/resources/product_img/Balenciaga Triple S Black Clear Sole 2019_1.png">
						</div>
					<div class="product_ex">
						<div class="product_brand"><p class="brand_text">Balenciaga</p></div>
						<div class="product_name"><p class="brand_name">Balenciaga Triple S Black Clear Sole 2019</p></div>
						<div class="product_price">
							<p class="product_num">430,000</p>
							<span class="product_won">원</span>
						</div>
							<div class="product_now"><p class="brand_gumae">즉시 구매가</p></div>
						
						</div>
					</div>
				</div>
			</div>
			<div class="btn_product">
				<a href="#" class="btn_add">더보기</a>
			
			</div>
				<div>
					<div class="sub_title">
						<h1>Style Pick!</h1>
						<br/>
					</div>
				</div>
			
 	<div class="style_board">		
		<ul id="autoWidth" class="cs_hidden">
			<li class="item_a">
				<div class="style_total">
					<div class="style_div">
						<div class="style_img">
							<img src="${path}/resources/styles/s1.PNG" alt="1">
					<div class="overlay">
						<!-- buy_btn -->
						<a href="#" class="buy_btn">Buy now</a>
					</div>
				</div>
					<div class="detail_box">
						<div class="type">
							<a href="#"> @its_coolwater</a>
							<span>아디다스</span>
						</div>
							<a href="#" class="price"></a>
					</div>
					</div>	
				</div>
			</li>
			<li class="item_b">
					<div class="style_div">
						<div class="style_img">
							<img src="${path}/resources/styles/s2.PNG" alt="2">
					<div class="overlay">
						<!-- buy_btn -->
						<a href="#" class="buy_btn">Buy now</a>
					</div>
				</div>
					<div class="detail_box">
						<div class="type">
							<a href="#">@kimjaeguan</a>
							<span>골든구스</span>
						</div>
							<a href="#" class="price"></a>
					</div>
					</div>	
			</li>
			<li class="item_c">
					<div class="style_div">
						<div class="style_img">
							<img src="${path}/resources/styles/s3.PNG" alt="3">
					<div class="overlay">
						<!-- buy_btn -->
						<a href="#" class="buy_btn">Buy now</a>
					</div>
				</div>
					<div class="detail_box">
						<div class="type">
							<a href="#">@sim</a>
							<span>아디다스</span>
						</div>
							<a href="#" class="price"></a>
					</div>
					</div>	
			</li>
			<li class="item_d">
					<div class="style_div">
						<div class="style_img">
							<img src="${path}/resources/styles/s4.PNG" alt="4">
					<div class="overlay">
						<!-- buy_btn -->
						<a href="#" class="buy_btn">Buy now</a>
					</div>
				</div>
					<div class="detail_box">
						<div class="type">
							<a href="#">@lumen0560</a>
							<span>휠라</span>
						</div>
							<a href="#" class="price"></a>
					</div>
					</div>	
			</li>
			<li class="item_e">
					<div class="style_div">
						<div class="style_img">
							<img src="${path}/resources/styles/s5.PNG" alt="5">
					<div class="overlay">
						<!-- buy_btn -->
						<a href="#" class="buy_btn">Buy now</a>
					</div>
				</div>
					<div class="detail_box">
						<div class="type">
							<a href="#">@zerosliver_</a>
							<span>반스</span>
						</div>
							<a href="#" class="price"></a>
					</div>
					</div>	
			</li>
			<li class="item_f">
					<div class="style_div">
						<div class="style_img">
							<img src="${path}/resources/styles/s6.PNG" alt="6">
					<div class="overlay">
						<!-- buy_btn -->
						<a href="#" class="buy_btn">Buy now</a>
					</div>
				</div>
					<div class="detail_box">
						<div class="type">
							<a href="#">@soybeen</a>
							<span>아디다스</span>
						</div>
							<a href="#" class="price"></a>
					</div>
					</div>	
			</li>
			<li class="item_g">
					<div class="style_div">
						<div class="style_img">
							<img src="${path}/resources/styles/s9.jpg" alt="7">
					<div class="overlay">
						<!-- buy_btn -->
						<a href="#" class="buy_btn">Buy now</a>
					</div>
				</div>
					<div class="detail_box">
						<div class="type">
							<a href="#">@gray.hood</a>
							<span>조던</span>
						</div>
							<a href="#" class="price"></a>
					</div>
					</div>	
			</li>
			<li class="item_h">
					<div class="style_div">
						<div class="style_img">
							<img src="${path}/resources/styles/s8.PNG" alt="8">
					<div class="overlay">
						<!-- buy_btn -->
						<a href="#" class="buy_btn">Buy now</a>
					</div>
				</div>
					<div class="detail_box">
						<div class="type">
							<a href="#">@allneed</a>
							<span>나이키</span>
						</div>
							<a href="#" class="price"></a>
					</div>
					</div>	
			</li>
		</ul>

	</div>
			<!-- <p class="controls"></p> -->
			<div>
				<label class="prev"></label>
				<button class="next"></button>
			</div>
		
			<div class="btn_product">
				<a href="#" class="btn_add">더보기</a>
			
			</div>
		 	<div class="shortcut_collection">
				<div class="sub_title">
					<h1>모두가 좋아하는 브랜드</h1>
					<h3>Brand Focus</h3>
				</div>
				<div class="shortcut_items_wrap">
					<div class="shortcut_items">
						<div  class="shortcut_item">
							<div class="shortcut_item_img_wrap">
								<a href="#"><figure class="shortcut_item_img_bg">
									<img src="${path}/resources/brandimg/b1.jpg">
								</figure>
								</a>
							
							</div>
							<p class="brand_title">에르메스</p>
						</div>
						<div  class="shortcut_item">
							<div class="shortcut_item_img_wrap">
								<a href="#">
								<figure class="shortcut_item_img_bg">
									<img src="${path}/resources/brandimg/b2.jpg">
								</figure>
								</a>
							
							</div>
							<p class="brand_title">샤넬</p>
						</div>
						<div  class="shortcut_item">
							<div class="shortcut_item_img_wrap">
								<a href="${path}/pboard/listPage?keyword=Louis Vuitton&brand=Louis Vuitton">
								<figure class="shortcut_item_img_bg">
									<img src="${path}/resources/brandimg/b3.jpg">
								</figure>
								</a>
							
							</div>
							<p class="brand_title">루이비통</p>
						</div>
						<div  class="shortcut_item">
							<div class="shortcut_item_img_wrap">
								<a href="#">
								<figure class="shortcut_item_img_bg">
									<img src="${path}/resources/brandimg/b4.jpg">
								</figure>
								</a>
							
							</div>
							<p class="brand_title">보테가베네타</p>
						
						</div>
						<div  class="shortcut_item">
							<div class="shortcut_item_img_wrap">
								<a href="#">
								<figure class="shortcut_item_img_bg">
									<img src="${path}/resources/brandimg/b5.jpg">
								</figure>
								</a>
							
							</div>
							<p class="brand_title">셀린느</p>
						</div>
					</div>
					<div class="shortcut_items">
						<div  class="shortcut_item">
							<div class="shortcut_item_img_wrap">
								<a href="#">
								<figure class="shortcut_item_img_bg">
									<img src="${path}/resources/brandimg/b6.jpg">
								</figure>
								</a>
							
							</div>
							<p class="brand_title">고야드</p>
						</div>
						<div  class="shortcut_item">
							<div class="shortcut_item_img_wrap">
								<a href="#">
								<figure class="shortcut_item_img_bg">
									<img src="${path}/resources/brandimg/b7.jpg">
								</figure>
								</a>
							
							</div>
							<p class="brand_title">아크테릭스</p>
						</div>
						<div  class="shortcut_item">
							<div class="shortcut_item_img_wrap">
								<a href="#">
								<figure class="shortcut_item_img_bg">
									<img src="${path}/resources/brandimg/b8.jpg">
								</figure>
								</a>
							
							</div>
							<p class="brand_title">르메르</p>
						</div>
						<div  class="shortcut_item">
							<div class="shortcut_item_img_wrap">
								<a href="#">
								<figure class="shortcut_item_img_bg">
									<img src="${path}/resources/brandimg/b9.jpg">
								</figure>
								</a>
							
							</div>
							<p class="brand_title">텔파</p>
						</div>
						<div  class="shortcut_item">
							<div class="shortcut_item_img_wrap">
								<a href="#">
								<figure class="shortcut_item_img_bg">
									<img src="${path}/resources/brandimg/b10.jpg">
								</figure>
								</a>
							
							</div>
							<p class="brand_title">폴로</p>
						</div>
					</div>
				</div>
			</div>
			<div>
			<br/>
			<br/>
			<br/>
			<div>
				<div class="banner_box">
					<a href="#"><div class="banner2">
					<img src="${path}/resources/img/banner_img2.PNG" alt="2">
					</div></a>
				</div>		
			</div>
			
			<br/>
			<br/>
			<br/>
			
			<div class="sub_title">
						<h1>모두의 의상</h1>
						<h3>Dress</h3>
					</div>
				</div>
			<div class="product_box">
				<div class="product_list">
					<div class="product_inner1">
						<div class="product1">
							<img src="${path}/resources/product/p1.png">
						</div>
					<div class="product_ex">
						<div class="product_brand"><p class="brand_text">Kenzo</p></div>
						<div class="product_name"><p class="brand_name">Kenzo Boke Flower Crewneck Sweatshirt Off White</p></div>
						<div class="product_price">
							<p class="product_num">790,000</p>
							<span class="product_won">원</span>
						</div>
							<div class="product_now"><p class="brand_gumae">즉시 구매가</p></div>
						
						</div>
					</div>
					<div class="product_inner2">
						<div class="product2">
							
						</div>
					<div class="product_ex">
						<div class="product_brand"><p class="brand_text">Kenzo</p></div>
						<div class="product_name"><p class="brand_name">Kenzo Boke Flower Crewneck Sweatshirt Off White</p></div>
						<div class="product_price">
							<p class="product_num">790,000</p>
							<span class="product_won">원</span>
						</div>
							<div class="product_now"><p class="brand_gumae">즉시 구매가</p></div>
						
						</div>
					</div>
					<div class="product_inner3">
						<div class="product3">
							
						</div>
					<div class="product_ex">
						<div class="product_brand"><p class="brand_text">Kenzo</p></div>
						<div class="product_name"><p class="brand_name">Kenzo Boke Flower Crewneck Sweatshirt Off White</p></div>
						<div class="product_price">
							<p class="product_num">790,000</p>
							<span class="product_won">원</span>
						</div>
							<div class="product_now"><p class="brand_gumae">즉시 구매가</p></div>
						
						</div>
						
					</div>
					<div class="product_inner4">
						<div class="product4">
							
						</div>
					<div class="product_ex">
						<div class="product_brand"><p class="brand_text">Kenzo</p></div>
						<div class="product_name"><p class="brand_name">Kenzo Boke Flower Crewneck Sweatshirt Off White</p></div>
						<div class="product_price">
							<p class="product_num">790,000</p>
							<span class="product_won">원</span>
						</div>
							<div class="product_now"><p class="brand_gumae">즉시 구매가</p></div>
						
						</div>
						
					</div>
					
				</div>
			</div>
			<div class="btn_product">
				<a href="#" class="btn_add">더보기</a>
			</div>
			
			<br/>
			<br/>
			<br/>
			
			<div>
				<div class="banner_box">
					<a href="#"><div class="banner3">
					<img src="${path}/resources/img/banner_img3.png" alt="3">
					</div></a>
				</div>		
			</div>
			
			<br/>
			<br/>
			<br/>
			
			<div class="sub_title">
						<h1>모두의 아이템</h1>
						<h3>item</h3>
					</div>
				</div>
			<div class="product_box">
				<div class="product_list">
					<div class="product_inner1">
						<div class="product1">
							<img src="${path}/resources/product/p1.png">
						</div>
					<div class="product_ex">
						<div class="product_brand"><p class="brand_text">Kenzo</p></div>
						<div class="product_name"><p class="brand_name">Kenzo Boke Flower Crewneck Sweatshirt Off White</p></div>
						<div class="product_price">
							<p class="product_num">790,000</p>
							<span class="product_won">원</span>
						</div>
							<div class="product_now"><p class="brand_gumae">즉시 구매가</p></div>
						
						</div>
					</div>
					<div class="product_inner2">
						<div class="product2">
							
						</div>
					<div class="product_ex">
						<div class="product_brand"><p class="brand_text">Kenzo</p></div>
						<div class="product_name"><p class="brand_name">Kenzo Boke Flower Crewneck Sweatshirt Off White</p></div>
						<div class="product_price">
							<p class="product_num">790,000</p>
							<span class="product_won">원</span>
						</div>
							<div class="product_now"><p class="brand_gumae">즉시 구매가</p></div>
						
						</div>
					</div>
					<div class="product_inner3">
						<div class="product3">
							
						</div>
					<div class="product_ex">
						<div class="product_brand"><p class="brand_text">Kenzo</p></div>
						<div class="product_name"><p class="brand_name">Kenzo Boke Flower Crewneck Sweatshirt Off White</p></div>
						<div class="product_price">
							<p class="product_num">790,000</p>
							<span class="product_won">원</span>
						</div>
							<div class="product_now"><p class="brand_gumae">즉시 구매가</p></div>
						
						</div>
						
					</div>
					<div class="product_inner4">
						<div class="product4">
							
						</div>
					<div class="product_ex">
						<div class="product_brand"><p class="brand_text">Kenzo</p></div>
						<div class="product_name"><p class="brand_name">Kenzo Boke Flower Crewneck Sweatshirt Off White</p></div>
						<div class="product_price">
							<p class="product_num">790,000</p>
							<span class="product_won">원</span>
						</div>
							<div class="product_now"><p class="brand_gumae">즉시 구매가</p></div>
						
						</div>
						
					</div>
					
				</div>
			</div>
	</section>
	</main>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />	
	
<script>

  
 // 스타일 슬라이드 자바스크립트 
var slides = document.querySelector('.cs_hidden'),
slide = document.querySelectorAll('.cs_hidden li'),
currentIdx = 0,
slideCount = slide.length;
slideWidth = 300,
slideMargin = 30,
prevBtn = document.querySelector('.prev'),
nextBtn = document.querySelector('.next');

makeClone();

function makeClone(){
	for(var i=0; i<slideCount; i++){
		var cloneSlide = slide[i].cloneNode(true);
		cloneSlide.classList.add('clone');
		slides.appendChild(cloneSlide);
	}
	for(var i = slideCount -1; i>=0; i--){
		var cloneSlide = slide[i].cloneNode(true);
		cloneSlide.classList.add('clone');
		slides.prepend(cloneSlide);
	}
	updateWidth();
	setInitialPos();
	setTimeout(function(){
		slides.classList.add('animated');	
	},100);
	
}

function updateWidth(){
	var currentSlides = document.querySelectorAll('.cs_hidden li');
	var newSlideCount = currentSlides.length;
	
	var newWidth = (slideWidth + slideMargin)*newSlideCount - slideMargin+'px';
	slides.style.width = newWidth;
}
function setInitialPos(){
	var initialTranslateValue = -(slideWidth + slideMargin)*slideCount;
	slides.style.transform = 'translateX('+ initialTranslateValue+'px)';
}
  
nextBtn.addEventListener('click',function(){
	moveSlide(currentIdx +1);
});

prevBtn.addEventListener('click',function(){
	moveSlide(currentIdx -1);
}); 

function moveSlide(num){
	slides.style.left = -num * (slideWidth + slideMargin) +'px';
	currentIdx = num;
	console.log(currentIdx, slideCount);
	if(currentIdx == slideCount || currentIdx == -slideCount){
		slides.style.left = '0px';
		currentIdx = 0;
	}
}
 
  
  
</script>
</body>
</html>