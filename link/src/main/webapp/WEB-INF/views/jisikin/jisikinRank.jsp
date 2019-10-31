<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>Link 지식인 > 명예의 전당</title>
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
	<link rel="stylesheet" href="/link/resources/css//jisikin/jisikinRank.css">
</head>
<body>
    <%@ include file="../common/nav.jsp" %>
<div class="container">
   <%@include file="jisikin-nav.jsp" %>
</div>
   
   
   <!-- 메인 컨텐츠 시작 -->
<!-- 질문 섹션-->
<div class="container">
   <!-- 질문 키워드 랭킹 -->
    <div class="row wrap_hall">
        <div class="section_keyword_qa grid_inner">
	<div class="uio_top">
		<h4 class="tit">질문키워드</h4>
	</div>
	<div class="article_list graph_data">
		
		<ul class="top_list">
			
			<li class="list_divide first">
				<a href="#" class="list_item" onclick="nhn.Kin.Utility.nClicks('hfh.tpkw', '', '', event);">
					<div class="list_body">
						<span class="rank"><em>1</em></span>
						<div class="heading">
							<strong class="tit ellipsis">${toptag[0].tagName }</strong>
							<p class="text"><em class="num">${toptag[0].countTag }</em>개의 질문<i class="sp_hall ico_arrow_rl">더보기</i></p>
						</div>
					</div>
				</a>
			</li>
			
			<li class="list_divide ">
				<a href="#" class="list_item" onclick="nhn.Kin.Utility.nClicks('hfh.tpkw', '', '', event);">
					<div class="list_body">
						<span class="rank"><em>2</em></span>
						<div class="heading">
							<strong class="tit ellipsis">${toptag[1].tagName }</strong>
							<p class="text"><em class="num">${toptag[1].countTag }</em>개의 질문<i class="sp_hall ico_arrow_rl">더보기</i></p>
						</div>
					</div>
				</a>
			</li>
			
			<li class="list_divide last">
				<a href="#" class="list_item" onclick="nhn.Kin.Utility.nClicks('hfh.tpkw', '', '', event);">
					<div class="list_body">
						<span class="rank"><em>3</em></span>
						<div class="heading">
							<strong class="tit ellipsis">${toptag[2].tagName }</strong>
							<p class="text"><em class="num">${toptag[2].countTag }</em>개의 질문<i class="sp_hall ico_arrow_rl">더보기</i></p>
						</div>
					</div>
				</a>
			</li>
			
		</ul>
	</div>
	<!-- //cont -->
