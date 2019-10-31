<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>Link 지식인 > 프로필</title>
    <link rel="shortcut icon" type="image/x-icon" href="/link/resources/images/shortcut-icon.PNG">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="/link/resources/css/blog/blog.css">
	<link rel="stylesheet" href="/link/resources/css//jisikin/jisikinmain.css">
	<link rel="stylesheet" href="/link/resources/css//jisikin/jisikinQna.css">
	<link rel="stylesheet" href="/link/resources/css//jisikin/jisikinQuestion.css">
	<link rel="stylesheet" href="/link/resources/css//jisikin/jisikinAnswer.css">
	<link rel="stylesheet" href="/link/resources/css//jisikin/jisikin.css">
	<link rel="stylesheet" href="/link/resources/css//jisikin/jisikinProfile.css">
</head>
<body>
    <%@ include file="../common/nav.jsp" %>
<div class="container">
   <%@include file="jisikin-nav.jsp" %>
</div>
   
   
   <!-- 메인 컨텐츠 시작 -->
<!-- 질문 섹션-->
<div id="loaddingIndicator" style="display: none; width:100%; height:100%; position:fixed; top:0px; left:0px; background-color: transparent; z-index: 10000;"></div>
<div class="wrap wrap_my" id="wrap">
<div id="container" class="container-fluid">
	<div class="container-fluid-content">
		<div class="container-fluid-content-inner _containerFluidContentInner"><h3 class="blind">프로필 영역</h3>

<ul class="location" id="au_location">
	<li><a href="/index.nhn">홈</a></li>
	<li class="last">
			<a href="#">프로필</a>	
	</li>
</ul>


<!-- Personal_Info  -->
<h2 class="blind">프로필</h2>


<div class="my_personal well" id="au_main_profile_box" style="">

	<div class="my_personal_top"></div>
	<div class="my_personal_inner">
		
		<div class="profile_section">
			<div class="profile_group">
				
					
					
					
						<a href="/people/levelup/index.nhn" class="profile_animate profile_default">
							<span class="thumbnail">
								<img src="/link/resources/images/${profileUser.img}" width="100%" height="100%" alt="allman956 님의 프로필">
							</span>
							<span class="mask_bdr"></span>
						</a>
					
				
				
				
					<a href="#" class="edit_photo _ros" target="_blank">
						<span class="photo_edit_button">
							<span class="blind">프로필 사진 변경</span>
						</span>
					</a>
				
				
			</div>
			<div class="profile_info">
				<div class="profile_name">
					<strong class="profile_user">${param.userId }</strong>
					
				</div>
				
				
				
				
					<div class="profile_answer_date">최초답변일 <span>${firstAnswerById }</span></div>
				
				
			</div>

		</div>
		<div class="profile_section2">
        </div>
			<div class="profile_section3" style="width: 700px;">
				<!-- 답변, 채택답변, 채택률 -->
				<div class="lv_area grd_lv4"> 
				
					<ul class="lv_cnt">
					<li><em class="tit">전체답변</em><p class="num" id="total_answer">${countAllAnswerById }</p></li>
					<li><em class="tit">채택답변</em><p class="num" id="total_best">${countSelectById }</p></li>
					<li><em class="tit">답변채택률</em><p class="num" id="best_rate"><fmt:formatNumber value="${selectPercent }" type="percent"></fmt:formatNumber></p></li>
					</ul>
				</div>
				
				<dl class="my_spec">
				
					<dt>내공순위</dt>
					<dd><strong>${rankMentalPointById }</strong>위</dd>
				
				<dt>질문</dt>
				<dd>
					<span class="q_list">전체질문 <strong>${countAllJisikinById }건</strong></span>
					<span class="q_list rec_text">답변 받은 질문 <strong>${countJisikinSelectById }건</strong></span>
					<span class="q_list">전체마감률 <strong><fmt:formatNumber value="${deadLineById }" pattern=".00"></fmt:formatNumber>%</strong></span>
					<span class="q_list rec_text">답변채택률 <strong><fmt:formatNumber value="${selectPercent }" type="percent"></fmt:formatNumber></strong></span>
				</dd> 
				<dt>받은추천</dt>
				<dd>
					<span class="q_list">좋아요 <strong>${recommendById }</strong></span>
				</dd>

				</dl>
				
				
				
					<div class="helper_area">
					    <div class="inner">
					        <div class="icon_area">
					            <i class="sp_common ico_helper"><img src="/link/resources/images/my-person.PNG" width="30px;" height="35px;"> alt=""></i>
					        </div>
					        <div class="content_area">
					            <em class="tit">도움을 준 사람 수 <a href="#" class="_helperLayerOpenBtn" onclick="nhn.Kin.Utility.nClicks('prf.helptip', '', '', event);"><img src="https://ssl.pstatic.net/static/kin/09renewal/ico_help.png" width="16" height="16" alt="도움말"></a></em>
					            <div class="count">
					                <span class="num">${countHelpUserById }</span>
					            </div>
					        </div>
					    </div>

					</div>

			</div>	
			
	</div>	
