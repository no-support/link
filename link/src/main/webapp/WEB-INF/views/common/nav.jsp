<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<nav class="navbar main-nav">
        <div class="container blog_remove_color">
            <div class="row">
                <div class="col-sm-2">
                    <a href="/link/home.do">
                        <span class="blog-main-javer">Link</span>
                    </a>
                    <c:choose>
                    <c:when test="${navMenu eq 'jisikin' }">
                    <a href="/link/jisikin/main.do">
                        <span class="blog-main-blog">지식인</span>
                    </c:when>
                    <c:otherwise>
                    <a href="/link/blog/main.do">
                        <span class="blog-main-blog">블로그</span>
                    </c:otherwise>
                    </c:choose>
                    </a>
                </div>
                <div class="col-sm-5 blog-searchbar">
                    <form class="navbar-form navbar-left" action="/link/search.do" method="GET" role="search">
                        <div class="form-group">
                            <input style="width:300px;" name="word" type="text" class="form-control" placeholder="검색">
                        </div>
                        <button type="submit" class="btn btn-green"><span class="glyphicon glyphicon-search"></span></button>
                    </form>
                </div>

                <div class="col-sm-4 col-sm-offset-1 text-right blog-toprow-right">
                    <div class="blog-navbar-right collapse navbar-collapse navbar-right">
                        <ul class="nav navbar-nav">
                        <c:if test="${empty LOGIN_USER }">
                        	 <li class="blogmain_login_li"><a class="blogmain_login" style="background-color:#649dfa;" href="/link/loginform.do">로그인 </a></li>
                        </c:if>
                        <c:if test="${not empty LOGIN_USER }">
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
                                    <img class="blog-profile-img" style="width:30px; height:30px; border-radius: 50%;" src="/link/resources/images/${LOGIN_USER.img }" alt="">
                                    <span class="blog-navbar-id">${LOGIN_USER.nickName }</span>
                                    <span class="caret"></span></a>
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
                                    <li><a href="/link/accountbook/expense.do">가계부 </a></li>
                                    <li><a href="/link/jisikin/main.do?sort=1&categoryNo=0">지식인</a></li>
                                    <li><a href="/link/series/home.do">시리즈</a></li>
                                    <li><a href="/link/tv/home.do">TV</a></li>
                                    
                                    <li class="divider"></li>
                                    <li><a class="blognav_logout_btn" href="/link/logout.do">로그아웃</a></li>
                                </ul>
                            </li>
                            </c:if>
                        </ul>
                        <div class="bell text-center"><a href=""><span class="glyphicon glyphicon-bell"></span></a></div>
                        <div class="envelope"><a href=""><span class="glyphicon glyphicon-envelope"></span></a></div>
                    </div>
                </div>
            </div>
        </div>
    </nav>
<script src="/link/resources/js/returnUrl.js"></script>