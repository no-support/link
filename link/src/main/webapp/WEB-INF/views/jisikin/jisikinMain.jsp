<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>Link 지식인</title>
    <link rel="shortcut icon" type="image/x-icon" href="/link/resources/images/shortcut-icon.PNG">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script src="/link/resources/js/jquery.timeago.js"></script>
    <script src="/link/resources/js/jquery.timeago.ko.js"></script>
    <link rel="stylesheet" href="/link/resources/css/blog/blog.css">
	<link rel="stylesheet" href="/link/resources/css/jisikin/jisikinmain.css">
	<link rel="stylesheet" href="/link/resources/css/jisikin/jisikinQna.css">
</head>
<body>
    <%@ include file="../common/nav.jsp" %>
<div class="container">
   <%@include file="jisikin-nav.jsp" %>
   
   <!-- 메인 컨텐츠 시작 -->
    
<!-- 첫번째 섹션-->
    <div class="row well">
       <div class="col-sm-3 jisik-section-1">
            <div class="row">
               <img src="/link/resources/images/jisikin-event1.PNG" style="height: 150px; width:100%;">
            </div>
            <div class="row" style="height: 50px;">
                  <c:if test="${empty todayJisikin[0].title }">
                  	<span class="_curation_question_title text-center">오늘의 질문이 없습니다!</span>
                  </c:if> 
                  <a href="/link/jisikin/questionDetail.do?jisikinNo=${todayJisikin[0].no}"><span class="_curation_question_title text-center">${todayJisikin[0].title }</span></a>
            </div>
       </div>
       <div class="col-sm-3 jisik-section-1">
           <div class="row">
               <img src="/link/resources/images/jisikin-event2.PNG" style="height: 150px; width:100%;">
            </div>
            <div class="row" style="height: 50px;">
                  <c:if test="${empty todayJisikin[1].title }">
                  	<span class="_curation_question_title text-center">오늘의 질문이 없습니다!</span>
                  </c:if> 
                  <a href="/link/jisikin/questionDetail.do?jisikinNo=${todayJisikin[1].no}"><span class="_curation_question_title text-center">${todayJisikin[1].title }</span></a>
            </div>
       </div>
       <div class="col-sm-3 jisik-section-1">
           <div class="row">
               <img src="/link/resources/images/jisikin-event3.PNG" style="height: 150px; width:100%;">
            </div>
            <div class="row" style="height: 50px;">
                  <c:if test="${empty todayJisikin[2].title }">
				  	<span class="_curation_question_title text-center">오늘의 질문이 없습니다!</span>
                  </c:if> 
                  <a href="/link/jisikin/questionDetail.do?jisikinNo=${todayJisikin[2].no}"><span class="_curation_question_title text-center">${todayJisikin[2].title }</span></a>
            </div>
       </div>
       <div class="col-sm-3">
<!-- 이벤트 캐러셀 -->
           <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
          <!-- Indicators -->
          <ol class="carousel-indicators">
            <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
            <li data-target="#carousel-example-generic" data-slide-to="1"></li>
            <li data-target="#carousel-example-generic" data-slide-to="2"></li>
            <li data-target="#carousel-example-generic" data-slide-to="3"></li>
            <li data-target="#carousel-example-generic" data-slide-to="4"></li>
          </ol>

          <!-- Wrapper for slides -->
          <div class="carousel-inner" role="listbox">
            <div class="item active">
              <img src="/link/resources/images/detail_gogi1.jpg" alt="..." style="height: 200px; width: 100%;">
              <div class="carousel-caption">
                오늘의 첫 번째 이벤트!
              </div>
            </div>
            <div class="item">
              <img src="/link/resources/images/detail_gogi1.jpg" alt="..." style="height: 200px; width: 100%;">
              <div class="carousel-caption">
                오늘의 첫 번째 이벤트!
              </div>
            </div>
            <div class="item">
              <img src="/link/resources/images/detail_gogi2.jpg" alt="..." style="height: 200px; width: 100%;">
              <div class="carousel-caption">
                오늘의 두 번째 이벤트!
              </div>
            </div>
            <div class="item">
              <img src="/link/resources/images/detail_gogi3.jpg" alt="..." style="height: 200px; width: 100%;">
              <div class="carousel-caption">
                오늘의 세 번째 이벤트!
              </div>
            </div>
            <div class="item">
              <img src="/link/resources/images/flower3.jpg" alt="..." style="height: 200px; width: 100%;">
              <div class="carousel-caption">
                오늘의 네 번째 이벤트!
              </div>
            </div>
          </div>
        </div>
