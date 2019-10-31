<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	
    <style>
        .navbar-nav > li > a:hover,.navbar-nav > li > a {
            background-color: indigo;
        }
        .nav .open>a, .nav .open>a:focus, .nav .open>a:hover  {
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
             color:black;
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
             border-left: 1px solid  white;
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
        .caret{
            color: white;
        }
        ul, li{
            list-style: none;
        }
        
       
        
        .tv-side-menu{
            border: 1px solid #CECECE; 
            cursor: pointer;
            width: 180px;
            padding: 15px 30px 15px 30px;
            border-radius: 20px;
            margin: 2px;
            font-family: Georgia, "맑은 고딕";
            text-align: center;
        }  
        .tv-side-menu:hover{
            color: white;
            background-color: indigo;
        }
        
        .tv-side-menubar{
            position: fixed;
            top: 150px;
            left: 100px;
            font-size: 15px;
        }
        
        .tv-side-menu a{
            text-decoration: none;
            color: black;
           
        } 
        .tv-content-header{
            font-size: 20px;
            text-align: left;
            margin-top: 50px;
        }  
        
        .tv-content-header a{
            text-decoration: none;
            color: black;
        }
        
/*---------------------------네브-------------------------------------------------*/
        
        .tv-content-button-box{
            margin-top: 50px;
        }
        .tv-content-button-r,.tv-content-button-l{
            transition-duration: 0.4s;
            background-color: white;
            border: 1px solid black;
            color: black;
            border-radius: 8px;
            font-size: 20px;
        }  
        .tv-content-button-r:hover, .tv-content-button-l:hover{
            
            background-color: indigo;
            color: white;
        }
        
        .tv-content-title{
            font-size: 20px;
            text-decoration: none;
            /*white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;*/
            
        }
        
        
       .tv-content-container{
            width:5900px;
            position: relative;
            left: -15px;
           
        }
        .tv-content-box{
            position: relative;
            width: 287px;
            height: 295px;
            display: inline-block;
            float: left;
           	padding-left:10px;
            margin-right: 4px;
            border-right: 2px solid #CECECE;
        }
         .video-thum{
            width: 265px;
            height: 200px;
            border-radius: 10px;
        }
        
        .video-preview{
            position: absolute;
            width: 265px;
	        border-radius: 10px;
            top: 0px;
            right:10px;
            opacity: 0;
            
        }
        
        .tv-runtime{
            position: absolute; 
            left: 227px; 
            top: 160px; 
            background-color: black; 
            color: white;
            padding: 5px;
        }
        .tv-btn-later{
            opacity: 0;
            position: absolute; 
            left: 225px;
            top: 150px; 
            background-color: black; 
            color: white;
            font-size: 35px;
            padding: 5px;
            z-index: 1;
             border-radius: 10px;
            transition-property: opacity;
            transition-duration: 300ms;    
            transition-timing-function: linear;
        }
        
        
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
         
            
            <!--사이드메뉴 끝------------------------------------->
            
            


            <div class="col-sm-12 well" style="overflow: hidden;">
               <div class="row">
                   <div class="col-sm-6 tv-content-header">
                       <a href="rank.do?category=best">TOP 20</a>
                   </div>
                    <div class="col-sm-6 tv-content-button-box " style="position: relative;" >
                        <button class="tv-content-button-r pull-right">▷</button>
                       <button class="tv-content-button-l pull-right">◁</button>
                    </div>
                </div>
                
                <div class="tv-content-container">
                	<c:forEach varStatus="loop" var="tv" items="${tvs}">
	                   <div class="tv-content-box">
	                       <a href="detail.do?vno=${tv.no}">
	                       		<img class="video-thum" src="/link/resources/images/tvdb/${tv.thumbnail}">
	                       		<span class="tv-runtime">
	                       			<c:choose>
	                       				<c:when test="${tv.playTime gt 60}">
	                       					<c:if test="${tv.playTime div 60 gt 60 }">
	                       						<fmt:parseNumber value="${tv.playTime div 60 div 60}" integerOnly="true"></fmt:parseNumber>:
	                       						<fmt:parseNumber value="${tv.playTime div 60 - 60}" integerOnly="true"></fmt:parseNumber>:
	                       						<fmt:parseNumber value="${tv.playTime mod 60}"></fmt:parseNumber>
	                       					</c:if>
	                       						<fmt:parseNumber value="${tv.playTime div 60}" integerOnly="true"></fmt:parseNumber>:
	                       						<c:choose>
	                       							<c:when test="${tv.playTime mod 60 < 10 }">
	                       								0<fmt:parseNumber value="${tv.playTime mod 60}"></fmt:parseNumber>
	                       							</c:when>
	                       							<c:otherwise>
	                       								<fmt:parseNumber value="${tv.playTime mod 60}"></fmt:parseNumber>
	                       							</c:otherwise>
	                       						</c:choose>
	                       				</c:when>
		                       			<c:otherwise>
			                       			0:0:<fmt:parseNumber value="${tv.playTime}" integerOnly="true"></fmt:parseNumber>
		                       			</c:otherwise>
	                       			</c:choose>
	                       		</span>
	                      
								<video class="video-preview" id="myVideo" preload="metadata" muted="muted" disablePictureInPicture controlsList="nodownload">
                                	<source src="/link/resources/images/tvdb/video/${tv.videoName }.mp4" type="video/mp4"></video><span class="glyphicon glyphicon-time tv-btn-later" data-login="${not empty LOGIN_USER ? 'Y' : 'N' }" data-vno='${tv.no }'></span>
                                        
	                       </a>
	                       	
	                       <p class="tv-content-title" onclick="location.href='detail.do?vno=${tv.no}'">${tv.title }</p>
	                       <div>
	                           <span class="" style="font-size: 40px;">${loop.count}</span>
	                           <a href="" >${tv.tvPlaylist.tvChannel.title }</a>
	                           <span style="float: right; margin-top: 25px">▷${tv.views } ♡${tv.likes }</span>
	                       </div>
	                   </div>
                	</c:forEach>
                   
                   
                   
                   
                </div>  
            </div>
            <div class="row">
                <div class="col-sm-12">
                    <div class="row">
                        <div class="col-sm-6 tv-content-header">
                            <a href="rank.do?category=suggest">추천 동영상 ></a>
                        </div>
                    </div>
                    <div class="">
                    	<c:forEach var="like" items="${likes }">
	                        <div class="tv-content-box">
	                           <a href="detail.do?vno=${like.no}">
	                       		<img class="video-thum" src="/link/resources/images/tvdb/${like.thumbnail}">
	                       		<span class="tv-runtime">
	                       			<c:choose>
	                       				<c:when test="${like.playTime gt 60}">
	                       					<c:if test="${like.playTime div 60 gt 60 }">
	                       						<fmt:parseNumber value="${like.playTime div 60 div 60}" integerOnly="true"></fmt:parseNumber>:
	                       						<fmt:parseNumber value="${like.playTime div 60 - 60}" integerOnly="true"></fmt:parseNumber>:
	                       						<fmt:parseNumber value="${like.playTime mod 60}"></fmt:parseNumber>
	                       					</c:if>
	                       						<fmt:parseNumber value="${like.playTime div 60}" integerOnly="true"></fmt:parseNumber>:
	                       						<c:choose>
	                       							<c:when test="${like.playTime mod 60 < 10 }">
	                       								0<fmt:parseNumber value="${like.playTime mod 60}"></fmt:parseNumber>
	                       							</c:when>
	                       							<c:otherwise>
	                       								<fmt:parseNumber value="${like.playTime mod 60}"></fmt:parseNumber>
	                       							</c:otherwise>
	                       						</c:choose>
	                       				</c:when>
		                       			<c:otherwise>
			                       			0:0:<fmt:parseNumber value="${like.playTime}" integerOnly="true"></fmt:parseNumber>
		                       			</c:otherwise>
	                       			</c:choose>
	                       		</span>
	                       		
								<video class="video-preview" id="myVideo" preload="metadata" muted="muted" disablePictureInPicture controlsList="nodownload">
                                	<source src="/link/resources/images/tvdb/video/${like.videoName }.mp4" type="video/mp4"></video><span class="glyphicon glyphicon-time tv-btn-later" data-login="${not empty LOGIN_USER ? 'Y' : 'N' }"  data-vno='${like.no }'></span>
	                       </a>
	                            <p class="tv-content-title" onclick="location.href='detail.do?vno=${like.no}'">${like.title }</p>
	                            <div><a href="" class="pull-left">${like.tvPlaylist.tvChannel.title }</a></div>
	                            <p class="pull-right">▷${like.views } ♡${like.likes }</p>
	                        </div>
                    	</c:forEach>
                        
                        
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12">
                    <div class="row">
                        <div class="col-sm-6 tv-content-header">
                            <a href="rank.do?category=recent">최근 동영상 ></a>
                        </div>
                    </div>
                    <div class="">
						<c:forEach var="recent" items="${recents }">
	                        <div class="tv-content-box">
	                           <a href="detail.do?vno=${recent.no}">
	                       		<img class="video-thum" src="/link/resources/images/tvdb/${recent.thumbnail}">
	                       		<span class="tv-runtime">
	                       			<c:choose>
	                       				<c:when test="${recent.playTime gt 60}">
	                       					<c:if test="${recent.playTime div 60 gt 60 }">
	                       						<fmt:parseNumber value="${recent.playTime div 60 div 60}" integerOnly="true"></fmt:parseNumber>:
	                       						<fmt:parseNumber value="${recent.playTime div 60 - 60}" integerOnly="true"></fmt:parseNumber>:
	                       						<fmt:parseNumber value="${recent.playTime mod 60}"></fmt:parseNumber>
	                       					</c:if>
	                       						<fmt:parseNumber value="${recent.playTime div 60}" integerOnly="true"></fmt:parseNumber>:
	                       						<c:choose>
	                       							<c:when test="${recent.playTime mod 60 < 10 }">
	                       								0<fmt:parseNumber value="${recent.playTime mod 60}"></fmt:parseNumber>
	                       							</c:when>
	                       							<c:otherwise>
	                       								<fmt:parseNumber value="${recent.playTime mod 60}"></fmt:parseNumber>
	                       							</c:otherwise>
	                       						</c:choose>
	                       				</c:when>
		                       			<c:otherwise>
			                       			0:0:<fmt:parseNumber value="${recent.playTime}" integerOnly="true"></fmt:parseNumber>
		                       			</c:otherwise>
	                       			</c:choose>
	                       		</span>
								<video class="video-preview" id="myVideo" preload="metadata" muted="muted" disablePictureInPicture controlsList="nodownload">
                                	<source src="/link/resources/images/tvdb/video/${recent.videoName }.mp4" type="video/mp4"></video>
                                	<span class="glyphicon glyphicon-time tv-btn-later" data-login="${not empty LOGIN_USER ? 'Y' : 'N' }"  data-vno='${recent.no }'></span>
                                	
	                       </a>
	                            <p class="tv-content-title" onclick="location.href='detail.do?vno=${recent.no}'">${recent.title }</p>
	                            <div><a href="" class="pull-left">${recent.tvPlaylist.tvChannel.title }</a></div>
	                            <p class="pull-right">▷${recent.views } ♡${recent.likes }</p>
	                        </div>
                    	</c:forEach>  
                        

                    </div>
                </div>
    	</div>
    </div>
		
		<!-- Small modal -->
		
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
    
    
    
    
    <script>
		$(".video-preview").on("mouseover",function(){
			$(this).css("cursor","pointer");
			$(this).css("opacity", 1);
			$(this).next(".tv-btn-later").css("opacity",1);
			
			var x = $(this).get(0);
			x.currentTime= 30;	
			x.play();
			
			$(x).on("timeupdate", function () {
				/* console.log(x.currentTime); */
				if(x.currentTime >= 33){
					x.pause();
					$(this).css("opacity",0);
				}
			})
		})   
		
		
		$(".video-preview").on("mouseout",function(){
			$(this).css("opacity", 0);
			$(this).next(".tv-btn-later").css("opacity",0);
			
		})    
    
      
        $(".tv-btn-later").on("mouseenter", function(){
            $(this).css("opacity", 1);
        })
        
        $(".tv-btn-later").on("mouseout", function(){
            $(this).css("opacity", 0);
        })
        
        
        
/*------------------------top20 버튼 조작 기능----------------------------*/        
        var cp = 0;
        
        $(".tv-content-button-r").on("click",function(){
            var asd = $(".tv-content-container").offset();
            if(cp < 4){
                $(".tv-content-container").animate({left:"+=-1165px"},300);
                cp += 1;
            }
        })
        
        $(".tv-content-button-l").on("click",function(){
             var asd = $(".tv-content-container").offset();
            
            if(cp> 0){
                $(".tv-content-container").animate({left:"+=1165px"},300);
                cp += -1;
            }
        })
/*--------------------------------------------------------------------------*/        
     
 $(".tv-content-title").on("mouseover", function(){
     $(this).css("cursor", "pointer");
 })       
 
 /* ----------------------------------------------- */
 
 
 //나중에 보기 할때 로그인 체크하깅
  $(".tv-btn-later").on("click", function(event) {
	
	  var vno = $(this).attr("data-vno");
	  var login = $(this).attr("data-login");
	  
	  if(login == 'N'){
		  var YN = confirm("로그인이 필요합니다. 로그인 페이지로 이동하시겠습니까?");
		  if(YN){
			  location.href="/link/loginform.do?returnUrl=tv/home.do";
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
					/* alert('이미 나중에 보기 한 영상입니다.'); */
					$("#modalFail").modal({
						backdrop: true
					});
				}
				if(result =='success'){
					/* alert('나중에 보기에 영상을 담았습니다.'); */
					$("#modalSuccess").modal({
						backdrop: true
					});
				}
			
			}
		}) 
	  }
		return false;

});
 
 
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
