<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Estonia&family=Gowun+Batang:wght@400;700&display=swap" rel="stylesheet">



<!-- mngt/main.jsp -->


<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<style>
	
	#firstTable{
		width:100%;
	}
	
	#maincontainer {
		height:600px;
		width:86%;
		overflow:auto;
		margin-bottom:500px;
		font-family: 'Gowun Batang', serif;
		margin-left:130px;
	}

	#maincontainer table {
		white-space:nowrap;
		border-collapse:collapse;
	}
	
	.first{
		text-align:center;
	}
	
	th, td{
		padding:5px 10px;
	}
	
	.h1{
		margin-top:100px;
	}
	
	#firstTable th{
		position: sticky;
    	top: 0px;
    	background-color: gray !important;
	}
	
	.deleteBtn, .adminButton, #selectBan, #selectUser{
		flex: 1 1 auto;
		border-style:none;
		  margin: 10px;
		  padding: 5px;
		  text-align: center;
		  text-transform: uppercase;
		  transition: 0.5s;
		  
		  color: white;
		  box-shadow: 0 0 20px #eee;
		  border-radius: 10px;
		  background-color: red;
	
	}
	
	.adminButton{
		background-color: black;
		margin-left:16px;
	}
	
	#selectBan{
		margin-left:1630px;
	}
	
	#selectUser{
		margin-left:1645px;
		background-color: black;
	}
	
</style>
<h1 class="h1" align="center">회원 목록</h1>
<div class="wrap">
<input type="button" id="selectBan" value="정지된 회원만 보기"/>
<input type="button" id="selectUser" style="display:none;" value="모든 회원 보기"/>
<div class="container" id="maincontainer">
	<!-- memberList -->
	<table id="firstTable">
		<tr class="first">
			<th>회원번호</th>
			<th>아이디</th>
			<th>이름</th>
			<th>닉네임</th>
			<th>성별</th>
			<th>휴대폰 번호</th>
			<th>우편번호</th>
			<th>주소</th>
			<th>상세주소</th>
			<th>최종방문일</th>
			<th>정지여부</th>
		</tr>
		<c:choose>
			<c:when test="${!empty memberList}">
				<c:forEach var="member" items="${memberList}">
				<c:if test="${member.bandate <= 0 and member.uno != 0}">
					<tr class="notBan">	
						<td class="first">${member.uno}</td>
						<td id="user_id">${member.uid}</td>
						<td class="first">${member.uname}</td>
						<td class="first">${member.unick}</td>
						<td class="first" >${member.gender}</td>
						<td class="first">${member.phone}</td>
						<td class="first">${member.post}</td>
						<td>${member.addr}</td>
						<td class="first">${member.addr_detail}</td>
						<td>
							<f:formatDate value="${member.visit_date}" 
								pattern="yyyy-MM-dd (E) HH:mm"/>
						</td>
						<td>
							<sec:authorize access="hasRole('ROLE_MASTER')">
							<input type="button" class="deleteBtn" value="계정정지"/>
							</sec:authorize>
						</td>
					</tr>
				</c:if>
				<c:if test="${member.bandate > 0 and member.uno != 0}">
					<tr style="color:red;">	
						<td class="first">${member.uno}</td>
						<td id="user_id">${member.uid}</td>
						<td class="first">${member.uname}</td>
						<td class="first">${member.unick}</td>
						<td class="first" >${member.gender}</td>
						<td class="first">${member.phone}</td>
						<td class="first">${member.post}</td>
						<td>${member.addr}</td>
						<td class="first">${member.addr_detail}</td>
						<td>
							<f:formatDate value="${member.visit_date}" 
								pattern="yyyy-MM-dd (E) HH:mm"/>
						</td>
						<td>
							<sec:authorize access="hasRole('ROLE_MASTER')">
								<!-- btn-xs btn-sm btn btn-lg -->
							<input type="button" class="deleteBtn" value="계정정지"/>
							</sec:authorize>
						</td>
					</tr>
				</c:if>
				<c:if test="${member.uid eq 'admin@naver.com'}">
					<tr class="notBan">	
						<td class="first">${member.uno}</td>
						<td id="user_id">${member.uid}</td>
						<td class="first">${member.uname}</td>
						<td class="first">${member.unick}</td>
						<td class="first" >${member.gender}</td>
						<td class="first">${member.phone}</td>
						<td class="first">${member.post}</td>
						<td>${member.addr}</td>
						<td class="first">${member.addr_detail}</td>
						<td>
							<f:formatDate value="${member.visit_date}" 
								pattern="yyyy-MM-dd (E) HH:mm"/>
						</td>
						<td>
							<sec:authorize access="hasRole('ROLE_MASTER')">
								<!-- btn-xs btn-sm btn btn-lg -->
							<input type="button" class="adminButton" value="관리자"/>
							</sec:authorize>
						</td>
					</tr>
				</c:if>
				</c:forEach>
			<c:if test="${banList eq false}">
					<tr class="notBan2" style="display:none;">	
						<th colspan="13">정지된 회원정보가 없습니다.</th>
					</tr>
			</c:if>
			</c:when>
			<c:otherwise>
				<tr>
					<th colspan="13">등록된 회원정보가 없습니다.</th>
				</tr>
			</c:otherwise>
		</c:choose>
	</table>
<script>

	$(".deleteBtn").on("click",function(){
		var parentTr = $(this).parent().parent();
		var uid = parentTr.find("#user_id").text();
		console.log(uid);
		$.ajax({
			type : "POST",
			url : "${path}/mngt/user/giveBan",
			data : {
				uid : uid,
				'${_csrf.parameterName}' : '${_csrf.token}'
			},
			dataType : "json",
			success : function(data){
				console.log("정지처리");
				alert("id : " + uid + " 정지 처리 완료");
				location.href="${path}/mngt/main";
			}
		});
	});
	
	$( "#firstTable tr").on( "mouseover", function() {
	    $( this ).css( "background-color", "#f4f4f4" );
	    $( this).children("td").css( "cursor", "pointer" );
	});
	
	$( "#firstTable tr" ).on( "mouseleave", function() {
	    $( this ).css( "background-color", "white" );
	});
	
	$(".adminButton").on("click",function(){
		alert("관리자 계정은 정지할 수 없습니다.");
	});
	
	$("#selectBan").on("click",function(){
		$(".notBan").css("display","none");
		$("#selectBan").css("display","none");
		$("#selectUser").css("display","");
		$(".notBan2").css("display","");
		console.log(${banList});
	});
	
	$("#selectUser").on("click",function(){
		$(".notBan").css("display","");
		$("#selectBan").css("display","");
		$("#selectUser").css("display","none");
		$(".notBan2").css("display","none");
	});
	
</script>
</div>
</div>
</body>
</html>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>




