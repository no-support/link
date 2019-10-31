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
        .ACbook{
              width:66px;
              height:20px;
              font-size:12px;
        }
        #line{
        
        }
        li{
            list-style: none;
        }
        .point{
            color: #111;
            font-weight: bold;
        }
        .btn-button{float: right;padding: 1px 7px; font-size: 13px;}
        .tb{padding: 50px;}
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
						<li><a href="/link/accountbook/expense.do"><h4>가계부</h4></a></li>
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
                <div class="row">
                    <div class="col-sm-12 text-center">
                        <strong>2019-07-01 ~ 2019-07-31</strong>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-12">
                        <ul class="nav nav-tabs">
                            <li><a href="/link/accountbook/mylist.do">나의 월결산 목록</a></li>
                            <li class="active"><a href="/link/accountbook/list.do">전체 글 목록</a></li>
                        </ul>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-12">
                
                       <div class="row" >
                          <div class="col-sm-12">
                                   <h3>전체 월결산 목록</h3>      
                              </div>
                        <table class="table table-hober"  >
                           <tbody>
                               <tr>
                                <th>결산월</th>
                                <th>제목</th>
                                <th>작성자</th>
                                <th>작성일</th>
                                <th>조회</th>
                                <th>추천</th>
                            </tr>
                             <tr>
                                <td>2019.06</td>
                                <td><a href="monthlyAccount_detail.jsp">내용이 올 자리입니다. 내용이 올 자리입니다. 내용이 올 자리입니다.</a></td>
                                <td>강희경</td>
                                <td>2019.07.17</td>
                                <td>7</td>
                                <td>0</td>
                            </tr>  
                              
                           </tbody>
                        </table> 
                           <ul class="pagination">
                              <li><a href="#">1</a></li>
                              <li><a href="#">2</a></li>
                              <li><a href="#">3</a></li>
                              <li><a href="#">4</a></li>
                              <li><a href="#">5</a></li>
                            </ul>
                       </div>
                    
                </div>
                
            </div>
        </div>
    </div>
    
    <div id="open-writing-account" class="modal" role="dialog">
        <div class="modal-dialog  modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">가계부</h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-sm-3">
                            달력
                        </div>
                        <div class="col-sm-9">
                            <ul class="nav nav-tabs">
                                <li class="active"><a href="#">지출</a></li>
                                <li><a href="#">수입</a></li>
                            </ul>
                            <table class="table table-bordered">
                            <thead>
                                <tr>
                                   <th><input type="checkbox"/></th>
                                   <th>사용내역</th>
                                   <th>현금</th>
                                   <th>카드</th>
                                   <th>분류</th>
                                   <th>태그</th>
                               </tr>
                            </thead>   
                            <tbody>
                               <tr>
                                   <td><input type="checkbox"/></td>
                                   <td>국수</td>
                                   <td class="text-right">0</td>
                                   <td class="text-right">6900</td>
                                   <td>식비>주식</td>
                                   <td>미정국수</td>
                               </tr>
                                <tr>
                                   <td><input type="checkbox"/></td>
                                   <td>국수</td>
                                   <td class="text-right">0</td>
                                   <td class="text-right">6900</td>
                                   <td>식비>주식</td>
                                   <td>미정국수</td>
                               </tr>
                            </tbody>
                            <tfoot>
                                <tr>
                                    <td colspan="2">
                                        <button class="btn btn-default btn-sm">선택삭제</button>
                                        합계
                                    </td>
                                    <td class="text-right">0</td>
                                    <td class="text-right">6900</td>
                                    <td colspan="2" ></td>
                                </tr>
                            </tfoot>
                        </table>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6">
                            <h4>일정 <small>일정을 조회/등록합니다.</small> <button class="btn btn-default pull-right">일정추가</button></h4>
                            <hr>
                            <ul class="list-group">
                                <li class="list-group-item"></li>
                                <li class="list-group-item"></li>
                                <li class="list-group-item"></li>
                                <li class="list-group-item"></li>
                                <li class="list-group-item"></li>
                                <li class="list-group-item"></li>
                                <li class="list-group-item"></li>
                            </ul>
                        </div>
                        <div class="col-sm-6">
                            <h4>메모 작성하기 <small>(0/200)</small></h4> 
                            <hr>
                            <textarea class="form-control" rows="7"></textarea>
                        </div>
                    </div>
                </div>
                <div class="modal-footer text-center">
                    <button type="button" class="btn btn-default"><strong>저장</strong></button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                </div>
            </div>

        </div>
    </div>
    </div>
</body>
</html>