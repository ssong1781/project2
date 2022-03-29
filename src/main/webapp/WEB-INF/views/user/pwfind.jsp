<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>플렉스 FLEX </title>
</head>
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
 		max-width:600px;
 	}


	table{
     font-family: 'Gowun Batang', serif;
    }
	
	#codeWrap, #acceptEmail, #emailCodeWrap{
	 		display:none;
	}
	
	.upass, .reupass{
		display:none;
	}
	
	 input[type=text],input[type=password]{
		border-right:1px; 
    	border-top:1px; 
    	border-left:1px; 
    	margin-bottom:15px;
    	border-bottom-width:thin;
    	border-color: #E2E2E2;
    }
    
    input:focus {outline:none;}
    
    .findButton, .email {
		width: 200px;
	    color: #ffffff;
	    border: #E2E2E2 solid 1px;
	    padding: 10px;
	    background-color: #c0c0c0;
	    text-align: center;
	    border-radius: 10px;
	    font-weight: bold;
	}
	
	.findButton:hover, .email:hover{
	    color: #ffffff;
	    background-color: #222;
	}
	
	.email{
		padding:7px;
		width: auto;
	    border-radius: 10px;
	}
	
	input::placeholder {
	  	color: #E2E2E2;
	  	font-family:inherit;
	}
	
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
	
	
</style>
<body>
<div class="wrap">
	<br/>
	<br/>
	<br/>
	<article>
			<form class="pwfind" name="pwfind" id="pwfindForm" action="pwChangePost" method="POST" onsubmit="return pwfindSubmit();">
				<table>
					<tr>
						<th colspan="2">
							<h1 style="font-size:40px">비밀번호 찾기</h1>
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
			    		<td>
			    			<button type="button" id="acceptEmail" class="email">이메일 인증</button>
			    			<div id="emailCodeWrap">
								<input type="text" id="emailCode" maxlength="5" autocomplete="off" />
								<button type="button" id="emailAcceptBtn" class="email">인증완료</button>
							</div>
			    		</td>
			    	</tr>
					
					<tr class="upass">
						<td>새로운 비밀번호</td>
					</tr>
						
					<tr class="upass">
						<td>
							<input type="password" name="upass" id="upass" placeholder="USER PW" autocomplete="off" alt="비밀번호" />
							<div class="result"></div>
						</td>
					</tr>	
						
					<tr class="reupass">
						<td>새로운 비밀번호 확인</td>
					</tr>
					
					<tr class="reupass">
						<td>
							<input type="password" name="reupass" id="reupass" placeholder="USER PW" autocomplete="off" alt="비밀번호 확인" />
							<div class="result"></div>
						</td>
					</tr>
					
					<tr>
						<td colspan="2" style="text-align: center;padding-top:25px;">
							<input type="submit" class="findButton" value="비밀번호 변경" />
							<input type="button" class="findButton" onclick="location.href='${path}/user/login';" value="로그인 하기" />
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
	
	var boolUid = false;
	
	
	
	//(메세지를 보여줄 요소,검사할 값,비교할 정규식,출력할 메세지,비동기 통신 함수)
	function checkRegex(elP,valP,regexP,messageP,ajaxP){
		if(regexP.test(valP) === false){
			showMessage(elP,messageP,false);
			return false;
		}else if(regexP.test(valP) !== false
				&& ajaxP === null){
			showMessage(elP,"사용가능합니다.",true);
			return true;
		}else{
			if(ajaxP !== null){
				ajaxP(elP);
			}
		}
	}
	
	// 메세지를 보여줄 요소, 메세지, 성공 실패 여부
	function showMessage(elP,messageP, isCheck){
		var html ="<span style='margin-left:5px;font-size:12px;";
		html += isCheck ? "color:green;" : "color:red;";
		html +="'>";
		html +=messageP;
		html +="</span>";
		$(elP).html(html);
	}

	// 이메일 확인 정규식
	var regexEmail =/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;       
	
	// 옵션 선택시 uid3 값 입력
	$("#select").change("option",function(){
		   if ($('#select').val() == 'directly') {
	               $('#textEmail').attr("disabled", false);
	               $('#textEmail').val("");
	               $('#textEmail').focus();
           } else {
				$(".uid3").val($("#select").val());
           }
			boolEmailCode = false;
			var tempVal = $(".uid2").val() + "@" + $(".uid3").val();
			var elP = $(this).parent().find(".result");
			var message = "올바른 이메일 형식이 아닙니다.";
			boolUid = checkRegex(elP,tempVal,regexEmail,message,findUidAjax);
			
			// 아이디 중복 체크
			function findUidAjax(elP){
				//var tempVal = $(".uid2").val() + "@" + $(".uid3").val();
				$.ajax({
					type : "POST",
					url : "${path}/user/findUidCheck",
					data : {
						uid : tempVal,
						'${_csrf.parameterName}' : '${_csrf.token}'
					},
					dataType : "json",
					success : function(result){
						boolUid = result;
						showMessage(
								elP,
							 boolUid ? "인증버튼을 눌러주세요." : "존재하지 않는 아이디 입니다.",
							 boolUid		 
						);
						if(boolUid){
							// 사용가능 이메일 인증 코드 발송 버튼 활성화
							$("#acceptEmail").show();
						}else{
							$("#acceptEmail").hide();
						}
					}
				});
			} 
		});
	
		// 이메일 입력태그에 값이 작성이 될때
		$(".uid2, .uid3").on("input",function(){
			boolEmailCode = false;
			var tempVal = $(".uid2").val() + "@" + $(".uid3").val();
			var elP = $(this).parent().find(".result");
			var message = "올바른 이메일 형식이 아닙니다.";
			boolUid = checkRegex(elP,tempVal,regexEmail,message,findUidAjax);
			
			// 아이디 중복 체크
			function findUidAjax(elP){
				$.ajax({
					type : "POST",
					url : "${path}/user/findUidCheck",
					data : {
						uid : tempVal,
						'${_csrf.parameterName}' : '${_csrf.token}'
					},
					dataType : "json",
					success : function(result){
						boolUid = result;
						showMessage(
								elP,
							 boolUid ? "인증버튼을 눌러주세요." : "존재하지 않는 아이디 입니다.",
							 boolUid		 
						);
						if(boolUid){
							// 사용가능 이메일 인증 코드 발송 버튼 활성화
							$("#acceptEmail").show();
						}else{
							$("#acceptEmail").hide();
						}
					}
				});
			} 
		});
	
	
	// 인증 메일에 발송된 코드 저장
	var emailCode = "";
	
	// 인증 메일 발송
	$("#acceptEmail").click(function(){
		var tempVal = $(".uid2").val() + "@" + $(".uid3").val();
		$.ajax({
			type : "GET",
			dataType : "text",
			url : "${path}/user/checkEmail",
			data : {
				uid : tempVal
			},
			success : function(code){
				console.log(code);
				if(code){
					emailCode = code;
					alert("메일 발송 완료!\n메일을 확인해주세요.");
					$("#emailCodeWrap").show();
				}else{
					alert("메일 전송 실패 관리자에게 문의해 주세요.");
				}
			}
		});
	});
	
	// 인증 코드 확인 완료 여부
	var boolEmailCode = false;
	
	// 인증 코드 검사
	$("#emailAcceptBtn").click(function(){
		var userCode = $("#emailCode").val();
		if(emailCode == userCode){
			boolEmailCode = true;
			alert("이메일 인증이 완료되었습니다.");
			$("#emailCodeWrap").hide();
			$(".upass").show();
			$(".reupass").show();
			$("#acceptEmail").hide();
			$("#subUid").hide();
		}else{
			boolEmailCode = false;
			alert("인증 코드를 다시 확인해 주세요.");
		}
	});

	// 비밀번호 확인
	var boolPassword = false;
	
	// 특수문자 포함 비밀번호
	var regexPass = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/;
	// 비밀번호 형식 확인
	$("#upass").on("input",function(){
		var tempVal = $(this).val();
		var elp = $(this).parent().find(".result");
		var message = "특수문자 포함 영문/숫자 조합하여 8~16자이내 작성";
		boolPassword = checkRegex(elp,tempVal,regexPass,message,null);
	});
	
	// 비밀번호 동일 값 체크 여부
	var boolPassCheck = false;
	
	// 비밀번호 확인
	$("#reupass").on("input",function(){
		var tempVal = $(this).val();
		var message = "";
		var originalVal = $("#upass").val();
		var elP = $(this).parent().find(".result");
		if(boolPassword){
			
			if(tempVal == originalVal){
				boolPassCheck = true;
				message ="비밀번호가 일치합니다.";
			}else{
				boolPassCheck = false;
				message ="비밀번호가 일치 하지않습니다.";
			}
			
		}else{
			boolPassCheck = false;
			message = "비밀번호를 먼저 확인해 주세요.";
		}
		showMessage(elP,message,boolPassCheck);
	});
	
	function pwfindSubmit(){
		
		
	   	 if(!boolUid){
			alert("아이디를 확인해 주세요.");
			$("#uid").focus();
			return false;
		}else if(!boolEmailCode){
			alert("이메일 인증을 완료해 주세요.");
			$("#emailCode").focus();
			return false;
		}else if(!boolPassword){
			alert("비밀번호를 확인해주세요.");
			$("#upass").focus();
			return false;
		}else if(!boolPassCheck){
			alert("비밀번호 일치 여부를 확인해주세요.");
			$("#urepass").focus();
			return false;
		} else{
			var tempVal = $(".uid2").val() + "@" + $(".uid3").val();
			$("#uid").val(tempVal);
			alert("비밀번호 변경 성공");
			return true;
		}  
	}
</script>	
</body>
</html>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>