<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:set var="path" value="${pageContext.request.contextPath}" scope="session"/>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<title>플렉스 FLEX </title>
<style>
	.wrap{
 		background-color:#FAFAFA;
	}

	article{
    	width:504px;
 		margin:0 auto;
 		background:white;
 		padding:0 100px;
 		border-radius: 10px;
    }

	table{
		max-width:1000px;
	}
	
	table{
     font-family: 'Gowun Batang', serif;
    }
    
    .button{
    	width: 161px;
	    color: #ffffff;
	    border: #E2E2E2 solid 1px;
	    padding: 10px;
	    background-color: #c0c0c0;
	    text-align: center;
	    border-radius: 10px;
	    font-weight: bold;
    }
    
     .button:hover{
     	color: #ffffff;
	    background-color: #222;
     }
     
    
      input[type=text],input[type=password]{
		border-right:1px; 
    	border-top:1px; 
    	border-left:1px; 
    	margin-bottom:10px;
    	border-bottom-width:thin;
    	border-color: #E2E2E2;
    }
     
     input:focus {outline:none;} 
    
    select {
		padding-left:10px;
		width: 122px;
		height: 27px;
		/* padding: .8em .5em; */
		font-family: inherit;
		background: url(https://farm1.staticflickr.com/379/19928272501_4ef877c265_t.jpg) no-repeat 95% 50%;
		-webkit-appearance: none;
		-moz-appearance: none;
		appearance: none;
		border: 1px solid #999;
		border-radius: 10px;
	}
	
	select::-ms-expand {
	  display: none;
	}
	
	select:hover{
		outline:none;
	}
	
	.text-center{
		padding-bottom:20px;
	}
    
</style>
<div class="wrap">
	<br/>
	<br/>
	<br/>
	<article>
	<form id="loginForm" onsubmit="return loginSubmit();" action="${path}/user/login" method="post" >
		<table class="table">
			<tr>
				<th colspan=2>
					<h1 style="font-size:40px">로그인</h1>
				</th>
			</tr>
			<tr>
	    		<td>아이디</td>
	    		
	    	</tr>
	    	<tr>
	    		<td colspan="2">
			    	<input type="hidden" name="uid" id="uid" value=""  />
			        <input type="text" class="uid2" name="uid2" value="" placeholder="이메일 입력" autocomplete="off"> 
					 <span>@</span>
					 <input type="text" id="textEmail" class="uid3" name="uid3" placeholder="이메일을 선택하세요." autocomplete="off"> 
					 <select id="select" class="select">
			            <option value="" disabled selected>E-Mail 선택</option>
			            <option value="naver.com" id="naver.com">naver.com</option>
			            <option value="hanmail.net" id="hanmail.net">hanmail.net</option>
			            <option value="gmail.com" id="gmail.com">gmail.com</option>
			            <option value="nate.com" id="nate.com">nate.com</option>
			            <option value="directly" id="textEmail">직접 입력하기</option>
			        </select>
			        <div class="result" id="subUid"></div>
	    		</td>
	    	</tr>
			<tr>
				<td>비밀번호</td>
			</tr>
				<tr>
					<td>
						<input type="password" name="upass" id="upass" placeholder="USER PW" autocomplete="off" alt="비밀번호" />
					</td>
				</tr>
			<tr>
				<td colspan="2" class="text-center">
					<label class="text-center">
						<input type="checkbox" name="rememberme" id="rememberme"/>
						로그인 정보 저장
					</label>
				</td>
			</tr>
		
			<tr>
				<td colspan="3">
					<input type="submit" class="button" id="loginBtn" value="로그인"/>
					<input type="button" class="button" onclick="location.href='pwfind';" value="비밀번호 찾기"/>
					<input type="button" class="button" onclick="location.href='signUp';" value="회원가입"/>
				</td>
			</tr>
			
			
		</table>
		<br/>
		<br/>
		<br/>
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	</form>
	</article>
	<br/>
	<br/>
	<br/>
</div>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	$(".uid2").focus();
	
	var boolCheck = false;
	
	// 옵션 선택시 uid3 값 입력
	$("#select").change("option",function(){
		   if ($('#select').val() == 'directly') {
	               $('#textEmail').attr("disabled", false);
	               $('#textEmail').val("");
	               $('#textEmail').focus();
           } else {
				$(".uid3").val($("#select").val());
           }
			var tempVal = $(".uid2").val() + "@" + $(".uid3").val();
			var upass = $("#upass").val();
			$.ajax({
				type : "POST",
				url : "${path}/user/beforeSubmit",
				data : {
					uid : tempVal,
					upass : upass,
					'${_csrf.parameterName}' : '${_csrf.token}'
				},
				dataType : "json",
				success : function(result){
					boolCheck = result;
				},
				error : function(res){
				}
			});
		});
	
	// 이메일 입력태그에 값이 작성이 될때
	$(".uid2, .uid3, #upass").on("input",function(){
		var tempVal = $(".uid2").val() + "@" + $(".uid3").val();
		var upass = $("#upass").val();
		$.ajax({
			type : "POST",
			url : "${path}/user/beforeSubmit",
			data : {
				uid : tempVal,
				upass : upass,
				'${_csrf.parameterName}' : '${_csrf.token}'
			},
			dataType : "json",
			success : function(result){
				boolCheck = result;
			}
		});
	});
	
	
	
	var boolBanCheck = false;
	
	// 이메일 입력태그에 값이 작성이 될때  차단된 사용자 확인
	$(".uid2, .uid3").on("input",function(){
		var tempVal = $(".uid2").val() + "@" + $(".uid3").val();
		$.ajax({
			type : "POST",
			url : "${path}/user/loginBanCheck",
			data : {
				uid : tempVal,
				'${_csrf.parameterName}' : '${_csrf.token}'
			},
			dataType : "json",
			success : function(result){
				boolBanCheck = result;
			}
		});
	});
	
	var date = null;
	
	// 옵션 선택시 차단된 사용자 확인
	$("#select").change("option",function(){
		   if ($('#select').val() == 'directly') {
	               $('#textEmail').attr("disabled", false);
	               $('#textEmail').val("");
	               $('#textEmail').focus();
           } else {
				$(".uid3").val($("#select").val());
           }
			var tempVal = $(".uid2").val() + "@" + $(".uid3").val();
			$.ajax({
				type : "POST",
				url : "${path}/user/loginBanCheck",
				data : {
					uid : tempVal,
					'${_csrf.parameterName}' : '${_csrf.token}'
				},
				dataType : "json",
				success : function(result){
					boolBanCheck = result.result;
					date = result.date;
				}
			});
		});
	
	var boolDelete = false;
	
	$(".uid2, .uid3").on("input",function(){
		var tempVal = $(".uid2").val() + "@" + $(".uid3").val();
		$.ajax({
			type : "POST",
			url : "${path}/user/loginDeleteCheck",
			data : {
				uid : tempVal,
				'${_csrf.parameterName}' : '${_csrf.token}'
			},
			dataType : "json",
			success : function(result){
				boolDelete = result;
			}
		});
	});
	
	// 옵션 선택시 탈퇴한사용자 확인
	$("#select").change("option",function(){
		   if ($('#select').val() == 'directly') {
	               $('#textEmail').attr("disabled", false);
	               $('#textEmail').val("");
	               $('#textEmail').focus();
           } else {
				$(".uid3").val($("#select").val());
           }
			var tempVal = $(".uid2").val() + "@" + $(".uid3").val();
			$.ajax({
				type : "POST",
				url : "${path}/user/loginDeleteCheck",
				data : {
					uid : tempVal,
					'${_csrf.parameterName}' : '${_csrf.token}'
				},
				dataType : "json",
				success : function(result){
					boolDelete = result;
				}
			});
		});
	
	function loginSubmit(){
		if($(".uid2").val() == ''){
			alert("아이디를 입력해 주세요.");
			$(".uid2").focus();
			return false;
		}else if($(".uid3").val() == ''){
			alert("아이디를 입력해 주세요.");
			$(".uid3").focus();
			return false;
		}else if($("#upass").val() == ''){
			alert("비밀번호를 입력해 주세요..");
			$("#upass").focus();
			return false;
		}else if(!boolCheck){
			alert("존재하지 않는 아이디이거나 비밀번호가 올바르지 않습니다");
			$(".uid2").val('');
			$(".uid3").val('');
			$("#upass").val('');
			$("#select").val('');
			$(".uid2").focus();
			return false;
		}else if(!boolBanCheck){
			alert("사용이 정지된 사용자입니다. 남은 일수 : " +date+ "일");
			$(".uid2").val('');
			$(".uid3").val('');
			$("#upass").val('');
			$("#select").val('');
			$(".uid2").focus();
			return false;
		}else if(!boolDelete){
			alert("탈퇴 처리된 아이디 입니다.");
			$(".uid2").val('');
			$(".uid3").val('');
			$("#upass").val('');
			$("#select").val('');
			$(".uid2").focus();
			return false;
		}
		
		var tempVal = $(".uid2").val() + "@" + $(".uid3").val();
		$("#uid").val(tempVal);
		return true;
	}
</script>


</body>
</html>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>