</div>
            <!-- 메뉴 -->
			<div class="container-fluid-content__left well">

<!--// Personal_Info  -->
<div class="snb snb_bordered snb_mykin" style="border: 2px solid #ddd;">
	<h2 class="snb_title blind">프로필</h2>
	<ul class="snb_list">
        <li>
			<a href="/link/jisikin/profile.do?userId=${LOGIN_USER.id }" class="" id="subMenuOfMykin">    홈</a>
			
			
		</li>
        
		<li>
			<a href="#" class="my-answer" id="subMenuOfMykin">나의 답변 <span class="num">(${myAnswer.size() })</span></a>
			
			
		</li>
		<li><a href="#" class="my-q">나의 질문 <span class="num">(${myJisikin.size() })</span></a></li>
		<li class="">
			<ul class="sub">
				<li><a href="/myinfo/pointHistory.nhn">내공<span class="num">(${LOGIN_USER.mentalPoint })</span></a></li>
			</ul>
		</li>
	</ul>
</div>
			</div>

        
        <!-- 나의 질문/답변 -->
			<div id="content" class="container-fluid-content__right well">
				<div id="myinfoIndex_1" class="my_home" style="border: 2px solid #ddd; padding:10px;">
					

<!-- 답변 -->
<div class="profile-answer">
    <h4 class="h_my_title ">

            <img src="/link/resources/images/my-answer.PNG" width="64" height="22" alt="나의 답변">
            <span class="eng">(${myAnswer.size() })</span>
    </h4>
        <table cellspacing="0" class="boardtype2 th_border my_table" width="100%">
        <caption><span class="blind">나의 답변 목록으로 제목, 디렉토리, 채택, 표정, 작성</span></caption>
        <colgroup>
        <col>
        <col width="105">
        <col width="54">
        <col width="54">
        <col width="90">
        </colgroup>
        <thead>
        <tr>
        <th scope="col" class="title">제목</th>	
        <th scope="col">디렉토리</th>
        <th scope="col">채택</th>  
        <th scope="col" class="title">작성</th>
        </tr>
        <tr>
        <td colspan="5" class="blank2">&nbsp;
        </td></tr>
        </thead>
        <tbody>

	<c:forEach var="ma" items="${myAnswer }" begin="0" end="2" varStatus="status">
        <tr>
        <td class="qna">
            <dl class="dlist_qna">
            <dt>
                <span class="ico_q"><img src="https://ssl.pstatic.net/static/kin/09renewal/blank.gif" width="18" height="14" alt="질문"></span>
                <a href="/link/jisikin/questionDetail.do?jisikinNo=${myAnswerQuestion[status.index].no }">${myAnswerQuestion[status.index].title }</a>

            </dt>
            <dd style="max-height:20px; overflow:hidden; text-overflow:ellipsis;"> 
                <span class="ico_a"><img src="https://ssl.pstatic.net/static/kin/09renewal/blank.gif" width="18" height="14" alt="답변"></span>${ma.contents }
            </dd>
            </dl>
        </td>
        <td class="field"><a href="/qna/list.nhn?dirId=110207">${myAnswerQuestion[status.index].category.name }</a></td>
        <td class="field">



                <em>${ma.selectedYn }</em>

        </td>
        <td class="t_num tc"><fmt:formatDate value="${ma.createDate }" pattern="yyyy.MM.dd"/></td>
        </tr>

	</c:forEach>
              
        <!-- 더보기 -->
	<c:forEach var="ma" items="${myAnswer }" begin="3" varStatus="status">
        <tr class="more-answer" style="display: none;">
        <td class="qna">
            <dl class="dlist_qna">
            <dt>
                <span class="ico_q"><img src="https://ssl.pstatic.net/static/kin/09renewal/blank.gif" width="18" height="14" alt="질문"></span>
                <a href="/link/jisikin/questionDetail.do?jisikinNo=${myAnswerQuestion[status.index].no }">${myAnswerQuestion[status.index].title }</a>

            </dt>  
            <dd style="max-height:20px; overflow:hidden; text-overflow:ellipsis;">
                <span class="ico_a"><img src="https://ssl.pstatic.net/static/kin/09renewal/blank.gif" width="18" height="14" alt="답변"></span>${ma.contents }
            </dd>
            </dl>
        </td>
        <td class="field"><a href="/qna/list.nhn?dirId=110207">${myAnswerQuestion[status.index].category.name }</a></td>
        <td class="field">



                <em>${ma.selectedYn }</em>

        </td>
        <td class="t_num tc"><fmt:formatDate value="${ma.createDate }" pattern="yyyy.MM.dd"/></td>
        </tr>

	</c:forEach>
        <!-- 더보기 --> 
        </tbody>
        </table>
