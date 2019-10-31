<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>Link 지식인 > 질문답변</title>
    <link rel="shortcut icon" type="image/x-icon" href="/link/resources/images/shortcut-icon.PNG">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <script src="/link/resources/js/jquery.timeago.js"></script>
    <script src="/link/resources/js/jquery.timeago.ko.js"></script>
    <link rel="stylesheet" href="/link/resources/css/blog/blog.css">
	<link rel="stylesheet" href="/link/resources/css//jisikin/jisikinmain.css">
	<link rel="stylesheet" href="/link/resources/css//jisikin/jisikinQna.css">
	<link rel="stylesheet" href="/link/resources/css//jisikin/jisikinQuestion.css">
	<script type="text/javascript" src="/link/resources/js/jisikin_se2/js/HuskyEZCreator.js"></script>
</head>
<body>
    <%@ include file="../common/nav.jsp" %>
<div class="container">
  <%@include file="jisikin-nav.jsp" %>
   
   
   <!-- 메인 컨텐츠 시작 -->
    
    </div>
<!-- 질문 섹션-->
  <div class="container-fluid">
   <div class="row">
       <div class="question-content">
            <div class="question-content__inner _contentWrap">

                <div class="c-heading _questionContentsArea c-heading--default-old" data-tag="%EA%B3%B5%EB%B6%80,%EB%AC%B8%EC%A0%9C%EC%A7%91%EC%B6%94%EC%B2%9C,%EC%98%88%EB%B9%84%EA%B3%A01,%EC%98%81%EC%96%B4">

                    <div class="c-heading__icon">
                                <img src="/link/resources/images/jisikin-Q.png" alt=""><span class="blind">질문</span>
                    </div>
                    <div class="c-heading__title">
                        <div class="c-heading__title-inner">
                                <div class="c-heading__icons-front">
                                    <span class="grade-point grade-point__large"><span class="blind">내공</span>${jisikin.mentalPoint }</span>
                                </div>

                            <div class="title">	
                                        ${jisikin.title }
                            </div>
                        </div>
                    </div>
                    <div class="c-heading__content">
                    					${jisikin.contents }
                    </div>
                </div>

                <div class="tag-list tag-list--end-title" role="region" aria-label="관련태그 목록" data-select="type-a">

				<c:forEach var="tag" items="${jisikin.tags}">
                            <a href="/link/search.do?word=${tag.tagName }" class="tag-list__item" target="_blank"><span>#</span>${tag.tagName }</a>
                	</c:forEach> 	

                </div>

                <div class="c-userinfo">
                    <div class="c-userinfo__left">
                        <div class="c-userinfo__profile _profileArea">
                            <div class="profile-default">  
                                <div class="profile-default--inner">    
                                    <span class="profile-default__thumbnail" style="background-image: url(/link/resources/images/${questionUser.img});"><span class="blind">내 프로필 이미지</span></span>
                                </div>

                                <div class="c-callout callout--profile-tooltip _profileTooltip">
                                    <ul class="c-callout__list">
                                        <li class="c-callout__item"><strong class="c-callout__item-title">질문수</strong><span class="c-callout__item-count">11</span></li>
                                        <li class="c-callout__item"><strong class="c-callout__item-title">채택률</strong><span class="c-callout__item-count">100.0%</span></li>
                                        <li class="c-callout__item"><strong class="c-callout__item-title">마감률</strong><span class="c-callout__item-count">100.0%</span></li>
                                    </ul>
                                </div>
                            </div>
                                    <span class="c-userinfo__author" style="margin-left:20px;"><span class="blind">닉네임</span>
                                    ${jisikin.secretYn eq 'Y' ? jisikin.userId : '비공개'}
                                    </span>
                        </div>
                        <span class="c-userinfo__date tg">${jisikin.createTime }</span>
                    </div>

                    <div class="c-userinfo__right" role="listbox">
                        <div role="presentation" class="c-userinfo__button-setting">

                            <a href="#" id="questionMenuBtn" class="button_compose _questionMenuLayerButton is_active" onclick="naver.kin.pc.common.nClicks('end*q.more', '', '', event);" role="option" aria-selected="true" aria-haspopup="true" aria-expanded="true"><i class="icon icon_compose_setting _questionMenuLayerButton" aria-hidden="true"></i><span class="blind">더보기</span></a>
                            <div class="c-userinfo__list-setting _questionMenuLayer _popupLayer" role="listbox" aria-hidden="true">
                                <a href="/link/jisikin/addRecommend.do?jisikinNo=${jisikin.no }" id="opt_2" class="_ros c-userinfo__setting-item _questionMenuButton">
                                <span class="glyphicon glyphicon-thumbs-up" style="font-size:19px; width:23px;color: blue;"></span>추천</a>${jisikin.recommend }
                                <a href="#" id="opt_2" class="_ros c-userinfo__setting-item _questionMenuButton">
                                <span class="glyphicon glyphicon-bell" style="color: red;"></span>신고</a>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