<!-- 이벤트 캐러셀 끝-->
       </div>
   </div>
   
<!-- 두번째 섹션-->
    <div class="row">
        <div class="col-sm-9">
            <div class="row"> 
                <div class="col-sm-4 well text-center">
                    <h4>&lt;지식iN 통계 답변자></h4><br/>
                    <c:set var="today" value="<%=new java.util.Date()%>" />
                    <p class="text-center">"<strong style="color:#649dfa;"><fmt:formatDate value="${today }" pattern="MM월dd일"/>
                    Link 지식 IN</strong>에서는<br/> <strong style="color:#649dfa;">${countTodayAnswer }</strong>명의 지식IN들이 답변하셨습니다."</strong></p>
                    <div id="donutchart" style="width: 389px; height: 264px; margin-left:-40px; margin-top :14px; margin-bottom:-20px;"></div>   
                </div>
                <div class="col-sm-8 well">
                	<div class="row">
                		<div class="col-sm-6">
                    		<a href="#" class="jisikin-section-2-qna">많이 한 질문 키워드</a>
                    		<div class="ranking_keyword_list_area" id="keywordRankChart" style="display:block;">
                    		<ul class="ranking_list" id="keywordRankList">
					
						<li class="ranking_item">
							<span class="no">1</span>
							<a href="/link/search.do?word=${toptag[0].tagName }" class="ranking_keyword_link_area" target="_blank">
								<strong class="ranking_title">${toptag[0].tagName }</strong>
								<span class="keyword_num_text"><em class="num">${toptag[0].countTag }</em><span class="text">개의 질문 &gt;</span></span>
							</a>
						</li>
					
						<li class="ranking_item">
							<span class="no">2</span>
							<a href="/link/search.do?word=${toptag[1].tagName }" class="ranking_keyword_link_area" target="_blank">
								<strong class="ranking_title">${toptag[1].tagName }</strong>
								<span class="keyword_num_text"><em class="num">${toptag[1].countTag }</em><span class="text">개의 질문 &gt;</span></span>
							</a>
						</li>
					   
						<li class="ranking_item">
							<span class="no">3</span>
							<a href="/link/search.do?word=${toptag[2].tagName }" class="ranking_keyword_link_area" target="_blank">
								<strong class="ranking_title">${toptag[2].tagName }</strong>
								<span class="keyword_num_text"><em class="num">${toptag[2].countTag }</em><span class="text">개의 질문 &gt;</span></span>
							</a>
						</li>
					
						<li class="ranking_item">
							<span class="no">4</span>
							<a href="/link/search.do?word=${toptag[3].tagName }" class="ranking_keyword_link_area" target="_blank">
								<strong class="ranking_title">${toptag[3].tagName }</strong>
								<span class="keyword_num_text"><em class="num">${toptag[3].countTag }</em><span class="text">개의 질문 &gt;</span></span>
							</a>
						</li>
					
						<li class="ranking_item">
							<span class="no">5</span>
							<a href="#" class="ranking_keyword_link_area" target="_blank">
								<strong class="ranking_title">${toptag[4].tagName }</strong>
								<span class="keyword_num_text"><em class="num">${toptag[4].countTag }</em><span class="text">개의 질문 &gt;</span></span>
							</a>
						</li>
					   
						<li class="ranking_item">
							<span class="no">6</span>
							<a href="/link/search.do?word=${toptag[5].tagName }" class="ranking_keyword_link_area" target="_blank">
								<strong class="ranking_title">${toptag[5].tagName }</strong>
								<span class="keyword_num_text"><em class="num">${toptag[5].countTag }</em><span class="text">개의 질문 &gt;</span></span>
							</a>
						</li>
					
				</ul>
				</div>
                		</div>
                		<div class="col-sm-6" style="border-left:1px solid #DDD; max-height:332px;">
                    <a href="#" class="jisikin-section-2-qna">많이 본 Q&A</a>
                    <div class="ranking-section-area">
                        <ul class="ranking-section">
                            <li class="ranking-item">
                                <span class="no">1</span>
                                <a href="/link/jisikin/questionDetail.do?jisikinNo=${JisikinByView[0].no}" class="ranking-title">${JisikinByView[0].title }</a>
                                <a href="/link/jisikin/questionDetail.do?jisikinNo=${JisikinByView[0].no}" class="text">${JisikinByView[0].contents }</a>
                                <span class="recommend-num">조회수 ${JisikinByView[0].viewCnt }</span>
                                <span class="reply-num">답변수 ${JisikinByView[0].countAnswer }</span>
                            </li>
                            <li class="ranking-item">
                                <span class="no">2</span>
                                <a href="/link/jisikin/questionDetail.do?jisikinNo=${JisikinByView[1].no}" class="ranking-title">${JisikinByView[1].title }</a>
                                <a href="/link/jisikin/questionDetail.do?jisikinNo=${JisikinByView[1].no}" class="text">${JisikinByView[1].contents }</a>
                                <span class="recommend-num">조회수 ${JisikinByView[1].viewCnt }</span>
                                <span class="reply-num">답변수 ${JisikinByView[1].countAnswer }</span>
                            </li>
                            <li class="ranking-item">
                                <span class="no">3</span>
                                <a href="/link/jisikin/questionDetail.do?jisikinNo=${JisikinByView[2].no}" class="ranking-title">${JisikinByView[2].title }</a>
                                <a href="/link/jisikin/questionDetail.do?jisikinNo=${JisikinByView[2].no}" class="text">${JisikinByView[2].contents }</a>
                                <span class="recommend-num">조회수 ${JisikinByView[2].viewCnt }</span>
                                <span class="reply-num">답변수 ${JisikinByView[2].countAnswer }</span>
                            </li>
                        </ul>
                		</div>
                	</div>
                    </div>
                </div>
            </div>  
            <div class="answer-wrab row well">
                <div id="noanswer_tab" class="title_area">
                    <ul style="width: 100%;" class="text-center">
                        <li style="width: 80%;" class="tc-tab text-center"><a href="#" class="title on" onclick="" id="contentsOfMain">답변을 기다리는 질문</a></li>
                        <li style="width: 10%;" class="tc-tab"><span class="bar2"></span></li>
                        <li style="width: 10%;" class="tc-tab text-center"><a href="#" class="title" onclick="">정렬</a></li>
                    </ul>
                </div>
                <div class="row" style="padding-top: 40px;">
                    <div class="col-sm-3">
                        <div class="directory_area _qna_menu">
                            <div class="directory_box _list_area">
                                <ul class="directory_list _qna_list">
                                    <li><a class="${param.categoryNo == 0 ? 'light_on' : ''}" href="/link/jisikin/main.do?categoryNo=0">전체</a></li>
                                    <li><a class="${param.categoryNo == 1 ? 'light_on' : ''}" href="/link/jisikin/main.do?categoryNo=1">교육,학문</a></li>
                                    <li><a class="${param.categoryNo == 2 ? 'light_on' : ''}" href="/link/jisikin/main.do?categoryNo=2">컴퓨터통신</a></li>
                                    <li><a class="${param.categoryNo == 3 ? 'light_on' : ''}" href="/link/jisikin/main.do?categoryNo=3">게임</a></li>
                                    <li><a class="${param.categoryNo == 4 ? 'light_on' : ''}" href="/link/jisikin/main.do?categoryNo=4">엔터테인먼트,예술</a></li>
                                    <li><a class="${param.categoryNo == 5 ? 'light_on' : ''}" href="/link/jisikin/main.do?categoryNo=5">생활</a></li>
                                    <li><a class="${param.categoryNo == 6 ? 'light_on' : ''}" href="/link/jisikin/main.do?categoryNo=6">건강</a></li>
                                    <li><a class="${param.categoryNo == 7 ? 'light_on' : ''}" href="/link/jisikin/main.do?categoryNo=7">사회,정치</a></li>
                                    <li><a class="${param.categoryNo == 8 ? 'light_on' : ''}" href="/link/jisikin/main.do?categoryNo=8">경제</a></li>
                                    <li><a class="${param.categoryNo == 9 ? 'light_on' : ''}" href="/link/jisikin/main.do?categoryNo=9">여행</a></li>
                                    <li><a class="${param.categoryNo == 10 ? 'light_on' : ''}" href="/link/jisikin/main.do?categoryNo=10">스포츠,레저</a></li>
                                    <li><a class="${param.categoryNo == 11 ? 'light_on' : ''}" href="/link/jisikin/main.do?categoryNo=11">쇼핑</a></li>
                                    <li><a class="${param.categoryNo == 12 ? 'light_on' : ''}" href="/link/jisikin/main.do?categoryNo=12">쥬니버Q&A</a></li>
                                    <li><a class="${param.categoryNo == 13 ? 'light_on' : ''}" href="/link/jisikin/main.do?categoryNo=13">지역&플레이스</a></li>
                                    <li><a class="${param.categoryNo == 14 ? 'light_on' : ''}" href="/link/jisikin/main.do?categoryNo=14">고민Q&A</a></li>
                                    <li><a class="${param.categoryNo == 15 ? 'light_on' : ''}" href="/link/jisikin/main.do?categoryNo=15">오픈사전</a></li>
                                </ul> 
                            </div>
                        </div>
                    </div>
                    <span class="border"></span>
                    <div class="col-sm-9">
                        <div class="content_area">
                            <div class="heading_area">
