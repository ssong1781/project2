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
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" type="text/css" />
</head>
<script>
	const autoHyphen = (target) => {
		 target.value = target.value
		   .replace(/[^0-9]/, '')
		   .replace(/^(\d{3,4})(\d{4})$/, `$1-$2`);
	}
	
	
	function onClickUpload() {
      let myInput = document.getElementById("profileImage");
      myInput.click();
    }
	
	 
</script>
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
     font-family: 'Gowun Batang', serif;
    }
 	table{
 		max-width:600px;
 	}
 	
 	.uploadImage{
 		width:100px;
 		height:100px;
 		border-radius:50px;
 		border:1px solid #ccc;
 	}


	#codeWrap, #acceptEmail, #emailCodeWrap{
 		display:none;
 	}
 	
    #profileImage {
        visibility: hidden;
    }
    
    input[type=text],input[type=password]{
		border-right:1px; 
    	border-top:1px; 
    	border-left:1px; 
    	margin-bottom:10px;
    	border-bottom-width:thin;
    	border-color: #E2E2E2;
    }
    
    
    .gender{
    	margin-bottom:2px;
    }
    
    
    input:focus {outline:none;}
    
    
	.joinButton {
		width: 200px;
	    color: #ffffff;
	    border: #E2E2E2 solid 1px;
	    padding: 10px;
	    background-color: #c0c0c0;
	    text-align: center;
	    border-radius: 10px;
	    font-weight: bold;
	}
	
	.joinButton:hover, #addrButton:hover, .email:hover{
	    color: #ffffff;
	    background-color: #222;
	}
	
	.email{
		padding:7px;
		width: auto;
	    color: #ffffff;
	    border: #E2E2E2 solid 1px;
	    background-color: #c0c0c0;
	    text-align: center;
	    font-weight: bold;
	    border-radius: 10px;
	}

	#addrButton{
		padding:5px;
		width: 80px;
	    color: #ffffff;
	    border: #E2E2E2 solid 1px;
	    background-color: #c0c0c0;
	    text-align: center;
	    border-radius: 10px;
	    font-weight: bold;
	}	
	
	input::placeholder {
	  	color: #E2E2E2;
	  	font-family:inherit;
	}
	
	#my-button, #removeProfile{
		margin-bottom:50px;
		width:150px;
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

	.phone1{
		width: 75px;
		height: 27px;
	}
	
	input[type=radio] {
	  -webkit-appearance: none;
	  -moz-appearance: none;
	  appearance: none;

	  border-radius: 50%;
	  width: 16px;
	  height: 16px;
	
	  border: 2px solid #999;
	  transition: 0.2s all linear;
	  margin-right: 3px;
	
	  position: relative;
	  top: 4px;
	}

	input[type=radio]:checked {
	  border: 6px solid black;
	}
	
</style>

