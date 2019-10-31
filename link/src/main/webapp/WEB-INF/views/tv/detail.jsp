<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<title>Link : TV 메인</title>
<link rel="shortcut icon" type="image/x-icon" href="../../../resources/images/shortcut-icon.PNG">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" type="image/x-icon" href="/mj/kurly/images/header_footer/tab-logo02.png">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script src="/link/resources/js/jquery.timeago.js"></script>
<script src="/link/resources/js/jquery.timeago.ko.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

<style>
.navbar-nav>li>a:hover, .navbar-nav>li>a {
	background-color: indigo;
}

.nav .open>a, .nav .open>a:focus, .nav .open>a:hover {
	background-color: indigo;
}

a:hover, a:focus {
	text-decoration: none;
}

.main-nav {
	background-color: indigo;
}

.blog-main-javer {
	position: relative;
	top: 5px;
	font-size: 15px;
	color: white;
	font-weight: 800;
}

.blog-main-blog {
	position: relative;
	top: 8px;
	font-size: 24px;
	color: white;
}

.btn-green {
	background-color: white;
	color: white;
	padding: 2px 6px;
}

.glyphicon-search {
	font-size: 23px;
	color: black;
}

.blog-navbar-id {
	color: white;
	position: relative;
	bottom: 3px;
	font-size: 13px;
	font-weight: bold;
	margin-right: 10px;
	cursor: pointer;
}

.glyphicon-triangle-bottom {
	margin-left: 5px;
}

.blog-navbar-img {
	position: relative;
	bottom: 3px;
	width: 30px;
}

.blog-navbar-right {
	position: relative;
}

.glyphicon glyphicon-triangle-bottom {
	color: white;
	font-size: 7px;
}

.bell {
	display: inline-block;
	position: relative;
	width: 60px;
	height: 50px;
	border-right: 1px solid white;
	border-left: 1px solid white;
	padding-right: 5px;
}

.envelope {
	display: inline-block;
	position: relative;
	width: 60px;
	height: 50px;
	border-right: 1px solid white;
}

.glyphicon-bell {
	color: white;
	position: relative;
	font-size: 20px;
	padding: 13px;
}

.glyphicon-envelope {
	color: white;
	position: relative;
	font-size: 20px;
	padding: 12px 20px;
}

.caret {
	color: white;
}

ul, li {
	list-style: none;
}

.tv-side-menu {
	border: 1px solid #CECECE;
	cursor: pointer;
	width: 180px;
	padding: 15px 30px 15px 30px;
	border-radius: 20px;
	margin: 2px;
	font-family: Georgia, "맑은 고딕";
	text-align: center;
}

.tv-side-menu:hover {
	color: white;
	background-color: indigo;
}

.tv-side-menubar {
	position: fixed;
	top: 150px;
	left: 100px;
	font-size: 15px;
}

.tv-side-menu a {
	text-decoration: none;
	color: black;
}

.tv-content-header {
	font-size: 20px;
	text-align: left;
	margin-top: 50px;
}

.tv-content-header a {
	text-decoration: none;
	color: black;
}

/*---------------------------네브-------------------------------------------------*/
/* width */
::-webkit-scrollbar {
	width: 10px;
}

/* Track */
::-webkit-scrollbar-track {
	box-shadow: inset 0 0 5px gray;
	border-radius: 3px;
}

/* Handle */
::-webkit-scrollbar-thumb {
	background: #CECECE;
	border-radius: 2px;
}

-------------------------
.tv-detail-video {
	width: 980px;
	height: 550px;
}

#myVideo {
	border-radius: 5px;
	
}

.tv-detail-title {
	border-top: 2px solid indigo;
	margin-top: 50px;
	border-bottom: 2px solid indigo;
	padding: 20px;
}

.tv-detail-chanel {
	border-bottom: 1px solid #CECECE;
}

.tv-detail-clip {
	border-bottom: 1px solid #CECECE;
	text-align: center;
}

