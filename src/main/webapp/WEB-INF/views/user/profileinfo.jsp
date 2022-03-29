<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ProfileInfo</title>
<link href="${path}/resources/css/profileinfo.css" rel="stylesheet"/>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<div class="container">
	<div>
		<div class="snb_area">
			<a href="javascript:myPageView('${member.uid}')">
				<h2 class="sub_main_title">마이 페이지</h2>
			</a>
			<nav class="snb">
				<div class="snb_list">
					<strong class="snb_title">쇼핑 정보</strong>
					<ul class="snb_menu">
						<li class="menu_item"><a class="menu_link" href="javascript:buyPageView('${member.uid}')">구매 내역</a></li> 
						<li class="menu_item"><a class="menu_link" href="javascript:wishListView('${member.uid}')">관심 상품</a></li>
					</ul>
				</div>
				<div class="snb_list">
					<strong class="snb_title">내 정보</strong>
					<ul class="snb_menu">
						<li class="menu_item"><a class="menu_link" href="javascript:profileinfoView('${member.uid}')">프로필 정보</a></li> 
						<li class="menu_item"><a class="menu_link" href="javascript:payView('${member.uid}')">결제 정보</a></li> 
						<li class="menu_item"><a class="menu_link" href="javascript:pointView('${member.uid}')">포인트</a></li>	
					</ul>
				</div>
			</nav>
		</div>
	</div>
	<div class="content_area">
		<div class="my_profile">
			<div class="content_title border">
				<div class="main_title">
					<h3>프로필 정보</h3>
				</div>
			</div>
			<form class="imageChange" name="imageChange" id="imageChange" action="imageChangePost" method="POST" onsubmit="return imageSubmit()" enctype="multipart/form-data">
				<input type="hidden" name="uid" value="${member.uid}"/>
				<div class="user_profile">
					<div class="profile_thumb">
					<c:choose>
							<c:when test="${!empty member.user_img}">
								<img id="uploadImage" class="uploadImage" src="${path}/upload/profile/${member.uid}/${member.user_img}"/>
							</c:when>
							<c:otherwise>
								<img id="uploadImage" class="uploadImage" src="${path}/resources/img/profile.jpg"/>
							</c:otherwise>
					</c:choose>
					<%-- <img src="${path}/resources/img/profile.jpg" id="uploadImage" class="uploadImage"/> --%>
					<br/>
					<input type="file" id="profileImage" name="profileImage" accept="image/*" />
					<br/>
					</div>
					<div class="profile_detail">
						<strong class="name">${member.unick}</strong>
						<div class="profile_btn_box">
							<div class="profile_btn1">
								<input type="button" class="abc btn outlinegrey small" id="my-button" onclick="onClickUpload();" value="프로필 사진 선택" />
								<input type="button" class="abc btn outlinegrey small" id="removeProfile" value="취소"/>
								<input type="submit" class="abcd btn outlinegrey small" id="changeClear" value="변경완료"/>
							</div>
						</div>
					</div>
				</div>
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			</form>
			<input type="file" accept="image/*" hidden="hidden">
			<div class="profile_info">
				<div class="profile_group">
				 	<h4 class="group_title">로그인 정보</h4>
				 	<div class="unit">
				 		<h5 class="title">아이디</h5>
				 		<p class="desc id">${member.uid}</p>
				 	</div>
				 	<div class="unit">
				 		<h5 class="title">비밀번호</h5>
				 		<p class="desc password">*********</p>
				 		<button type="button" id="modifyChange" class="btn btn_modify outlinegrey small">변경</button>
				 	</div>
				 	<div class="PassModify">
				 		<h5 class="input_title">비밀번호 변경</h5>
				 		<div class="input_box">
				 			<h6 class="input_title">새로운 비밀번호</h6>
				 			<div class="input_item">
				 				<input type="password" id="upass" name="upass" placeholder="영문, 숫자, 특수문자 조합 8-16자" autocomplete="off" class="input_txt">
				 				<div class="result"></div>
				 			</div>
				 		</div>
				 		<div class="input_box">
				 			<h6 class="input_title">새로운 비밀번호 확인</h6>
				 			<div class="input_item">
				 				<input type="password" id="reupass" name="reupass" placeholder="영문, 숫자, 특수문자 조합 8-16자" autocomplete="off" class="input_txt">
				 				<div class="result"></div>
				 			</div>
				 		</div>
				 		<div class="modify_btn_box">
				 			<button type="button" class="btn outlinegrey medium" id="modifyChange2">취소</button>
				 			<input type="submit" id="passChange" class="btn solid medium disabled" onclick="passChangeSubmit()" value="저장" />
				 		</div>
					</div>
				 <!-- 	</form> -->
				<div class="profile_group">
					<h4 class="group_title">개인 정보</h4>
					<div class="unit">
						<h5 class="title">이름</h5>
						<p class="desc">${member.uname}</p>
					</div>
					<div class="unit">
					<form class="phone" name="phone" id="phoneForm" action="phoneChangePost" method="POST" onsubmit="return phoneSubmit();">
						<input type="hidden" name="uid" id="uid"/>
						<h5 class="title">휴대폰 번호</h5>
						<button type="button" id="phoneChange" class="btn btn_modify outlinegrey small">변경</button>
						<input style="border:0 solid black;" type="text" name="phone" id="phone" class="desc" value="${member.phone}" oninput="autoHyphen(this)" maxlength="13" placeholder="번호작성" autocomplete="off"/>
						<input type="submit" id="SubPhoneChange" class="btn btn_modify outlinegrey small" value="변경 완료"/>
						<div class="result"></div>
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
					</form>	
					</div>
					
				</div>
				<input type="submit" id="delete" class="btn outlinegrey medium" onclick="profileSubmit()" value="회원 탈퇴" />
			</div>
		</div>
	</div>
