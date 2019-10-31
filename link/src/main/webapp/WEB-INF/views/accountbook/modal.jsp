<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="/link/resources/css/accountBookcalendar/iCalendar.css" rel="stylesheet">
<script src="/link/resources/js/accountBookcalendar/iCalendar.js"></script>
<script src="/link/resources/js/accountBookcalendar/iCalendar.es5.js"></script>
<style>
	input{
	 width:50px;
	}
</style>



 		<button type="button" class="btn-button btn" data-toggle="modal" data-target="#open-writing-account">
                      <strong>빠른 쓰기</strong>
        </button>
        <form  action="modal.do" method="post"></form>
        <div id="open-writing-account" class="modal" role="dialog">
        <div class="modal-dialog  modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">가계부</h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-sm-3">
                            <div id="calendar"></div>
                        </div>
                        <div class="col-sm-9">
						 
						   <ul class="nav nav-tabs">
                                <li class="active" id="expense-btn"><a href="#">지출</a></li>
                                <li id="income-btn"><a href="#">수입</a></li>
                            </ul>
                           <!-- 지출탭 -->
                           <div id="expense">
	                            <table class="table table-bordered">
	                            <colgroup>
	                            	<col width="10%">
	                            	<col width="18%">
	                            	<col width="18%">
	                            	<col width="18%">
	                            	<col width="18%">
	                            	<col width="18%">
	                            </colgroup>
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
	                                   <td><input class="form-control input-sm" type="text" value="국수"></td>
	                                   <td class="text-right"><input class="form-control input-sm" type="text" value="0"></td>
	                                   <td class="text-right"><input class="form-control input-sm" type="text" value="6900"></td>
	                				   <td>
											<select id="cat"  class="form-control">
												<option value="">카테고리 선택</option>
												<c:forEach var="category" items="${expenseCategory }">
													<option 
													value="${category.categoryNo }" 
													${expense.category.categoryNo eq category.categoryNo ? 'selected' :'' }> 
													${category.categoryName }
													</option>
												</c:forEach>
											</select>
									   </td>
									   <td><input class="form-control" type="text" value="${expense.tag.tagName  }"></td>
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
	                                    <td colspan="2"></td>
	                                </tr>
	                            </tfoot>
	                        </table>
                           </div>
                        <!-- 수입탭 -->
                         <div id="income" style="display:none;">
                            <table class="table table-bordered">
                             <colgroup>
	                            	<col width="10%">
	                            	<col width="23%">
	                            	<col width="23%">
	                            	<col width="23%">
	                            	<col width="23%">
	                            </colgroup>
                            <thead>
                                <tr>
                                   <th><input type="checkbox"/></th>
                                   <th>수입내역</th>
                                   <th>현금</th>
                                   <th>분류</th>
                                   <th>태그</th>
                               </tr>
                            </thead>   
                            <tbody>
                               <tr>
                                   <td><input type="checkbox"/></td>
                                   <td><input class="form-control input-sm" type="text" value="국수"></td>
                                   <td class="text-right"><input class="form-control input-sm" type="text" value="6900"></td>
                                   <td><input class="form-control input-sm" type="text" value="식비>주식" ></td>
                                   <td><input class="form-control input-sm" type="text" value="미정국수"></td>
                               </tr>
                            </tbody>
                            <tfoot>
                                <tr>
                                    <td colspan="2">
                                        <button class="btn btn-default btn-sm">선택삭제</button>
                                        합계
                                    </td>
                                    <td class="text-right">6900</td>
                                    <td colspan="2"></td>
                                </tr>
                            </tfoot>
                        </table>
                         </div>
                        
                        
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
                    <button type="submit" class="btn btn-default"><strong>저장</strong></button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                </div>
            </div>
        </div>
    </div>
    
<script>
	var iCal = new iCalendar('calendar');
	iCal.render();

	document.addEventListener('iCalendarDateSelected', function(event) {
	 	console.log(iCal.selectedDate);
	 });

	$('#expense-btn').click(function(){
		$("#income").css("display", "none");
		$("#expense").css("display", "block");
		$('#expense-btn').addClass("active");
		$('#income-btn').removeClass("active");
	})
	
	$('#income-btn').click(function(){
		$('#expense').css("display","none");
		$('#income').css("display","block");
		$('#income-btn').addClass("active");
		$('#expense-btn').removeClass("active");
	})
</script>