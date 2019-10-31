<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>LINK TV 메인</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" type="image/x-icon" href="/mj/kurly/images/header_footer/tab-logo02.png">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

    <style>
        .navbar-nav>li>a:hover,
        .navbar-nav>li>a {
            background-color: indigo;
        }

        .nav .open>a,
        .nav .open>a:focus,
        .nav .open>a:hover {
            background-color: indigo;

        }

        a:hover,
        a:focus {
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

        ul,
        li {
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

        /*--------------------------여기까지-네브---아래는 다른고----------------------------------------------*/

        .tv-edit-panel a {
            border: 1px solid;
            padding: 10px;
        }

        .tv-edit-panel {
            margin-top: 10px;
            padding: 20px;
            border: 1px solid #CECECE;
        }

        .tv-runtime {
            padding: 5px;
            position: absolute;
            left: 153px;
            top: 165px;
            border: 1px solid black;
            background-color: black;
            color: white;
            border-radius: 10px;
        }

        .tv-recent-content {
            position: relative;
            border: 1px solid #CECECE;
        }

        .tv-recent-img {
        	position: relative;
            border-radius: 10px;
            width: 200px;
            height: 200px;
        }

        .tv-recent-info {
            position: absolute;
            top: 50px;
            left: 250px;
        }

        .tv-recent-title,
        .tv-recent-title:hover {
            font-size: 20px;
            color: black;
            text-decoration: none;


        }

        .tv-recent-chanel {
            font-size: 15px;
            position: absolute;
            top: 70px;
        }

        .tv-recent-paly {
            position: absolute;
            top: 100px;
            color: gray;
        }

        .tv-recent-like {
            position: absolute;
            top: 100px;
            left: 90px;
            color: gray;
        }

        .tv-recent-check {
            color: #CECECE;
        }

        .chk-on {
            color: indigo;
        }

        .tv-recent-chkCancle,
        .tv-recent-chkAll,
        .tv-recent-delete,
        .tv-recent-complete,
        .tv-recent-check {
            display: none;
        }

        /*-------------------------------------------------------*/
    </style>

</head>

<body>
    <%@include file="common/nav.jsp" %>

    <div class="container" style="margin-top:100px; ">
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



            <ul class="nav nav-tabs">
                <li role="presentation" class="${param.sort eq 'recent' ? 'active' : ''}"><a href="history.do?sort=recent">최근 본</a></li>
                <li role="presentation" class="${param.sort eq 'later' ? 'active' : ''}"><a href="history.do?sort=later">나중에 보기</a></li>
                <li role="presentation" class="${param.sort eq 'like' ? 'active' : ''}"><a href="history.do?sort=like">좋아요</a></li>
            </ul>

            <div class="tv-my-box">
                <div class="tv-edit-panel">
                    <a href="" class="tv-recent-edit">편집</a>
                    <a href="" class="tv-recent-complete">완료</a>
                    <a href="" class="tv-recent-chkAll">전체 선택</a>
                    <a href="" class="tv-recent-chkCancle">전체 해제</a>
                    <a href="" class="tv-recent-delete">삭제<em class="amount-chk"></em></a>
                </div>
            </div>
            <div class="tv-content-area">
            <form id="videos-form">
            <c:forEach var="video" items="${videos }">
                <div class="tv-recent-content">
                    <span class="pull-left " style="margin-top: 80px">
                        <span class="glyphicon glyphicon-ok-circle tv-recent-check" style="font-size: 40px"></span>
                        <input class="hidden" type="checkbox" name="vno" value="${video.no }">
                    </span>	
                    <div>
                        <a href="detail.do?vno=${video.no}">
                            <img src="/link/resources/images/tvdb/${video.thumbnail }" alt="" class="tv-recent-img">
                            <span class="tv-runtime">
                            	<c:choose>
	                       				<c:when test="${video.playTime gt 60}">
	                       					<c:if test="${video.playTime div 60 gt 60 }">
	                       						<fmt:parseNumber value="${video.playTime div 60 div 60}" integerOnly="true"></fmt:parseNumber>:
	                       						<fmt:parseNumber value="${video.playTime div 60 - 60}" integerOnly="true"></fmt:parseNumber>:
	                       						<fmt:parseNumber value="${video.playTime mod 60}"></fmt:parseNumber>
	                       					</c:if>
	                       						<fmt:parseNumber value="${video.playTime div 60}" integerOnly="true"></fmt:parseNumber>:
	                       						<c:choose>
	                       							<c:when test="${video.playTime mod 60 < 10 }">
	                       								0<fmt:parseNumber value="${video.playTime mod 60}"></fmt:parseNumber>
	                       							</c:when>
	                       							<c:otherwise>
	                       								<fmt:parseNumber value="${video.playTime mod 60}"></fmt:parseNumber>
	                       							</c:otherwise>
	                       						</c:choose>
	                       				</c:when>
		                       			<c:otherwise>
			                       			0:0:<fmt:parseNumber value="${video.playTime}" integerOnly="true"></fmt:parseNumber>
		                       			</c:otherwise>
	                       			</c:choose>
                            </span>
                        </a>
                    </div>
                    <div class="tv-recent-info">
                        <dl>
                            <dt>
                                <a href="detail.do?vno=${video.no}" class="tv-recent-title">${video.title }</a>
                            </dt>
                            <dd>
                            <div style="padding-top: 10px;">
                            	${video.contents }
                            </div>
                                <span>
                                    <a href="channel.do?" class="tv-recent-chanel">${video.tvPlaylist.tvChannel.title }</a>
                                </span>
                                <span class="tv-recent-paly">▷ ${video.views }</span>
                                <span class="tv-recent-like">♡ ${video.likes }</span>
                            </dd>
                        </dl>
                    </div>
                </div>
            
            </c:forEach>
            </form>
                
                
                </div>
            </div>
        </div>
    

    <script>
    	
    
        function checkamount() {
            var x = $(".chk-on").length
            $(".amount-chk").text(x);
           
        }

        function editmode() {
            $(".tv-recent-chkCancle").hide();
            $(".tv-recent-chkAll").hide();
            $(".tv-recent-delete").hide();
            $(".tv-recent-complete").hide();
            $(".tv-recent-check").hide();
            $(".tv-recent-edit").show();
            $("input[name=vno]").prop("checked", false);
            $(".tv-recent-check").removeClass("chk-on");
            $(".tv-runtime").css("left", 153);
            checkamount();

        }

        function completeEdit() {
            $(".tv-recent-edit").hide();
            $(".tv-recent-chkCancle").hide();
            $(".tv-recent-chkAll").show();
            $(".tv-recent-delete").show();
            $(".tv-recent-complete").show();
            $(".tv-recent-check").show();
            $("input[name=vno]").prop("checked", false);
            $(".tv-recent-check").removeClass("chk-on");
            $(".tv-runtime").css("left", 195);
            checkamount();

        }

        $(".tv-recent-check").on("click", function() {
            if ($(this).hasClass("chk-on")) {
                $(this).removeClass("chk-on");
                $(this).next().prop("checked", false);
            } else {
                $(this).addClass("chk-on");
                $(this).next().prop("checked", true);
            }
            checkamount();

        })

        $(".tv-recent-chkAll").on("click", function(event) {
            event.preventDefault();
            $(".tv-recent-chkCancle").show();
            $(".tv-recent-chkAll").hide();
            $(".tv-recent-check").addClass("chk-on");
            $("input[name=vno]").prop("checked", true);
            checkamount();

        })

        $(".tv-recent-chkCancle").on("click", function(event) {
            event.preventDefault();
            $(".tv-recent-chkCancle").hide();
            $(".tv-recent-chkAll").show();
            $(".tv-recent-check").removeClass("chk-on");
            $("input[name=vno]").prop("checked", false);
            checkamount();
        })

        $(".tv-recent-complete").on("click", function() {
            event.preventDefault();
            editmode();
        })
        $(".tv-recent-edit").on("click", function() {
            event.preventDefault();

            completeEdit();

        })
        
        $(".tv-recent-delete").on("click", function () {
        	event.preventDefault();
        	
        	if($(':checkbox:checked').length == 0){
        		alert("선택한 영상이 없습니다.");
        	}
        	else{
				var YN = confirm("삭제 하시겠습니까?");
				if(YN == true){
					$.ajax({
						type:"get",
						url:"deleteHistory.do?sort=${param.sort}",
						data:$("#videos-form").serialize(),
						success:function(){
							$(':checkbox:checked').closest(".tv-recent-content").remove();
							checkamount();
						}
					});
					
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
        
       	
       
    </script>
</body>

</html>