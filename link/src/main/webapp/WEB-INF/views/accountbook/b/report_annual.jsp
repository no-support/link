<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>Link : </title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="shortcut icon" type="image/x-icon" href="../../../resources/images/shortcut-icon.PNG">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
	<link rel="stylesheet" href="/link/resources/css/accountBook/expensive.css">
	<link rel="stylesheet" href="/link/resources/css/blog/blog.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <script src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	
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
        
        #strong-pading{padding-top: 50px; padding-bottom: 8px;}
    </style>
     
       <script type="text/javascript">
        <!--원형 그래프-->
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {

    	   var data = google.visualization.arrayToDataTable([
    	          ['분류', '금액'],
    	          ['지출', parseInt('${annualTerm.expense}')],
    	          ['수입', parseInt('${annualTerm.income}')],
    	        ]);

        var options = {
          title: '연간 수입/지출 분석'
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart'));

        chart.draw(data, options);
      }
      
      
      <!--막대그래프-->
       google.charts.load('current', {packages: ['corechart', 'bar']});
        google.charts.setOnLoadCallback(drawBasic);

        function drawBasic() {			
            
        var data = new google.visualization.DataTable();
          data.addColumn('string','카테고리');  
          data.addColumn('number','금액');        
 			
   
            data.addRows([
 			<c:forEach var="annualExpense" items="${totalExpenseCategory}">
 			['${annualExpense.categoryName}', parseInt('${annualExpense.total}')],
 			</c:forEach>
      		]);

      var options = {
        width: 1500,
        height: 500,
        legend: { position: 'top', maxLines: 3 },
        bar: { groupWidth: '50%' },
        isStacked: true,
      };

        
        var chart = new google.visualization.ColumnChart(
        document.getElementById('chart_div1'));

        chart.draw(data, options);
        }
    </script>
     

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
							class="point" style="color: dimgray"><h4>지출 보고서</h4></a></li>
						<li><a href="/link/accountbook/budget.do"
							style="color: dimgray"><h4>예산쓰기</h4></a></li>
						<li><a href="/link/accountbook/mylist.do"
							 style="color: dimgray"><h4>월결산</h4></a></li>
						
						<li class="month-accountBook">▼이달의 가계
							<ul>
								<li>+수입</li>
								<li>-지출</li>
							</ul>
						</li>
						
						<li>▼총 누적 자산</li>

						<li>자산합계</li>
						
						<li>▼최근 태그</li>

						<li>미정국수</li>

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
                       <!--  <strong>2019-07-01 ~ 2019-07-31</strong> -->
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-12">
                       <ul class="nav nav-tabs">
                            <li><a href="/link/accountbook/monthly.do">월 보고서</a></li>
                            <li class="active"><a href="/link/accountbook/annual.do">연간 보고서</a></li>
                            <li><a href="/link/accountbook/analysis.do">지출 분석</a></li>
                        </ul>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-12">
                        <div class="col-sm-2">
                            <div>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div id="piechart" style="width: 800px; height: 300px;">
                            </div>
                        </div>
                    </div>
                <div class="row">
                    <div class="col-sm-12">
                            <div id="chart_div1" style="width: 1000; height: 1000;"></div>
                    </div>
                </div>
                    
                <div class="row">
                    <div class="col-sm-12" id="strong-pading">
                     <strong>연간보고서</strong>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-12">
                        <table class="table table-bordered table-hover">
                             <thead>
                                 <tr>
                                     <th>기간</th>
                                     <th>1월</th>
                                     <th>2월</th>
                                     <th>3월</th>
                                     <th>4월</th>
                                     <th>5월</th>
                                     <th>6월</th>
                                     <th>7월</th>
                                     <th>8월</th>
                                     <th>9월</th>
                                     <th>10월</th>
                                     <th>11월</th>
                                     <th>12월</th> 
                                 </tr>
                             </thead>
<!--                            <tbody>
                                <tr>
                                    <td>식비</td>
                                    <td>0</td>
                                    <td>0</td>
                                    <td>0</td>
                                    <td>0</td>
                                    <td>0</td>
                                    <td>0</td>
                                    <td>0</td>
                                    <td>0</td>
                                    <td>0</td>
                                    <td>0</td>
                                    <td>0</td>
                                    <td>0</td>
                                </tr>
                                <tr>
                                    <td>주거 통신</td>
                                    <td>0</td>
                                    <td>0</td>
                                    <td>0</td>
                                    <td>0</td>
                                    <td>0</td>
                                    <td>0</td>
                                    <td>0</td>
                                    <td>0</td>
                                    <td>0</td>
                                    <td>0</td>
                                    <td>0</td>
                                    <td>0</td>
                                </tr>
                                <tr>
                                    <td>생활용품</td>
                                    <td>0</td>
                                    <td>0</td>
                                    <td>0</td>
                                    <td>0</td>
                                    <td>0</td>
                                    <td>0</td>
                                    <td>0</td>
                                    <td>0</td>
                                    <td>0</td>
                                    <td>0</td>
                                    <td>0</td>
                                    <td>0</td>
                                </tr>    
                                <tr>
                                    <td>의복/미용</td>
                                    <td>0</td>
                                    <td>0</td>
                                    <td>0</td>
                                    <td>0</td>
                                    <td>0</td>
                                    <td>0</td>
                                    <td>0</td>
                                    <td>0</td>
                                    <td>0</td>
                                    <td>0</td>
                                    <td>0</td>
                                    <td>0</td>
                                </tr>
                                <tr>
                                    <td>건강/문화</td>
                                    <td>0</td>
                                    <td>0</td>
                                    <td>0</td>
                                    <td>0</td>
                                    <td>0</td>
                                    <td>0</td>
                                    <td>0</td>
                                    <td>0</td>
                                    <td>0</td>
                                    <td>0</td>
                                    <td>0</td>
                                    <td>0</td>
                                </tr>
                                <tr>
                                    <td>저축/보험</td>
                                    <td>0</td>
                                    <td>0</td>
                                    <td>0</td>
                                    <td>0</td>
                                    <td>0</td>
                                    <td>0</td>
                                    <td>0</td>
                                    <td>0</td>
                                    <td>0</td>
                                    <td>0</td>
                                    <td>0</td>
                                    <td>0</td>
                                </tr>
                                <tr>
                                    <td>카드대금</td>
                                    <td>0</td>
                                    <td>0</td>
                                    <td>0</td>
                                    <td>0</td>
                                    <td>0</td>
                                    <td>0</td>
                                    <td>0</td>
                                    <td>0</td>
                                    <td>0</td>
                                    <td>0</td>
                                    <td>0</td>
                                    <td>0</td>
                                </tr>
                                <tr>
                                    <td>지출 합계</td>
                                    <td colspan="12">
                                    </td>
                                </tr>
                         </tbody> -->
                        </table>
                    </div>
                </div>
                
                <div id="chart_div" style="width: 1000; height: 1000;"></div>
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
</body>
</html>