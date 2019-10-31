<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
	<title>Link 지식인 > Q&A</title>
    <link rel="shortcut icon" type="image/x-icon" href="/link/resources/images/shortcut-icon.PNG">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <script src="/link/resources/js/jquery.timeago.js"></script>
    <script src="/link/resources/js/jquery.timeago.ko.js"></script>
    <link rel="stylesheet" href="/link/resources/css/blog/blog.css">
	<link rel="stylesheet" href="/link/resources/css/jisikin/jisikinmain.css">
	<link rel="stylesheet" href="/link/resources/css/jisikin/jisikinQna.css">
	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
</head>
<body>
    <%@ include file="../common/nav.jsp" %>
<div class="container">
   <%@include file="jisikin-nav.jsp" %>
   
   <!-- 메인 컨텐츠 시작 -->
    
<!-- 첫번째 섹션-->
   <div class="row">
       <div class="col-sm-9 well wrap_qna">
       <div class="spot_area" style="width: 100%;">
            <div class="spot_area_inner">
            <div class="s_header">
                <h2>Q&amp;A</h2>
                <div class="ques_cnt">
                    <dl>
                    <dt class="itm">오늘의 새 질문</dt>
                    <dd id="todayQuestion">${countToday }</dd>
                    <dt class="itm3" style="background-position:0 -24px;">오늘의 답변</dt>
                    <dd id="todayAnswer">${countTodayAnswer }</dd>
                    </dl>
                </div>
            </div>
                    <div class="s_body">
                        <div class="spot_directory">
                            <ul style="padding-left:50px;">
                            	<c:forEach var="c" items="${categoriesParent }">
                            		<li style="list-style:square !important;">
                            			<a class="a-category" href="/link/jisikin/qna.do?categoryNo=${c.no }">${c.name }</a>
                            		</li>
                            	</c:forEach>
                            </ul>
                        </div>
                        <!-- 인기(지역) 시작-->	
                        <!-- 인기(지역) 끝 -->
                        <!-- 인기 태그 -->
                        <!-- 인기 태그 -->
                    </div>
        </div>
       </div>
       <div class="">
            <div id="list_noanswer" class="qna_list_noanswer">
                <div class="board_box">

                <h3 class="blind">새 질문 게시판</h3>
                    <table cellspacing="0" class="boardtype2" width="100%">
                    <caption><span class="blind">새 질문 게시글 1페이지 목록</span></caption>
                    <colgroup>
                    <col>
                    <col width="94">
                    <col width="47">
                    <col width="66">
                    </colgroup>

                    <thead>
                    <tr>
                    <th scope="col" class="title "><a href="#" class="option_grade _nclicks:kls_new.bybest">내공<img src="https://ssl.pstatic.net/static/kin/09renewal/blank.gif" width="12" height="12" alt="정렬"></a>제목</th>
                    <th scope="col">분야</th>
                    <th scope="col" class="" id="listAnswerField"><a href="#" class="_nclicks:kls_new.byanswer">답변<img src="https://ssl.pstatic.net/static/kin/09renewal/blank.gif" width="12" height="12" alt="정렬"></a></th>
                    <th scope="col" class="on"><a href="#" class="_nclicks:kls_new.bydate">작성<img src="https://ssl.pstatic.net/static/kin/09renewal/blank.gif" width="12" height="12" alt="정렬"></a></th>
                    </tr>
                    </thead>
	                 <tbody id="au_board_list" class="list2">

						<c:forEach var="all" items="${allJisikin }">
	                        <tr>
	                            <td class="title">
	                                <a href="/link/jisikin/questionDetail.do?jisikinNo=${all.no}" rel="KIN" class="">${all.title }</a>
	                            </td>
	                            <td class="field"><a href="#" class="">${all.category.name }</a></td>
	                            <td class="t_num">${all.countAnswer }</td>
	                            <td class="t_num tg">${all.createTime }</td>
	                        </tr>
						</c:forEach>
                    </tbody>
                    </table>	

        <div class="paginate _default_pager">
	           <c:if test="${!pagination.first }">
	              <a class="pr-prev _pre" href="/link/jisikin/qna.do?categoryNo=${param.categoryNo }&page=${pagination.page - 1 }">이전페이지
	              </a>
	           </c:if>
	            <c:forEach var="p" begin="${pagination.begin }" end="${pagination.end }">
		            <a class="${pagination.page eq p ? 'on' : '' }" href="/link/jisikin/qna.do?categoryNo=${param.categoryNo }&page=${p }">${p }</a>
	            </c:forEach>
	            <c:if test="${!pagination.last }">
		              <a class="next" href="/link/jisikin/qna.do?categoryNo=${param.categoryNo }&page=${pagination.page + 1 }">다음페이지
		              </a>
		        </c:if>
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






			<!-- 관심키워드 추가 레이어 -->

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
	/*
	$(".a-category").click(function(){
		var categoryNo = $(this).attr("data-value");
		console.log(categoryNo);
		
		    $.ajax({
			url:"byCategory.do",
			data:{categoryNo:categoryNo},
			dateType:"JSON",
			success:function(result){

			}
		})
		
		return false; 
	})
	*/
	

     $(document).ready(function(){
         
        $('.dropdown,.dropdown-menu').hover(function(){

          if($(window).width()>=768){
            $(this).addClass('open')
            return false;
          }
          
        },function(){
          if($(window).width()>=768){
            $(this).removeClass('open')
            return false;
          }
        })
        
        // timeAgo
         $(".tg").each(function(){
            var timeago_t = jQuery.timeago( new Date(parseInt($(this).text())));
            console.log(timeago_t);
            $(this).text(timeago_t);
         });
        
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
         

     });

</script>
</body>
</html>