<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>Link 지식인 > 답변하기</title>
    <link rel="shortcut icon" type="image/x-icon" href="/link/resources/images/shortcut-icon.PNG">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <script src="/link/resources/js/jquery.timeago.js"></script>
    <script src="/link/resources/js/jquery.timeago.ko.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
    <link rel="stylesheet" href="/link/resources/css/blog/blog.css">
	<link rel="stylesheet" href="/link/resources/css//jisikin/jisikinmain.css">
	<link rel="stylesheet" href="/link/resources/css//jisikin/jisikinQna.css">
	<link rel="stylesheet" href="/link/resources/css//jisikin/jisikinQuestion.css">
	<link rel="stylesheet" href="/link/resources/css//jisikin/jisikinAnswer.css">
</head>
<body>
<script type="text/javascript">
	var app = angular.module('myApp', []);
	
	app.controller('searchCtrl', function($scope, $http){
	    // $scope에 boxoffice라는 이름으로 빈 배열을 저장한다.
	    $scope.categories = [];
	    
	    $scope.searchCategories = function(categoryNo){
	    	
	    	var keyword = $(".catNo").val();
	        console.log(keyword);
	        var url = "byKeywordCategory.do?categoryNo="+categoryNo+"&keyword="+keyword;
	        
	        $http.get(url)
	            .then(function(response){
	                var data = response.data;   // 응답데이터 조회
	                $("#default-box").remove();
	                console.log(data);
	                $scope.categories = data;
	        }, function(){
	            alert("세부 카테고리를 골라주세요.");
	        })
	    }
	    
	})	
	
	// timeago
	app.filter("timeago", function() {
    	return function(time) {
    		return jQuery.timeago( new Date(time));
    	}
    })
    

</script>
<body ng-app="myApp" ng-controller="searchCtrl">
    <%@ include file="../common/nav.jsp" %>
<div class="container">
   <%@include file="jisikin-nav.jsp" %>
</div>
   
   
   <!-- 메인 컨텐츠 시작 -->
<!-- 질문 섹션-->
<div class="container">
    <div class="row ">
        <div class="col-sm-9 well">
            <div class="answer_wrap">
                <div class="tc-panel tc-selected">
				<!-- 내용 시작 -->
