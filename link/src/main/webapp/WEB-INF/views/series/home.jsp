<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <title>Link : 시리즈</title>
    <link rel="shortcut icon" type="image/x-icon" href="../../../resources/images/shortcut-icon.PNG">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    
    <link rel="stylesheet" href="/link/resources/css/series/swiper.min.css">
    <style type="text/css">
        /* * {font: NanumGothic;} */

        /* a {
            color: black !important;
            text-decoration: none !important
        }

        a:hover {
            color: black;
        } */
        
        /* #slide-box {
            max-width: 1000px;
            margin: 10px auto;
        } */
		
		.likes-vod-img-size {
			width: 155px;
            height: 228px;
		}

		.brand-new-img-size {
			width: 93px;
			height: 129px;
		}
        .margin-top {margin-top: 20px;}
        
        .price {color: #649dfa;}

        .round {
            border: 1px solid #649dfa;
            border-radius: 20px;
        }

        .look-more {float: right;}

        .arrays {margin: 30px 0px;}

        #point {
            color: #649dfa;
            float: right;
            text-align: right;
        }
        
        .title{display: block;}
        
        .top-N{height: 60px; margin: 10px 0;}
        
        .topN-img-size{height: 60px; width: 39px;}
    </style>
</head>

<body style="background-color: #ddd;">
<c:set var="menu" value="home"></c:set>
<%@ include file="common/jstl.jsp" %>
<%@ include file="common/nav.jsp" %>

    <div class="container-fluid swiper-container" style="background-color: white;">
        <!-- 슬라이드 -->
        <div class="swiper-wrapper"> <!--  id="slide-box" -->
            <c:forEach var="vod" items="${likesVods }">
	            <div class="swiper-slide">
	                <div class="row">
	                    <div class="col-sm-12 text-center">
	                        <a href="detail.do?vodno=${vod.no }"><img class="likes-vod-img-size" src="/link/resources/images/series/vods/${vod.img }"></a>
	                    </div>
	                </div>
	                <div class="row">
	                    <div class="col-sm-12 text-center">
	                        <h4><a href="detail.do?vodno=${vod.no }"><strong>${vod.title }</strong></a></h4>
	                        <h6 class="small-font">
	                        	<c:choose>
						           <c:when test="${fn:length(vod.actor) > 11}">
						            <c:out value="${fn:substring(vod.actor,0,10)}"/>…
						           </c:when>
						           <c:otherwise>
						            <c:out value="${vod.actor}"/>
						           </c:otherwise> 
						        </c:choose>
	                        </h6>
	                        <p class="price"><fmt:formatNumber type="number" maxFractionDigits="3" value="${vod.price }"></fmt:formatNumber>원</p>
	                    </div>
	                </div>
	            </div>
            </c:forEach>

        </div>
        <!-- Add Pagination -->
	    <div class="swiper-pagination"></div>
	    <!-- Add Arrows -->
	    <div class="swiper-button-next"></div>
	    <div class="swiper-button-prev"></div>
    </div>

    <div class="container">
        <!-- 컨텐츠-->
        <div class="row margin-top">
            <div class="col-sm-8 col-sm-offset-1">
               <!-- 최신 방송 -->
                <div class="col-sm-12 round well">
                    <div class="row">
                        <div class="col-sm-12"> 
                            <strong>최신 방송</strong>
                            <div class="look-more"><a href="category.do">더 보기</a></div>
                        </div>
                    </div>

                    <div class="row arrays">
	                    <c:forEach var="vod" items="${brandNewVods }">
	                        <div class="col-sm-3">
	                            <div class="row">
	                                <div class="col-sm-12 text-center">
	                                    <a href="detail.do?vodno=${vod.no }"><img class="brand-new-img-size" src="/link/resources/images/series/vods/${vod.img }"></a>
	                                </div>
	                            </div>
	                            <div class="row">
	                                <div class="col-sm-12 text-center">
		                                <c:choose>
								           <c:when test="${fn:length(vod.title) > 11}">
								           		<p><strong><c:out value="${fn:substring(vod.title,0,10)}"/>…</strong></p>
								           </c:when>
								           <c:otherwise>
								            	<p><strong><c:out value="${vod.title}"/></strong></p>
								           </c:otherwise> 
						        		</c:choose>
	                                    <p class="price"><fmt:formatNumber type="number" maxFractionDigits="3" value="${vod.price }"></fmt:formatNumber>원</p>
	                                </div>
	                            </div>
	                        </div>
	                    </c:forEach>
                    </div>
                </div>
                
                <div class="col-sm-12 round well">
                    <div class="row">
                        <div class="col-sm-12">
                            <strong>공지사항</strong>
                            <div class="look-more"><a href="noticelist.do">더 보기</a></div>
                        </div>
                    </div>
                    
                    <div class="row">
                        <ul class="list-group">
                        <c:forEach var="notice" items="${notices }"><li class="list-group-item">${notice.title }</li></c:forEach>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-sm-3">
            <!-- 나의 이용정보 -->
            <c:if test="${not empty LOGIN_USER }">
                <div class="row">
                    <div class="col-sm-12 round well">
                        <div class="row">
                            <div class="col-sm-12"><strong>나의 이용정보</strong></div>
                        </div>
                        <div class="row">
                            <div class="col-sm-6">나의 포인트: </div>
                            <div class="col-sm-6" id="point"><span><fmt:formatNumber type="number" maxFractionDigits="3" value="${LOGIN_USER.point }"></fmt:formatNumber>원</span></div>
                        </div>
                    </div>
                </div>
			</c:if>
			<!-- 방송 TOP 5 -->
                <div class="row">
                    <div class="col-sm-12 round well">
                        <div class="row"> 
                           <div class="col-sm-12">
                            <strong>인기순위</strong>
                            <div class="look-more"><a href="toprank.do">더 보기</a></div>
                           </div>
                        </div>
                        
                        <div class="row">
                             <ol>
                             <c:forEach var="vod" items="${ranks }">
                                <li class="top-N">
                                  <div class="col-sm-3">
                                        <a href="detail.do?vodno=${vod.no }" class="">
                                           <img class="topN-img-size" src="/link/resources/images/series/vods/${vod.img}" alt="">
                                        </a>
                                  </div>
                                  <div class="col-sm-9">
                                  
                                  		<c:choose>
								           <c:when test="${fn:length(vod.title) > 11}">
								           		<a href="detail.do?vodno=${vod.no }" class="title"><strong><c:out value="${fn:substring(vod.title,0,10)}"/>…</strong></a>
								           </c:when>
								           <c:otherwise>
								            	<a href="detail.do?vodno=${vod.no }" class="title"><strong><c:out value="${vod.title}"/></strong></a>
								           </c:otherwise> 
						        		</c:choose>
						        		
						        		<c:choose>
								           <c:when test="${fn:length(vod.actor) > 11}">
								            <small><c:out value="${fn:substring(vod.actor,0,10)}"/>…</small>
								           </c:when>
								           <c:otherwise>
								            <small><c:out value="${vod.actor}"/></small>
								           </c:otherwise> 
								        </c:choose>
						        		
                                      
                                  </div>
                                </li>
                             </c:forEach>
                            </ol>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
	<script src="/link/resources/js/series/swiper.min.js"></script>
	
	<script>
    var swiper = new Swiper('.swiper-container', {
      slidesPerView: 5,
      spaceBetween: 30,
      slidesPerGroup: 5,
      loop: true,
      loopFillGroupWithBlank: true,
      pagination: {
        el: '.swiper-pagination',
        clickable: true,
      },
      navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
      },
    });
	</script>
</body>

</html>