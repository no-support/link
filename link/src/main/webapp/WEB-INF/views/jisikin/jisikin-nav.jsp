<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="row" style="margin-top: 0px;">
       <nav class="navbar navbar-default main-nav jisikin-nav">
          <div class="container-fluid">
           
            <div class="navbar-header">
              <a class="navbar-brand menu-home" href="/link/jisikin/main.do?sort=1&categoryNo=0">홈</a>
            </div>

            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
              <ul class="nav navbar-nav">
                <li class="dropdown menu-tab">
                  <a href="/link/jisikin/qna.do" class="qna-toggle dropdown-toggle" aria-expanded="false">Q&A <span data-toggle="dropdown" role="button" class="caret"></span></a>
                  <ul class="dropdown-menu" role="menu">
                    <li><a href="/link/jisikin/qna.do?categoryNo=1">교육,학문</a></li>    
                    <li><a href="/link/jisikin/qna.do?categoryNo=2">컴퓨터통신</a></li>
                    <li><a href="/link/jisikin/qna.do?categoryNo=3">게임</a></li>
                    <li><a href="/link/jisikin/qna.do?categoryNo=4">엔터테인먼트,예술</a></li>
                    <li><a href="/link/jisikin/qna.do?categoryNo=5">생활</a></li>
                    <li><a href="/link/jisikin/qna.do?categoryNo=6">건강</a></li>
                    <li><a href="/link/jisikin/qna.do?categoryNo=7">사회,정치</a></li>
                    <li><a href="/link/jisikin/qna.do?categoryNo=8">경제</a></li>
                    <li><a href="/link/jisikin/qna.do?categoryNo=9">여행</a></li>
                    <li><a href="/link/jisikin/qna.do?categoryNo=10">스포츠,레저</a></li>
                    <li><a href="/link/jisikin/qna.do?categoryNo=11">쇼핑</a></li>
                    <li><a href="/link/jisikin/qna.do?categoryNo=12">쥬니버Q&A</a></li>
                    <li><a href="/link/jisikin/qna.do?categoryNo=13">지역&플레이스</a></li>
                    <li><a href="/link/jisikin/qna.do?categoryNo=14">고민Q&A</a></li>
                    <li><a href="/link/jisikin/qna.do?categoryNo=15">오픈사전</a></li>
                  </ul>
                </li>
                <li class="menu-tab user-only">
                    <a href="/link/jisikin/answer.do">답변하기 <span class="sr-only">(current)</span></a>
                </li>
                <li class="menu-tab"><a href="/link/jisikin/rank.do">명예의 전당</a></li>
              </ul>
             
              <ul class="nav navbar-nav navbar-right">
                <li class="menu-tab user-only"><a href="/link/jisikin/profile.do?userId=${LOGIN_USER.id }">프로필</a></li>
                <li class="menu-tab user-only"><a href="/link/jisikin/questionform.do"><span class="glyphicon glyphicon-pencil"></span>질문하기</a>
                </li>
              </ul>
            </div><!-- /.navbar-collapse -->
          </div><!-- /.container-fluid -->
        </nav>
   </div>
   <script>
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
   </script>