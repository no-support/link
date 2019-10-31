<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>Link : </title>
    <link rel="shortcut icon" type="image/x-icon" href="../../../resources/images/shortcut-icon.PNG">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
     <link rel="stylesheet" href="/link/resources/css/accountBook/expensive.css">
	<link rel="stylesheet" href="/link/resources/css/blog/blog.css">
    <style>
        div {
            margin-top: 2px;
        }

        .ACbook {
            width: 66px;
            height: 20px;
            font-size: 12px;
        }

        #line {}

        li {
            list-style: none;
        }

        .point {
            color: #111;
            font-weight: bold;
        }

        .btn-button {
            float: right;
            padding: 1px 7px;
            font-size: 13px;
        }

        .a {
            display: block;
        }

        .b {
            float: left;
        }

        .c {
            float: right;
        }

        .d {
            float: right;
        }

        .e {
            float: right;
        }

        .aa {
            display: block;
        }

        .bb {
            float: left;
        }

        .cc {
            float: left;
        }

        .dd {
            float: right;
        }

        .ee {
            float: right;
        }
    </style>
</head>

<body>
    <%@include file="../../common/nav.jsp"%>
    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-2" style="background-color: lightgray; ">
                <%@ include file="../modal.jsp" %>
                <div>
					<ul>
						<li><a href="/link/accountbook/expense.do" ><h4>가계부</h4></a></li>
						<li><a href="/link/accountbook/monthly.do"
							style="color: dimgray"><h4>지출 보고서</h4></a></li>
						<li><a href="/link/accountbook/budget.do"
							style="color: dimgray"><h4>예산쓰기</h4></a></li>
						<li><a href="/link/accountbook/mylist.do"
							class="point" style="color: dimgray"><h4>월결산</h4></a></li>
						
						<!-- <li class="month-accountBook">▼이달의 가계
							<ul>
								<li>+수입</li>
								<li>-지출</li>
							</ul>
						</li>
						
						<li>▼총 누적 자산</li>

						<li>자산합계</li>
						
						<li>▼최근 태그</li>

						<li>미정국수</li> -->

					</ul>
				</div> 
            </div>
            <div class="col-sm-10">
                <div class="row">
                    <div class="col-sm-6">
                        <!-- Button trigger modal -->
                        <button class="btn btn-default btn-xs">금액감추기</button>
                    </div>
                    <div class="col-sm-6 text-right">
                        <form class="form-inline">
                            <div class="form-group">
                                <input type="text" class="form-control">
                                <button class="btn btn-success">검색</button>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="row" style="border-bottom: 2px grey solid;">
                    <div class="col-sm-12">
                        <h4>월결산 이야기</h4>
                         </div>
                </div>
                 
                  <div class="row">
                             <div class="col-sm-12" style="padding-top: 50px; ">
                                 <div class="col-sm-12" style="padding-top: 50px; outline: 1px grey solid;">
                                     <div class="a" style="border-bottom: 2px grey dotted; height: 40px;" >
                                        
                                         <div class="b"> 
                                         <strong style="font-size: 17px;">
                                         제목: 이번달은 식비가 많이나오네요.........돼지가 꿈입니다.
                                         </strong>
                                         </div>
                                         <div class="c"> 조회
                                             <span>123</span>
                                         </div>
                                         <div class="d"> 추천
                                             <span>2</span>
                                         </div>
                                         <div class="e">
                                             2019.07.17
                                         </div>
                                     </div>
                                     <div class="row">
                                         <div class="col-sm-12">
                                             <div class="a">
                                                 <div class="b" style="padding-left: 10px;">결산월
                                                     <span>2019.06</span>
                                                 </div>
                                                 <div class="c"><a href="#"><button type="button" class="btn btn-primary btn-sm">다른글보기</button></a>
                                                 </div>
                                                 <div class="d"> 92hk*** </div>
                                             </div>
                                         </div>
                                     </div>
                                     <div class="row" style="padding-left: 10px;">
                                         <div class="col-sm-12">
                                             <p>여기는 내용입니다.</p>
                                         </div>
                                     </div>
                                     <div class="row">
                                         <div class="col-sm-12">
                                             <div class="a">
                                                 <div class="b" style="padding-left: 10px; padding-bottom: 10px; font-size: 15px;">덧글
                                                     <span>1</span>개
                                                 </div>
                                                 <div class="d">스크랩</div>
                                             </div>
                                         </div>
                                     </div>

                                     <div class="row" style="padding:50px 1px 10px 1px; background-color:lightgray">
                                         <div class="col-sm-12">
                                             <div class="com-sm-10">
                                                 <form>
                                                     <textarea class="form-control" rows="3"></textarea>
                                                 </form>
                                             </div>
                                             <div class="com-sm-2">
                                                 <button type="submit" class="btn btn-default">
                                                     댓글 등록
                                                 </button>
                                             </div>
                                             <div class="row">
                                                 <div class="col-sm-12">
                                                     <div class="a">
                                                         <div class="b" style="padding-left: 10px;">abb***(작성자)
                                                             <span>2019.06.18 17:22</span>
                                                         </div>
                                                         <div class="c"><a href="#"><button type="button" class="btn btn-default btn-sm">삭제</button></a>
                                                         </div>
                                                         <div class="d"><a href="#"><button type="button" class="btn btn-default btn-sm">답글</button></a>
                                                         </div>
                                                     </div>
                                                 </div>
                                             </div>
                                         </div>
                                     </div>
                                 </div>
                             </div>
                <div class="row" style="padding-top: 50px; padding-bottom: 50px;">
                      <div class="col-sm-12">
                          <a href="#" type="button" class="btn btn-primary">목록</a>
                      </div>
                </div>
            </div>
        </div>
    </div>
    </div>
</body>
</html>