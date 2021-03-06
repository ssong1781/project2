<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<c:set var="path" value="${pageContext.request.contextPath}"/> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

	#board_Wrap{
		width: 1303px;
		margin:0 300px;
	}
	
	#board_Wrap #top_box{
		
		text-align:center;
		margin-top: 150px;
		
	}
	
	#board_Wrap #top_box #search_box a{
		text-decoration:none;
		color:black;
		padding:10px;
		margin:0 10px;
		background-color:#F2F2F2;
		border-radius:10px;
	}
	
	#board_Wrap #content_wrap{
		display: flex;
	}
	
	#board_Wrap #filter_wrap{
		width:252px;
	}
	
	#board_Wrap #filter_wrap #search_filter{
		width: 250px;
		height: 1200px;
	}
	#filter_wrap #search_filter .filter_status{
		display: flex;
        align-items: center;
		height: 90px;	
	}
	
	.filter_list{
		display: flex;
        flex-direction: column;
        justify-content: center;
		height: 210px;
		border-top: 1px solid lightgray;
		cursor:pointer;
	}
	
	#filter_list_brand{
		height: 320px;
	}
	
	.filter_list .filter_title{
		display: flex;
		justify-content: space-between;
	}
	
	.title_span{
		font-size: 14px;
	}
	
	.filter_title_box .filter_placeholder{
		display:block;
		width:220px;
		color: lightgray;
		overflow:hidden;
		white-space:nowrap;
		text-overflow: ellipsis;
	}
	
	
	.filter_menu .filter_title_box{
		display:flex;
		justify-content: space-between;
	}
	
	.filter_menu_list p{
		margin: 0;
		padding:8px 0;
	}
	
	#board_Wrap #board_items_wrap{
		width:1020px;
		margin-left: 10px;
	}

	#board_Wrap .board_items{
		/* border:1px solid lightgray; */
		/* float:left; */
		display:inline-block;
		width:230px;
		height:410px;
		margin:10px;
		cursor:pointer;
	}
	
	
	#board_Wrap .board_items #product_content{
		text-align: left;
	}
	
	#board_Wrap .board_items #product_content p{
		font-size:13px;
		margin:3px 0;
	}
	
	#board_Wrap .board_items #product_content #product_content_title{
		height:90px;
	}
	
	#board_Wrap .board_items #product_content #product_content_title #product_brand{
		font-size:14px;
	}
	
	#board_Wrap .board_items #product_content #product_content_price{
		height:46px;
	}
	
	#board_Wrap .board_items #product_content .product_content_heart{
		height:30px;
	}
	
	.product_content_heart:hover{
		color:#404040;
	}
	
	#board_Wrap .board_items #product_img{
		background-color:#EFF5FB;
		width:100%;
		height:230px;
		border-radius:14px;
	}
	
	#board_Wrap .board_items #product_img #images{
		width:230px;
		height:230px;
	}
	
	#search_input{
		display: flex;
	}
	
	#paging_wrap{
		display: flex;
		width: 1300px;
		justify-content: flex-end;
		margin-bottom: 30px;
		margin-top: 20px;
	}
	
	#paging{
		display: flex;
		width: 1020px;
		justify-content: center;
		margin-right: 30px;
	}
	
	#paging a{
		padding:4px 12px;
		color:#222;
		font-size: 16px;
	}
	
	#kor_name{
		color: rgba(34,34,34,.5);
		font-size: 13px;
	}
	

	