<body>
   


    
	<div class="wrap">
		<br/>
		<br/>
		<br/>
		<article>
			<form class="join" name="join" id="joinForm" action="signUpPost" method="POST" onsubmit="return joinSubmit();" enctype="multipart/form-data">
				<table>
					<tr>
						<th colspan="2">
							<h1 style="font-size:40px">회원가입</h1>
						</th>
					</tr>
					<tr class="header">
						<td style="text-align:center" colspan="2">
							<img src="${path}/resources/img/profile.jpg" id="uploadImage" class="uploadImage"/>
							<br/>
							<input type="file" id="profileImage" name="profileImage" accept="image/*" />
							<br/>
							<input type="button" class="joinButton" id="my-button" onclick="onClickUpload();" value="프로필 사진 선택" />
							<input type="button" class="joinButton" id="removeProfile" value="지우기"/>
						</td>
					</tr>
					<tr>
						<td>이름</td>
					</tr>
					<tr>
						<td>
							<input type="text" name="uname" id="uname" placeholder="USER NAME" alt="이름" autocomplete="off" />
							<div class="result" id="subUname"></div>
						</td>
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
					
					
					<tr>
						<td>닉네임</td>
					</tr>
					<tr>
						<td>
							<input type="text" name="unick" id="unick" placeholder="USER NICKNAME" autocomplete="off" alt="닉네임" />
							<div class="result"></div>
						</td>
					</tr>
					
					<tr>
						<td>비밀번호</td>
					</tr>
					<tr>
						<td>
							<input type="password" name="upass" id="upass" placeholder="USER PW" autocomplete="off" alt="비밀번호" />
							<div class="result"></div>
						</td>
					</tr>
					<tr>
						<td>비밀번호 확인</td>
					</tr>
					<tr>
						<td>
							<input type="password" name="reupass" id="reupass" placeholder="USER PW" autocomplete="off" alt="비밀번호 확인" />
							<div class="result"></div>
						</td>
					</tr>
					
					<tr>
						<td>생년월일</td>
					<tr>
						<td>
							<input type="text" name="birth" id="birth" placeholder="USER BIRTH" autocomplete="off" alt="생년월일" maxlength="8" readonly  />
							<div class="result"></div>
						</td>
					</tr>
					
					<tr>
						<td>성별</td>
					</tr>
					
					<tr>
						<td>
							<label>
								<input type="radio" name="gender" class="gender" value="남성" /> 남성
							</label>
							<label>
								<input type="radio" name="gender" class="gender" value="여성" /> 여성
							</label>
						</td>
					</tr>
					
					<tr>
						<td>휴대폰 번호</td>
					</tr>
					
					<tr>
						<td>
							<input type="hidden" name="phone" id="phone" class="phone" value="" />
							 <select id="phone1" class="phone1">
					            <option value="" disabled selected></option>
					            <option value="02" id="02">02</option>
					            <option value="010" id="010" selected>010</option>
					            <option value="011" id="011">011</option>
					            <option value="018" id="018">018</option>
					        </select>
							<input type="text" id="phone2" class="phone2" placeholder="USER PHONE" autocomplete="off" alt="휴대폰 번호" 
							   oninput="autoHyphen(this)" maxlength="9"/>
							<div class="result"></div>
						</td>
					</tr>
					
					<tr>
						<td>주소</td>
					</tr>
					
					<tr>
						<td>
							<div>
								<input type="text" name="post" class="addr"
									   id="post" placeholder="USER POST" alt="우편 번호" autocomplete="off" readonly />
								<input type="button" id="addrButton" value="주소찾기" onclick="daumPostCode();"/>
							</div>
							<input type="text" name="addr" class="addr"
								   id="addr" placeholder="USER ADDR" alt="주소" autocomplete="off" readonly />
							<input type="text" name="addr_detail" class="addr"
								   id="addr_detail" placeholder="USER DETAIL_ADDR" alt="상세주소" autocomplete="off"  /> 
						</td>
					</tr>
					
					<tr>
						<td colspan="2" style="text-align: center;padding-top:25px;">
							<input type="submit" class="joinButton" value="가입하기"/>
							<input type="button" class="joinButton" onclick="location.href='${path}/user/login';" value="나가기" />
						</td>
					</tr>
				</table>
				<br/>
				<br/>
				<br/>
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			</form>
		</article>
			<br/>
			<br/>
			<br/>
	 </div>
	 
	

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function daumPostCode(){
    	new daum.Postcode({
            oncomplete: function(data) {
                
                var fullAddr = "";	// 최종 주소
                var extraAddr = ""; // 조합형 주소
                
                if(data.userSelectedType == "R"){
                	fullAddr = data.roadAddress;
                }else{
                	fullAddr = data.jibunAddress;
                }
                
                if(data.userSelectedType == "R"){
                	// 법정 동명
                	if(data.bname !== ''){
                		extraAddr += data.bname; 
                	}
                	
                	// 건물명 
                	if(data.buildingName !== ''){
                		extraAddr += extraAddr !== '' ? ', '+data.buildingName : data.buildingName;
                	}
                	
                	fullAddr += (extraAddr !== '') ? '('+extraAddr+')' : '';
                }
                // 입력필드에 값 추가
                $("#post").val(data.zonecode);
                $("#addr").val(fullAddr);
                $("#addr_detail").focus();
            }
        }).open();
    }
    
