<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>플렉스 FLEX </title>
<link href="${path}/resources/css/watch.css?after" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
<link rel="shortcut icon" href="${path}/resources/img/favicon.ico" type="image/x-icon">

</head>
<body>

<header>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>     
</header>
	
<main>
	<h3 class="box-title">
	<%-- SEARCH LIST PAGE - [${pm.totalCount}] --%>
	</h3>
	<br/>
	<br/>
	<br/>
	<div class="select_box">
		<div class="select_wrap">
		<select class="select">
			<option value="n">---------------------</option>
			<option value="t">제목</option>
			<option value="b">브랜드</option>
			<option value="c">내용</option>
			<option value="tc">제목 &amp; 내용</option>
		</select>
		<input type="text" id="keyword" class="search_keyword"/>
		<input type="button" value="검색" id="searchBtn" class="select_btn"/>
		<sec:authorize access="hasAnyRole('ROLE_MASTER')">
			<input type="button" id="newBtn" value="글작성" class="register_btn"/>
		</sec:authorize>
		</div>
	</div>
	<br/>
	<br/>
	<div class="watch_main">
		<div class="watch_wrap">
			<c:forEach items="${list}" var="watch" >
			<div class="watch_board">
				<div class="watch_box">
					<div class="watch_box2">
						<div class="watch_watch">
						
							${watch.player}
						
						</div>
					</div>
					<a href="readPage${pm.search(pm.cri.page)}&bno=${watch.bno}">
					<div class="watch_info">
					
						<div class="watch_writer">
							<h3>${watch.writer}</h3>
						</div>
						<div class="watch_title">
							<p class="title">${watch.title}</p>
							
						</div>
					
					</div>
				</a>	
				</div>
			</div>

			</c:forEach>

		</div>
		
		<!-- 페이징 -->
		<div class="p_zing">
		<table class="table">
			<tr>
<%-- 				<c:if test="${pm.first}">
					<th>
						<a href="listReply${pm.search(1)}">처음</a>
					</th>
				</c:if> --%>
				
				<c:if test="${pm.prev}">
					<th>
						<a href="listReply${pm.search(pm.startPage-1)}">&#10094;</a>
					</th>
				</c:if>
				<th colspan="5">
					<c:forEach var="i" begin="${pm.startPage}" 
								   end="${pm.endPage}">
				  	 <a href="listReply${pm.search(i)}">${i}</a>
					</c:forEach>
					<c:if test="${pm.next}">
						<th>
							<a href="listReply${pm.search(pm.endPage+1)}">&#10097;</a>
						</th>
					</c:if>
					
					
<%-- 					<c:if test="${pm.last}">
						<th>
							<a href="listReply${pm.search(pm.maxPage)}">마지막</a>
						</th>
					</c:if> --%>
					
				</th>
			</tr>
		</table>
	</div> <!-- 페이징 끝 -->
	
	</div>
	
	
	
	
	
	
	
	
	
	
	
</main>
	

	
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script>
		// 검색 요청
		$("#searchBtn").click(function(){
			var searchType = $("select option:selected").val();
			var keyword = $("#keyword").val();
			console.log("searchType : " + searchType);
			console.log("keyword : " + keyword);
			location.href="listReply?searchType="+searchType+"&keyword="+keyword;
		});
		
		// 새글 작성 요청
		$("#newBtn").click(function(){
			location.href="register";
		});	
		
		
		// 사이즈 자동 100% 조절
		 $("iframe").attr('width','100%');
		 $("iframe").attr('height','100%');
		
		
	</script>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>     
</body>
</html>














