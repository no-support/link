<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>Bootstrap</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Jura|Marck+Script|Russo+One|Sacramento&display=swap" rel="stylesheet">
<link rel="stylesheet" href="/link/resources/css/main.css">
<link rel="stylesheet" href="/link/resources/css/blog/blog.css">
<link rel="stylesheet" href="/link/resources/css/search/searchMain.css">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<style>
.block {
   border:2px solid #649dfa; 
   padding:0 5px; height:25px; 
   overflow:hidden; 
   background:#fff; 
   width:140px;  
   font-family:Gulim;   
   font-size:15px;}  
     
.block ul, .block li {
   margin:0; 
   padding:0; 
   list-style:none;}
   
.block li a {
   display:block; 
   height:25px; 
   width:120px; 
   line-height:20px; 
   color:#555; 
   text-decoration:none;
}
   
.block li .rankk {
   padding:2px 5px; 
   background:#649dfa; 
   color:#fff; 
   font-weight:bold; 
   margin-right:3px;}
   
.pull-right{  
   color: #649dfa !important; 
   font-size:12px;
}

.unfold-rank {
   border: 1px solid #649dfa;
   position:absolute !important;
   top:-5px !important;
   left:102px !important;
   z-index : 1000;
   background-color:white;
   min-width:150px;
}
</style>  
</head>