</div>
    </div>
    <!-- 채택왕 -->
    <div class="row wrap_hall" style="margin-top : 20px;">
        <div class="section_ranking grid_inner _cheerUpArea"  style="height: 400px;">
	<div class="uio_top">
		
		<ul class="tab_area_sub" role="tablist">
			<li class="on" aria-selected="true"><a href="#" class="_eliteUserBtn" onclick="nhn.Kin.Utility.nClicks('hfh.kgtab', '', '', event);"><h4 class="tit"><span>채택왕</span></h4></a></li>
			
		</ul>
	</div>

	<!-- 채택왕 -->
	<div class="section_adoption _eliteUserArea">
		<h5 class="blind">채택왕 프로필</h5>
		<div class="article_list">
			<ul class="top_list">
				
				<li class="list_divide first">
					<div class="list_item top_item1">
						
							<a href="/link/jisikin/profile.do?userId=${ranks[0].userId }" class="inner" onclick="nhn.Kin.Utility.nClicks('hfh.kgname', '', '', event);">
								<span class="rank"><em>1</em></span>
								<div class="thmb_profile">
									<div class="thmb">
										
											<img src="https://ssl.pstatic.net/static/kin/09renewal/avatar/200x200_m/18.png" alt="프로필이미지">
										
										
										<span class="mask"></span>
									</div>
								</div>
								<div class="list_body">
									<div class="writer_sec">
										<span class="writer no_badge"><em class="ellipsis">${ranks[0].userId }</em></span>  
									</div>
									<p class="desc ellipsis">진정한 채택왕!</p>
									<div class="information_section">
										<p class="information_section_item"><strong class="category_title value">채택</strong><span class="category_content type_number"><span class="ellipsis">${ranks[0].cnt }</span></span></p>
									</div>
								</div>
							</a>
						
						
					</div>

				</li>    
				
				<li class="list_divide ">
					<div class="list_item top_item2">
						
							<a href="/link/jisikin/profile.do?userId=${ranks[1].userId }" class="inner" onclick="nhn.Kin.Utility.nClicks('hfh.kgname', '', '', event);">
								<span class="rank"><em>2</em></span>
								<div class="thmb_profile">
									<div class="thmb">
										
											<img src="https://ssl.pstatic.net/static/kin/09renewal/avatar/200x200_m/17.png" alt="프로필이미지">
										
										
										<span class="mask"></span>
									</div>
								</div>
								<div class="list_body">
									<div class="writer_sec">
										<span class="writer no_badge"><em class="ellipsis">${ranks[1].userId }</em></span>
									</div>
									<p class="desc ellipsis">뭐든 맡겨만 주세요!</p>
									<div class="information_section">
										<p class="information_section_item"><strong class="category_title value">채택</strong><span class="category_content type_number"><span class="ellipsis">${ranks[1].cnt }</span></span></p>
									</div>
								</div>
							</a>
						
						
					</div>

				</li>
				
				<li class="list_divide last">  
					<div class="list_item top_item3">
						
							<a href="/link/jisikin/profile.do?userId=${ranks[2].userId }" class="inner" onclick="nhn.Kin.Utility.nClicks('hfh.kgname', '', '', event);">
								<span class="rank"><em>3</em></span>
								<div class="thmb_profile">
									<div class="thmb">
											<img src="https://kin-phinf.pstatic.net/20190513_219/1557757741605MLODS_JPEG/1557757741489.jpeg?type=w200" alt="프로필이미지">
										<span class="mask"></span>   
									</div>
								</div>
								<div class="list_body">
									<div class="writer_sec">
										<span class="writer no_badge"><em class="ellipsis">${ranks[2].userId }</em></span>
									</div>
									<p class="desc ellipsis">도와드리겠습니다!</p>
									<div class="information_section">
										<p class="information_section_item"><strong class="category_title value">채택</strong><span class="category_content type_number"><span class="ellipsis">${ranks[2].cnt }</span></span></p>
									</div>
								</div>
							</a>
					</div>

				</li>
				
			</ul>
		</div>
	</div>
	<!-- //채택왕 -->
    <!-- 성지글 -->
    <div class="section_shrine" style="margin-top:-20px;">
	<h4 class="blind">성지글</h4>
	<div class="content">
		
		<div class="slide _legendQna" style="display: none;">
			<a href="/qna/detail.nhn?d1id=7&amp;dirId=703&amp;docId=25239646">
				<div class="cont">
					<p class="sub_tit"><span class="ellipsis">이런 방법이!!</span></p>
					<p class="desc"><span class="ellipsis">엉덩이땀, 의자에 앉기만하면 축축하게 젖어요... 아우 너무 불편해요 .....ㅜㅜ</span></p>
				</div>
				<div class="util_wrap">
					<span class="reply_simple"><i class="sp_hall ico_reply">댓글</i><em>281</em></span>
					<span class="like_simple"><i class="sp_hall ico_like">표정</i><em>1,243</em></span>
				</div>
			</a>
		</div>
		
		<div class="slide _legendQna active" style="display: block;">
			<a href="/link/jisikin/questionDetail.do?jisikinNo=${bestJisikin[0].no }">
				<div class="cont">
					<p class="sub_tit"><span class="ellipsis">${bestJisikin[0].title }</span></p>
					<p class="desc"><span class="ellipsis">이런 방법이 있다니!!</span></p>  
				</div>
				<div class="util_wrap">
					<span class="reply_simple"><i class="sp_hall ico_reply">답변</i><em>${bestJisikin[0].countAnswer }</em></span>
					<span class="like_simple"><i class="sp_hall ico_like">추천수</i><em>${bestJisikin[0].recommend }</em></span>
				</div>
			</a>
		</div>
		
		<c:forEach var="best" items="${bestJisikin }" begin="2" end="5">
			<div class="slide _legendQna" style="display: none;">
				<a href="/link/jisikin/questionDetail.do?jisikinNo=${best.no }">
					<div class="cont">
						<p class="sub_tit"><span class="ellipsis">${best.title }</span></p>
						<p class="desc"><span class="ellipsis">대단한 지식입니다~</span></p>
					</div>
					<div class="util_wrap">
						<span class="reply_simple"><i class="sp_hall ico_reply">답변</i><em>${best.countAnswer }</em></span>
						<span class="like_simple"><i class="sp_hall ico_like">추천수</i><em>${best.recommend }</em></span>
					</div>
				</a>
			</div>
		</c:forEach>
		
		
	</div>

	<div class="nav_area">
		<a href="#" class="prev sp_hall _legendPrevBtn" >이전</a>
		<a href="#" class="next sp_hall _legendNextBtn" >다음</a>
	</div>
</div>
</div>
    </div>
</div>

<script>
    /* 성지글 이전 다음 */
    $("._legendPrevBtn").click(function(){
        
        if ($("._legendQna.active").index() == 0) {
             $("._legendQna.active").removeClass('active').hide();
             $('._legendQna').eq($('._legendQna').length-1).addClass('active').show();
        } else {
            $("._legendQna.active").removeClass('active').hide()
            .prev().addClass('active').show();
        }
        return false;
    })
    
    $("._legendNextBtn").click(function(){
        
        if ($("._legendQna.active").index() == $("._legendQna").length-1) {
             $("._legendQna.active").removeClass('active').hide();
             $('._legendQna').eq(1).addClass('active').show();
        } else {
            $("._legendQna.active").removeClass('active').hide()
            .next().addClass('active').show();
        }
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