.btn-detail-like {
	font-size: 30px;
	color: pink;
	cursor: pointer;
}

.likeOn {
	color: red;
}

.btn-detail-comment {
	font-size: 30px;
	color: blue;
	cursor: pointer;
}

.btn-detail-comment:hover {
	color: #1D05D8;
}

.btn-detail-later {
	font-size: 30px;
	color: black;
	cursor: pointer;
}

.btn-detail-later:hover {
	color: #141414;
}

.tv-clip-list {
	overflow: auto;
	height: 800px;
}

.clip-list-palytime {
	position: absolute;
	left: 0px;
	bottom: 46px;
	border: 1px solid black;
	color: white;
	background-color: black;
}

.clip-list-video {
	width: 100%;
}

.tv-detail-comment {
	border-top: 2px solid #CECECE;
	margin-top: 20px;
	margin-bottom: 20px;
}

.comment-tumbsup {
	display: inline-block;
	float: right;
	margin-left: 20px;
	margin-right: 20px;
	padding: 2px;
	border: 1px dashed gray;
	cursor: pointer;
}

.comment-tumbsdown {
	display: inline-block;
	float: right;
	margin-right: 20px;
	padding: 2px;
	border: 1px dashed gray;
	cursor: pointer;
}

.likeYnOn{
	border:1px solid indigo;
}

.clip-list-title {
	margin-top: 5px;
}

.clip-list-palylike-box {
	text-align: left;
	color: gray;
	border-bottom: 1px solid #CECECE;
}

.clip-list-video-box {
	position: relative;
	cursor: pointer;
	margin-top: 10px;
}

.tv-detail-video-dummy {
	border: 1px solid;
	width: 980px;
	height: 550px;
	display: none;
}
 .active {
 	
 	border: 2px dashed indigo;

 }
</style>

</head>

<body>
	<%@include file="common/nav.jsp"%>


	<div class="container" style="margin-top: 100px;">
		<div class="row">
			<div>
				<ul class="tv-side-menubar">
					<li class="tv-side-menu" onclick="location.href='home.do'">홈</li>
                   <li class="tv-side-menu" onclick="location.href='rank.do?category=best'">인기</li>
                   <li class="tv-side-menu chk-user" data-login="${not empty LOGIN_USER ? 'Y' : 'N' }" data-url="history.do?sort=recent">최근 본 동영상</li>
                   <li class="tv-side-menu chk-user" data-login="${not empty LOGIN_USER ? 'Y' : 'N' }" data-url="history.do?sort=later">나중에 볼 동영상</li>
                   <li class="tv-side-menu chk-user" data-login="${not empty LOGIN_USER ? 'Y' : 'N' }" data-url="history.do?sort=like">좋아요 한 동영상</li>
                   <li class="tv-side-menu chk-user" data-login="${not empty LOGIN_USER ? 'Y' : 'N' }" data-url="mychannel.do">내 채널 가기</li>
				</ul>
			</div>


			<!--사이드메뉴 끝------------------------------------->




