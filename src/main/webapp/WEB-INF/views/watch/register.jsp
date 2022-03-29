<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>플렉스 FLEX </title>
<link rel="shortcut icon" href="${path}/resources/img/favicon.ico" type="image/x-icon">
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
<style>

	*{
		margin: 0;
		padding: 0;
	}
	
	.fileDrop{
		width:100%;
		height:150px;
		border:1px solid gray;
		background-color:lightgray;
		margin:auto;

	}
	
	.uploadList{
		width :100%;
	}
	
	.uploadList li{
		float:left;
		padding:20px;
		list-style:none;
	}
	
	.uploadList li a{
		text-decoration:none;
	}
	
	a{
		
		color: black;
	}
	
	
	.r_wrap{
		width:600px;
		width:920px;
		margin: 0 auto;
		
	}
	
	.r_table{

		margin: 0 auto;
		border: 1px solid black;;
		padding: 25px;
		line-height:10px;
		font-family: 'Gowun Dodum', sans-serif;
		font-weight: bold;
		border-radius:5px; 
		
		 
	}
	
	.r_td{
		/* border: 1px solid #E2E2E2; */
		border-collapse: collapse;
		padding-right: 10px;
	
		text-align: center;
	}
	
	input, textarea {
		border:1px solid black;
		border-radius:2px; 
		 
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

	
	
	
	
	
</style>
</head>
<body>
	<h1>
	<a href="${pageContext.request.contextPath}">목록으로</a>
	</h1>
	<br>
	<br>
	<br>
<div class="r_wrap">
	<form id="registerForm" action="register" method="POST">
		
		<table class="r_table">
			<tr>
				<td class="r_td">제목</td>
				<td><textarea name="title" rows="8" cols="50" required></textarea> </td>
			</tr>
			<tr>
				<td  class="r_td">작성자</td>
				<td><input type="text" name="writer" required /> </td>
			</tr>
			<tr>
				<td  class="r_td">브랜드</td>
				<td><input type="text" name="brand" required /> </td>
			</tr>
			<tr>
				<td  class="r_td">유튜브 소스</td>
				<td><textarea name="player" rows="8" cols="50" required></textarea> </td>
			</tr>

			<tr>
				<td  class="r_td">내용</td>
				<td><textarea name="content" rows="30" cols="50"></textarea></td>
			</tr>
			<tr>
				<td colspan="2">
					
					<input type="button" id="saveBtn" value="등록"/>
				</td>
			</tr>
		</table>
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	</form>
</div>
<br>
<br>
<br>
	

	
	
	
	
	
	
	
	
<script src="http://code.jquery.com/jquery-latest.min.js"></script>


<script>
	var contextPath = '${pageContext.request.contextPath}';

	$(".fileDrop").on("dragenter dragover", function(e){
		e.preventDefault();
	});

	$(".fileDrop").on("drop", function(e){
		e.preventDefault();
		var files = e.originalEvent.dataTransfer.files; // 파일정보저장
		console.log(files);
		
		// 1024(1kb) * 1024(1kb) = 1048576(1MB) *10 = 10MB
		var maxSize = 10485760;
		
		var formData = new FormData();
		
		for(var i=0; i < files.length; i++ ){	// 파일 용량 제한
			if(files[i].size > maxSize){
				alert("업로드 할 수 없는 크기의 파일이 포함되어 있습니다.");
				return;
			}
			formData.append("file", files[i]); // 파일정보저장
		}
		
	});
	
	// image type check
	function checkImageType(fileName){
		return fileName.indexOf("s_") > 0 ? true : false;
	}
	
	function getFileInfo(fullName){
		var imgSrc, fileName, getLink;
		// 이미지 인지 확인
		if(checkImageType(fullName)){
			// 이미지 파일
			// 파일 정보 요청 url displayFile
			//imgSrc = contextPath+"/displayFile?fileName="+fullName;
			imgSrc = contextPath+"/resources/upload"+fullName;
			// 다운로드 요청 - image일 경우 원본 이미지 출력
			getLink = contextPath+"/displayFile?fileName="+fullName.replace("s_",""); // 디스플레이파일하고 파일이름을전달하면 파일정보가 전달됨
		}else{
			// 일반 파일
			imgSrc = contextPath+"/resources/img/file.png";
			// 다운로드 요청
			getLink = contextPath+"/displayFile?fileName="+fullName;
		}
		
		fileName = fullName.substr(fullName.lastIndexOf("_")+1); // 언더바 이후 자르면 원본파일이름
		return {
					fileName : fileName,
					imgSrc : imgSrc,
					fullName : fullName,
					getLink : getLink
				};
	}
	$(".uploadList").on("click",".delBtn", function(event){
		event.preventDefault();
		var target = $(this); // 업로드한 파일 중에 x버튼이 눌러진 파일
		
		
		
		
	}); 

	$("#saveBtn").click(function(){
		var str = "";
		var fileList = $(".uploadList .delBtn");
		$(fileList).each(function(index){
			var fullName = $(this).attr("href");
			str += "<input type='hidden' name='files["+index+"]' value='"+fullName+"' />";
		});
		$("#registerForm").append(str);
		$("#registerForm").submit();
	});
	
	
	
	
	
	
	
	
	
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>     
</body>
</html>