</style>
</head>
<body onload='javascript:check();'>
	
	<div id="board_Wrap">
		<div id="top_box">
			<h1>SHOP</h1>
			<br/>
			<hr/>
			<br/>
			<br/>
			<div id="search_box">
				<a href="#" class="category">ALL</a>
				<a href="#" class="category">??????</a>
				<a href="#" class="category">??????</a>
				<a href="#" class="category">????????????</a>
			</div>
			
			<br/>
			<br/>
		</div>
		<div id="content_wrap">
			<div id="filter_wrap">
				<div id="search_filter">
					<div class="filter_status">
						<b><span class="title_span">??????</span></b>
					</div>
					<div class="filter_list">
						<div class="filter_title">
							<div class="filter_title_box">
								<b><span class="title_span">????????????</span></b> <br/>
								<span class="filter_placeholder" id="filter_placeholder_category">?????? ????????????</span>
							</div>
							<div class="filter_sign_box">-</div>
						</div>
						<div class="filter_menu">
							
							<div class="filter_menu_list">
								<label for="category_chk1"><p><input type="checkbox" data-value="??????" class="category_chk"  id="category_chk1"/>&nbsp;??????</p></label>
								<label for="category_chk2"><p><input type="checkbox" data-value="??????" class="category_chk" id="category_chk2"/>&nbsp;??????</p></label>
								<label for="category_chk3"><p><input type="checkbox" data-value="????????????" class="category_chk" id="category_chk3"/>&nbsp;????????????</p></label>
							</div>
						</div>
					</div>
					<div class="filter_list" id="filter_list_brand">
						<div class="filter_title">
							<div class="filter_title_box">
								<b><span class="title_span">?????????</span></b> <br/>
								<span class="filter_placeholder" id="filter_placeholder_brand">?????? ?????????</span>
							</div>
							<div class="filter_sign_box">-</div>
						</div>
						<div class="filter_menu">
							
							<div class="filter_menu_list" id="brand_menu" style="overflow:scroll; overflow-x: hidden; width:100%; height:210px;">
							
							</div>
						</div>
					</div>
					<div class="filter_list">
						<div class="filter_title">
							<div class="filter_title_box">
								<b><span class="title_span">??????</span></b> <br/>
								<span class="filter_placeholder" id="filter_placeholder_price">?????? ??????</span>
							</div>
							<div class="filter_sign_box">-</div>
						</div>
						<div class="filter_menu">
							
							<div class="filter_menu_list">
								<label for="price_chk1"><p><input type="checkbox" data-value="10?????? ??????" class="price_chk" id="price_chk1"/>&nbsp;10?????? ??????</p></label>
								<label for="price_chk2"><p><input type="checkbox" data-value="10?????? - 30??????" class="price_chk" id="price_chk2"/>&nbsp;10?????? - 30??????</p></label>
								<label for="price_chk3"><p><input type="checkbox" data-value="30?????? - 50??????" class="price_chk" id="price_chk3"/>&nbsp;30?????? - 50??????</p></label>
								<label for="price_chk4"><p><input type="checkbox" data-value="50?????? ??????" class="price_chk" id="price_chk4"/>&nbsp;50?????? ??????</p></label>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div id="board_items_wrap">
				<c:forEach var="board" items="${pList}">
					<div data-pno='${board.pno}' class="board_items">
						<div id="product_img">
							
						</div>	
						<div id="product_content">
							<div id="product_content_title">
								<p id="product_brand"><b>${board.brand}</b></p>
								<p>${board.model_eng_name}</p>
								<p id="kor_name">${board.model_kor_name}</p>
							</div>	
							<div id="product_content_price">
								<p><b>???</b></p>
								<p>?????? ?????????</p>
							</div>
							
							<sec:authorize access="isAuthenticated()">
								<div class="product_content_heart">
									<p>
									<span>
										<img class="heart_img" width="12px" src="../resources/other/star1.png"/>
										?????? ?????? : <span class="heartCnt">${board.heart}</span>
									</span>
									</p>
								</div>	
							</sec:authorize>
							<sec:authorize access="isAnonymous()">
								<div class="product_content_hearts">
									<p>
									<span>
										<img class="heart_img" width="12px" src="../resources/other/star1.png"/>
										?????? ?????? : <span class="heartCnt">${board.heart}</span>
									</span>
									</p>
								</div>	
							</sec:authorize>
						</div>	
						<form id="readForm" action="readPage" method="get">
							<input type="hidden" name="pno" value="${board.pno}"/>
						</form>
					</div>
				</c:forEach>
			</div>		
		</div>
		<div id="paging_wrap">
			<div id="paging">
				<c:if test="${pm.prev}">
					<a href="${path}/pboard/listPage${pm.search(pm.startPage-1)}">&#60;</a>
				</c:if>
				<c:forEach var="i" begin="${pm.startPage}" end="${pm.endPage}">
					<a href="${path}/pboard/listPage${pm.search(i)}">${i}</a>			
				</c:forEach>
				<c:if test="${pm.next}">
					<a href="${path}/pboard/listPage${pm.search(pm.endPage+1)}">&#62;</a>
				</c:if>
			</div>
		</div>
	</div>
	
	
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>

	var uno = "${uno}";

	$(document).ready(function(){
		if(uno != ""){
			$.ajax({
				url : "${path}/pboard/zzimFind",
				type : "POST",
				data : {
					uno : uno,
					'${_csrf.parameterName}' : '${_csrf.token}'
				},
				dataType : "json",
				success : function(result){
					console.log(result);
					if(result != null || result != ''){
						for(var i=2;i<result.length; i=i+2) {
							var boarditem = $(".board_items[data-pno="+result[i]+"]");
							var img = boarditem.children("#product_content")
							.children(".product_content_heart").children("p")
							.children("span").children(".heart_img");
							img.attr("src","../resources/other/star2.png");
						}
					}	
				},
				error : function(res){
					console.log("????????? ??????");
				}
			});
		}
		
	});


	//?????? ?????? ????????? ????????? ????????????
	$(".board_items").each(function(){
		var pno = $(this).attr("data-pno");
		var pi = $(this).children("#product_img");
		var pcp = $(this).children('div:eq(1)').find("#product_content_price");
		var pb = pcp.children('p:eq(0)').find("b");
		
		$.ajax({
			url : "${path}/pboard/readOneImg",
			type : "POST",
			data : {
				pno : pno,
				'${_csrf.parameterName}' : '${_csrf.token}'
			},
			dataType : "text",
			success : function(result){
				var src = "../resources/product_img/";
				var str = "<img id='images' src='"+src+result+"'/>";
				pi.append(str);
			},
			error : function(res){
				alert(res.responseText);
			}
		});
		
		$.ajax({
			url : "${path}/pboard/minPriceNoSize",
			type : "POST",
			data : {
				pno : pno,
				'${_csrf.parameterName}' : '${_csrf.token}'
			},
			dataType : "json",
			success : function(result){
				var price = result.sell_price;
				price = price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
				console.log("price : " + price);
				pb.prepend(price);
			},
			error : function(res){
				pb.html("??????");
			}
		});
		
	});	
	
	getBrand();
	
	$(".filter_list").click(function(){	
		if($(this).children(".filter_menu").css("display") == 'block'){
			$(this).css("height",90);
			$(this).children(".filter_menu").hide();
			$(this).find(".filter_title").find(".filter_sign_box").html("+");
		}else{
			if($(this).find(".title_span").html() == '?????????'){
				$(this).css("height",320);
			}else{
				$(this).css("height",210);
			}
			$(this).children(".filter_menu").show();
			$(this).find(".filter_title").find(".filter_sign_box").html("-");
		}	
	});

	function getBrand(){
		var bm = $("#brand_menu");
		$.ajax({
			url : "${path}/pboard/getBrand",
			type : "POST",
			data : {
				'${_csrf.parameterName}' : '${_csrf.token}'
			},
			success : function(result){
				console.log(result);
				var str = "";
				$(result).each(function(index){
					str = "<label for='brand_chk"+(index+1)+"'><p><input type='checkbox' data-value='"+result[index]+"' class='brand_chk' id='brand_chk"+(index+1)+"'/> "+result[index]+"</p></label>";
					bm.append(str);
				});
				brandCheck();
			},
			error : function(res){
				alert(res.responseText);
			}
		});
	}
	
	$('input[type="checkbox"][class="category_chk"]').click(function(){ 
		var fl = $(this).closest(".filter_list");
		if($(this).prop('checked')){
			$('input[type="checkbox"][class="category_chk"]').prop('checked',false);
			$(this).prop('checked',true); 
			$(fl).find(".filter_placeholder").html($(this).attr("data-value"));
		}  
		if($('input[type="checkbox"][class="category_chk"]:checked').length == 0){	
			$(fl).find(".filter_placeholder").html("?????? ????????????");
			location.href="${path}/pboard/listPage?keyword=${pm.cri.keyword}&category=&brand=${pm.cri.brand}&price=${pm.cri.price}";
		}
		
 		if($(this).prop("checked") == false){
			$(this).prop("checked", false);
		}else{
			var thisval = $(this).attr("data-value");
			if(thisval == "??????"){
				$("#search_box").children("a:eq(1)").trigger("click");
			}else if(thisval == "??????"){
				$("#search_box").children("a:eq(2)").trigger("click");
			}else if(thisval == "????????????"){
				$("#search_box").children("a:eq(3)").trigger("click");
			}
		}
		
	});
	

	$("#brand_menu").on("click",'input[type="checkbox"][class="brand_chk"]',function(){
		var fl = $(this).closest(".filter_list");
		var check = $('input[type="checkbox"][class="brand_chk"]:checked');
		var brand = "";

		$(".brand_chk").each(function(){
			if($(this).prop("checked")){
				brand += $(this).attr("data-value")+",";
			}
		});
		brand = brand.slice(0, -1);
		$(fl).find(".filter_placeholder").html(brand);
		if(check.length == 0){	
			$(fl).find(".filter_placeholder").html("?????? ?????????");
		}
		location.href="${path}/pboard/listPage?keyword=${pm.cri.keyword}&category=${pm.cri.category}&brand="+brand+"&price=${pm.cri.price}";
	});
	
	
	$('input[type="checkbox"][class="price_chk"]').click(function(){ 
		var fl = $(this).closest(".filter_list");
		if($(this).prop('checked')){
			$('input[type="checkbox"][class="price_chk"]').prop('checked',false);
			$(this).prop('checked',true); 
			var fl = $(this).closest(".filter_list");
			$(fl).find(".filter_placeholder").html($(this).attr("data-value"));
		}  
		if($('input[type="checkbox"][class="price_chk"]:checked').length == 0){	
			$(fl).find(".filter_placeholder").html("?????? ??????");
			location.href="${path}/pboard/listPage?keyword=${pm.cri.keyword}&category=${pm.cri.category}&brand=${pm.cri.brand}&price=0";
		}
		if($(this).prop("checked") == false){
			$(this).prop("checked", false);
		}else{
			if($(this).attr("id") == "price_chk1"){
				location.href="${path}/pboard/listPage?keyword=${pm.cri.keyword}&category=${pm.cri.category}&brand=${pm.cri.brand}&price=1";
			}else if($(this).attr("id") == "price_chk2"){
				location.href="${path}/pboard/listPage?keyword=${pm.cri.keyword}&category=${pm.cri.category}&brand=${pm.cri.brand}&price=2";
			}else if($(this).attr("id") == "price_chk3"){
				location.href="${path}/pboard/listPage?keyword=${pm.cri.keyword}&category=${pm.cri.category}&brand=${pm.cri.brand}&price=3";
			}else{
				location.href="${path}/pboard/listPage?keyword=${pm.cri.keyword}&category=${pm.cri.category}&brand=${pm.cri.brand}&price=4";
			}
		}
	});


	$(".board_items").click(function(){
		$(this).children('#readForm').submit();
	});
	
	
	$(".category").click(function(){
		var category = $(this).html();
		if(category == "ALL"){
			location.href="${path}/pboard/listPage";
		}else{	
			location.href="${path}/pboard/listPage?keyword=${pm.cri.keyword}&category="+category+"&brand=${pm.cri.brand}&price=${pm.cri.price}";
		}
	});
	
	
	function check(){
		var keyword = "${pm.cri.keyword}";
		var category = "${pm.cri.category}";
		var price = "${pm.cri.price}";
		
		if(keyword != ""){
			$(".search_bar").val(keyword);
		}
		
		if(category == "??????"){
			$("#category_chk1").attr("checked",true);
			$("#filter_placeholder_category").html(category);
			$("#search_box").children("a:eq(1)").css({"background-color":"#fef7f6", "color":"#f15746"});
		}else if(category == "??????"){
			$("#category_chk2").attr("checked",true);
			$("#filter_placeholder_category").html(category);
			$("#search_box").children("a:eq(2)").css({"background-color":"#fef7f6", "color":"#f15746"});
		}else if(category == "????????????"){
			$("#category_chk3").attr("checked",true);
			$("#filter_placeholder_category").html(category);
			$("#search_box").children("a:eq(3)").css({"background-color":"#fef7f6", "color":"#f15746"});
		}else if(category == ""){
			$("#search_box").children("a:eq(0)").css({"background-color":"#fef7f6", "color":"#f15746"});
		}
		
		if(price != ""){
			$("#price_chk"+price).prop("checked",true);
			$("#filter_placeholder_price").html($("#price_chk"+price).attr("data-value"));
		}
		
	}
	function brandCheck(){
		var brand = "${pm.cri.brand}";
		if(brand != ""){
			var brands = brand.split(",");
			for(var i=0; i <brands.length;i++){
				var brandsSplit = brands[i].split(" ");
				brandsSplit[0] = brandsSplit[0].replace(".","");
				$(".brand_chk[data-value^="+brandsSplit[0]+"]").attr("checked",true);
			}
			$("#filter_placeholder_brand").html(brand);
		}
	}
	
	
	$(".product_content_heart").click(function(e){
		
		e.stopPropagation();
		
		var heartCnt = $(this).children().children().find(".heartCnt").html();
		
		var pno = $(this).parents(".board_items").attr("data-pno");
		
		console.log(pno);
		
		var img = $(this).children("p").children("span").children(".heart_img");
		
		console.log(img.attr("src"));
		
		if(img.attr("src") == "../resources/other/star1.png"){
			img.attr("src","../resources/other/star2.png");
			$(this).children().children().find(".heartCnt")
			.html(parseInt(heartCnt)+parseInt(1));
			
			$.ajax({
				url : "${path}/pboard/zzimSuccess",
				type : "POST",
				data : {
					pno : pno,
					uno : uno,
					'${_csrf.parameterName}' : '${_csrf.token}'
				},
				success : function(result){
					console.log("???????????? ??????  ok~!");
				},
				error : function(res){
					alert(res.responseText);
				}
			});			
		}else if(img.attr("src") == "../resources/other/star2.png"){
			img.attr("src","../resources/other/star1.png");
			$(this).children().children().find(".heartCnt")
			.html(parseInt(heartCnt)-parseInt(1));
			
			$.ajax({
				url : "${path}/pboard/zzimCancel",
				type : "POST",
				data : {
					pno : pno,
					uno : uno,
					'${_csrf.parameterName}' : '${_csrf.token}'
				},
				success : function(result){
					console.log("???????????? ??????  ok~!");
				},
				error : function(res){
					alert(res.responseText);
				}
			});
			
		}
	});
	
	
	$(".product_content_hearts").click(function(e){
		e.stopPropagation();
		alert("????????? ??? ?????? ???????????????.");
		location.href="${path}/user/login";
	});
	

	
	
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>