<div>
    <div class="tv-detail-content">
        <div class="row">
            <div class="col-sm-10">
                <h3 class="tv-detail-chanel">${video.tvPlaylist.tvChannel.title}</h3>
                <div class="row">
                    <div class="col-sm-12 tv-detail-video">
                        <video id="myVideo" preload="metadata" autoplay="autoplay" controls disablePictureInPicture controlsList="nodownload" style="width: 100%; height: 550px;">
                            <source src="/link/resources/images/tvdb/video/${video.videoName}.mp4" type="video/mp4">
                        </video>
                    </div>
                    <div class="col-sm-12 tv-detail-video-dummy"></div>
                    <div class="row">
                        <div class="col-sm-12">
                            <div>
                                <h2 class="tv-detail-title">${video.title}</h2>
                                <div class="pull-right">
                                    <span class="glyphicon glyphicon-heart btn-detail-like ${status eq 'Like' ? 'likeOn' : '' }" data-likeStatus="${status eq 'Like' ? 'Y' : 'N' }" data-vno=${video.no } data-login="${not empty LOGIN_USER ? 'Y' : 'N' }"></span><span><strong class="like-count">${video.likes }</strong></span>
                                    <span class="glyphicon glyphicon-comment btn-detail-comment" data-login="${not empty LOGIN_USER ? 'Y' : 'N' }"></span><span><strong>${video.comments }</strong></span>
                                    <span class="glyphicon glyphicon-time btn-detail-later" data-vno=${video.no } data-login="${not empty LOGIN_USER ? 'Y' : 'N' }"></span>
                                </div>
                            </div>
                            <div style="color: gray">
                                <span class="glyphicon glyphicon-play"></span><em>${video.views }</em>
                                <span>등록일 :</span><em>
                                    <fmt:formatDate value="${video.createDate}" pattern="yyyy-MM-dd" /></em>
                            </div>
                            <div style="margin-top: 50px;">
                                <div>
                                    <p>${video.contents }</p>

                                </div>
                            </div>
                        </div>
                    </div>


                    <div class="row" style="margin-top: 100px;">
                        <div class="col-sm-12 comment-header" data-position='${param.position eq "cmt" ? "bottom" : "" }'>
                            <form action="addComment.do" class="form-group">
                                <label>댓글</label>
                                <input type="hidden" name="vno" value="${param.vno }">
                                <textarea class="form-control comment-textarea" name="CommentContents" data-login="${not empty LOGIN_USER ? 'Y' : 'N'}" style="resize: none;" id="" rows="5"></textarea>
                                <div><strong><span class="word-check">0</span>/200</div></strong>
                                <button class="btn btn-info pull-right btn-comment-insert" type="submit">등록</button>
                            </form>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12">
                            <c:forEach var="comment" items="${comments }">
	                            <div class="tv-detail-comment">
	                                <label>${comment.USERID }</label>
	                                <div>${comment.CONTENTS }</div>
	                                <span style="color: gray">등록일 :</span> <span class="tg" style="color: gray">${comment.CREATEDATE }</span>
	                                <div class="comment-tumbsdown ${comment.STATUS eq 'N' ? 'likeYnOn' : '' }">
	                                    <span class="glyphicon glyphicon-thumbs-down" data-cno="${comment.NO }" data-status="${comment.STATUS eq 'N' ? 'N' : '' }"  data-login="${not empty LOGIN_USER ? 'Y' : 'N'}">싫어요</span><em class="hates-${comment.NO }">${comment.HATECNT }</em>
	                                </div>
	                                <div class="comment-tumbsup ${comment.STATUS eq 'Y' ? 'likeYnOn' : '' }">
	                                    <span class="glyphicon glyphicon-thumbs-up"  data-cno="${comment.NO }"data-status="${comment.STATUS eq 'Y' ? 'Y' : ''}" data-login="${not empty LOGIN_USER ? 'Y' : 'N'}">좋아요</span><em class="likes-${comment.NO }">${comment.LIKECNT }</em>
	                                </div>
	                            </div>
                            </c:forEach>

                        </div>
                    </div>	
                </div>
            </div>
            <div>
                <h3 class="tv-detail-clip">재생목록</h3>
            </div>
            <div class="col-sm-2 tv-clip-list">
                <c:forEach var="list" items="${playlist}">
                    <div class="clip-list-video-box ${param.vno eq list.no ? 'active' : '' }">
                        <img class="clip-list-video" src="/link/resources/images/tvdb/${list.thumbnail }"  style="width: 100%;" onclick="location.href='detail.do?vno=${list.no}'"><span class="clip-list-palytime">
                            <c:choose>
                                <c:when test="${list.playTime gt 60}">
                                    <c:if test="${list.playTime div 60 gt 60 }">
                                        <fmt:parseNumber value="${list.playTime div 60 div 60}" integerOnly="true"></fmt:parseNumber>:
                                        <fmt:parseNumber value="${list.playTime div 60 - 60}" integerOnly="true"></fmt:parseNumber>:
                                        <fmt:parseNumber value="${list.playTime mod 60}"></fmt:parseNumber>
                                    </c:if>
                                    <fmt:parseNumber value="${list.playTime div 60}" integerOnly="true"></fmt:parseNumber>:
                                    <c:choose>
                                        <c:when test="${list.playTime mod 60 < 10 }">
                                            0<fmt:parseNumber value="${list.playTime mod 60}"></fmt:parseNumber>
                                        </c:when>
                                        <c:otherwise>
                                            <fmt:parseNumber value="${list.playTime mod 60}"></fmt:parseNumber>
                                        </c:otherwise>
                                    </c:choose>
                                </c:when>
                                <c:otherwise>
                                    0:0:<fmt:parseNumber value="${list.playTime}" integerOnly="true"></fmt:parseNumber>
                                </c:otherwise>
                            </c:choose>
                        </span>
                      	<c:choose>
							<c:when test="${fn:length(list.title) > 12}">
                             	<div class="clip-list-title">${fn:substring(list.title,0,11)}…</div>
                             </c:when>
                             <c:otherwise>
                             	<div class="clip-list-title">${list.title}</div>
                             </c:otherwise> 
                        </c:choose>
                        <div class="clip-list-palylike-box">
                            <span class="glyphicon glyphicon-play clip-list-play">${list.views }</span>
                            <span class="clip-list-like"> ♡ ${list.likes}</span>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</div>

		<div id="modalFail" class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-sm">
		    <div class="modal-content">
		    	<span></span>
		    	<div style="border:2px solid indigo; padding: 15px; font-size: 15px; font-weight: bold;">
		      	이미 나중에 보기 한 영상입니다.
		    	</div>	
		    </div>
		  </div>
		</div>
		
		<div id="modalSuccess" class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-sm">
		    <div class="modal-content">
		    	<div style="border:2px solid indigo; padding: 15px; font-size: 15px; font-weight: bold;">
		      		나중에 보기에 영상을 담았습니다.
		    	</div>
		    </div>
		  </div>
		</div>

