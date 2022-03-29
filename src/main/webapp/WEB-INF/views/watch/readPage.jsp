<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>플렉스 FLEX </title>
<link href="${path}/resources/css/detail.css?after" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
<link rel="shortcut icon" href="${path}/resources/img/favicon.ico" type="image/x-icon">
<style>
	div{
	
	}

	a{
		text-decoration : none;
	}
	.uploadList{
		width:100%;
	}
	
	.uploadList li{
		text-algn:center;
		float:left;
		padding:20px;
		list-style:none;
	
	}
	
</style>
</head>
<body>
	<header>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>     
	</header>

	<div class="read_main">
		<div class="read_wrap">
			<div class="read_box">
				<div class="read_detail">
				 <div class="read_watch">
						${watch.player}
				 </div>
				 <br/>
				 <div class="read_info">
				 	<div class="read_writer">
					 	&nbsp;${watch.writer}
					</div>
					 <div class="read_title">
						 &nbsp;${watch.title}
					 </div>

					 <div class="read_viewcnt">
					 	&nbsp;조회수 ${watch.viewcnt} 회 <f:formatDate value="${watch.regdate}" pattern="yyyy-MM-dd HH:mm:ss"/> 
					 </div>
					 <hr/>
					 <br/>
					<div class="read_content">
							&nbsp;${watch.content}
					</div>
				</div>
				</div>
			<div class="click_box">
		<div class="click_wrap">
			<sec:authorize access="hasAnyRole('ROLE_MASTER')">
         		<input type="button" id="modifyBtn" value="수정"/>
         		<input type="button" id="deleteBtn" value="삭제"/>
      		</sec:authorize>
			<input type="button" id="listBtn" value="목록으로"/>
		</div>
	</div>
			</div>

		</div>

	</div> <!-- main -->
	

	<hr/>
	<div style="clear:both;"></div>
	<hr/>

	<form id="readForm">
		
		<input type="hidden" name="bno" value="${watch.bno}"/>
		<input type="hidden" name="page" value="${cri.page}"/>
		<input type="hidden" name="perPageNum" value="${cri.perPageNum}"/>
		<input type="hidden" name="searchType" value="${cri.searchType}"/>
		<input type="hidden" name="keyword" value="${cri.keyword}"/>
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	</form>
	

	
	
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<%-- <jsp:include page="../comment/comment.jsp"/> --%> <!-- 이건 동적인 인클루드. 각자 개별의 클래스로 변수 공유를 안함 -->
<script>
	var formObj = $("#readForm");
	// 게시글 목록
	$("#listBtn").click(function(){
		formObj.attr("action","listReply").submit();
	});
	// 답변글 작성
	$("#replyBtn").click(function(){
		formObj.attr("action","replyRegister").submit();
	});
	
	// 게시글 수정
	$("#modifyBtn").click(function(){
		formObj.attr("action","modifyPage").submit();
	});
	
	// 삭제 요청
	$("#deleteBtn").click(function(){
		var isDelete = confirm("게시글을 삭제하시겠습니까?");
		if(isDelete){
			var arr = [];
			$(".uploadList li").each(function(){
				var fileName = $(this).attr("data-src");
				arr.push(fileName);
			});
			console.log(arr.length);
			if(arr.length > 0) {
				
			}
			
			formObj.attr("action","remove");
			formObj.attr("method","post");
			formObj.submit();
		}else{
			alert("삭제 요청이 취소되었습니다.");
		}
	});
	
	// 사이즈 자동 100% 조절
	 $("iframe").attr('width','100%');
	 $("iframe").attr('height','100%');
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>     
</body>
</html>