<!--                                <div class="heading_title">
                                    <h5 class="tit ellipsis">
                                     <a href="#"><strong>전체</strong></a></h5>
                                </div>-->
                                <div class="sort_list_group_right">
                                   <h5 class="tit ellipsis">
                                     <a href="#"><strong>
                                     ${param.categoryNo == 0 ? '전체' : ''}
                                     ${param.categoryNo == 1 ? '교육, 학문' : ''}
                                     ${param.categoryNo == 2 ? '컴퓨터통신' : ''}
                                     ${param.categoryNo == 3 ? '게임' : ''}
                                     ${param.categoryNo == 4 ? '엔터테인먼트, 예술' : ''}
                                     ${param.categoryNo == 5 ? '생활' : ''}
                                     ${param.categoryNo == 6 ? '건강' : ''}
                                     ${param.categoryNo == 7 ? '사회, 정치' : ''}
                                     ${param.categoryNo == 8 ? '경제' : ''}
                                     ${param.categoryNo == 9 ? '여행' : ''}
                                     ${param.categoryNo == 10 ? '스포츠, 레저' : ''}
                                     ${param.categoryNo == 11 ? '쇼핑' : ''}
                                     ${param.categoryNo == 12 ? '쥬니버Q&A' : ''}
                                     ${param.categoryNo == 13 ? '지역&플레이스' : ''}
                                     ${param.categoryNo == 14 ? '고민Q&A' : ''}
                                     ${param.categoryNo == 15 ? '오픈사전' : ''}
                                     </strong></a></h5>
                                    <ul class="sort_list_module _sortOptionList">
                                        <li class="${param.sort == 1 ? 'is_active' : ''} _answer"><a href="/link/jisikin/main.do?sort=1&categoryNo=${not empty param.categoryNo ? param.categoryNo : 0}" role="button" class="_sort_option _param('answer')"><i class="ico_sort _sort_option _param('answer')"></i>답변적은순</a></li>
                                        <li class="${param.sort == 2 ? 'is_active' : ''} _recent"><a href="/link/jisikin/main.do?sort=2&categoryNo=${not empty param.categoryNo ? param.categoryNo : 0}" role="button" class="_sort_option _param('recent')"><i class="ico_sort _sort_option _param('recent')"></i>최신순</a></li>
                                        <li class="${param.sort == 3 ? 'is_active' : ''} _betPoint"><a href="/link/jisikin/main.do?sort=3&categoryNo=${not empty param.categoryNo ? param.categoryNo : 0}" role="button" class="_sort_option _param('betPoint')"><i class="ico_sort _sort_option _param('betPoint')"></i>내공높은순</a></li>
                                    </ul>
				                </div>
                            </div>
                            <div class="answer_list" style="padding-top: 40px; display: block;">
                            	<c:forEach var="sort" items="${sortJisikin }" begin="0" end="6">
	                                <div class="answer_box">
	                                    <div class="tit_wrap ">
	                                        <a href="/link/jisikin/questionDetail.do?jisikinNo=${sort.no}" rel="KIN" target="_blank">
	                                                <span class="power_grade"><span class="blind">내공</span>${sort.mentalPoint }</span>
	                                            <span class="tit_txt">${sort.title }</span>
	
	                                        </a>
	                                    </div>
	                                    <div class="update_info">
	                                        <span class="num_answer">답변 <em>${sort.countAnswer }</em></span>
	                                        <span class="info"><a href="#">${sort.category.name }</a></span>
	                                        <span class="info tg">${sort.createTime }</span>
	                                    </div>
	                                </div>
                            	</c:forEach>
                            </div>                           
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-3 aside-content">
            <c:choose>
       	<c:when test="${empty LOGIN_USER}">
            <div class="aside-login"">
               <p class="top_text">질문과 답변을 하고 싶다면,</p>
                <button type="text" id="login-btn" class="btn btn-default" onclick ="location.href = '/link/loginform.do'">
                    <img src="/link/resources/images/link_logo.PNG" alt="" style="width: 50%;"><strong>로그인</strong>
                </button>
                <div class="row sign_area">
                    <div class="info_find">
                        <a href="#" class="" target="_blank">아이디 찾기</a>
                        <span class="bar"></span>
                        <a href="#" target="_blank">비밀번호 찾기</a>
                    </div>

                    <div class="sign_in">
                        <a href="/link/registerAgree.do">회원가입</a>
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
						<a href="/link/jisikin/profile.do?userId=${LOGIN_USER.id}">
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
							href="/link/logout.do" id="logout-btn"
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
       
       
            <div style="margin-top: 5px;">
                <div class="aside aside_tag well">
                    <h4>지식iN 인기태그</h4>
                    <div class="tag_wrap">
                    		<c:forEach var="tag" items="${toptag }">
	                            <a href="/link/search.do?word=${tag.tagName }" class="tag">#${tag.tagName }</a>
                    		</c:forEach>
                    </div>
                </div>
                <div class="aside aside_statistics well">
                    <h4>오늘의 질문과 답변</h4>
                    <div class="stats stats_today">
                        <span class="blind">질문</span><strong class="num">${countToday }</strong><em class="slash sp_common">/</em><span class="blind">답변</span><strong class="num">${countTodayAnswer }</strong>
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

	// 구글 차트
     google.charts.load("current", {packages:["corechart"]});
      google.charts.setOnLoadCallback(drawChart);
      function drawChart() {
        var data = google.visualization.arrayToDataTable([
        	['성별', '비율'],
            ['남성',      ${male}],
            ['여성',  ${female}]
        ]);

        var options = {
          title: '오늘의 남성/여성 답변비율',
          pieHole: 0.4,
          backgroundColor: { fill:'transparent' }
        };

        var chart = new google.visualization.PieChart(document.getElementById('donutchart'));
        chart.draw(data, options);
      }

    $(document).ready(function(){
    	// timeAgo
        $(".tg").each(function(){
           var timeago_t = jQuery.timeago( new Date(parseInt($(this).text())));
           console.log(timeago_t);
           $(this).text(timeago_t);
        });
         
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
        
        $('#login-btn').click(function(){
            var host = location.host;
            var returnUrl = location.pathname;
            var queryString = location.search.substr(1).replace(/&/g, ',');
            location.href = '/link/loginform.do?returnUrl=' + returnUrl + '&queryString=' + queryString;
            return false;
        }); 
        
        $('#logout_btn').click(function(){
            var host = location.host;
            var returnUrl = location.pathname;
            var queryString = location.search.substr(1).replace(/&/g, ',');
            location.href = '/link/logout.do?returnUrl=' + returnUrl + '&queryString=' + queryString;
            return false;
      });
          
      })


</script>
</body>
</html>