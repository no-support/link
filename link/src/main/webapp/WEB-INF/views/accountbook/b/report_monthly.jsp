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
	 <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script src="https://www.gstatic.com/charts/loader.js">
    </script>
      <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	  <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
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
        select{width: 20%; padding: 10px 10px 10px 10px; border: 1px solid #ccc;border-radius: 3px; resize: vertical;}
    </style>
    
    <script type="text/javascript">
        <!--원형 그래프-->
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {

        var data = google.visualization.arrayToDataTable([
          ['분류', '금액'],
          ['지출', parseInt('${monthlyTerm.expense}')],
          ['수입', parseInt('${monthlyTerm.income}')],
        ]);

        var options = {
          title: '1달 수입/지출 분석'
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart'));

        chart.draw(data, options);
      }
      <!--막대그래프-->
	      google.charts.load('current', {packages: ['corechart', 'bar']});
	      google.charts.setOnLoadCallback(drawBasic);
	
	      function drawBasic() {
	      
	     var data = new google.visualization.DataTable();
	      data.addColumn('string','카레고리');
	      data.addColumn('number','금액');	      
	      
		  data.addRows([
			<c:forEach var="monthlyExpense" items="${totalExpenseCategory}">
	       ['${monthlyExpense.categoryName}', parseInt('${monthlyExpense.total}') ],
	       </c:forEach>
	    	]);
	
	    var options = {
	      width: 1250,
	      height: 400,
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
						<li><a href="/link/accountbook/expense.do"><h4>가계부</h4></a></li>
						<li><a href="/link/accountbook/monthly.do"
							class="point" style="color: dimgray"><h4>지출 보고서</h4></a></li>
						<li><a href="/link/accountbook/budget.do"
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
                        <!-- <strong>2019-07-01 ~ 2019-07-31</strong> -->
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-12">
                        <ul class="nav nav-tabs">
                            <li  class="active"><a href="/link/accountbook/monthly.do">월 보고서</a></li>
                            <li><a href="/link/accountbook/annual.do">연간 보고서</a></li>
                            <li><a href="/link/accountbook/analysis.do">지출 분석</a></li>
                        </ul>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-12">
                          <div class="row">
                            <div class="col-sm-12">
                               <div class="col-sm-3"></div>
                                <div class="col-sm-9">
                                    <div><div id="piechart" style="width: 800px; height: 300px;">
                            </div></div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                           <div class="col-sm-12" style="padding: 36px 10px 3px 35px; border-bottom: 2px solid #496e85">
                             <strong >지출 현황</strong>   
                           </div>
                        </div>    
                        </div>
                           
                           </div>
                        </div>
                        <div class="row" style="padding: 30px 10px 30px 35px;">
                                <div class="col-sm-12">
                                      <div class="col-sm-2"></div>
                                      <div class="col-sm-10">
                                       <div id="chart_div1" style="width: 1000; height: 1000;"></div>   
                                      </div>
                                        
                                 
                                </div>
                            
                        </div>
                        
                    </div>
                    <div class="col-sm-12" style="padding: 4px 10px 3px 35px;  border-top:2px solid black; border-bottom: 2px solid black">
                            <div class="col-sm-3">지출합계  211,600</div>
                            <div class="col-sm-3">저축/보험합계</div>
                            <div class="col-sm-3">카드대금</div>
                            <div class="col-sm-3"></div>
                             
                        </div>
                    <div class="row">
                        
                    </div>
                </div>
                
            </div>
        </div>
</body>
</html>