<body>
   <nav class="navbar navbar-default">
      <div class="container-fluid">
         <ul class="nav navbar-nav navbar-right">
            <c:if test="${not empty LOGIN_USER }">
               <li class="dropdown"><a href="#" style="background-color: white !important;" class="dropdown-toggle" data-toggle="dropdown"
                  role="button" aria-expanded="false"> <img class="blog-profile-img" style="width:25px !important; height:25px; border-radius: 50%;" src="/link/resources/images/${LOGIN_USER.img }" alt=""> <span class="blog-navbar-id"
                     style="color: gray !important; font-size:13px; font-weight: bold;">${LOGIN_USER.nickName }</span> <span class="caret" style="color: gray !important;"></span></a>
                  <ul class="dropdown-menu" role="menu">
                     <li><a href="/link/home.do">Link 홈</a></li>
                     <li class="divider"></li>
                     <li><a href="/link/blog/main.do">블로그</a></li>
                     <c:if test="${LOGIN_USER.isHaveBlog eq 'Y' }">
                        <li style="margin-left: 10px;"><a href="/link/blog/mydetail.do">내 블로그</a></li>
                        <li style="margin-left: 10px;"><a href="/link/blog/beauty.do">내 블로그 관리</a></li>
                     </c:if>
                     <li class="divider"></li>

                     <li><a href="/link/band/main.do">밴드</a></li>
                     <li><a href="/link/jisikin/main.do?sort=1&categoryNo=0">지식인</a></li>
                     <li><a href="/link/accountbook/expense.do">가계부 </a></li>
                     <li><a href="/link/series/home.do">시리즈</a></li>
                     <li><a href="/link/tv/home.do">TV</a></li>
                     <li class="divider"></li>
                     <li><a class="blognav_logout_btn" href="/link/logout.do">로그아웃</a></li>
                  </ul></li>
            </c:if>
            <c:if test="${empty LOGIN_USER }">
               <li class=""><a class="main-login blogmain_login" style="color: #666666;" href="loginform.do">로그인</a></li>
            </c:if>
            <c:if test="${not empty LOGIN_USER }">
               <li class=""><a class="main-login blognav_logout_btn" style="color: #666666; padding:15px !important;" href="logout.do">로그아웃</a></li>
            </c:if>
         </ul>
      </div>
   </nav>
   <div class="container">
      <div class="row main-row-1">
         <div class="col-sm-12 text-center">
            <span class="main-naver"><a href=""><span style="" class="main-null-img glyphicon glyphicon-link"></span> <span style="">L</span><span
                  style="color: #E62600;"
               >i</span><span style="color: #FCC800;">n</span><span style="color: #00B658">k</span> </a></span>
         </div>
         <div class="col-sm-6 col-sm-offset-3 text-center">
         <form id="search-bar-form" action="/link/search.do" method="GET">
         <fieldset class="greenwindow">
            <div class="greenbox"> <span class="keyword"> <input type="text" id="nx_query" name="word" class="box_window" maxlength="255" accesskey="s" value="" autocomplete="off" title="검색어 입력"> </span> 
                    </div>
               <button type="submit" class="bt_search"><span class="
                    glyphicon glyphicon-search"></span></button>
         </fieldset>  
         </form>
         </div>
         <div class="col-sm-3 main-rank" style="margin-top:-15px">  
            <p class="text-center" style="margin-left:-26px;">실시간 인기 검색 순위</p>  
            <div class="block" style="overflow:hidden;">
                <ul id="ticker"> 
                <c:forEach var="rank" items="${popWords }" varStatus="status" begin="0" end="9">
                    <li><a href="/link/search.do?word=${rank }"><span class="rankk">${status.count }</span> ${rank }&nbsp;<span class="pull-right glyphicon glyphicon-chevron-down"></span></a></li>
                </c:forEach>
                </ul>
            </div>  
            <div class="rank-list unfold-rank" style="display:none;">
            <p style="margin-top:-25px !important;">실시간 인기 검색 순위</p>
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
                        <p class="dsc" style="margin-left:-42px;">
                        <c:set var="now" value="<%=new java.util.Date()%>" />
                            <time><fmt:formatDate value="${now }" pattern="yyyy.MM.dd"/></time>
                            . 기준
                        </p>
                    </div>
                </div>
         </div>
      </div>
      <hr class="main-row-hr-1" />
      <div class="row main-row-2">
         <div class="col-sm-2 text-center main-col">
            <div class="main-menu">
               <a href="/link/blog/main.do">블로그</a>
            </div>
            <a href="/link/blog/main.do"><img style="" src="resources/images/blog.png" alt=""></a>
         </div>
         <div class="col-sm-2 text-center main-col">
            <div class="main-menu">
               <a href="/link/band/main.do">BAND</a>
            </div>
            <a href="/link/band/main.do"><img src="resources/images/band.png" alt=""></a>
         </div>
         <div class="col-sm-2 text-center main-col">
            <div class="main-menu">
               <a href="/link/jisikin/main.do?sort=1&categoryNo=0">지식인</a>
            </div>
            <a href="/link/jisikin/main.do"><img style="position: relative;" src="resources/images/jisik.jpg" alt=""></a>
         </div>
         <div class="col-sm-2 text-center main-col">
            <div class="main-menu">
               <a href="/link/series/home.do">시리즈</a>
            </div>
            <a href="/link/series/home.do"><img style="position: relative;" src="resources/images/video.png" alt=""></a>
         </div>
         <div class="col-sm-2 text-center main-col">
            <div class="main-menu">
               <a href="/link/tv/home.do">TV</a>
            </div>
            <a href="/link/tv/home.do"><img style="position: relative;" src="resources/images/tv.png"  alt=""></a>
         </div>
         <div class="col-sm-2 text-center main-col">
            <div class="main-menu">
               <a href="/link/accountbook/expense.do">가계부</a>
            </div>
            <a href="/link/accountbook/expense.do"><img src="resources/images/gage.png" alt=""></a>
         </div>
      </div>

   </div>
</body>
<script src="/link/resources/js/returnUrl.js"></script>
<script type="text/javascript">
$(function()
      {  
          var ticker = function()
          {     
              setTimeout(function(){            
                  $('#ticker li:first').animate( {marginTop:'20px'}, 600, function()
                  {
                      $(this).detach().appendTo('ul#ticker').removeAttr('style');
                  });
                  ticker();
              }, 2000);
          };
          ticker();
      });
      
$(".pull-right").hover(function(){ 
   $(".unfold-rank").css('display', 'block');
});

$(".unfold-rank").mouseleave(function(){
   $(".unfold-rank").css('display', 'none');
})
</script>
</html>