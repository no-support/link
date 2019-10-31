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
	.bold{font-weight: bold;}
	.unhearted{color:black;}
	.hearted{color: red;}
	
	</style>
</head>
<body>
<%@ include file="common/jstl.jsp" %>
<%@ include file="common/nav.jsp" %>
<div class="container" style="margin-top: 15px;">

    <div class="col-sm-3">
        <div  style="text-align: center"><img src="/link/resources/images/series/vods/${seriesVod.img}" width="150" height="250"></div>
        
    </div>
    <div class="col-sm-9">
        <h2>${seriesVod.title }(총 ${countEpisodes }회)</h2>        
        <button id="heart"  type="button" class="btn btn-default" style="margin: 0px 0px 5px 0px;" data-login="${not empty LOGIN_USER ? 'yes' : 'no' }">
          <span class="glyphicon glyphicon-heart-empty ${ isAlreadyHearted > 0 ? 'hearted' : ''}" aria-hidden="true">${countLikes }</span>
        </button>

        <div>
            <span class="bold">기본정보</span> ${seriesVod.runningTime }분<br/>
            <span class="bold">방송일</span> <fmt:formatDate value="${seriesVod.airStartDate }"/> ~ <fmt:formatDate value="${seriesVod.airFinishedDate }"/> <br/>
            <span class="bold">등급</span> ${seriesVod.grade }<br/>
            <span class="bold">장르</span> ${category.name }<br/>
            <span class="bold">주연</span> ${seriesVod.actor }<br/><br/>
        </div>
        <p>${seriesVod.descriptrion }</p>
        <div>
           <div class="text-right">총 <span class="total">${countEpisodes }</span>화 중 <span class="checked">0</span>화 선택
               <button type="button" id="btn-add-cart" class="btn btn-default">
                  <span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span>
                  <span>담기</span>
                </button>
          </div>
           
           <table class="table table-condensed">
               <colgroup>
                  <col width="7%">
                   <col width="10%">
                   <col width="*">
                   <col width="10%">
               </colgroup>
               <thead>
                   <tr>
                       <th class="text-center"><input id="checkall" type="checkbox" name="episode" value="14">전체</th>
                       <th>회차</th>
                       <th>줄거리</th>
                       <th>가격</th>
                   </tr>
               </thead>
               <tbody>
               	<form id="cart-form" >
               		<c:forEach var="episode" items="${episodes }">
	                   <tr>
	                       <td rowspan="2" class="text-center" style="vertical-align: middle;"><input type="checkbox" name="chk" value="${episode.no }"></td>
	                       <td style="vertical-align: bottom;">${episode.title }</td>
	                       <td rowspan="2" style="vertical-align: middle;">${episode.summary }</td>
	                       <td rowspan="2" style="vertical-align: middle;"><fmt:formatNumber type="number" maxFractionDigits="3" value="${episode.price }"></fmt:formatNumber>원</td>
	                   </tr>
	                   <tr>
	                       <td style="border-top: 0; vertical-align: top;"><fmt:formatDate value="${episode.createDate }"/></td>
	                   </tr>
                    </c:forEach>
                  </form>
               </tbody>
           </table>
        </div>
        <div class="review">
            <div><strong>리뷰 (${countReviews })</strong></div>
            <form class="form-horizontal" action="addReview.do" method="post">
	            <div class="form-group">
	                <div class="col-sm-12" style="margin-right: -15px;">
	                <input type="hidden" name="vodno" value="${seriesVod.no }">
	                      <div  style="float: left; display: inline-block; width:709px;"><textarea id="reviewform" class="form-control" name="contents" rows="5" style="resize: none;"></textarea></div>
	                      <div style="height:116px; float: left; display: inline-block; position: relative; bottom: 1px;"><button class=" btn btn-default btn-block" style="height:116px; width: 116px;">등록</button></div>
	                </div>
	            </div>
            </form>
            <ul class="list-group">
            	<c:forEach var="review" items="${reviews }">
	                <li class="list-group-item">
	                    <span>${review.user.nickName } (${fn:substring(review.user.id,0,3)}*****) <fmt:formatDate value="${review.createDate }"/></span><span class="pull-right">공감: 0 ${countrepuLike } 비공감 : 0 ${countrepuDislike }</span>
	                    <p>${review.contents }</p>
	                </li>
	            </c:forEach>
            </ul>
        </div>
    </div>
