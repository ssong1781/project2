<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>플렉스 FLEX </title>
<link rel="shortcut icon" href="${path}/resources/img/favicon.ico" type="image/x-icon">
<style>

	a{
	color: black;
	}
	.fileDrop{
		width:100%;
		height:150px;
		border:1px solid black;
		background-color:lightgray;
	}
	
	.uploadList{width:100%;}
	.uploadList li a{text-decoration:none;color:black;}
	.uploadList li{
		float:left;
		text-align:center;
		padding:20px;
		list-style:none;
	}
	
		
	.m_wrap{
		width:600px;
		width:920px;
		margin: 0 auto;
		
	}
	
	
	.m_table{
		margin: 0 auto;
		border: 1px solid black;;
		padding: 25px;
		line-height:10px;
		font-family: 'Gowun Dodum', sans-serif;
		font-weight: bold;
		border-radius:5px;  
	}
	
	#saveBtn{
	width:80px;
    background-color: black;
    border: none;
    border-radius:10px;
    color:#fff;
    padding: 10px 0;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 15px;
    margin: 4px;
    cursor: pointer;
    position: relative;
    left:200px;
    top:10px;
	}

	.m_td{
		/* border: 1px solid #E2E2E2; */
		border-collapse: collapse;
		padding-right: 10px;
	
		text-align: center;
	}
	
	input, textarea {
		border:1px solid black;
		border-radius:2px; 
		 
	}
	
	
	
</style>
</head>
<body>
	<h1>
		<a href="${pageContext.request.contextPath}">HOME</a>
	</h1>

<div class="m_wrap">	
	<form id="modifyForm" action="modifyPage" method="POST">
		<%-- <input type="hidden" name="uno" value="${userInfo.uno}"/> --%>
		<table class="m_table">
			<tr>
				<td class="m_td">제목</td>
				<td>
					<textarea name="title" rows="5" cols="50" required >${watch.title}</textarea>
				</td>
			</tr>
			<tr>
				<td class="m_td">작성자</td>
				<td><input type="text" name="writer" value="${watch.writer}" required /></td>
			</tr>
			<tr>
				<td class="m_td">브랜드</td>
				<td><input type="text" name="brand" value="${watch.brand}" required /></td>
			</tr>
			<tr>
				<td class="m_td">유튜브 경로</td>
				<td>
					<textarea name="player" rows="8" cols="50">${watch.player}</textarea>
				</td>
			</tr>
			<tr>
				<td class="m_td">내용</td>
				<td>
					<textarea name="content" rows="30" cols="50">${watch.content}</textarea>
				</td>
			</tr>
			
			<tr>
				<td colspan="2">
					<input type="button" id="saveBtn" value="등록" />
				</td>
			</tr>
		</table>
<!-- 		<div>
			<label>FILE DROP HERE</label>
			<div class="fileDrop">
				
			</div>
		</div> -->
		<%-- <div>
			<c:set var="path" value="${pageContext.request.contextPath}"/>
			<ul class="uploadList">
				<c:forEach var="file" items="${watch.files}">
				<li>
					<c:choose>
						<c:when test="${fn:contains(file,'s_')}">
							<img src="${path}/displayFile?fileName=${file}"/>
							<div>
								<a target="_blank" href="${path}/displayFile?fileName=${fn:replace(file,'s_','')}">
									${fn:substringAfter(fn:substringAfter(file,"s_"),"_")}
								</a>
							</div>
						</c:when>
						<c:otherwise>
							<img src="${path}/resources/img/file.png"/>
							<div>
								<a href="${path}/displayFile?fileName=${file}">
									${fn:substringAfter(file,"_")}
								</a>
							</div>
						</c:otherwise>
					</c:choose>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="${file}" class='delBtn'>[삭제]</a>
				</li>
			</c:forEach>			
			</ul>
		</div>
		 --%>
		<input type="hidden" name="bno" value="${watch.bno}"/>
		<input type="hidden" name="page" value="${cri.page}"/>
		<input type="hidden" name="perPageNum" value="${cri.perPageNum}"/>
		<input type="hidden" name="searchType" value="${cri.searchType}"/>
		<input type="hidden" name="keyword" value="${cri.keyword}"/>
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	</form>
</div>	
<script src="http://code.jquery.com/jquery-latest.min.js" ></script>
<script>var contextPath = '${path}';</script>
<script src="${path}/resources/js/upload.js"></script>
<script>
	$(".fileDrop").on("dragenter dragover",function(event){
		event.preventDefault();
	});
	
	$(".fileDrop").on("drop",function(event){
		event.preventDefault();
		var files = event.originalEvent.dataTransfer.files;
		var maxSize = 10485760;
		var formData = new FormData();
		for(var i=0; i<files.length;i++){
			if(files[i].size > maxSize){
				alert('업로드 할 수 없는 파일이 포함되어 있습니다.');
				return;
			}
			formData.append("file",files[i]);
		}
		
	});
	
	var arr = [];
	// x버튼으로 첨부파일 삭제 시 등록 버튼을 누르지 않으면 배열에만 담아두고 등록버튼 눌러야 삭제되게끔
	$(".uploadList").on("click",".delBtn",function(event){
		event.preventDefault();
		var fileLink = $(this).attr("href");
		arr.push(fileLink);
		$(this).closest("li").remove();
	});

	$("#saveBtn").click(function(){
		var str = "";
		
		var fileList = $(".uploadList .delBtn");
		$(fileList).each(function(index){
			var fullName = $(this).attr("href");
			str += "<input type='hidden' name='files["+index+"]' value='"+fullName+"' />";
		});
		
		$("#modifyForm").append(str);
		
		// 삭제 버튼이 눌러진 모든 파일 데이터 삭제
		// 위에서 삭제버튼 누르고 배열에 담아 둔 것을 진짜 등록버튼 눌러야 삭제되게
		
	
		
		$("#modifyForm").submit();
	});
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>     
</body>
</html>
