</div>

   </div>
</div>
<div class="container answer-section">
   <div class="row" style="margin-top: 10px;">
       <div class="col-sm-12 well" style="height: 60px; padding: 10px 10px 0px 10px">
            <div class="c-heading-answer__body">
                <div class="c-heading-answer__title">		
                    <div class="c-userinfo">
                                <span class="c-userinfo__item">답변하시면 내공 10점을 답변이 채택되면 내공 35점을 드립니다.</span>
                    </div>
                </div>
                <div class="c-heading-answer__button">
                    <a href="#" id="answerWriteButton" role="button" aria-expanded="false" aria-controls="" class="c-button-default c-button-default--blue"><span class="c-button-default__title">답변하기</span></a>
                </div>
            </div>
       </div>
       <div class="answer-form well" style="display:none;">
       		<form id="answer-form" action="questionDetail.do" method="POST">
       			<input type="hidden" name="jisikinNo" value="${jisikin.no }"/>
	       		<div>
		        		<textarea rows="10" class="form-control" name="contents" id="answer_contents"></textarea>
		        </div>
       			<span class="first">아이디 
                <!-- 공개 설정 레이어 --> 
                   <select id="secretYN" name="secretYn">
                   	<option value="N">비공개</option>
                   	<option value="Y">공개</option>
                   </select>
                </span>
                <!-- 등록 -->
				<div class="text-center">
					<div class="btn_c2" style="float:center;">
						<button type="button" id="submit-answer"
							class="btn btn-primary _register _clickcode:sbm.ok">답변등록</button>
					</div>
					<div class="btn_r" style="float:right; margin-top : -34px;">
						<button type="button"
							class="btn btn-default answer-cancel">작성취소</button>
					</div>
				</div>
				</form>
       </div>
   </div>
   
   <c:choose>
   	<c:when test="${empty answers }">
   		<div class="row">
   			<div class="answer-content-inner text-center">
   				<h3>현재 등록된 답변이 없습니다! 답변해주세요!!</h3>
   			</div>
   		</div>
   	</c:when>
   	<c:otherwise>
	   <div class="row">
	       <div class="answer-content_inner text-center">
	           <div class="c-classify__title-part">
	    		  <h3 class="c-classify__title"><i class="icon icon_common_a" aria-hidden="true"></i><span class="blind">답변</span><em class="_answerCount num">1</em>개</h3>
		       </div>
		       <div class="c-classify__sorting-part">
		           <div class="c-sorting">
		               <select class="selectBox01">
		                   <option value="" name="">채택순</option>
		                   <option value="" name="">최신순</option>
		                   <option value="" name="">추천순</option>
		               </select>
		           </div>
		       </div>
	       </div>
	   </div>
	   
	   <!--  답변 리스트 -->
	   
	   <c:forEach var="answer" items="${answers }">
		   <div class="row well">
		       <div class="answer-content__item">
		           <div class="answer-content-header">
		               <div class="profile-default">
							<a href="#" target="_blank" class="profile-default--inner">
								<span class="profile-default__thumbnail" style="background-image: url(/link/resources/images/${answer.user.img});"><span class="blind">박수진님 프로필 이미지</span></span>
							</a>
						</div>
		                <div class="profile-info">
		                    <h3 class="answer-author">${answer.secretYn eq 'Y' ? answer.userId : '비공개' } 님 답변</h3>
		                    <h4 class="answer-author-num">내공 <em>${answer.user.mentalPoint }</em></h4>
		                </div>
		                <c:if test="${LOGIN_USER.id eq jisikin.userId }"> 
		                <div class="pull-right" style="margin-top:-40px !important; margin-right:10px;">
		                	<a id="select-btn" href="/link/jisikin/selected.do?jno=${jisikin.no }&ano=${answer.no}" class="c-button-default c-button-default--blue">채택하기</a>
		                </div>
		                </c:if>
		           </div>
		       </div>
		       <div class="answer-contents" style="overflow-y:hidden; overflow-x:scroll">
		           <p class="main-contents">
		           ${answer.contents }
		           </p>
		            <div class="answer-content-date">
		                <p class="tg">${answer.createTime }</p>
		            </div>
		            <div class="row">
		                <div class="answer-bottom">
		                    <div class="answer-bottom-left">
		                        <button type="button" id="comment-show">
		                            <i class="icon icon_compose_opinion" aria-hidden="true"><span class="glyphicon glyphicon-comment"></span><span class="answer-comment">댓글</span></i> 
		                        </button>
		                    </div>
		                    <div class="answer-bottom-right">
		                        <button type="button">
		                            <span class="glyphicon glyphicon-bell" style="color: red;"></span>신고
		                        </button>
		                    </div>
		            </div>
		            <div class="row comment-area comment-area-none" style="padding-top: 30px;">
		                    <!-- 댓글창 -->
		                <div class="c-opinion _commentListArea" data-answer-no="1" data-thanks-message="" style="" id="p156395222136665351400">
			<h2 class="blind">댓글영역</h2>
			<div class="c-opinion__write">
				
				<fieldset>
					<legend>댓글 입력</legend>
					<div class="c-opinion__write-form">
						
						<textarea class="c-opinion__write-textarea placeholder" maxlength="1000" title="댓글 입력" placeholder="개인정보를 공유 및 요청하거나, 명예 훼손, 무단 광고, 불법 정보 유포시 모니터링 후 삭제될 수 있으며, 이에 대한 민형사상 책임은 게시자에게 있습니다."></textarea>
					</div>
					<div class="c-opinion__write-upload">
						<div class="c-opinion__write-count">
							<span class="blind">현재 입력한 글자수</span>
							<span class="c-opinion__write-count__num _currentCharCount">0</span>
							/
							<span class="blind">전체 입력 가능한 글자수 </span>
							<span class="c-opinion__write-count__total">1000</span>
						</div>
						<button type="submit" class="button_register _registerCommentBtn">등록</button>
					</div>
				</fieldset>
				
			</div>
			<!-- 댓글 리스트 -->
			<div class="c-opinion__list _commentList">
		        <div class="c-opinion__item">
		            <p class="c-opinion__list-nick">
		                <strong><a href="#">allm****</a></strong>
		            </p>
		            <div class="c-opinion__list-text">
		                <p>잘보고갑니다</p>
		            </div>
		            <p class="c-opinion__list-date">2019.07.24. 16:38:30</p>
		            <div class="button_more">
		
		                <a href="#" class="_deleteBtn" data-comment-no="-1" data-page="1"><img height="9" width="9" alt="삭제" src="https://ssl.pstatic.net/static/kin/09renewal/btn_delete_list2.gif" class="del"></a>
		            </div>
		        </div>
		
		    </div>
			<!-- -->
			<div class="paginator paginator--number _pagingArea" style="display: none;"></div>
		</div>
		               <!-- -->
		            </div>
		            </div>
		       </div>
		   </div>
	   </c:forEach>
   	</c:otherwise>
   </c:choose>
