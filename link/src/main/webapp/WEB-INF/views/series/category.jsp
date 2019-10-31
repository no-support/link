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
	<style type="text/css">
	/* * {font: NanumGothic;} */
	
	/* a {color: black !important;} */
        
    .series-menu{
        padding:5px;
        /*border:0.5px solid lightgray;*/
    }
    
    .series-menu div{padding: 5px;}
    
    .text-right-align{
        display: inline-block;
        float: right;
        text-align: right;
        margin: 0px 20px 20px 0px;
    }
    
    .price{color: #649dfa;}
    
    .font-emphasize {font-weight: bold;}
	</style>
</head>
<body style="background-color: #ddd;">
<c:set var="menu" value="category"></c:set>
<%@ include file="common/jstl.jsp" %>
<%@ include file="common/nav.jsp" %>
	
	<div class="container">
		<div class="row" style="margin-top: 15px;">
		    <div class="col-sm-2" style="background-color: white; margin: 15px;">
		      <div class="row">
			      	<ul class="nav nav-pills nav-stacked">
	                      <li role="presentation" class=" ${(param.cat eq '0') || (empty param.cat) ? 'active' : '' }"><a href="category.do?cat=0">전체</a></li>
	                      <li role="presentation" class="${(param.cat eq '31') && (param.ing eq 'Yes')? 'active' : '' }"><a href="category.do?cat=31&ing=Yes">한국드라마[방영중]</a></li>
	                      <li role="presentation" class="${(param.cat eq '31') && (param.ing eq 'No')? 'active' : '' }"><a href="category.do?cat=31&ing=No">한국드라마[종영]</a></li>
	                      <li role="presentation" class="${param.cat eq '32' ? 'active' : '' }"><a href="category.do?cat=32">영미권 드라마</a></li>
	                      <li role="presentation" class="${param.cat eq '33' ? 'active' : '' }"><a href="category.do?cat=33">중화권 드라마</a></li>
	                      <li role="presentation" class="${param.cat eq '34' ? 'active' : '' }"><a href="category.do?cat=34">일본 드라마</a></li>
	                      <li role="presentation" class="${param.cat eq '35' ? 'active' : '' }"><a href="category.do?cat=35">예능</a></li>
	                      <li role="presentation" class="${param.cat eq '36' ? 'active' : '' }"><a href="category.do?cat=36">애니메이션</a></li>
	                      <li role="presentation" class="${param.cat eq '37' ? 'active' : '' }"><a href="category.do?cat=37">교양/다큐멘터리</a></li>
	                      <li role="presentation" class="${param.cat eq '38' ? 'active' : '' }"><a href="category.do?cat=38">KIDS</a></li>
	                </ul>
	          </div>
		    </div>
		    
		    <div class="col-sm-9" style="background-color: white; margin: 15px;">
              <div class="row">
                  <h4>전체</h4>
                  <p>총 ${length }개 작품</p>
                  <%-- [${param.sort }] --%>
                  <a href="category.do?cat=${param.cat }&ing=${param.ing}&sort=price"><span class="text-right-align ${param.sort eq 'price' ? 'font-emphasize' : '' }" >가격순</span></a>
                  
                  <a href="category.do?cat=${param.cat }&ing=${param.ing}&sort=date"><span class="text-right-align ${param.sort eq 'date' ? 'font-emphasize' : '' }">최신순</span></a>
		      </div>
		      <div class="row">
					<c:forEach var="vod" items="${vods }">
					    <div class="col-sm-3">
					             <div style="text-align: center">
					              <a href="detail.do?vodno=${vod.no }"><img src="/link/resources/images/series/vods/${vod.img }"></a>
					        <p><strong>
									<c:choose>
							           <c:when test="${fn:length(vod.title) > 13}">
							           		<a href="detail.do?vodno=${vod.no }"><c:out value="${fn:substring(vod.title,0,12)}"/>…</a>
							           </c:when>
							        	<c:otherwise>
							           		<a href="detail.do?vodno=${vod.no }"><c:out value="${vod.title}"/></a>
							           </c:otherwise> 
							       </c:choose>
					          </strong></p>
					        <p class="price"><fmt:formatNumber type="number" maxFractionDigits="3" value="${vod.price }"></fmt:formatNumber>원</p>
					        </div>
					    </div>
					</c:forEach>
              </div>
		    </div>
		    
	    </div>
	</div>

</body>