</div>
</div>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>

	$("#changeClear").hide();
	$(".PassModify").hide();
	$("#SubPhoneChange").hide();

	$("#my-button").on("click",function(){
		$("#changeClear").show();
	});
	
	$("#phoneChange").on("click",function(){
		$("#phoneChange").hide();
		$("#SubPhoneChange").show();
	});
	
	$("#modifyChange").on("click",function(){
		$(".PassModify").show();
	});
	
	$("#modifyChange2").on("click",function(){
		$(".PassModify").hide();
	});


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
	
	function passChangeSubmit(){
		if(!boolPassword){
			alert("비밀번호를 확인해주세요.");
			$("#upass").focus();
			return false;
		}else if(!boolPassCheck){
			alert("비밀번호 일치 여부를 확인해주세요.");
			$("#urepass").focus();
			return false;
		}
		var result = confirm("비밀번호 변경 하시겠습니까?");
		var uid = "${member.uid}";
		var upass = $("#upass").val();
		if(result){
		    alert("비밀번호 변경 되었습니다. 다시 로그인 해주세요.");
		    
		   $.ajax({
		    	type : "POST",
		    	url : "${path}/user/pwChangePost",
		    	data : {
		    		upass : upass,
		    		uid : uid,
		    		'${_csrf.parameterName}' : '${_csrf.token}'
		    	},
		    	dataType : "json",
		    	success : function(){
		    		console.log("비밀번호 변경 성공");
		    	}
		    });
		    
		    location.href = "${path}/user/logout";
		}else{
			return false;
		} 
	}
	
	
	
	// 전화번호 작성 및 인증
	var boolPhone = false;
	
	// 휴대폰 번호 -표시 없이 숫자만
	var regexMobile = /^[0-9]{2,3}-?[0-9]{3,4}-?[0-9]{4}$/;	
	
	
	$("#phoneChange").on("click",function(){
		$("#phone").val('');
	});
	
	$("#phone").on("input",function(){
		regexMobile.replace
		var elP = $(this).parent().find(".result");
		var phone = $("#phone").val();
		var message = "형식에 맞지 않는 휴대폰 번호입니다.";
		boolPhone = checkRegex(elP,phone,regexMobile,message,checkPhoneAjax);
		// 휴대폰 번호 중복체크
		 function checkPhoneAjax(elP){
			
			$.ajax({
				type : "POST",
				url : "${path}/user/phoneCheck",
				data : {
					phone : phone,
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
	
	
	function phoneSubmit(){
		var uid = "${member.uid}";
		if(!boolPhone){
			alert("휴대폰 번호를 다시 입력해주세요.");
			$("#phone").focus();
			return false;
		}
		$("#uid").val(uid);
		alert("휴대폰 번호 변경이 완료되었습니다.");
		return true
	}
	
	 function profileSubmit(){
		
		var result = confirm("정말 탈퇴 하시겠습니까?");
		var uid = "${member.uid}";
		if(result){
		    alert("탈퇴 처리 되었습니다.");
		    
		   $.ajax({
		    	type : "POST",
		    	url : "${path}/user/userDelete",
		    	data : {
		    		uid : uid,
		    		'${_csrf.parameterName}' : '${_csrf.token}'
		    	},
		    	dataType : "json",
		    	success : function(){
		    		console.log("탈퇴 성공");
		    	}
		    });
		    
		    location.href = "${path}/user/logout";
		}else{
			return false;
		}
	}
	 
	 
	function imageSubmit(){
		alert("프로필 사진 변경이 완료되었습니다");
		var imgsrc = $("#profileImage").val();
		console.log(imgsrc);
		return true;
			
	} 
	 
	function profile(){
		console.log("프로필정보에 두번누르기");
		var uid = "${member.uid}";
		$(".uid").val(uid);
	}
	 
	const autoHyphen = (target) => {
		 target.value = target.value
		   .replace(/[^0-9]/, '')
		   .replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`);
	}
	
	function onClickUpload() {
	      let myInput = document.getElementById("profileImage");
	      $(".uploadImage").attr("src","${path}/resources/img/profile.jpg");
	      myInput.click();
	    }
	
	// 포스트 방식으로 a 태그 데이터 넘겨주기
	function profileinfoView(uid){
	    let f = document.createElement('form');
	    
	    let obj;
	    obj = document.createElement('input');
	    obj.setAttribute('type', 'hidden');
	    obj.setAttribute('name', 'uid');
	    obj.setAttribute('value', uid);
	    let obj1;
	    obj1 = document.createElement('input');
	    obj1.setAttribute('name', '${_csrf.parameterName}');
	    obj1.setAttribute('value', '${_csrf.token}');
	    
	    f.appendChild(obj);
	    f.appendChild(obj1);
	    f.setAttribute('method', 'Post');
	    f.setAttribute('action', 'profileinfo');
	    document.body.appendChild(f);
	    f.submit();
	}
	
	function payView(uid){
	    let f = document.createElement('form');
	    
	    let obj;
	    obj = document.createElement('input');
	    obj.setAttribute('type', 'hidden');
	    obj.setAttribute('name', 'uid');
	    obj.setAttribute('value', uid);
	    let obj1;
	    obj1 = document.createElement('input');
	    obj1.setAttribute('name', '${_csrf.parameterName}');
	    obj1.setAttribute('value', '${_csrf.token}');
	    
	    f.appendChild(obj);
	    f.appendChild(obj1);
	    f.setAttribute('method', 'Post');
	    f.setAttribute('action', 'pay');
	    document.body.appendChild(f);
	    f.submit();
	}
	
	function pointView(uid){
	    let f = document.createElement('form');
	    
	    let obj;
	    obj = document.createElement('input');
	    obj.setAttribute('type', 'hidden');
	    obj.setAttribute('name', 'uid');
	    obj.setAttribute('value', uid);
	    let obj1;
	    obj1 = document.createElement('input');
	    obj1.setAttribute('name', '${_csrf.parameterName}');
	    obj1.setAttribute('value', '${_csrf.token}');
	    
	    f.appendChild(obj);
	    f.appendChild(obj1);
	    f.setAttribute('method', 'Post');
	    f.setAttribute('action', 'point');
	    document.body.appendChild(f);
	    f.submit();
	}
	
	function wishListView(uid){
	    let f = document.createElement('form');
	    
	    let obj;
	    obj = document.createElement('input');
	    obj.setAttribute('type', 'hidden');
	    obj.setAttribute('name', 'uid');
	    obj.setAttribute('value', uid);
	    let obj1;
	    obj1 = document.createElement('input');
	    obj1.setAttribute('name', '${_csrf.parameterName}');
	    obj1.setAttribute('value', '${_csrf.token}');
	    
	    f.appendChild(obj);
	    f.appendChild(obj1);
	    f.setAttribute('method', 'Post');
	    f.setAttribute('action', 'wishList');
	    document.body.appendChild(f);
	    f.submit();
	}
	
	function buyPageView(uid){
	    let f = document.createElement('form');
	    
	    let obj;
	    obj = document.createElement('input');
	    obj.setAttribute('type', 'hidden');
	    obj.setAttribute('name', 'uid');
	    obj.setAttribute('value', uid);
	    let obj1;
	    obj1 = document.createElement('input');
	    obj1.setAttribute('name', '${_csrf.parameterName}');
	    obj1.setAttribute('value', '${_csrf.token}');
	    
	    f.appendChild(obj);
	    f.appendChild(obj1);
	    f.setAttribute('method', 'Post');
	    f.setAttribute('action', 'buyPage');
	    document.body.appendChild(f);
	    f.submit();
	}
	
	function myPageView(uid){
	    let f = document.createElement('form');
	    
	    let obj;
	    obj = document.createElement('input');
	    obj.setAttribute('type', 'hidden');
	    obj.setAttribute('name', 'uid');
	    obj.setAttribute('value', uid);
	    let obj1;
	    obj1 = document.createElement('input');
	    obj1.setAttribute('name', '${_csrf.parameterName}');
	    obj1.setAttribute('value', '${_csrf.token}');
	    
	    f.appendChild(obj);
	    f.appendChild(obj1);
	    f.setAttribute('method', 'Post');
	    f.setAttribute('action', 'myPage');
	    document.body.appendChild(f);
	    f.submit();
	}
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>