</div>

<script>
	// 채택버튼
	$("#select-btn").click(function(){
		alert("채택하셨습니다!");
	})

   	/* 스마트에디터 */
   	var oEditors = [];

   	/* 스마트에디터 사진 */
   	function pasteHTML(filepath){
   		setTimeout(function() {
   	    	var sHTML = '<img src="/link/resources/js/jisikin_se2/photo_uploader/upload/'+filepath+'">';
   	    	oEditors.getById['answer_contents'].exec("PASTE_HTML", [sHTML]);
   		}, 5000);
   	}
   	
 
   	
    $(document).ready(function(){
    	$("#opt_2").click(function(){
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
    	
    	
		$("#answerWriteButton").click(function(){
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
			
			$(".answer-form").css("display", "block");
			
			$('iframe').remove();
			console.log(oEditors);
			// 에디터 창
	    	nhn.husky.EZCreator.createInIFrame({
	    		oAppRef: oEditors,
	    			elPlaceHolder: "answer_contents",
	    			sSkinURI: "/link/resources/js/jisikin_se2/SmartEditor2Skin.html",
	    			fCreator: "createSEditor2",
	    			htParams : {
	    				fOnBeforeUnload : function() {
	    				}
	    			}
	    		// 이페이지 나오기 alert 삭제
	    		});
			
			
	    	 // 등록 버튼
	    	$("#submit-answer").click(function(){
	    		submitContents();
	    	})
	    		
	    		
	    		//‘저장’ 버튼을 누르는 등 저장을 위한 액션을 했을 때 submitContents가 호출된다고 가정한다.
	    		function submitContents(elClickedObj) {
	    			// 에디터의 내용이 textarea에 적용된다.
	    			oEditors.getById["answer_content"].exec("UPDATE_CONTENTS_FIELD",
	    					[]);

	    			// 에디터의 내용에 대한 값 검증은 이곳에서
	    			// document.getElementById("textAreaContent").value를 이용해서 처리한다.
	    			console.log(document.getElementById("answer_content").value);
	    			try {
	    				$("#answer-form").submit();
	    			} catch (e) {

	    			}
	    		}
	    	 
	    	 
			return false;
			
			
			
			// 등록 버튼
			$("#submit-answer").click(function(){
				submitContents();
			})
				
				
				//‘저장’ 버튼을 누르는 등 저장을 위한 액션을 했을 때 submitContents가 호출된다고 가정한다.
				function submitContents(elClickedObj) {
					// 에디터의 내용이 textarea에 적용된다.
					oEditors.getById["answer_contents"].exec("UPDATE_CONTENTS_FIELD",
							[]);

					// 에디터의 내용에 대한 값 검증은 이곳에서
					// document.getElementById("textAreaContent").value를 이용해서 처리한다.
					console.log(document.getElementById("answer_contents").value);
					try {
						$("#answer-form").submit();
					} catch (e) {

					}
				}
			
		})
		
		

		
		$(".answer-cancel").click(function(){
			$(".answer-form").css("display", "none");
		})
    	
    	
    	
         
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
        
        
     // timeAgo
        $(".tg").each(function(){
           var timeago_t = jQuery.timeago( new Date(parseInt($(this).text())));
           console.log(timeago_t);
           $(this).text(timeago_t);
        });
      })

    $(".c-userinfo__left").hover(function(){
        $(".callout--profile-tooltip").css("display", "table");
    }, function(){
        $(".callout--profile-tooltip").css("display", "none");
    });
    
    $("#comment-show").click(function(){
        $(".comment-area").toggleClass("comment-area-none");
    })
    </script>
</body>
</html>