</div>



<!-- 질문 -->
<div class="profile-question">
    <h4 class="h_my_title">
        <img src="/link/resources/images/my-question.PNG"  width="64" height="22" alt="나의 질문">
        <span class="eng">(${myJisikin.size() })</span>

        <span class="highlight">답변채택을 기다리는 질문이 <strong>4</strong>개 있습니다.</span>
    </h4>
        <table cellspacing="0" class="boardtype2 th_border my_table" width="100%">
        <caption><span class="blind">나의 질문 목록으로 제목, 디렉토리, 채택, 답변, 표정, 작성</span></caption>
        <colgroup>
        <col>
        <col width="105">
        <col width="54">
        <col width="54">
        <col width="54">
        <col width="90">
        </colgroup>
        <thead>
        <tr>
        <th scope="col" class="title">제목</th>
        <th scope="col">디렉토리</th>
        <th scope="col">채택</th>  
        <th scope="col">답변</th>
        <th scope="col">추천</th>
        <th scope="col" class="title">작성</th>
        </tr>
        <tr>
        <td colspan="6" class="blank">&nbsp;</td>
        </tr>
        </thead>
        <tbody id="au_board_list_1">

	<c:forEach var="mj" items="${myJisikin }" begin="0" end="3">
        <tr>
        <td class="title">
            <a href="/link/jisikin/questionDetail.do?jisikinNo=${mj.no}" rel="KIN">${mj.title }</a>
                <img src="https://ssl.pstatic.net/static/kin/09renewal/blank.gif" width="13" height="14" alt="이미지첨부" class="pic2 is_img">
        </td>
        <td class="field"><a href="/qna/list.nhn?dirId=1040205">${mj.category.name }</a></td>
        <td class="field">
        ${mj.deadLineYn }
        </td>
        <td class="t_num">${mj.countAnswer }</td>
        <td class="t_num"><span class="recomm">${mj.recommend }</span></td>
        <td class="t_num tc"><fmt:formatDate value="${mj.createDate }" pattern="yyyy.MM.dd"/></td>
        </tr>
	</c:forEach>

        <!-- 더보기 -->
	<c:forEach var="mj2" items="${myJisikin }" begin="4">
        <tr class="more-question" style="display: none;">
          <td class="title">
            <a href="/link/jisikin/questionDetail.do?jisikinNo=${mj2.no}" rel="KIN">${mj2.title }</a>
                <img src="https://ssl.pstatic.net/static/kin/09renewal/blank.gif" width="13" height="14" alt="이미지첨부" class="pic2 is_img">
        </td>
        <td class="field"><a href="/qna/list.nhn?dirId=1040205">${mj2.category.name }</a></td>
        <td class="field">
        ${mj.deadLineYn }
        </td>
        <td class="t_num">${mj2.countAnswer }</td>
        <td class="t_num"><span class="recomm">${mj2.recommend }</span></td>
        <td class="t_num tc"><fmt:formatDate value="${mj2.createDate }" pattern="yyyy.MM.dd"/></td>
        </tr>
	</c:forEach>
        <!-- 더보기 -->

        </tbody>
        </table>
</div>


			</div>
		</div>
	</div>
</div>
    </div>
    </div>
<script>
    /* 나의 답변 더보기 */
    $(".my-answer").click(function(){
        $(".profile-answer").css("display","block");
        $(".more-answer").css("display","table-row");
        $(".profile-question").css("display","none");
        return false;
    })
    
    /* 나의 질문 더보기 */
    $(".my-q").click(function(){
        $(".profile-question").css("display","block");
        $(".more-question").css("display","table-row");
        $(".profile-answer").css("display","none");
        return false;
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