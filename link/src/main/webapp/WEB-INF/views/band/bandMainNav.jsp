<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<nav class="navbar navbar-default">
        <div class="container">
            <div class="row">
                <div class="col-sm-2">
                    <a href="main.do">
                        <span class="band-main-javer">Link</span> <span class="band-main-band">밴드</span>
                    </a>
                </div>
                <div class="col-sm-5 blog-searchbar">
                    <form class="navbar-form navbar-left" role="search">
                        <div class="form-group">
                            <input style="width:300px;" type="text" class="form-control" placeholder="검색">
                        </div>
                        <button type="submit" class="btn btn-default" style="width: 31px; height: 31px;"><span style="color: black; font-size: 23px;" class="glyphicon glyphicon-search band-search-position"></span></button>
                    </form>
                </div>

                <div class="col-sm-4 col-sm-offset-1 text-right blog-toprow-right">
                    <div class="blog-navbar-right collapse navbar-collapse navbar-right">
						
						<c:choose>
							<c:when test="${not empty LOGIN_USER }">
								<ul class="nav navbar-nav">
		                            <li class="dropdown">
		                                <a href="#" class="dropdown-toggle toggle-main-nav" data-toggle="dropdown" role="button" aria-expanded="false">
		                                    <img class="band-profile-img" src="/link/resources/images/bandLog.png" alt="" >
		                                    <span class="band-navbar-id">${LOGIN_USER.name } 님</span>
		                                    <span class="caret"></span></a>
		                                <ul class="dropdown-menu" role="menu">
		                                    <li><a href="#">내 정보</a></li>
		                                    <li><a href="/link/home.do">홈으로</a></li>
		                                    <li><a href="#">블로그</a></li>
		                                    <li><a href="/link/blog/main.do">밴드</a></li>
		                                    <li><a href="#">가계부</a></li>
		                                    <li><a href="#">지식인</a></li>
		                                    <li><a href="#">시리즈</a></li>
		                                    <li><a href="#">TV</a></li>
		                                    <li class="divider"></li>
		                                    <li><a href="/link/logout.do">로그아웃</a></li>
		                                </ul>
		                            </li>
		                        </ul>
							</c:when>
							<c:otherwise>
								<span class="band-navbar-id"><a href="/link/loginform.do" class="main-nav-login">로그인</a></span>
							</c:otherwise>
						</c:choose>
					                        
                        
                        <div class="bell2 text-center"><a href=""><span class="glyphicon glyphicon-bell" style="color: black"></span></a></div>
                        <div class="comment text-center"><a href=""><span class="glyphicon glyphicon-comment" style="color: black"></span></a></div>
                    </div>
                </div>
            </div>
        </div>
    </nav>
<!--네비끝-->