<h4 class="blind">답변을 기다리는 질문</h4>
<div class="content_wrap _noanswer_wrap row  section_answer">
	<div class="directory_area _qna_menu col-sm-2" style="width:190px">
		<div class="directory_box _list_area">
			<ul class="directory_list _qna_list" id="category-list-box">
				
					
						<li dirid="0" class="on"><a href="/link/jisikin/answer.do">전체<span class="blind _selected">질문 목록 선택됨</span></a></li>						
						<li dirid="1"><a href="/link/jisikin/answer.do?categoryNo=1" data-value="1">교육, 학문</a></li>						
						<li dirid="2"><a href="/link/jisikin/answer.do?categoryNo=2">컴퓨터통신</a></li>						
						<li dirid="3"><a href="/link/jisikin/answer.do?categoryNo=3">게임</a></li>						
						<li dirid="4"><a href="/link/jisikin/answer.do?categoryNo=4">엔터테인먼트, 예술</a></li>						
						<li dirid="5"><a href="/link/jisikin/answer.do?categoryNo=5">생활</a></li>						
						<li dirid="6"><a href="/link/jisikin/answer.do?categoryNo=6">건강</a></li>						
						<li dirid="7"><a href="/link/jisikin/answer.do?categoryNo=7">사회, 정치</a></li>						
						<li dirid="8"><a href="/link/jisikin/answer.do?categoryNo=8">경제</a></li>						
						<li dirid="9"><a href="/link/jisikin/answer.do?categoryNo=9">여행</a></li>						
						<li dirid="10"><a href="/link/jisikin/answer.do?categoryNo=10">스포츠, 레저</a></li>						
						<li dirid="11"><a href="/link/jisikin/answer.do?categoryNo=11">쇼핑</a></li>						
						<li dirid="12"><a href="/link/jisikin/answer.do?categoryNo=12">쥬니버Q&amp;A</a></li>						
						<li dirid="13"><a href="/link/jisikin/answer.do?categoryNo=13">지역&amp;플레이스</a></li>						
						<li dirid="14"><a href="/link/jisikin/answer.do?categoryNo=14">고민Q&amp;A</a></li>						
						<li dirid="15"><a href="/link/jisikin/answer.do?categoryNo=15">오픈사전</a></li>						
				
			</ul> 
		</div>
	</div>
	    <span class="answer-border"></span>
	<div class="content_area _dir_content col-sm-9" style="display: block;">
		
		<div class="heading_area _dir_content_title" style="display: block;">
			
			<h5 class="tit ellipsis _heading_title">
		
			<a href="/qna/list.nhn"><strong id="text-box">전체</strong></a>

	</h5>
			
			<div class="search_area _heading_search">
				<input type="text" class="search_input _search_input catNo" title="검색어 입력">
				<a href="#" id="search-keyword" ng-click="searchCategories('${param.categoryNo }')"><span class="glyphicon glyphicon-search"></span></a>
			</div>
		</div>
		
		
	<div class="answer_list _noanswer_list" style="display: block;">

		<div ng-repeat="jisikin in categories" class="answer_box _noanswerItem no_tag">
					<div class="tit_wrap ">
						<a
							href="/link/jisikin/questionDetail.do?jisikinNo={{jisikin.no }}"
							rel="KIN" target="_blank"> <span class="tit_txt" style="max-width:250px;">{{jisikin.title }}</span>
		
							<div class="contentss" style="font-weight : 100; font-size:10px;">
								<p class="txt">{{jisikin.contents }}</p>
							</div>
						</a>
					</div>
		
					<div class="answer_update_info">
						<span class="num_answer">답변 <em>{{jisikin.countAnswer }}</em></span> <span
							class="info">
							<a href="#" ng-repeat="tag in jisikin.tags">
							{{tag.tagName}}
							</a>
							
							</span> <span class="info">{{jisikin.createTime |  timeago}}</span>
					</div>
		
					<div class="lnk_wrap">
		
						<a href="#"
							class="lnk_wonder _metooWonderBtn _param('31505,332077452')">나도궁금해요
							<em class="_metooWonderCount">{{jisikin.recommend }}</em>
						</a><span class="dv"></span> <a href="/link/jisikin/questionDetail.do?jisikinNo={{jisikin.no }}" rel="KIN"
							class="lnk_answer" target="_blank">답변하기 <span
							class="sp_common ico_arr"></span></a>
					</div>
				</div>
		</div>
		
		<div class="answer_list _noanswer_list" id="default-box"  style="display: block;">

		<c:forEach var="jisikin" items="${allJisikin }">
				<div class="answer_box _noanswerItem no_tag">
					<div class="tit_wrap ">
						<a
							href="/link/jisikin/questionDetail.do?jisikinNo=${jisikin.no }"
							rel="KIN" target="_blank"> <span class="tit_txt" style="max-width:250px;">${jisikin.title }</span>
		
							<div class="contentss" style="font-weight : 100; font-size:10px;">
								<p class="txt">${jisikin.contents }</p>
							</div>
						</a>
					</div>
		
					<div class="answer_update_info">
						<span class="num_answer">답변 <em>${jisikin.countAnswer }</em></span> <span
							class="info">
						<c:forEach var="tag" items="${jisikin.tags }">
							<a href="#">
									#${tag.tagName }
							</a>
						</c:forEach>
							
							</span> <span class="info tg">${jisikin.createTime }</span>
					</div>
		
					<div class="lnk_wrap">
		
						<a href="#"
							class="lnk_wonder _metooWonderBtn _param('31505,332077452')">나도궁금해요
							<em class="_metooWonderCount">${jisikin.recommend }</em>
						</a><span class="dv"></span> <a href="/link/jisikin/questionDetail.do?jisikinNo=${jisikin.no }" rel="KIN"
							class="lnk_answer" target="_blank">답변하기 <span
							class="sp_common ico_arr"></span></a>
					</div>
				</div>
		</c:forEach>
	
	</div>

<!-- 페이징 -->
		<div class="paginate _default_pager">
	           <c:if test="${!pagination.first }">
	              <a class="pr-prev _pre" href="/link/jisikin/answer.do?categoryNo=${param.categoryNo }&page=${pagination.page - 1 }">이전페이지
	              </a>
	           </c:if>
	            <c:forEach var="p" begin="${pagination.begin }" end="${pagination.end }">
		            <a class="${pagination.page eq p ? 'on' : '' }" href="/link/jisikin/answer.do?categoryNo=${param.categoryNo }&page=${p }">${p }</a>
	            </c:forEach>
	            <c:if test="${!pagination.last }">
		              <a class="next" href="/link/jisikin/answer.do?categoryNo=${param.categoryNo }&page=${pagination.page + 1 }">다음페이지
		              </a>
		        </c:if>
        </div>
	</div>

