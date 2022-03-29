<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>    
<c:set var="path" value="${pageContext.request.contextPath}" scope="session" />
<link href="${path}/resources/css/comment.css" rel="stylesheet"/>
</head>
<body>
<sec:authorize access="isAuthenticated()">
	<sec:authentication var="member" property="principal.member"/>
</sec:authorize>
<div class="layer_social_comment layer lg">
	<div class="layer_container">
		<div class="layer_header">
			<h2 class="title">댓글</h2>
		</div>
		<button class="closebtn">
			<img src="${path}/resources/img/x.png">
		</button>
		<div class="commentWrite">
			<div class="comment_top">
				<div class="comment_box">
					<a href="sprofile/${vo.uno}">
						<c:choose>
							<c:when test="${empty vo.user_img}">
								<img src="${path}/resources/img/profile.jpg" id="profileImage" alt="프로필">	
							</c:when>
							<c:otherwise>
								<img src="${path}/upload/profile/${vo.uid}/${vo.user_img}" id="profileImage" alt="프로필">
							</c:otherwise>
						</c:choose>
						
					</a>
					<div>
						<div class="main_">
							<p class="user_name">${vo.unick}</p>
							<p class="comment_txt">${vo.content}</p>
						</div>
						<div class="sub">
							<span class="post-time"><f:formatDate value="${vo.regdate}" pattern="yyyy.MM.dd"/></span>
							<p class="likes_">• 좋아요  ${vo.heart}개</p>
						</div>
					</div>
					<input type="hidden" name="bno" value="2"/>
				</div>
			</div>
			<c:if test="${!empty uno && !empty member.uno}">
			<div class="comment_input">
				<div class="comment_detail">
					<a href="${path}/sprofile/${uno}" class="profile_link">
						<img src="${path}/resources/img/profile.jpg" class="profileImage">
					</a>
					<div>
						<input type="text" id="content" class="content" placeholder="댓글입력.." required/>
						<input type="button" class="btn btn btn_my_style outlinegrey small" id="commentAddBtn" value="등록" />
					</div>
				</div>
			</div>
			</c:if>
			<div class="comment_content">
				<ul id="comments" class="comments">
				
				</ul>
			</div>
		</div>
	</div>
</div>
</body>
<script>
var sno = '${vo.sno}';
var commentPage = 1;


$(".commentImg").click(function(){
	$(".layer_social_comment").fadeIn();
	sno = $(this).parent(".commentBtn").val();
	getListPage(commentPage);
});
$(".closebtn").click(function(){
	$(".layer_social_comment").fadeOut();
})

/* getListPage(commentPage); */

function getListPage(page){
	console.log('getListPage '+sno);
	commentPage = page;
	$.getJSON('${path}/comments/'+sno+'/'+page, function(data){
		console.log(data);
		console.log('list '+data.list);
		var str = "";
		$(data.list).each(function(){
			str +="<div class='comment_group'>";
			str +="<div class='comment_unit'>";
			str +="<div class='reply_box'>";
			str +="	<a href='${path}/sprofile/"+this.uno+"' class='profile_link'>";
			if(this.user_img == ''){
				str +="		<img src='${path}/resources/img/profile.jpg' id='profileImage'>";	
			}else{
				console.log('uid   '+  this.uid);
				console.log('user_img  '+  this.user_img);
				str +="		<img src='${path}/upload/profile/"+this.uid+"/"+this.user_img+"' id='profileImage'>";	
			}
			
			str +="	</a>"+"&nbsp;";
			str +="<li data-text='"+this.content+"' class='commentLi'>";
			str +="<span class='user_name'>"+this.commentAuth+"</span>"+"&nbsp;&nbsp;"+this.content;
			str +="<div>";
			str +="<span class='post-time' patter='yyyy.MM.dd'>"+getDate(this.updatedate)+"</span>";
			
			// 로그인한 사용자가 댓글 작성자 일때만 노출
			if(isCheckUser(this.uno)){
				str +="<input data-rno='"+this.rno+"' type='button' id='deleteBtn' class='deleteBtn' value='댓글 삭제'/>";
			}
			str +=" <a href='#' class='commentReply'>답글 쓰기 &nbsp;</a>";
			str +="</div>";
			str +="</li>";
			str +="</div>";
			str +="</div>";
			str +="</div>";
		});
		
		$("#comments").html(str);
		
		// data.pm
		var pageBlock = "<div class='pagemaker'>";
		for(var i=data.pm.startPage; i<=data.pm.endPage; i++){
			pageBlock +="<li>";
			pageBlock +="<span class='paging' onclick='getListPage("+i+");'>"+i+"</span>";
			pageBlock +="</li>";
		}
		pageBlock += "</div>";
		
		$("#comments").append(pageBlock);
		
	});
}

// 댓글 작성
$(".btn_my_style").click(function(){
	// 댓글 등록 요청 전달
	var content = $("#content").val();
	console.log(content +'  작성한 내용');
	/* var uno = "${vo.uno}"; */
	var uno = '${uno}';
	
	$.ajax({
		type : "POST",
		url : '${path}/comments/add',
		headers : {
			"Content-Type" : "application/json",
			"X-HTTP-Method-Override" : "POST",
			"${_csrf.headerName}" : "${_csrf.token}"
		},
		data : JSON.stringify({
			sno : sno,
			content : content,
			uno : uno
		}),
		dataType : "text",
		success : function(result){
			alert(result);	
			$("#content").val("");
			$("#content").focus();
			commentPage = 1;
			getListPage(commentPage);
		},
		error : function(res){
			alert(res.responseText);
		}
	});
});
 
// 댓글 삭제요청
$("#comments").on("click",".deleteBtn",function (){
	var isConfirm = confirm("댓글을 삭제하시겠습니까?");
	if(isConfirm){
		var rno = $(this).attr("data-rno");
		console.log(rno);
		$.ajax({
			type : "delete",
			url : '${path}/comments/remove/'+rno,
			headers : {
				"${_csrf.headerName}" : "${_csrf.token}"
			},
			dataType : "text",
			success : function(result){
				alert(result);
				getListPage(commentPage);
			},
			error : function(res){
				alert(res.responseText);
			}
		});
	}
});

// 현재 로그인한 사용자 정보와 일치하는 지 확인
function isCheckUser(uno){
	let userUno = '${member.uno}';
	console.log('uno       '+uno);
	console.log('userUno   ' +userUno);
	
	if(userUno != "" && userUno == uno){
		return true;
	}
	return false;
}

function getDate(timeValue){
	var dateObj = new Date(timeValue);
	var year = dateObj.getFullYear();
	var month = dateObj.getMonth()+1;
	var date = dateObj.getDate();
	var hour = dateObj.getHours();
	var minute = dateObj.getMinutes();
	var seconds = dateObj.getSeconds();
	return year+"/"+month+"/"+date+" "+
	       hour+":"+minute+":"+seconds;
}


</script>
</html>