</script>
<script>
	var imgTemp = $("#uploadImage").attr("src");
	$("#uname").focus();
	console.log(imgTemp);
	
	$("#profileImage").on("change",function(){
		var files = $(this)[0].files[0];
		console.log(files.type);
		if(!files.type.startsWith("image/")){
			console.log("이미지 아님");
			alert('이미지를 선택해주세요.');
			removeImage();
		}else{
			console.log("이미지 맞음");
			var path = window.URL.createObjectURL(files);
			$("#uploadImage").attr("src",path);
			console.log(path);
		}
	});
	
	$("#removeProfile").click(function(){
		removeImage();
	});
	
	function removeImage(){
		$("#profileImage").val("");
		$("#uploadImage").attr("src",imgTemp);
	}  
	
	
	
	var boolUnick = false;
	
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
		var html ="<span style='padding:0px;margin:0px;font-size:8px;";
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
			boolUid = checkRegex(elP,tempVal,regexEmail,message,checkUidAjax);
			
			// 아이디 중복 체크
			function checkUidAjax(elP){
				$.ajax({
					type : "POST",
					url : "${path}/user/uidCheck",
					data : {
						uid : tempVal,
						'${_csrf.parameterName}' : '${_csrf.token}'
					},
					dataType : "json",
					success : function(result){
						boolUid = result;
						showMessage(
								elP,
							 boolUid ? "사용가능한 아이디입니다." : "이미 존재하는 아이디입니다.",
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
		//$(".uid3").val($("#select").val());
		boolEmailCode = false;
		var tempVal = $(".uid2").val() + "@" + $(".uid3").val();
		var elP = $(this).parent().find(".result");
		var message = "올바른 이메일 형식이 아닙니다.";
		boolUid = checkRegex(elP,tempVal,regexEmail,message,checkUidAjax);
		
		// 아이디 중복 체크
		function checkUidAjax(elP){
			$.ajax({
				type : "POST",
				url : "${path}/user/uidCheck",
				data : {
					uid : tempVal,
					'${_csrf.parameterName}' : '${_csrf.token}'
				},
				dataType : "json",
				success : function(result){
					boolUid = result;
					showMessage(
							elP,
						 boolUid ? "사용가능한 아이디입니다." : "이미 존재하는 아이디입니다.",
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
				uid : tempVal,
				'${_csrf.parameterName}' : '${_csrf.token}'
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
	
	
	// 한글 영문 숫자 포함 8자 이내 
	var regexNcik = /^[가-힣-0-9a-zA-Z]{2,12}$/;	
	
	$("#unick").on("input",function(){
		var tempVal = $(this).val();
		var elP = $(this).find("+ .result");
		var message = "2~12글자 이내 한글과 영문,숫자로 작성해 주세요.";
		boolUnick = checkRegex(elP,tempVal,regexNcik,message,checkUnickAjax);
	});
	
	// 닉네임 중복체크
	function checkUnickAjax(elP){
		$.ajax({
			type : "POST",
			url : "${path}/user/unickCheck",
			data : {
				unick : $("#unick").val(),
				'${_csrf.parameterName}' : '${_csrf.token}'
			},
			dataType : "json",
			success : function(result){
				boolUnick = result;
				showMessage(
					elP,
					boolUnick ? "사용가능한 닉네임 입니다." : "이미 존재하는 닉네임입니다.",
					boolUnick	
				);
			}
		});
	}
	
	
	// 인증 코드 확인 완료 여부
	var boolEmailCode = false;
	
	// 인증 코드 검사
	$("#emailAcceptBtn").click(function(){
		var userCode = $("#emailCode").val();
		if(emailCode == userCode){
			boolEmailCode = true;
			alert("이메일 인증이 완료되었습니다.");
			$("#emailCodeWrap").hide();
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
	
	// 이름 확인 여부
	var boolName = false;
	
	// 한글 2~6글자 이내
	var regexName = /^[\uac00-\ud7a3]{2,6}$/;	
	
	// 사용자 이름 확인
	 $("#uname").on("input",function(){
		var tempVal = $(this).val();
		var elP = $(this).find("+ .result");
		var message = "2~6글자 이내 한글로 작성해 주세요.";
		boolName = checkRegex(elP,tempVal,regexName,message,null);
	}); 
	
	// 생년월일 트루반환
	function checkBirth(elP,valP,regexP,messageP,ajaxP){
		// 생년월일 클릭과 동시에 정규식 확인 가능/ readonly 이기 때문에 바로 리턴
		return true;
	}
		
	 // 생년월일 확인 yyyyMMdd
	var boolAge= false;
	
	 // 생년월일 정규식 19900505
	var regexBirth = /^(19[0-9][0-9]|20\d{2})-?(0[0-9]|1[0-2])-?(0[1-9]|[1-2][0-9]|3[0-1])$/

	$("#birth").change("input",function(){
		boolAge = checkBirth(regexBirth,null);
	});  

    $("#birth").datepicker({
		changeMonth : true,
		changeYear : true,
		dateFormat : "yy-mm-dd",
		dayNames : ['월요일','화요일','수요일','목요일','금요일','토요일','일요일'],
		dayNamesMin : ['월','화','수','목','금','토','일'],
		monthNamesShort : ['1','2','3','4','5','6','7','8','9','10','11','12'],
		monthNames : ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		showMonthAfterYear: true ,
		showAnim: "slide",
    	yearRange : 'c-62:c'
	});
    
    
	// 전화번호 작성 및 인증
	var boolPhone = false;
	
	// 휴대폰 번호 -표시 없이 숫자만
	var regexMobile = /^[0-9]{2,3}-?[0-9]{3,4}-?[0-9]{4}$/;		
	
	$("#phone1").change("option",function(){
		console.log($("#phone1").val());
	});
	
	$("#phone2").on("input",function(){
		regexMobile.replace
		var tempVal = $("#phone1").val() + "-" + $(this).val();
		var elP = $(this).parent().find(".result");
		var message = "형식에 맞지 않는 휴대폰 번호입니다.";
		boolPhone = checkRegex(elP,tempVal,regexMobile,message,checkPhoneAjax);
		
		// 휴대폰 번호 중복체크
		 function checkPhoneAjax(elP){
			$.ajax({
				type : "POST",
				url : "${path}/user/phoneCheck",
				data : {
					phone : tempVal,
					'${_csrf.parameterName}' : '${_csrf.token}'
				},
				dataType : "json",
				success : function(result){
					boolPhone = result;
					showMessage(
						elP,
						boolPhone ? "등록가능한 휴대폰번호 입니다." : "이미 등록된 휴대폰번호입니다.",
						boolPhone	
					);
				}
			});
		}
	});
	
	function joinSubmit(){
		
		
	 	// 주소 입력 태그 공백 확인
		var addObj = null;
		var boolAddress = false;
		$(".addr").each(function(){
			var val = $(this).val();
			
			boolAddress = (val !== '') ? true : false;
			if(!boolAddress){
				addrObj = $(this);
				// 반복문 탈출
				return false;
			}
			var hint = $(this).attr("placeholder");
		});
		
	   	 if(!boolName){
			alert("이름을 확인해 주세요.");
			$("#uname").focus();
			return false;
		}else if(!boolUid){
			alert("아이디를 확인해 주세요.");
			$("#uid").focus();
			return false;
		}else if(!boolEmailCode){
			alert("이메일 인증을 완료해 주세요.");
			$("#emailCode").focus();
			return false;
		}else if(!boolUnick){
			alert("닉네임을 확인해 주세요.");
			$("#unick").focus();
			return false;
		}else if(!boolPassword){
			alert("비밀번호를 확인해주세요.");
			$("#upass").focus();
			return false;
		}else if(!boolPassCheck){
			alert("비밀번호 일치 여부를 확인해주세요.");
			$("#urepass").focus();
			return false;
		}else if(!boolAge){
			alert("생년월일을 확인해주세요.");
			$("#age").focus();
			return false;
		}else if(!$(".gender").is(":checked")){
			alert("성별을 체크해주세요.");
			$("#gender").focus();
			return false;
		}else if(!boolPhone){
			alert("전화번호를 확인해 주세요.");
			$("#phone").focus();
			return false;
		} else if(!boolAddress){
			alert($(addrObj).attr("alt")+"을 확인해 주세요.");
			$(addrObj).focus();
			return false;
		}else{
			var tempVal = $(".uid2").val() + "@" + $(".uid3").val();
			$("#uid").val(tempVal);
			var tempPhone = $("#phone1").val() + "-" + $("#phone2").val();
			$("#phone").val(tempPhone);
			alert("회원가입 성공");
			return true;
		}  
	}
	
	
</script>
</body>
</html>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>


















