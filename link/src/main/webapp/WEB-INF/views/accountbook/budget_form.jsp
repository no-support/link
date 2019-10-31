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
	<script type="text/javascript" src="/link/resources/js/se2/js/HuskyEZCreator.js"></script>
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
        .active{
            color: #111;
            font-weight: bold;
        }
        .btn-button{float: right;padding: 1px 7px; font-size: 13px;}
        .tb{padding: 50px;}
    </style>
</head>
<body>
<%@include file="../common/nav.jsp"%>
<form action="budget.do" method="post">
    <div class="container-fluid">
        <div class="row">
			<div class="col-sm-2" style="background-color: lightgray; ">
                 <button type="button" class="btn-button btn" data-toggle="modal" data-target="#open-writing-account">
                       <strong>빠른 쓰기</strong>
                 </button>
                <div>
					<ul>
						<li><a href="/link/accountbook/expense.do" class="active"><h4>가계부</h4></a></li>
						<li><a href="/link/accountbook/monthly.do"
							style="color: dimgray"><h4>지출 보고서</h4></a></li>
						<li><a href="#"
							style="color: dimgray"><h4>예산쓰기</h4></a></li>
						<li><a href="/link/accountbook/mylist.do"
							style="color: dimgray"><h4>월결산</h4></a></li>
						
						<!-- <li class="month-accountBook">▼이달의 가계
							<ul>
								<li>+수입</li>
								<li>-지출</li>
							</ul>
						</li>
						
						<li>▼총 누적 자산</li>

						<li>자산합계</li>
						
						<li>▼최근 태그</li>

						<li>미정국수</li>
 -->
					</ul>
				</div> 
            </div>
            <div class="col-sm-10">
                <div class="row">
                    <div class="col-sm-6">
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
                       <div class="col-sm-12">
                           <h3>지출 예산</h3>
                       </div>
                   </div>
                     <div class="row">
                         <div class="col-sm-12">
                             <div class="col-sm-2">
                             </div>
                             <div class="col-sm-5">
                              <strong>6월</strong>
                                  <div class="row">
                                      <p> 2019.06.01-2019.06-30</p>
                                     <p>수입 688,400</p>
                                      
                                  </div>
                             </div>
                             <div class="col-sm-5">
                                  <strong>7월</strong>
                                 <div class="row">
                                      <p> 2019.06.01-2019.06-30</p>
                                     <p>수입 688,400</p>
                                      
                                  </div>
                             </div>
                         </div>
                     </div>
                      <div class="row">
                       <div class="col-sm-12">
                          <table class="table table-bordered" style="border: antiquewhite 1px solid; padding-bottom: 100px;">
                              <tr>
                                  <th>분류</th>
                                  <th>예산</th>
                                  <th>지출</th>
                                  <th>남은돈</th>
                                  <th>예산</th>
                                  <th>지출</th>
                                  <th>남은돈</th>
                              </tr>
                              <c:forEach var="expense" items="${categoryExpense }">
                              <tr>
                                  <td><input class="form-control" type="text" name="categoryNo"value="${expense. }"></td>
                                  <td><input class="form-control" name="budget1" type="text" value="0"></td>
                                  <td><input class="form-control" name="expense1" type="text" value="0"></td>
                                  <td><input class="form-control" name="remainAmount1" type="text" value="0"></td>
                                  <td><input class="form-control" name="budget2" type="text" value="688400"></td>
                                  <td><input class="form-control" name="expense2" type="text" value="100000"></td>
                                  <td><input class="form-control" name="remainAmount2" type="text" value="688400"></td>
                              </tr>
                              </c:forEach>
                              
                          </table>
                       </div>
                   </div>
                       <button class="btn btn-primary btn-lg" type="submit" id="save" name="save" >
                           저장하기
                       </button>
            </div>
    </div>
    </div>
</form>
    <script type="text/javascript">
   
    </script>
</body>
</html>