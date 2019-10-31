<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>Link 검색키워드 > 통합검색 </title>
    <link rel="shortcut icon" type="image/x-icon" href="/link/resources/images/shortcut-icon.PNG">
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="/link/resources/css/search/searchMain.css">
	<link rel="stylesheet" href="/link/resources/css/blog/blog.css">
</head>
<body>
        <div class="container-fluid" style="margin-top: 30px;">
            <div class="row navbar main-nav">
                <div class="col-sm-6 col-sm-offset-1 testbox" style="z-index: 100;">
                    <form id="nx_search_form" name="search" action="/link/search.do" method="GET" style="width: 702px;">
                <h1 class="search_logo"><a href="/link/home.do" class="spnew logo_naver"><img src="/link/resources/images/link_logo.PNG" alt="링크_로고"></a></h1>
                <fieldset class="greenwindow" style="width: 503px;">
                    <div class="greenbox"> <span class="keyword"> 
                    	<input type="text" id="search-input" name="word" class="box_window" maxlength="255" accesskey="s" value="${param.word }" autocomplete="off" title="검색어 입력"> </span> 
                    </div>
                    <button id="go-search" type="submit" class="bt_search"><span class="
                    glyphicon glyphicon-search"></span></button>
                    <!-- 자동완성 -->
                    <div id="nautocomplete" class="autocomplete"> 

                        <!-- 펼쳤을 때 -->
                        <a href="#" class="bt_atcp _btn_arw unfold"><span class="blind _text">자동완성 접기</span><span class="ico_arrow spnew"><img src="/link/resources/images/search_auto_complete.png" alt=""></span></a> 

                        <!-- 접었을 때-->
                        <a href="#" class="bt_atcp _btn_arw fold"><span class="blind _text">자동완성 펼치기</span><span class="ico_arrow spnew"><img src="/link/resources/images/search_auto_complete_unfold.png" alt=""></span></a> 
                    </div>
                    
                    <!-- 자동검색 박스 -->
                    <div class="ly_atcmp" id="nx_autoframe_top" style="display: none; z-index:1000;">
                       <div class="api_atcmp_wrap _atcmp" style="display: block">
                            <div class="words _words expand" style="display: block;"> 
                            	<div class="_atcmp_result_wrap"> 
                            		<ul class="_resultBox" style="display: block;">
		                            </ul>
                            	</div>
                            </div>
                           
                       </div>
                       
                    </div>
                    
                </fieldset>
            </form>
                </div>

                <div class="col-sm-4 text-right blog-toprow-right">
                    <div class="blog-navbar-right collapse navbar-collapse navbar-right">
                        <ul class="nav navbar-nav">
                        	<c:if test="${not empty LOGIN_USER }">
                            <li class="dropdown" id="my_saying">
                                <a href="#" class="dropdown-toggle myfirst" data-toggle="dropdown" role="button" aria-expanded="false">
                                    <img class="blog-profile-img" src="/link/resources/images/default_profile.PNG" alt="">
                                    <span class="blog-navbar-id">${LOGIN_USER.nickName }</span>
                                    <span class="caret"></span></a>
                                <ul class="dropdown-menu" role="menu">
                                    <li><a href="#">내 블로그</a></li>
                                    <li><a href="/link/band/main.do">밴드</a></li>
                                    <li><a href="/link/accountbook/expense.do">가계부 </a></li>
                                    <li><a href="/link/jisikin/main.do?categoryNo=0&sort=1">지식인</a></li>
                                    <li><a href="/link/series/home.do">시리즈</a></li>
                                    <li><a href="/link/tv/home.do">TV</a></li>
                                    <li class="divider"></li> 
                                    <li><a href="/link/logout.do">로그아웃</a></li>
                                </ul>  
                            </li>  
                        </ul>
                        <div class="bell text-center"><a href=""><span class="glyphicon glyphicon-bell"></span></a></div>
                            </c:if>
                        <div class="envelope" style="width:57px !important;">
		                        <c:if test="${empty LOGIN_USER }">
									<li style="margin-top:15px;" 
									class="btn btn-default"><a class="main-login" style="color: #666666;" href="/link/loginform.do">로그인</a></li>
								</c:if>
								<c:if test="${not empty LOGIN_USER }">
									<li style="margin-top:15px;" class="btn btn-default"><a class="main-login" style="color: #666666;" href="/link/logout.do">로그아웃</a></li>
								</c:if>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        
        <!-- 검색 결과 창 -->
        <div class="container-fluid">
            <div class="row search-category">
                <ul class="search-category-list">
                    <li><a href="#" id="totalsearch" class="category-btn cat-on">통합검색</a></li>
                    <li><a href="#" id="jisikinsearch" class="category-btn">지식IN</a></li>
                    <!-- <li><a href="#" id="imagesearch" class="category-btn">이미지</a></li> -->
                    <li><a href="#" id="blogsearch" class="category-btn">블로그</a></li>
                    <li><a href="#" id="tvsearch" class="category-btn">TV</a></li>
                    <li><a href="#" id="seriessearch" class="category-btn">SERIES</a></li>
                    <li><a href="#" id="bandsearch" class="category-btn">BAND</a></li>
                    <li><a href="#" class="search-opt btn">검색옵션<img src="/link/resources/images/search_auto_complete_unfold.png" alt="" width="15px;"></a></li>
                </ul>
            </div>
            <div class="row search-category search-opt-box">
                <div class="sort-area">
                    <select name="sort" id="sort-box">
                        <option value="" selected disabled>정렬</option>
                        <option value="recent">최신순</option>
                        <option value="gal">관련순</option>
                    </select> 
                </div>
                <div class="sort-area">
                    <select name="days" id="sort-box">
                        <option value="" selected disabled>기간</option>
                        <option value="day">1일</option>
                        <option value="week">1주일</option>
                    </select>  
                </div>
                <div class="sort-area">
                    <select name="section" id="sort-box">
                        <option value="" selected disabled>영역</option>
                        <option value="total">전체</option>
                        <option value="title">제목</option>
                    </select>
                </div>
            </div>
        </div>
        <div class="container-fluid">
            <div class="row search-content">
                <div class="col-sm-9 search-result">
                    <div class="row related_content">
                        <span class="tit_relate  _related_keyword_lis">연관검색어
                        <img src="/link/resources/images/search-notice.PNG" width="15px" alt=""></span>
                        <ul>
                            <li><a href="/link/search.do?word=${words[0] }">${words[0] }</a></li>
                            <li><a href="/link/search.do?word=${words[1] }">${words[1] }</a></li>
                            <li><a href="/link/search.do?word=${words[2] }">${words[2] }</a></li>
                            <li><a href="/link/search.do?word=${words[3] }">${words[3] }</a></li>
                        </ul>
                    </div>
                    
                    
                <!-- 검색 메인 결과내역들 -->
                <!-- 지식인 -->
                <c:if test="${not empty resultJisikin }">
                    <div class="row result-section result-jisikin">
                        <div class="row section_head">
                            <h2>지식iN</h2>
                            <span class="title_num">${resultJisikin.size() }건</span>
                        </div>
                        <div class="jisikin-section-content">
                            <ul class="jisikin-list">
                            <c:forEach var="jisikinList" items="${resultJisikin }" begin="0" end="1">
                            <a href="/link/jisikin/questionDetail.do?jisikinNo=${jisikinList.NO }">
                                <li>
                                    <dl>  
                                        <dt class="title">
                                            <img src="/link/resources/images/jisikin-Q2.png" width="15" alt="">
                                            <a href="/link/jisikin/questionDetail.do?jisikinNo=${jisikinList.NO }" class="jisikin-list-title">${jisikinList.TITLE }</a>
                                            <span class="create_date"><fmt:formatDate value="${jisikinList.CREATEDATE }" pattern="yyyy.MM.dd"/> </span>
                                        </dt>
                                        <dd class="content">
                                           ${jisikinList.CONTENTS }
                                        </dd>
                                        <dd class="answer">
                                            <p class="p-answer">
                                            <img src="/link/resources/images/jisikin-A2.png" width="15" alt=""> 
                                            ${jisikinList.ANSWERCONTENTS }
                                        </dd> 
                                        <dd class="cat">${jisikinList.CATEGORYNAME }</dd>
                                    </dl>
                                </li>
                            </a>  
                            </c:forEach>
                            </ul>
                        </div>
                        <div class="section-more">
                            <a href="#">지식iN 더보기></a>
                        </div>
                    </div>	
                </c:if>
                <c:if test="${empty resultJisikin and empty resultBlog and empty resultBand and empty resultTv and empty resultVod}">
                	<div class="not_frow result-section result-jisikin not_found02"> 
	                	<ul>   
		                	<li>단어의 철자가 정확한지 확인해 보세요.</li><br/> 
		                	<li>한글을 영어로 혹은 영어를 한글로 입력했는지 확인해 보세요.</li> <br/>
		                	<li>검색어의 단어 수를 줄이거나, 보다 일반적인 검색어로 다시 검색해 보세요.</li> <br/>
		                	<li>두 단어 이상의 검색어인 경우, 띄어쓰기를 확인해 보세요.</li><br/>
		                	<li>검색 옵션을 변경해서 다시 검색해 보세요.</li>	 <br/>
	                	</ul> 
                	</div>
                </c:if>
                
                <!-- BLOG 08.11 여기부터 ( resultType Map으로 다시시작해보자  -->
                <c:if test="${not empty resultBlog }">
                    <div class="row result-section result-blog">
                        <div class="section_head">
                            <h2>블로그</h2>
                            <span class="title_num">${resultBlog.size() }건</span>
                        </div>
                        <div class="jisikin-section-content">
                            <ul class="jisikin-list blog-list">
                            <c:forEach var="blogList" items="${resultBlog }" begin="0" end="1">
                                <li>
                                    <div class="search-blog-img">   
                                        <img src="/link/resources/images/userblogimgs/${blogList.BOARDMAINIMG }" width="80px" height="80px" alt="">
                                    </div>
                                    <dl> 
                                        <dt class="title">
                                            <a href="/link/blog/board.do?blogNo=${blogList.BLOGNO }&categoryNo=${blogList.CATEGORYNO}&boardNo=${blogList.BOARDNO}" class="jisikin-list-title">${blogList.TITLE }</a>
                                            <span class="create_date"><fmt:formatDate value="${blogList.CREATEDATE }" pattern="yyyy.MM.dd"/> </span>
                                        </dt>  
                                        <dd class="content" style="display: block !important">
                                       		${blogList.CONTENTS }
                                        </dd>    
                                        <dd class="cat blog-title">${blogList.BLOGTITLE }</dd>
                                    </dl>
                                </li>                             
                            </c:forEach>
                                
                            </ul>
                        </div>
                        <div class="section-more">
                            <a href="#">blog 더보기></a>
                        </div>
                    </div>
                </c:if>
                
                <!-- 시리즈 검색 -->
                <c:if test="${not empty resultVod }">
                    <div class="row result-section result-series">
                        <div class="section_head">
                            <h2>시리즈</h2>
                            <span class="title_num">${resultVod.size() }건</span>
                        </div>
                        <div class="jisikin-section-content">
                            <ul class="jisikin-list vod-list" style="margin-left:-20px;">
                            <c:forEach var="vod" items="${resultVod }" begin="0" end="1">
                                <li style="padding-bottom:10px !important;">
                                    <div class="search-blog-img">
                                    <a href="/link/series/detail.do?vodno=${vod.no }">
                                        <img src="/link/resources/images/series/vods/${vod.img }" width="150" height="200" alt="">
                                        </a>    
                                    </div>  
                                    <dl>  
                                        <dt class="title"> 
                                            <a href="/link/series/detail.do?vodno=${vod.no }" class="jisikin-list-title">${vod.title }</a>
                                            <span class="create_date">개봉일  : <fmt:formatDate value="${vod.createDate }" pattern="yyyy.MM.dd"/> </span>
                                        </dt>   
                                        <dd class="content" style="max-width:420px; overflow:hidden;">
                                            <span style="color:gray;">내용</span>
                                            ${vod.descriptrion }    	
                                        </dd>
                                        <dd class="cat blog-title">
                                            <span class="running-time">상영시간<em>${vod.runningTime }분</em></span>
                                            <span class="grade">관람등급<em>${vod.grade }</em></span>
                                            <span class="actor"
                                            style="max-width:420px; overflow:hidden;"
                                            >배우<em>${vod.actor }</em></span>
                                        </dd>   
                                    </dl>
                                </li>                             
                            </c:forEach>
                            </ul>
                        </div>
                        <div class="section-more">  
                            <a href="#">상세보기></a>
                        </div>
                        
                    </div>  
                 </c:if>
                 
                 <!--  밴드 검색 -->
                 <c:if test="${not empty resultBand }">
                    <div class="row result-section result-band">
                        <div class="section_head">
                            <h2>BAND</h2>
                            <span class="title_num">${resultBand.size() }건</span>
                        </div>
                        <div class="jisikin-section-content">
                            <ul class="jisikin-list">        
                            <c:forEach var="band" items="${resultBand }" begin="0" end="1">
                                <li style="min-width:600px;">
                                    <dl>   
                                        <dt class="title">  
                                            <p class="band-title">
                                            BAND명 : 
    	                                        <a href="/link/band/bandhome.do?bandNo=${band.BANDNO }" class="jisikin-list-title">
	    	                                        ${band.BANDNAME }
            	                                </a>
                                            </p>
                                            <span class="create_date">/ 창설일 : <fmt:formatDate value="${band.CREATEDATE }" pattern="yyyy.MM.dd"/> </span>
                                        </dt>
                                    </dl>  
                                </li>
                            </c:forEach>                 
                                
                            </ul>
                        </div>
                        <div class="section-more">
                            <a href="#">BAND 더보기></a>
                        </div>
                    </div>
                 </c:if>
                 
                 <!-- TV검색 -->
                 <c:if test="${not empty resultTv }">
                    <div class="row result-section result-tv">
                        <div class="section_head">
                            <h2>TV</h2>
                            <span class="title_num">${resultTv.size() }건</span>
                        </div>
                        <div class="jisikin-section-content">
                            <ul class="jisikin-list blog-list">
                            <c:forEach var="tv" items="${resultTv }" begin="0" end="3">
                                <li>
                                    <div class="search-blog-img">
                                       <a href="/link/tv/detail.do?vno=${tv.no }" class="video">
                                            <img src="/link/resources/images/tvdb/${tv.thumbnail }" width="140px;" alt="">
                                            <span class="runtime"><span class="blind">재생시간</span>${tv.playTime }초</span>
                                            <span class="spmv ico play">동영상 바로보기</span>
                                       </a>
                                    </div>
                                    <dl>
                                        <dt class="title">
                                            <a href="/link/tv/detail.do?vno=${tv.no }" class="jisikin-list-title">${tv.title }</a>
                                        </dt>
                                        <dd class="content">
                                        	${tv.contents }
                                        </dd>
                                        <dd class="cat blog-title video-title">${tv.tvPlaylist.tvChannel.title }<span class="create_date video_date"><fmt:formatDate value="${tv.createDate }" pattern="yyyy.MM.dd"/> </span></dd>
                                    </dl>
                                </li>                             
                            </c:forEach>
                                
                            </ul>
                        </div>
                        <div class="section-more">
                            <a href="#">TV 더보기></a>
                        </div>
                    </div>
                 </c:if>
                 	<!-- 이미지 검색 폐기 -->
                    <!-- <div class="row result-section result-image">
                        <div class="section_head">
                            <h2>이미지</h2>
                            <span class="title_num">26건</span>
                        </div>
                        <div class="search-blog-img">
                           <a href="#">
                            <img src="/link/resources/images/search-img-ex1.jpg" alt="">
                            </a>
                        </div>
                        <div class="search-blog-img">
                            <a href="#">
                            <img src="/link/resources/images/search-img-ex2.jpg" alt="">
                            </a>
                        </div>
                        <div class="search-blog-img">
                            <a href="#">
                            <img src="/link/resources/images/search-img-ex3.jpg" alt="">
                            </a>
                        </div>
                        <div class="search-blog-img">
                            <a href="#">
                            <img src="/link/resources/images/search-img-ex4.jpg" alt="">
                            </a>
                        </div>
     
                        <div class="section-more">
                            <a href="#">이미지 더보기></a>
                        </div>
                    </div> -->
                    <div class="row paging-row" style="display: none;">
                        <div class="paging" style="padding-left:0px;">             <a href="#" class="paging-strong">1</a>
                            <a href="#">2</a>
                            <a href="#">3</a>
                            <a href="#">4</a>
                            <a href="#">5</a>
                            <a href="#">6</a>
                            <a href="#">7</a>
                            <a href="#">8</a>
                            <a href="#">9</a>
                            <a href="#">10</a>
                            <a class="next" href="#">다음페이지</a> 
                        </div>
                    </div>
                <!-- 내역 끝 -->
                </div>
                <div class="col-sm-3 search-ranking">   
                    <div class="search-rank">
                        <div class="rank-head">
                            <h2>일간검색순위</h2>
                        </div>
                        <div class="rank-list">
                            <ol>
                            	<c:forEach var="pop" items="${popWords }" begin="0" end="9" varStatus="status">
	                                <li>
	                                    <a href="/link/search.do?word=${pop }" class="bx bx_item">
	                                        <span class="keyword">
	                                            <em class="num">${status.count }</em>
	                                            <span class="tit">${pop }</span>
	                                        </span>
	                                    </a>
	                                </li>
                            	</c:forEach>
                            </ol>
                            <div class="realtime_srch_area">
                                <p class="dsc">
                                <c:set var="now" value="<%=new java.util.Date()%>" />
                                    <time><fmt:formatDate value="${now }" pattern="yyyy.MM.dd"/></time>
                                    . 기준
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>  
<script>	

$(document).ready(function(){ 
	// 키워드 강조
	var search = $('#search-input').val();
	
	$(".title, .content:contains('"+search+"')").each(function (index, item) {
        var regex = new RegExp(search,'gi');
        $(item).html($(item).html().replace(regex, '<span style="background-color:yellow;">'+search+'</span>'));
        
    });
	
	// 검색결과 없을때 
	$(".not_found02 ul").before('<p><em>\''+search+'\'</em>에 대한 검색결과가 없습니다.</p');
	
	// $('.content *').removeAttr("style"); 
	$('.blog-list .content *').css("all", "inherit");  
	$('.blog-list .content *').css("overflow", "");  
	$(".content img").hide();  
}); 

	/* 검색바 자동완성 */
	$("#search-input").keyup(function(){
		var word = $("#search-input").val();
		console.log(word);
		
		$.ajax({
			url:"autoComplete.do",
			data:{word:word},
			dataType:"json",
			success:function(result){
				console.log(result)
				$("._resultBox").empty();
				
				$.each(result,function(index,item){
					
					var html = '<li class="_item"><a href="/link/search.do?word='+item+'">'+item+'</a></li>';
					$("._resultBox").append(html);
				})
			}
		})
	})
	
	/* 자동완성기능 ( 펼치기 접기 포함)*/
	var isIntoResultBox = false;
	
	 $("#search-input").click(function(){ 
		 $(".unfold").css("display", "block");
		 $(".fold").css("display", "none");
		 $("#nx_autoframe_top").show();
	 })
	 
	 $("#search-input").blur(function(){ 
		 if (!isIntoResultBox) {
			 $(".unfold").css("display", "none");
			 $("#nx_autoframe_top").hide();
			 $(".fold").css("display", "block");
		 }
	 })
	 
	 $("#nx_autoframe_top").mouseenter(function() {
		 isIntoResultBox = true;
	 })
	 
	 $("#nx_autoframe_top").mouseleave(function() {
		 isIntoResultBox = false;
	 })

    
    /* 페이징 */
    $(".paging a").click(function(){
        $(this).siblings().removeClass("paging-strong");
        $(this).addClass("paging-strong");
    })
    
    /* 검색 섹션 보이기/감추기 */
    $("#totalsearch").click(function(){
        $(".result-section").css("display", "block");
        $(".paging-row").css("display","none");
        return false;
    })
    
    $("#jisikinsearch, .result-jisikin .section-more").click(function(){
        $(".result-jisikin").css("display", "block");
        $(".result-jisikin").siblings().css("display", "none");
        $(".result-jisikin .section-more").css("display", "none");
        $(".paging-row").css("display","block");
        return false;
    })
    
    $("#blogsearch, .result-blog .section-more").click(function(){
        $(".result-blog").css("display", "block");
        $(".result-blog").siblings().css("display", "none");
        $(".result-blog .section-more").css("display", "none");
        $(".paging-row").css("display","block");
        return false;
    })
    
    $("#seriessearch, .result-series .section-more").click(function(){
        $(".result-series").css("display", "block");
        $(".result-series").siblings().css("display", "none");
        $(".result-series .section-more").css("display", "none");
        $(".paging-row").css("display","block");
        return false;
    })
    
    $("#bandsearch, .result-band .section-more").click(function(){
        $(".result-band").css("display", "block");
        $(".result-band").siblings().css("display", "none");
        $(".result-band .section-more").css("display", "none");
        $(".paging-row").css("display","block");
        return false;
    })
    
    $("#tvsearch, .result-tv .section-more").click(function(){
        $(".result-tv").css("display", "block");
        $(".result-tv").siblings().css("display", "none");
        $(".result-tv .section-more").css("display", "none");
        $(".paging-row").css("display","block");
        return false;
    })
    
    $("#imagesearch, .result-image .section-more").click(function(){
        $(".result-image").css("display", "block");
        $(".result-image").siblings().css("display", "none");
        $(".result-image .section-more").css("display", "none");
        $(".paging-row").css("display","block");
        return false;
    })
    
    /* 검색 옵션 상세 펼치기 */
    $(".search-opt-box").toggle("hide");
    
    $(".search-opt").click(function(){
        $(".search-opt-box").toggle();
    })
    
    /* 해당 카테고리 불켜기 */
    $(".category-btn").click(function(){
        $(this).parent().siblings().find("a").removeClass("cat-on");
        $(this).addClass("cat-on");
        return false;   
    })
    
</script>
</body>
</html>