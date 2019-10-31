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
        
 /*--------------------네브-------------------------------------------*/     
        .tv-rank-box{
            position: relative;
            width: 280px;
            height: 295px;
            border: 1px solid indigo;
            border-radius:10px; 
            float: left; 
            padding: 5px; 
            margin-top: 10px;
            margin-right: 5px;
           
        }
        
        .video-thum{
            width: 100%;
            height: 200px;
            border-radius: 10px;
        }
        
        .video-preview{
            position: absolute;
            width: 268px;
            height: 198px;
            border-radius: 10px;
            top: 5px;
            opacity: 0;
            transition-property: opacity;
            transition-duration: 200ms;    
            transition-timing-function: linear;
            
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
 		
 		.tv-content-title{
            font-size: 20px;
            text-decoration: none;
            }
        
        
    
       
    </style>

</head>

<body>
	<%@include file="common/nav.jsp" %>
 <!----------------------------------------네비<------------------------------->  
    
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
        </div>
    </div>
            <!--사이드메뉴 끝------------------------------------->
<div class="container">
   <ul class="nav nav-tabs">
    <li class="${param.category eq 'best' ? 'active' : '' }"><a data-toggle="tab" href="#home">인기 영상</a></li>
    <li class="${param.category eq 'suggest' ? 'active' : '' }"><a data-toggle="tab" href="#menu1">추천 영상</a></li>
    <li class="${param.category eq 'recent' ? 'active' : '' }"><a data-toggle="tab" href="#menu2">최신 영상</a></li>
  </ul>

	<div class="tab-content">
		<div id="home" class="tab-pane fade ${param.category eq 'best' ? 'in active' : '' }">
	        <h3>인기영상</h3>
	        <div>
	        	<c:if test="${empty bestTvs }">
					<span>해당 조건의 영상을 찾을수 없습니다.</span>	
				</c:if>
				<c:forEach varStatus="loop" var="best" items="${bestTvs }">
		            <div class="tv-rank-box">
		                <a href="detail.do?vno=${best.no}">
		                	<img class="video-thum" src="/link/resources/images/tvdb/${best.thumbnail }">
	       					<span class="tv-runtime">
	                			<c:choose>
	                				<c:when test="${best.playTime gt 60}">
	                					<c:if test="${best.playTime div 60 gt 60 }">
	                						<fmt:parseNumber value="${best.playTime div 60 div 60}" integerOnly="true"></fmt:parseNumber>:
	                						<fmt:parseNumber value="${best.playTime div 60 - 60}" integerOnly="true"></fmt:parseNumber>:
	                						<fmt:parseNumber value="${best.playTime mod 60}"></fmt:parseNumber>
	                					</c:if>
	                						<fmt:parseNumber value="${best.playTime div 60}" integerOnly="true"></fmt:parseNumber>:
	                						<c:choose>
	                							<c:when test="${best.playTime mod 60 < 10 }">
	                								0<fmt:parseNumber value="${best.playTime mod 60}"></fmt:parseNumber>
	                							</c:when>
	                							<c:otherwise>
	                								<fmt:parseNumber value="${best.playTime mod 60}"></fmt:parseNumber>
	                							</c:otherwise>
	                						</c:choose>
	                				</c:when>
	                 				<c:otherwise>
	                  					0:0:<fmt:parseNumber value="${best.playTime}" integerOnly="true"></fmt:parseNumber>
	                 				</c:otherwise>
	                			</c:choose>
	                		</span>
		                	<span class="glyphicon glyphicon-time tv-btn-later" data-login="${not empty LOGIN_USER ? 'Y' : 'N' }" data-vno='${best.no }'></span>
		                </a>
		                
		                <p class="tv-content-title" style="text-align: center; cursor: pointer;" onclick="location.href=''">${best.title }</p>
		                <div>
		                    <span class="" style="font-size: 40px;">${loop.count }</span>
		                    <a href="detail.do?vno=${best.no}">${best.tvPlaylist.tvChannel.title }</a>
		                    <span style="float: right; margin-top: 25px">▷${best.views } ♡${best.likes }</span>
		                </div>
		            </div>
	        	</c:forEach>
	            
	            
	        </div>
	        
	    </div>
	    <div id="menu1" class="tab-pane fade ${param.category eq 'suggest' ? 'in active' : '' }">
	      <h3>추천영상</h3>
				<c:if test="${empty suggestTvs }">
					<span>해당 조건의 영상을 찾을수 없습니다.</span>	
				</c:if>
				<c:forEach varStatus="loop" var="suggest" items="${suggestTvs }">
		            <div class="tv-rank-box">
		                <a href="detail.do?vno=${suggest.no}">
		                	<img class="video-thum" src="/link/resources/images/tvdb/${suggest.thumbnail }">
	       					<span class="tv-runtime">
	                			<c:choose>
	                				<c:when test="${suggest.playTime gt 60}">
	                					<c:if test="${suggest.playTime div 60 gt 60 }">
	                						<fmt:parseNumber value="${suggest.playTime div 60 div 60}" integerOnly="true"></fmt:parseNumber>:
	                						<fmt:parseNumber value="${suggest.playTime div 60 - 60}" integerOnly="true"></fmt:parseNumber>:
	                						<fmt:parseNumber value="${suggest.playTime mod 60}"></fmt:parseNumber>
	                					</c:if>
	                						<fmt:parseNumber value="${suggest.playTime div 60}" integerOnly="true"></fmt:parseNumber>:
	                						<c:choose>
	                							<c:when test="${suggest.playTime mod 60 < 10 }">
	                								0<fmt:parseNumber value="${suggest.playTime mod 60}"></fmt:parseNumber>
	                							</c:when>
	                							<c:otherwise>
	                								<fmt:parseNumber value="${suggest.playTime mod 60}"></fmt:parseNumber>
	                							</c:otherwise>
	                						</c:choose>
	                				</c:when>
	                 				<c:otherwise>
	                  					0:0:<fmt:parseNumber value="${suggest.playTime}" integerOnly="true"></fmt:parseNumber>
	                 				</c:otherwise>
	                			</c:choose>
	                		</span>
		                	<span class="glyphicon glyphicon-time tv-btn-later" data-login="${not empty LOGIN_USER ? 'Y' : 'N' }" data-vno='${suggest.no }'></span>
		                </a>
		                
		                <p class="tv-content-title" style="text-align: center; cursor: pointer;" onclick="location.href=''">${suggest.title }</p>
		                <div>
		                    <span class="" style="font-size: 40px;">${loop.count }</span>
		                    <a href="detail.do?vno=${suggest.no}">${suggest.tvPlaylist.tvChannel.title }</a>
		                    <span style="float: right; margin-top: 25px">▷${suggest.views } ♡${suggest.likes }</span>
		                </div>
		            </div>
	        	</c:forEach>
	    </div>
	    <div id="menu2" class="tab-pane fade ${param.category eq 'recent' ? 'in active' : '' }">
	      <h3>최신영상</h3>
	      		<c:if test="${empty recentTvs }">
					<span>해당 조건의 영상을 찾을수 없습니다.</span>	
				</c:if>
				<c:forEach varStatus="loop" var="recent" items="${recentTvs }">
		            <div class="tv-rank-box">
		                <a href="detail.do?vno=${recent.no}">
		                	<img class="video-thum" src="/link/resources/images/tvdb/${recent.thumbnail }">
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
		                	<span class="glyphicon glyphicon-time tv-btn-later" data-login="${not empty LOGIN_USER ? 'Y' : 'N' }" data-vno='${recent.no }'></span>
		                </a>
		                
		                <p class="tv-content-title" style="text-align: center; cursor: pointer;" onclick="location.href=''">${recent.title }</p>
		                <div>
		                    <span class="" style="font-size: 40px;">${loop.count }</span>
		                    <a href="detail.do?vno=${recent.no}">${recent.tvPlaylist.tvChannel.title }</a>
		                    <span style="float: right; margin-top: 25px">▷${recent.views } ♡${recent.likes }</span>
		                </div>
		            </div>
	        	</c:forEach>
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
   
       
 <script>

	$(".video-thum").on('mouseenter',function(){
		$(this).css("cursor","pointer");
		$(this).next().next(".tv-btn-later").css("opacity", 1);
        
	})
    $(".video-thum").on('mouseout',function(){
        $(this).next().next(".tv-btn-later").css("opacity", 0);
        
    })
        
    $(".tv-btn-later").on("mouseenter", function(){
        $(this).css("opacity", 1);
    })
    $(".tv-btn-later").on("mouseout", function(){
        $(this).css("opacity", 0);
    })
	
    $(".tv-btn-later").on("click", function(event) {
	
		var vno = $(this).attr("data-vno");
		var login = $(this).attr("data-login");
		
		//지금 켜져있는 텝의정보를 찾아와서 이프문으로 리다이렉트 주소로 보낼값 전해주기
		var inActive = $(this).parents(".tab-pane").attr("id");
		
		if(inActive == 'menu1'){
			inActive = 'suggest'			
		}
		if(inActive == 'menu2'){
			inActive = 'recent'			
		}
		if(inActive == 'home'){
			inActive = 'best'			
		}
		if(login == 'N'){
			var YN = confirm("로그인이 필요합니다. 로그인 페이지로 이동하시겠습니까?");
			if(YN){
				
				location.href="/link/loginform.do?returnUrl=tv/rank.do?category="+inActive;
				
			}
		}
		 if(login == 'Y'){
			$.ajax({
				type:"POST",
				url:"addLater.do",
				data:{"vno":vno},
				dataType:"text",
				success:function(result){
					console.log(result);
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