</div>
<script type="text/javascript">
	$(document).ready(function(){
	    $("#checkall").click(function(){
	        if($("#checkall").prop("checked")){
	            $("input[name=chk]").prop("checked",true);
	        }else{
	            $("input[name=chk]").prop("checked",false);
	        }
		    var checked = $("input:checkbox[name=chk]:checked").length;
		    $(".checked").text(checked);
	    });

	    $("input[name=chk]").change(function(){
	    	var checked = $("input:checkbox[name=chk]:checked").length;
		    $(".checked").text(checked);
	    });
	    
	    
    	$('#reviewform').on('keyup', function() {
        	if($(this).val().length > 100) {
            	$(this).val($(this).val().substring(0, 100));
				window.alert("100자 이내로 작성해주세요");
        	}
    	});
    	
    	$('#btn-add-cart').click(function(){
    		var arr = $('#cart-form').serialize();
    		
    		$.ajax({
    			type:"post",
    			url:'mypage/addcart.do',
    			data:arr,
    			dataType:"text",
    			success:function(data){	// {result:success}
    				$("input[name=episode]").prop("checked",false);
    				$("input[name=chk]").prop("checked",false);
    				$(".checked").text(0);
    				alert("장바구니에 추가되었습니다.");
    			}
    		})
    	});
    	
    	/*
    	$(".user-only").click(function(){
    		   if('${LOGIN_USER}'== ""){
    				var result = confirm('로그인이 필요한 서비스입니다. 로그인 페이지로 이동하시겠습니까?');
    				var host = location.host;
    				var returnUrl = location.pathname;
    				var queryString = location.search.substr(1).replace(/&/g, ',');
    				
    				if(result){
    					location.href = '/link/loginform.do?returnUrl='+returnUrl+'&queryString='+queryString;
    					return false;
    				}
    				return false;
    			}
    	   })
    	   */
    	
    	$("#heart").click(function(){
    		// if('${LOGIN_USER}'== "") { 지식인-내브.jsp
    			
    		if ($(this).attr('data-login') == "no") {
    			var result = confirm('로그인이 필요한 서비스입니다. 로그인 페이지로 이동하시겠습니까?');
    			var host = location.host;
    			var returnUrl = location.pathname;
    			var queryString = location.search.substr(1).replace(/&/g, ',');
    			
    			if (result) {
    				location.href = '/link/loginform.do?returnUrl='+returnUrl+'&queryString='+queryString;
    				return false;
    			}
    			
    			// return false;
    		}
    		/* if ($(this).attr('data-login') == "no") {
    			alert("로그인 페이지로 이동합니다.");
    			location.href = '/link/loginform.do';
    			return false;
    		} */
    		
    		if ($(this).find('span').hasClass('unhearted')){
	    		$.ajax({
	    			type:"get",
	    			url:"likeedit.do?vodno=${param.vodno}&gubun=plus",
	    			dataType:"text",
	    			success:function(){
		    			$(this).find('span').addClass('hearted');
	    				
	    			}
	    			
	    			// location.href="likeedit.do?vodno=${param.vodno}&gubun=plus"
	    			// $(this).find('span').addClass('hearted').removeClass('unhearted');
	    			
	    		})
    		} else if ($(this).find('span').hasClass('hearted')){
	    		$.ajax({
	    			type:"get",
	    			url:"likeedit.do?vodno=${param.vodno}&gubun=minus",
	    			dataType:"text",
	    			success:function(){
		    			$(this).find('span').removeClass('hearted');
	    				
	    			}
	    		})
    		}
    		
    	});
    	
	});
</script>
</body>