</div>
			</div>
            </div>
        </div>
        <div class="col-sm-3 aside-content">
       
       <c:choose>
       	<c:when test="${empty LOGIN_USER}">
            <div class="aside-login">
               <p class="top_text">질문과 답변을 하고 싶다면,</p>
                <button type="text" class="btn btn-default" onclick ="location.href = '/link/loginform.do'">
                    <img src="/link/resources/images/link_logo.PNG" alt="" style="width: 50%;"><strong>로그인</strong>
                </button>
                <div class="row sign_area">
                    <div class="info_find">
                        <a href="#" class="" target="_blank">아이디 찾기</a>
                        <span class="bar"></span>
                        <a href="#" target="_blank">비밀번호 찾기</a>
                    </div>

                    <div class="sign_in">
                        <a href="#">회원가입</a>
                    </div>
			    </div>
           </div>
       	</c:when>
       	<c:otherwise>
			<div class="aside-login" style="background-color: #f8f8f8; border: 1px solid #e3e3e3;">
				<div id="aside_login" class="aside_myinfo">
					<h2 class="blind">
						NAVER <em>로그인</em> 영역
					</h2>
					<div class="my_wrap">
						<a href="/myinfo/index.nhn">
							<div class="my_photo">
								<img
									src="https://ssl.pstatic.net/static/kin/09renewal/avatar/200x200_m/4.png"
									alt="프로필이미지" class="img" width="50" height="50">
							</div>
							<div class="my_service">
								<p class="user_id ellipsis">${LOGIN_USER.id }</p>
								<p class="user_mykin" onclick="location.href='/link/jisikin/profile.do?userId=${LOGIN_USER.id }'">
								접속중
								</p>   
								<a href="/link/jisikin/profile.do?userId=${LOGIN_USER.id}">프로필 바로가기&gt;</a>
							</div>
						</a> <span class="btn_login_area"> <a
							href="/link/logout.do"
							class="btn_login">로그아웃</a>
						</span>
						<div class="mykin_wrap _tab_myarea">
							<div class="mykin_tab_content tc-panel tc-selected">
								<h4 class="blind">나의 지식iN</h4>
								<div class="scroll_area _panel">
									<div class="gradeup_info">
										<div class="lv_area grd_lv4">
											<div class="mylv">
												<div class="gauge" id="level_guage">
													<div class="grd_wrap">

														<div class="inner" style="width: 14%;">
															<div class="grd_bar">
																<span class="grd_action"></span>
															</div>
														</div>
													</div>
													<div class="my_level_num" style="padding-top: 40px;">
														<strong style="display: block;">내공:</strong> <strong
															style="display: block;">${LOGIN_USER.mentalPoint }</strong>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>

						</div>
					</div>
				</div>
			</div>
       	</c:otherwise>
       </c:choose>






			<!-- 관심키워드 추가 레이어 -->

            <div style="margin-top: 5px;">
                <div class="aside aside_tag well">
                    <h4>지식iN 인기태그</h4>
                    <div class="tag_wrap">
                            <c:forEach var="tag" items="${toptag }">
	                            <a href="#" class="tag">#${tag.tagName }</a>
                    		</c:forEach>
                    </div>
                </div>
                <div class="aside aside_statistics well">
                    <h4>오늘의 질문과 답변</h4>
                    <div class="stats stats_today">
                        <span class="blind">질문</span><strong class="num">${countToday }</strong><em class="slash sp_common">/</em><span class="blind">답변</span><strong class="num">${countTodayAnswer }</strong>
                        <!--  오늘날짜 뿌리기 -->
                        <c:set var="now" value="<%=new java.util.Date()%>" />
                        <p class="date_info"><fmt:formatDate value="${now }" pattern="yyyy.MM.dd"/></p>
                    </div>
                    <h4>누적 답변수</h4>
                    <div class="stats stats_accum">
                        <strong class="num">${countAnswer }</strong>
                        <p class="date_info">since 2019</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
/* $('#category-list-box li').click(function() {
	$(this).siblings().removeClass('on');
	$(this).addClass('on');
	
	
	var text = $(this).find('a').text();
	console.log(text);
	
	$('#text-box').text(text);
									집가서 여기하자 
}); */			


//timeAgo
$(".tg").each(function(){
   var timeago_t = jQuery.timeago( new Date(parseInt($(this).text())));
   console.log(timeago_t);
   $(this).text(timeago_t);
});	


    /* 나도 답변하기 */
    $('._noanswerItem').hover(function(){
        $(this).find('.lnk_wrap').css("display", "block");
    }, function(){
        $(this).find('.lnk_wrap').css("display", "none");
    })
    
    $(document).ready(function(){
         
        $('.dropdown,.dropdown-menu').hover(function(){

          if($(window).width()>=768){
            $(this).addClass('open').trigger('shown.bs.dropdown', relatedTarget)
            return false;
          }
          
        },function(){
          if($(window).width()>=768){
            $(this).removeClass('open').trigger('hidden.bs.dropdown', relatedTarget)
            return false;
          }
        })
        
        
      })
    </script>
</body>
</html>