</div>
</div>








	
	<script>
	
		// 스크롤 이벤트 화면 위치 변경
		
		$(window).on(
				"scroll",
				function() {
					var x = $(window).scrollTop();
					if ($(window).scrollTop() >= 680) {
						console.log(x);
						$(".tv-detail-video-dummy").show();
						$("#myVideo").css("position", 'fixed')
								.css("right", 100).css("width", 400).css(
										"bottom", 100);
					}
					if ($(window).scrollTop() <= 680) {
						$(".tv-detail-video-dummy").hide();
						$("#myVideo").css("position", '').css("right", '').css(
								"width", '100%').css("bottom", '');
					}
				})
				
				// 페이지 준비되면 active 위치로  스크롤 이동
				$(document).ready(function () {
					var x = $(".active").index();
					$(".tv-clip-list").scrollTop(175*x);
					
					var words = $(".comment-textarea").val().length;
					if(words == 0 || words > 200){
						$(".btn-comment-insert").attr("disabled", true);
					}
					
				})
				
				
			// 댓글 글자수 체크
			
		
		$(".comment-textarea").on("keyup", function () {
			var words = $(this).val().length;
			$(".word-check").text(words);
			
			if(words == 0 || words > 200){
				$(".btn-comment-insert").attr("disabled", true);
			} else{
				
				$(".btn-comment-insert").attr("disabled", false);
			}
		})
			
			//댓글창 클릭시 로그인 체크
		$(".comment-textarea").on("focus", function () {
			var login = $(this).attr("data-login");
							
			if(login == 'N'){
				var YN = confirm("로그인이 필요합니다. 로그인 페이지로 이동하시겠습니까?");
				if(YN) {
					$(".comment-textarea").blur();
					location.href="/link/loginform.do?returnUrl=tv/detail.do?vno=${param.vno}";
				}else{
					$(".comment-textarea").blur();
				}
			}
		})
		
		
		$(".chk-user").on("click", function () {
			 
			var url = $(this).attr('data-url');
			var login = $(this).attr('data-login');
			 
			if (login == 'Y') {
				location.href = url;
			} else {
				var YN = confirm("로그인이 필요합니다. 로그인 페이지로 이동하시겠습니까?")
				if(YN){
					location.href = url;
				}
			}
		});
	
		// 나중에보기 ajax
	 $(".btn-detail-later").on("click", function(event) {
			
		  var vno = $(this).attr("data-vno");
		  var login = $(this).attr("data-login");
		  
		  if(login == 'N'){
			  var YN = confirm("로그인이 필요합니다. 로그인 페이지로 이동하시겠습니까?");
			  if(YN){
				  location.href="/link/loginform.do?returnUrl=tv/detail.do?vno=${param.vno}";
			  }
		  }
		  if(login == 'Y'){
			  $.ajax({
				type:"POST",
				url:"addLater.do",
				data:{"vno":vno},
				dataType:"text",
				success:function(result){
					if(result =='fail'){
						$("#modalFail").modal({
							backdrop: true
						});
					}
					if(result =='success'){
						$("#modalSuccess").modal({
							backdrop: true
						});
						
					}
				
				}
			}) 
		  }
			return false;

	});
	
	 // 좋아요 버튼 ajax (좋아요 취소)
	$(".btn-detail-like").on("click", function () {
		var vno = $(this).attr("data-vno");
		var login = $(this).attr("data-login");
		var status = $(this).attr("data-likeStatus");
		 console.log(vno);
		 console.log(login);
		 console.log(status);
		
		if(login == 'N'){
			var YN = confirm("로그인이 필요합니다. 로그인 페이지로 이동하시겠습니까?");
			if(YN){
				location.href="/link/loginform.do?returnUrl=tv/detail.do?vno=${param.vno}";
			}
		}
		if(login == 'Y'){
			
			if($(this).hasClass("likeOn")){
				$(this).removeClass("likeOn");
				$(this).attr("data-likeStatus", "N");
			} else{
				$(this).addClass("likeOn");
				$(this).attr("data-likeStatus", "Y");
			}
			
			console.log(status);
			$.ajax({
				type:"POST",
				url:"addLike.do",
				data:{"vno":vno, "status":status},
				dataType:"text",
				success:function(result){
					console.log(result);
					$(".like-count").text(result);
				
				}
			}) 
		}
		return false;
	});
		
		
	// 댓글번튼 누르면 comment-rextarea 포커스 시켜서 포커스이벤트 발동시키기(포커스이벤트에 로그인체크 기능해놨으니까...)
	// 로그인 되어있으면 댓글 area 포커스해주기 알아서 스크롤 움직일테니까..
		$(".btn-detail-comment").on("click",function(){
			var login = $(this).attr("data-login");
	
			if(login == 'N'){
				var YN = confirm("로그인이 필요합니다. 로그인 페이지로 이동하시겠습니까?");
				if(YN){
					location.href="/link/loginform.do?returnUrl=tv/detail.do?position=cmt&vno=${param.vno}";
				}
			}
			
			if(login == 'Y'){
		       $(".comment-textarea").focus();
		       /* var x = 한페이지에 5댓글씩 보여준다면, 5이상이면 5고정  */
		       /*			1,2,3,4	???? 이렇게하면되나  */
		       /* $(window).scrollTop(410+(x*95)); */
			}
		})
		
		 // 포지션 bottom은 바텀으로 스크롤이동
		$(function () {
			var p =$(".comment-header").attr("data-position");
			if(p == 'bottom'){
				$(window).scrollTop(900);
			}
		});
	
	
		
	// 댓글의 좋아요 싫어요 ajax
	
		$(".glyphicon-thumbs-up").on("click", function () {
			 
			var login = $(this).attr("data-login");
			var status= $(this).attr("data-status");
			var cno = $(this).attr("data-cno");
			var hate = $(this).parent().prev().first().children().first().attr("data-status");
			
			if(login == 'N'){
				var YN = confirm("로그인이 필요합니다. 로그인 페이지로 이동하시겠습니까?");
				if(YN){
					location.href="/link/loginform.do?returnUrl=tv/detail.do?vno=${param.vno}";
				}
			}
			
			if(login == 'Y'){
				
				if(status == 'Y'){
					$(this).parent().removeClass("likeYnOn");
					$(this).attr("data-status", '');
				}
				if(status == ''){
					$(this).parent().addClass("likeYnOn"); 
					$(this).attr("data-status", 'Y');
					$(this).parent().prev().first().children().first().attr("data-status",'');
					$(this).parent().prev().first().removeClass("likeYnOn");
				}
				
				$.ajax({
					type:"POST",
					url:"addCommentLike.do",
					data:{"cno":cno, "status":status, "hate": hate},
					dataType:"json",
					success:function(result){
						$(".likes-"+cno).text(result.LIKES);
						$(".hates-"+cno).text(result.HATES);

					}
				}) 
			}
		})
		
		
		// 댓글 싫어요 /취소
		
		$(".glyphicon-thumbs-down").on("click", function () {
			 
			var login = $(this).attr("data-login");
			var status= $(this).attr("data-status");
			var cno = $(this).attr("data-cno");
			var like = $(this).parent().next().first().children().first().attr("data-status");
			console.log(status);
			console.log(cno);
			console.log(like);
			if(login == 'N'){
				var YN = confirm("로그인이 필요합니다. 로그인 페이지로 이동하시겠습니까?");
				if(YN){
					location.href="/link/loginform.do?returnUrl=tv/detail.do?vno=${param.vno}";
				}
			}
			
			if(login == 'Y'){
				
				if(status == 'N'){
					$(this).parent().removeClass("likeYnOn");
					$(this).attr("data-status", '');
				}
				if(status == ''){
					$(this).parent().addClass("likeYnOn"); 
					$(this).attr("data-status", 'N');
					 $(this).parent().next().first().children().first().attr("data-status",'');
					$(this).parent().next().first().removeClass("likeYnOn");
					
				}
				
				$.ajax({
					type:"POST",
					url:"addCommentHate.do",
					data:{"cno":cno, "status":status, "like":like},
					dataType:"json",
					success:function(result){
						$(".likes-"+cno).text(result.LIKES);
						$(".hates-"+cno).text(result.HATES);

					}
				}) 
			}
		})
		
		
	

		
		// timeAgo 현재시간 구하는 아주 멋잇는놈
        $(".tg").each(function(){
           var timeago_t = jQuery.timeago( new Date(parseInt($(this).text())));
           console.log(timeago_t);
           $(this).text(timeago_t);
        });
		
		/*var x = $("#myVideo");
		
		 $(document).ready(function(){
		 var z=  document.getElementById("myVideo");
		 var w =z.duration; 
		 alert(w);
		
		 });*/

		/*  
		$(document).ready(function(){
		$("#myVideo").one(
		  "timeupdate", 
		  function(event){
		      if(this.duration>60){
		          if(this.duration/60 > 60){
		              
		              var PT = parseInt(this.duration/60/60)+':'+parseInt(this.duration/60-60)+":"+parseInt(this.duration%60);
		              alert(PT);
		          }else{
		              
		              alert("0:"+parseInt(this.duration/60)+':'+parseInt(this.duration%60));
		          }
		          
		      } else{
		          alert("0:"+"0:"+parseInt(this.duration));
		      }
		      
		  });
		}); */
		
		
	</script>
</body>
</html>
