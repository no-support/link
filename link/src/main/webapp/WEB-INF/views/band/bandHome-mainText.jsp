<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript" src="/link/resources/js/jhse/js/HuskyEZCreator.js"charset="utf-8"></script>
<!--가운데-->
               
	<div class="row">
	    <div class="col-sm-11 search-box">
	        <input type="text" class="band-search-contents" placeholder=""/>
	    </div>
	    <a href="">
	        <div class="col-sm-1 search-box2">
	            <span class="glyphicon glyphicon-search"></span>
	        </div>
	    </a>
	</div>
	<!--검색끝-->
	<!--12px-->
	<c:choose>
		<c:when test="${empty LOGIN_USER || param.joinYn eq 'N'}">
			
			<div class="row login-after-contents">
			    <a href="#">
			    <div class="col-sm-12">
			        <p style="color: #888;">밴드가입 및 로그인 후 이용해주세요</p>
			    </div>
			    </a>
			    <div class="col-sm-12 new-content-icon">
			        <!-- <a href="#"><img src="/link/resources/images/new_photo.PNG" data-toggle="tooltip" data-placement="top" title="사진" alt=""></a> -->
			        <!-- <a href="#"><img src="/link/resources/images/new_player.PNG" data-toggle="tooltip" data-placement="top" title="동영상" alt=""></a> -->
			        <a href="#"><img src="/link/resources/images/new_vote.PNG" data-toggle="tooltip" data-placement="top" title="투표" alt=""></a>
			        <!-- <a href="#"><img src="/link/resources/images/new_file.PNG" data-toggle="tooltip" data-placement="top" title="파일" alt=""></a> -->
			        <a href="#"><img src="/link/resources/images/new_map.PNG" data-toggle="tooltip" data-placement="top" title="지도" alt=""></a>
			        <a href="#"><img src="/link/resources/images/new_todo.PNG" data-toggle="tooltip" data-placement="top" title="To-Do" alt=""></a>
			        <a href="#"><img src="/link/resources/images/new_join.PNG" data-toggle="tooltip" data-placement="top" title="참가 신청서" alt=""></a>
			        <a href="#"><img src="/link/resources/images/new_cal.PNG" data-toggle="tooltip" data-placement="top" title="일정" alt=""></a>
			        <a href="#"><img src="/link/resources/images/new_nbbang.PNG" data-toggle="tooltip" data-placement="top" title="N빵" alt=""></a>
			    </div>
			</div>
		</c:when>
		<c:otherwise>
			<div class="row band-new-contents">
			    <a href="#">
			    <div class="col-sm-12">
			        <p style="color: #888;">새로운 소식을 남겨보세요</p>
			    </div>
			    </a>
			    <div class="col-sm-12 new-content-icon">
			        <!-- <a href="#"><img src="/link/resources/images/new_photo.PNG" data-toggle="tooltip" data-placement="top" title="사진" alt=""></a> -->
			        <!-- <a href="#"><img src="/link/resources/images/new_player.PNG" data-toggle="tooltip" data-placement="top" title="동영상" alt=""></a> -->
			        <a href="#"><img src="/link/resources/images/new_vote.PNG" data-toggle="tooltip" data-placement="top" title="투표" alt=""></a>
			        <!-- <a href="#"><img src="/link/resources/images/new_file.PNG" data-toggle="tooltip" data-placement="top" title="파일" alt=""></a> -->
			        <a href="#"><img src="/link/resources/images/new_map.PNG" data-toggle="tooltip" data-placement="top" title="지도" alt=""></a>
			        <a href="#"><img src="/link/resources/images/new_todo.PNG" data-toggle="tooltip" data-placement="top" title="To-Do" alt=""></a>
			        <a href="#"><img src="/link/resources/images/new_join.PNG" data-toggle="tooltip" data-placement="top" title="참가 신청서" alt=""></a>
			        <a href="#"><img src="/link/resources/images/new_cal.PNG" data-toggle="tooltip" data-placement="top" title="일정" alt=""></a>
			        <a href="#"><img src="/link/resources/images/new_nbbang.PNG" data-toggle="tooltip" data-placement="top" title="N빵" alt=""></a>
			    </div>
			</div>
		</c:otherwise>
	</c:choose>

<!-- 글 표시-->
<div class="row contents-writes">

	<c:forEach items="${writes }" var="item">

		<div class="row band-view-contants">
			<div class="col-sm-12">
				<div class="col-sm-11">
					<div class="row">
						<div class="col-sm-12" style="padding-left: 0px;">
							<strong>${item.user.name } 님</strong>
						</div>
						<div class="col-sm-12 view-contents-date"
							style="padding-left: 0px;">
							<p>
								<fmt:formatDate value="${item.createDate }" pattern="yyyy년 MM월 dd일 E요일 a hh:mm " />
								<%-- ${item.createDate } --%>
							</p>
						</div>
					</div>
				</div>
				<div class="col-sm-1" style="position: relative; right: -30px;">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
						<img src="/link/resources/images/band_new_option.PNG"class="view-contants-option" alt="" /></a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="#" class="view-contents-udpate" data-value="${item.writeNo }">글 수정</a></li>
						<li><a href="#" class="view-contents-notice" data-value="${item.writeNo }">공지로 등록</a></li>
						<li><a href="#" class="view-contents-delete" data-value="${item.writeNo }">삭제하기</a></li>
					</ul>
				</div>
			</div>
			<div class="band-contents-body" style="margin-top: 60px;" data-value="${item.writeNo }">
				<!--글 본문-->
				<a href="#" style="color:black;"> ${item.contents } </a>
				<div class="col-sm-12">

					<div class="row">
						<div class="col-sm-10"
							style="padding-right: 0px; padding-left: 0px;">
							<input type="text" class="form-control band-new-command"
								placeholder="댓글을 남겨주세요" aria-describedby="sizing-addon3" />
						</div>
						<div class="col-sm-2"
							style="padding-left: 0px; padding-right: 0px;">
							<button type="button" class="btn btn-default"
								style="width: 100%; height: 30px; font-size: 90%; color: #5c5a5a; margin-top:15px;">보내기</button>
						</div>
					</div>
				</div>
			</div>
		</div>

	</c:forEach>
</div>
<!-- 글표시 끝-->

<!-- 글등록 모달 -->
    <div id="new_contents" class="modal fade" role="dialog">
     <form action="addBandHomeWrite.do" method="post" id="writeForm" name="writeForm">
      <div class="modal-dialog" style="width: 650px;">

        <!-- Modal content-->
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" id="add-write-del">&times;</button>
            <h4 class="modal-title text-center">글쓰기</h4>
          </div>
          <div class="modal-body">
            <div class="row">
            
                <div class="col-sm-12 bonmumBody">
                	
                    <textarea name="contents" id="ir1" rows="10" cols="60"></textarea>
                   
                </div>
                <div class="col-sm-12 new-content-icon">
                       <!--  <a href="#"><img src="/link/resources/images/new_photo.PNG" data-toggle="tooltip" data-placement="top" title="사진" alt="사진" id="addPhoto"></a> -->
                       <!--  <a href="#"><img src="/link/resources/images/new_player.PNG" data-toggle="tooltip" data-placement="top" title="동영상" alt="동영상" id="addVideo"></a> -->
                        <a href="#"><img src="/link/resources/images/new_vote.PNG" data-toggle="tooltip" data-placement="top" title="투표" alt="투표" id="addVote"></a>
                       <!-- <a href="#"><img src="/link/resources/images/new_file.PNG" data-toggle="tooltip" data-placement="top" title="파일" alt="파일" id="addFile"></a> -->
                        <a href="#"><img src="/link/resources/images/new_map.PNG" data-toggle="tooltip" data-placement="top" title="지도" alt="맵" id="addMap"></a>
                        <a href="#"><img src="/link/resources/images/new_todo.PNG" data-toggle="tooltip" data-placement="top" title="To-Do" alt="todo" id="addTodo"></a>
                        <a href="#"><img src="/link/resources/images/new_join.PNG" data-toggle="tooltip" data-placement="top" title="참가 신청서" alt="참가신청서" id="addJoin"></a>
                        <a href="#"><img src="/link/resources/images/new_cal.PNG" data-toggle="tooltip" data-placement="top" title="일정" alt="일정" id="addCal"></a>
                        <a href="#"><img src="/link/resources/images/new_nbbang.PNG" data-toggle="tooltip" data-placement="top" title="N빵" alt="n빵" id="addNbbang"></a>
                </div>
            </div>
          </div>
          <div class="modal-footer" style="padding: 10px">
               <div class="row">
                   <div class="col-sm-9 text-left"
                       style="padding-top: 10px; padding-left: 30px;">
                        <div class="row">
                            <div class="col-sm-3">
                                <strong>공지로 등록</strong>
                            </div>
                            <div class="col-sm-7">
                                <input type="checkbox" name="noticeYn" value="Y"/>
                            </div>
                        </div>
                   </div>
                   <div class="col-sm-3">
                 
                   		<input type="hidden" value="${param.bandNo }" name="bandNo">
                   		<input type="hidden" name="writeNo" value="">
                       <button type="button" id="addBandHomeWrite" class="btn btn-default add-new-modal">작성</button>
                   </div>
               </div>
          </div>
        </div>

      </div>
      </form>
    </div>
    <!--글 등록 모달 끝-->
    
    
    <!-- 글 수정 모달 -->
    <div id="update_contents" class="modal fade" role="dialog">
     <form action="addBandHomeWrite.do" method="post" id="writeForm" name="writeForm">
      <div class="modal-dialog" style="width: 650px;">

        <!-- Modal content-->
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" id="add-write-del">&times;</button>
            <h4 class="modal-title text-center">글쓰기</h4>
          </div>
          <div class="modal-body">
            <div class="row">
            
                <div class="col-sm-12 bonmumBody">
                	
                    <textarea name="contents" id="ir1" rows="10" cols="60"></textarea>
                   
                </div>
                <div class="col-sm-12 new-content-icon">
                       <!--  <a href="#"><img src="/link/resources/images/new_photo.PNG" data-toggle="tooltip" data-placement="top" title="사진" alt="사진" id="addPhoto"></a> -->
                       <!--  <a href="#"><img src="/link/resources/images/new_player.PNG" data-toggle="tooltip" data-placement="top" title="동영상" alt="동영상" id="addVideo"></a> -->
                        <a href="#"><img src="/link/resources/images/new_vote.PNG" data-toggle="tooltip" data-placement="top" title="투표" alt="투표" id="addVote"></a>
                       <!-- <a href="#"><img src="/link/resources/images/new_file.PNG" data-toggle="tooltip" data-placement="top" title="파일" alt="파일" id="addFile"></a> -->
                        <a href="#"><img src="/link/resources/images/new_map.PNG" data-toggle="tooltip" data-placement="top" title="지도" alt="맵" id="addMap"></a>
                        <a href="#"><img src="/link/resources/images/new_todo.PNG" data-toggle="tooltip" data-placement="top" title="To-Do" alt="todo" id="addTodo"></a>
                        <a href="#"><img src="/link/resources/images/new_join.PNG" data-toggle="tooltip" data-placement="top" title="참가 신청서" alt="참가신청서" id="addJoin"></a>
                        <a href="#"><img src="/link/resources/images/new_cal.PNG" data-toggle="tooltip" data-placement="top" title="일정" alt="일정" id="addCal"></a>
                        <a href="#"><img src="/link/resources/images/new_nbbang.PNG" data-toggle="tooltip" data-placement="top" title="N빵" alt="n빵" id="addNbbang"></a>
                </div>
            </div>
          </div>
          <div class="modal-footer" style="padding: 10px">
               <div class="row">
                   <div class="col-sm-9 text-left"
                       style="padding-top: 10px; padding-left: 30px;">
                        <div class="row">
                            <div class="col-sm-3">
                                <strong>공지로 등록</strong>
                            </div>
                            <div class="col-sm-7">
                                <input type="checkbox" name="noticeYn" value="Y"/>
                            </div>
                        </div>
                   </div>
                   <div class="col-sm-3">
                 
                   		<input type="hidden" value="${param.bandNo }" name="bandNo">
                   		<input type="hidden" name="writeNo" value="">
                       <button type="submit" id="addBandHomeWrite" class="btn btn-default add-new-modal">작성</button>
                   </div>
               </div>
          </div>
        </div>

      </div>
      </form>
    </div>
    <!-- 글수정 모달 끝 -->
    
    
    <!-- 투표 모달 -->
    <div id="vote_modal" class="modal fade" role="dialog" style="z-index: 2000">
      <div class="modal-dialog">
      <form action="addVote" method="post" id="voteForm" name="voteForm">

        <!-- Modal content-->
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title text-center"><strong>투표</strong></h4>
          </div>
          <div class="modal-body">
            
            <div class="row">
                <div class="row">
                	<!-- writeNo -->
                	<input type="hidden" name="writeNo" value="">
                	
                    <div class="col-sm-12 modal-vote-title">
                        <input type="text" placeholder="제목" name="title"/>
                    </div>
                </div>
                
                <div class="voteHangmoc">
	                <!--투표 항목-->
	               <div class="row">
	                    <div class="col-sm-12 modal-vote-contents">
	                       <div class="row">
	                           <div class="col-sm-1">
	                                <span class="vote-num">1</span>
	                           </div>
	                           <div class="col-sm-11">
	                                <input type="text" placeholder="제목" name="hangmoc"/>       
	                           </div>
	                       </div>
	                    </div>
	                </div>
	                <!--투표 항목 끝-->
	                
	                
	                <!--투표항목 2-->
	                <div class="row">
	                    <div class="col-sm-12 modal-vote-contents">
	                       <div class="row">
	                           <div class="col-sm-1">
	                                <span class="vote-num">2</span>
	                           </div>
	                           <div class="col-sm-11">
	                                <input type="text" placeholder="제목" name="hangmoc"/>       
	                           </div>
	                       </div>
	                    </div>
	                </div>
	                <!--투표항목 2 끝-->
                </div>
                
                <a href="" class="voteHangPlus">
	                <div class="row vote-option-row" style="padding-bottom: 15px;">
	                    <div class="col-sm-1">
	                        <span class="glyphicon glyphicon-plus"></span>
	                    </div>
	                    <div class="col-sm-11">
	                        <span>항목추가</span>
	                    </div>
	                </div>
                </a>
                

                <div class="row vote-option-row">
                    <div class="col-sm-1">
                        <input type="checkbox" class="checkbox" value="Y" name="everyOneAdd">
                    </div>
                    <div class="col-sm-11">
                        <span>누구나 항목 추가</span>
                    </div>
                </div>
                <div class="row vote-option-row">
                    <div class="col-sm-1">
                        <input type="checkbox" class="checkbox" value="Y" name="MultipleYn">
                    </div>
                    <div class="col-sm-11">
                        <span>복수 선택 허용</span>
                    </div>
                </div>
                
                <!--
               <div class="row vote-option-row">
                    <div class="col-sm-1">
                        <input type="checkbox" class="checkbox">
                    </div>
                    <div class="col-sm-3">
                        <span>종료일 설정</span>
                    </div>
                    <div class="col-sm-4 vote-end-date">
                        <input type="date">
                    </div>
                    <div class="col-sm-4 vote-end-time">
                        <select>
                            <option value="0000">오전 12:00</option>
                            <option value="0030">오전 12:30</option>
                            <option value="0100">오전 01:00</option>
                            <option value="0130">오전 01:30</option>
                            <option value="0200">오전 02:00</option>
                            <option value="0230">오전 02:30</option>
                            <option value="0300">오전 03:00</option>
                            <option value="0330">오전 03:30</option>
                            <option value="0400">오전 04:00</option>
                            <option value="0430">오전 04:30</option>
                            <option value="0500">오전 05:00</option>
                            <option value="0530">오전 05:30</option>
                            <option value="0600">오전 06:00</option>
                            <option value="0630">오전 06:30</option>
                            <option value="0700">오전 07:00</option>
                            <option value="0730">오전 07:30</option>
                            <option value="0800">오전 08:00</option>
                            <option value="0830">오전 08:30</option>
                            <option value="0900">오전 09:00</option>
                            <option value="0930">오전 09:30</option>
                            <option value="1000">오전 10:00</option>
                            <option value="1030">오전 10:30</option>
                            <option value="1100">오전 11:00</option>
                            <option value="1130">오전 11:30</option>
                            <option value="1200">오후 12:00</option>
                            <option value="1230">오후 12:30</option>
                            <option value="1300">오후 01:00</option>
                            <option value="1330">오후 01:30</option>
                            <option value="1400">오후 02:00</option>
                            <option value="1430">오후 02:30</option>
                            <option value="1500">오후 03:00</option>
                            <option value="1530">오후 03:30</option>
                            <option value="1600">오후 04:00</option>
                            <option value="1630">오후 04:30</option>
                            <option value="1700">오후 05:00</option>
                            <option value="1730">오후 05:30</option>
                            <option value="1800">오후 06:00</option>
                            <option value="1830">오후 06:30</option>
                            <option value="1900">오후 07:00</option>
                            <option value="1930">오후 07:30</option>
                            <option value="2000">오후 08:00</option>
                            <option value="2030">오후 08:30</option>
                            <option value="2100">오후 09:00</option>
                            <option value="2130">오후 09:30</option>
                            <option value="2200">오후 10:00</option>
                            <option value="2230">오후 10:30</option>
                            <option value="2300">오후 11:00</option>
                            <option value="2330">오후 11:30</option>
                        </select>
                    </div>
                </div>
                -->
                
                <hr/>
                <div class="row vote-option-row" style="margin-bottom: 10px">
                    <div class="col-sm-6">
                        <span>투표 현황 보기</span>
                    </div>
                    <div class="col-sm-6 vote-end-time">
                        <select name="currentView">
                            <option value="always" selected="selected">항상 보기</option>
                            <option value="voteafter">투표 참여 후 보기</option>
                            <option value="voteEnd">투표 종료 후 보기</option>
                        </select>
                    </div>
                </div>
                <div class="row vote-option-row">
                    <div class="col-sm-6 ">
                        <span>투표 항목 정렬</span>
                    </div>
                    <div class="col-sm-6 vote-end-time">
                        <select name="solt">
                            <option value="sunbun" selected="selected">항목 번호 순</option>
                            <option value="votesun">득표순</option>
                        </select>
                    </div>
                </div>
            </div>
            
          </div>
          <div class="modal-footer" style="padding: 10px">
               <div class="row">
                   <div class="col-sm-12 text-center">
                       <button type="button" class="btn btn-default add-new-modal" data-dismiss="modal">취소</button>
                       <button type="button" class="btn btn-primary add-new-modal" data-dismiss="modal" id="addVoteDB">확인</button>
                   </div>
               </div>
          </div>
        </div>
		</form>
      </div>
    </div>
    <!--투표 모달 끝-->
    
    <!--to-do모달-->
    <div id="todo_modal" class="modal fade" role="dialog" style="z-index: 2000">
      <div class="modal-dialog">
      <form action="addTodo" method="post" id="todoForm" name="todoForm">

        <!-- Modal content-->
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title text-center"><strong>To-Do</strong></h4>
          </div>
          <div class="modal-body">
            
            <div class="row">
                <div class="row">
                <input type="hidden" name="writeNo" value="">
                    <div class="col-sm-12 modal-vote-title">
                        <input type="text" placeholder="제목" name="title"/>
                    </div>
                </div>
                
                <!--항목 입력-->
                <div class="row modal-todo-contents">
                    <ul>
                        <li>
                            <input type="text" placeholder="항목 입력" name="hangmoc"/>
                        </li>
                        
                    </ul>   
                </div>
                <!--항목 입력 끝-->
                
                <div class="row todo-option-row">
                	<a href="#" class="add-Todo-Hangmoc" style="color:black;">
	                    <div class="col-sm-1">
	                        <span class="glyphicon glyphicon-plus"></span>
	                    </div>
	                    <div class="col-sm-11">
	                        <span>항목추가</span>
	                    </div>
                    </a>
                </div>
                <div class="row vote-option-row">
                    <div class="col-sm-1">
                        <input type="checkbox" class="checkbox" value="Y" name="everybody">
                    </div>
                    <div class="col-sm-11">
                        <span>누구나 항목 추가</span>
                    </div>
                </div>
                
                <!-- 마감일 설정
                <div class="row vote-option-row">
                    <div class="col-sm-1">
                        <input type="checkbox" class="checkbox">
                    </div>
                    <div class="col-sm-3">
                        <span>마감일 설정</span>
                    </div>
                    <div class="col-sm-4 vote-end-date">
                        <input type="date">
                    </div>
                    <div class="col-sm-4 vote-end-time">
                        <select>
                            <option value="0000">오전 12:00</option>
                            <option value="0030">오전 12:30</option>
                            <option value="0100">오전 01:00</option>
                            <option value="0130">오전 01:30</option>
                            <option value="0200">오전 02:00</option>
                            <option value="0230">오전 02:30</option>
                            <option value="0300">오전 03:00</option>
                            <option value="0330">오전 03:30</option>
                            <option value="0400">오전 04:00</option>
                            <option value="0430">오전 04:30</option>
                            <option value="0500">오전 05:00</option>
                            <option value="0530">오전 05:30</option>
                            <option value="0600">오전 06:00</option>
                            <option value="0630">오전 06:30</option>
                            <option value="0700">오전 07:00</option>
                            <option value="0730">오전 07:30</option>
                            <option value="0800">오전 08:00</option>
                            <option value="0830">오전 08:30</option>
                            <option value="0900">오전 09:00</option>
                            <option value="0930">오전 09:30</option>
                            <option value="1000">오전 10:00</option>
                            <option value="1030">오전 10:30</option>
                            <option value="1100">오전 11:00</option>
                            <option value="1130">오전 11:30</option>
                            <option value="1200">오후 12:00</option>
                            <option value="1230">오후 12:30</option>
                            <option value="1300">오후 01:00</option>
                            <option value="1330">오후 01:30</option>
                            <option value="1400">오후 02:00</option>
                            <option value="1430">오후 02:30</option>
                            <option value="1500">오후 03:00</option>
                            <option value="1530">오후 03:30</option>
                            <option value="1600">오후 04:00</option>
                            <option value="1630">오후 04:30</option>
                            <option value="1700">오후 05:00</option>
                            <option value="1730">오후 05:30</option>
                            <option value="1800">오후 06:00</option>
                            <option value="1830">오후 06:30</option>
                            <option value="1900">오후 07:00</option>
                            <option value="1930">오후 07:30</option>
                            <option value="2000">오후 08:00</option>
                            <option value="2030">오후 08:30</option>
                            <option value="2100">오후 09:00</option>
                            <option value="2130">오후 09:30</option>
                            <option value="2200">오후 10:00</option>
                            <option value="2230">오후 10:30</option>
                            <option value="2300">오후 11:00</option>
                            <option value="2330">오후 11:30</option>
                        </select>
                    </div>
               
                <hr/>
            </div>
            -->
            
          </div>
          <div class="modal-footer" style="padding: 10px">
               <div class="row">
                   <div class="col-sm-12 text-center">
                       <button type="button" class="btn btn-default add-new-modal" data-dismiss="modal">취소</button>
                       <button type="button" class="btn btn-primary add-new-modal" data-dismiss="modal" id="addTodoDb">확인</button>
                   </div>
               </div>
          </div>
        </div>

      </div>
      </form>
    </div>
    </div>
    <!--to-do모달 끝-->
    
    
    <!--참가신청서 모달-->
    <div id="join_modal" class="modal fade" role="dialog" style="z-index: 2000;">
      <div class="modal-dialog">
      <form action="addJoin" method="post" id="joinForm" name="joinForm">

        <!-- Modal content-->
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title text-center"><strong>참가 신청서</strong></h4>
          </div>
          <div class="modal-body">
            <div class="row">
                <div class="row">
                <input type="hidden" name="writeNo" value="">
                    <div class="col-sm-12 modal-vote-title">
                        <input type="text" placeholder="제목" name="title"/>
                    </div>
                </div>
                
                <div class="row join-date-row">
                    <div class="col-sm-2">
                        <span>날짜</span>
                    </div>
                    <div class="col-sm-6 join-date">
                        <input type="date" name="startDate">
                    </div>
                </div>
                
                <!--항목 입력-->
                <div class="row modal-join-contents">
                    <ul>
                        <li>
                            <input type="text" placeholder="일정 입력" name="hangmoc"/>
                        </li>
                        
                    </ul>   
                </div>
                <!--항목 입력 끝-->
                
                <div class="row todo-option-row">
                    <div class="col-sm-2">
                        <span class="" style=" position: relative; top: 7.8px; left: -7px; ">인원제한</span>
                    </div>
                    <div class="col-sm-9" style=" padding-left: 10px; ">
                        <input type="number" style=" border: 1px solid #eee; background-color: #f8f8f8; color: #999; height: 30px;" name="pepleLimit">
                    </div>
                </div>
                
                <div class="row todo-option-row">
                	<a href="#" class="add-join-Hangmoc" style="color:black;">
	                    <div class="col-sm-1">
	                        <span class="glyphicon glyphicon-plus"></span>
	                    </div>
	                    <div class="col-sm-11">
	                        <span>항목추가</span>
	                    </div>
                    </a>
                </div>
                
                <div class="row vote-option-row">
                    <div class="col-sm-1">
                        <input type="checkbox" class="checkbox" name="endTimeCheck" value="Y">
                    </div>
                    <div class="col-sm-3">
                        <span>마감일 설정</span>
                    </div>
                    <div class="col-sm-4 vote-end-date">
                        <input type="date" name="endDate">
                    </div>
                    <div class="col-sm-4 vote-end-time">
                        <select name="endTime">
                            <option value="0000">오전 12:00</option>
                            <option value="0030">오전 12:30</option>
                            <option value="0100">오전 01:00</option>
                            <option value="0130">오전 01:30</option>
                            <option value="0200">오전 02:00</option>
                            <option value="0230">오전 02:30</option>
                            <option value="0300">오전 03:00</option>
                            <option value="0330">오전 03:30</option>
                            <option value="0400">오전 04:00</option>
                            <option value="0430">오전 04:30</option>
                            <option value="0500">오전 05:00</option>
                            <option value="0530">오전 05:30</option>
                            <option value="0600">오전 06:00</option>
                            <option value="0630">오전 06:30</option>
                            <option value="0700">오전 07:00</option>
                            <option value="0730">오전 07:30</option>
                            <option value="0800">오전 08:00</option>
                            <option value="0830">오전 08:30</option>
                            <option value="0900">오전 09:00</option>
                            <option value="0930">오전 09:30</option>
                            <option value="1000">오전 10:00</option>
                            <option value="1030">오전 10:30</option>
                            <option value="1100">오전 11:00</option>
                            <option value="1130">오전 11:30</option>
                            <option value="1200">오후 12:00</option>
                            <option value="1230">오후 12:30</option>
                            <option value="1300">오후 01:00</option>
                            <option value="1330">오후 01:30</option>
                            <option value="1400">오후 02:00</option>
                            <option value="1430">오후 02:30</option>
                            <option value="1500">오후 03:00</option>
                            <option value="1530">오후 03:30</option>
                            <option value="1600">오후 04:00</option>
                            <option value="1630">오후 04:30</option>
                            <option value="1700">오후 05:00</option>
                            <option value="1730">오후 05:30</option>
                            <option value="1800">오후 06:00</option>
                            <option value="1830">오후 06:30</option>
                            <option value="1900">오후 07:00</option>
                            <option value="1930">오후 07:30</option>
                            <option value="2000">오후 08:00</option>
                            <option value="2030">오후 08:30</option>
                            <option value="2100">오후 09:00</option>
                            <option value="2130">오후 09:30</option>
                            <option value="2200">오후 10:00</option>
                            <option value="2230">오후 10:30</option>
                            <option value="2300">오후 11:00</option>
                            <option value="2330">오후 11:30</option>
                        </select>
                    </div>
               
                <hr/>
            </div>
            
          </div>
          <div class="modal-footer" style="padding: 10px">
               <div class="row">
                   <div class="col-sm-12 text-center">
                       <button type="button" class="btn btn-default add-new-modal" data-dismiss="modal">취소</button>
                       <button type="button" class="btn btn-primary add-new-modal" data-dismiss="modal" id="addJoinDb">확인</button>
                   </div>
               </div>
          </div>
        </div>

      </div>
      </form>
    </div>
    </div>
    <!--참가신청서 모달 끝-->
    
    <!--N빵 모달-->
    <div id="nbbang_modal" class="modal fade" role="dialog">
      <div class="modal-dialog">
      <form action="addNbbangFrom" method="post" name="nbbForm" id="nbbForm">

        <!-- Modal content-->
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close nbbang-close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title text-center">N빵 계산기</h4>
          </div>
          <div class="modal-body">
           <div class="row">
            <div class="row nbbang-row">
            <input type="hidden" name="writeNo" value="">
                <div class="col-sm-3 nbbang-col-3">
                    <span class="nbbang-kr">KRW(￦)</span>
                </div>
                <div class="col-sm-9 nbbnag-col-9 text-right">
                    <input type="number" placeholder="총 금액을 입력해주세요" name="nbbTotalPrice">
                </div>
            </div>
            
            <div class="row">
                <div class="col-sm-2 nbbang-col-2">
                    <img src="/link/resources/images/band_nbbang_member.PNG">
                </div>
                <div class="col-sm-7">
                    
                </div>
                <div class="col-sm-3 nbbnag-col-7">
                    <a href="#" id="nbbang_member" class="nbbNewMember" data-value="${param.bandNo }">멤버 선택 ></a>
                </div>
            </div>
            <hr/>
            <div class="row nbbang-modal-list">
	            <!--인원이 추가 됐을시 추가할때마다 알아서 계산-->
	            <!-- 
	            <div class="row">
	                <div class="col-sm-3 nbbang-col-2">
	                    <strong>이재헌 님</strong>
	                </div>
	                <div class="col-sm-9 nbbang-price">
	                    <input type="text" value="10,000" readonly>
	                </div>
	            </div>
	            -->
	            <!--인원 추가 칸 끝-->
            </div>
           </div>
          </div>
          <div class="modal-footer">
            <div class="row">
                   <div class="col-sm-12 text-center">
                       <button type="button" class="btn btn-default add-new-modal" data-dismiss="modal" id="cancelNbbItems">취소</button>
                       <button type="button" class="btn btn-primary add-new-modal" data-dismiss="modal" id="addNbbAndUpdate">확인</button>
                   </div>
               </div>
          </div>
        </div>
		</form>
      </div>
    </div>
    <!--N빵 모달 끝-->
    
    <!--N빵 인원추가 모달-->
    <div id="nbbang_member_modal" class="modal fade" role="dialog" style="z-index: 3000;">
      <div class="modal-dialog">
      <form action="addNbbangItems" method="post" name="nbbItemsForm" id="nbbItemsForm">

        <!-- Modal content-->
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close detail-view-close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title text-center">멤버 선택</h4>
          </div>
          <div class="modal-body">
           <div class="row" id="nbbang-member-id">
            <div class="row nbbang-row2">
                <div class="col-sm-2 nbbang-search-logo">
                    <span class="glyphicon glyphicon-search"></span>
                </div>
                <div class="col-sm-8 nbbang-search-name">
                    <input type="text" placeholder="이름" class="searchName"/>
                </div>
                <div class="col-sm-2 text-right" style="padding-right: 0px;">
                    <button type="button" class="btn shearchNbbName" data-value="${param.bandNo }">검색</button>
                </div>
            </div>
            
            <div class="row nbbang-member-row2">
                <div class="col-sm-9 nbbang-serch-col2">
                    <span>모두 선택</span>
                </div>
                
                <div class="col-sm-2 text-right">
                    <input type="checkbox" class="memberAllCheck"/>
                </div>
            </div>
            <hr/>
            
			<%-- <c:forEach var="members" items=""> --%>
				<!-- 
				<div class="row nbbang-member-row3">
	                <div class="col-sm-9 nbbang-serch-col2">
	                    <p class="memberIds"> 님</p>
	                </div>
	                <div class="col-sm-2 text-right">
	                    <input type="checkbox" class="member-checked"/>
	                </div>
	            </div>
	            		 -->	
			<%-- </c:forEach> --%>
            
           </div>
          </div>
          <div class="modal-footer">
            <div class="row">
                   <div class="col-sm-12 text-center">
                       <button type="button" class="btn btn-default add-new-modal" data-dismiss="modal">취소</button>
                       <button type="button" class="btn btn-primary add-new-modal" data-dismiss="modal" id="addNbbItems">확인</button>
                   </div>
               </div>
          </div>
        </div>
		</form>
      </div>
    </div>
    <!--N빵 인추가 모달 끝-->
    
       <!-- 글보기 모달 -->
    <div id="view_contents" class="modal fade" role="dialog">
     <form action="" method="post">
      <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close detail-view-close" data-dismiss="modal">&times;</button>
            <div class="modal-title">
                <div class="row contents-view-modal">
                    <div class="col-sm-11">
                       <div class="row">
                       <input type="hidden" name="writeNo" value="">
                            <div class="col-sm-2" style="padding-right: 0px;">
                                <strong>이재헌 님</strong>
                            </div>
                            <div class="col-sm-10 view-modal-crown">
                                <img src="/link/resources/images/band_leader.PNG">
                            </div>
                            <div class="col-sm-12">
                                <p>2019년 7월 25일 오전 10:39</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-1">
                       <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                        <img src="/link/resources/images/band_new_option.PNG">
                        </a>
                        <ul class="dropdown-menu" role="menu">
                            <li><a href="#">글 수정</a></li>
                            <li><a href="#">공지로 등록</a></li>
                            <li><a href="#">삭제하기</a></li>
                        </ul>
                        
                    </div>
                </div>
            </div>
          </div>
          <div class="modal-body">
            <div class="row view-detail-body">
               
                <div class="col-sm-12 view-count">
                   <span class="">0명</span> 읽었습니다.
                </div>
                
                <!--투표 뷰-->
                <!-- 
                <div class="modal-items">
                
                <div class="view-content-vote col-sm-12">
                  
                   <div class="view-content-vote-title">
                    <div class="row">
                        <div class="col-sm-12">
                            <img src="/link/resources/images/active_vote.PNG"> <span>투표중</span> 0명 참여
                        </div>
                        <div class="col-sm-12">
                            <strong>투표 제목</strong>
                        </div>
                        <div class="col-sm-12">
                            복수선택이 가능합니다.
                        </div>
                    </div>
                  </div>
                  
                  <div class="view-content-vote-body">
                      <div class="row">
                          <div class="col-sm-12">
                              <div class="row">
                                  <div class="col-sm-2">
                                      <input type="checkbox" />
                                  </div>
                                  <div class="col-sm-10">
                                      1 번 항목
                                  </div>
                              </div>
                              <hr/>
                              
                              <div class="row">
                                  <div class="col-sm-2">
                                      <input type="checkbox" />
                                  </div>
                                  <div class="col-sm-10">
                                      1 번 항목
                                  </div>
                              </div>
                              <hr/>
                              
                              <div class="row">
                                  <div class="col-sm-2">
                                      <input type="checkbox" />
                                  </div>
                                  <div class="col-sm-10">
                                      1 번 항목
                                  </div>
                              </div>
                              <hr/>
                              
                              <div class="row view-content-vote-footer">
                                  <div class="col-sm-12 text-center">
                                      <button type="button" class="btn btn-default">종료</button>
                                  </div>
                              </div>
                          </div>
                      </div>
                  </div>
                </div>
                </div>
                -->
                <!--투표뷰 끝-->
                
                
                <!--투두 뷰-->
                <!-- 
                <div class="modal-items">
                
                <div class="view-content-vote col-sm-12">
                  
                   <div class="view-content-vote-title">
                    <div class="row">
                        <div class="col-sm-12">
                            <img src="/link/resources/images/active_todo.PNG"> <span>To-Do</span> 1/3개 완료
                        </div>
                        <div class="col-sm-12">
                            <strong>To-Do 제목</strong>
                        </div>
                        <div class="col-sm-12" style="color: #34cc6c;">
                            참여가 마감되었습니다.
                        </div>
                    </div>
                  </div>
                  
                  <div class="view-content-vote-body">
                      <div class="row">
                          <div class="col-sm-12">
                              <div class="row">
                                  <div class="col-sm-2">
                                      <input type="checkbox" />
                                  </div>
                                  <div class="col-sm-10">
                                      1 번 항목
                                  </div>
                              </div>
                              <hr/>
                              
                              <div class="row">
                                  <div class="col-sm-2">
                                      <input type="checkbox" />
                                  </div>
                                  <div class="col-sm-10">
                                      1 번 항목
                                  </div>
                              </div>
                              <hr/>
                              
                              <div class="row">
                                  <div class="col-sm-2">
                                      <input type="checkbox" />
                                  </div>
                                  <div class="col-sm-10">
                                      1 번 항목
                                  </div>
                              </div>
                              <hr/>
                              
                              <div class="row view-content-vote-footer">
                                  
                              </div>
                          </div>
                      </div>
                  </div>
                </div>
                </div>
                -->
                <!--To-Do뷰 끝-->
                
                <!--참가신청 뷰-->
                <!-- 
                <div class="modal-items">
                
                <div class="view-content-vote col-sm-12">
                  
                   <div class="view-content-vote-title">
                    <div class="row">
                        <div class="col-sm-12">
                            <img src="/link/resources/images/active_join.PNG"> <span>참가 신청서</span>
                        </div>
                        <div class="col-sm-12">
                            <strong style="font-size: 20px;">참가 신청서 제목</strong>
                        </div>
                        
                    </div>
                  </div>
                  
                  <div class="view-content-vote-body">
                      <div class="row">
                         <div class="col-sm-12" style="padding: 10px 0px 14px 25px;">
                             <strong>2019년 7월 26일 금요일</strong>
                         </div>
                          <div class="col-sm-12">
                              <div class="row">
                                  <div class="col-sm-2">
                                      <input type="checkbox" />
                                  </div>
                                  <div class="col-sm-10">
                                      1 번 항목
                                  </div>
                              </div>
                              <hr/>
                              
                              <div class="row">
                                  <div class="col-sm-2">
                                      <input type="checkbox" />
                                  </div>
                                  <div class="col-sm-10">
                                      1 번 항목
                                  </div>
                              </div>
                              <hr/>
                              
                              <div class="row">
                                  <div class="col-sm-2">
                                      <input type="checkbox" />
                                  </div>
                                  <div class="col-sm-10">
                                      1 번 항목
                                  </div>
                              </div>
                              <hr/>
                              
                              <div class="row view-content-vote-footer">
                                  
                              </div>
                          </div>
                      </div>
                  </div>
                </div>
                </div>
                -->
                <!--참가신청뷰 끝-->
                
                <!--N빵 뷰-->
                <!-- 
                <div class="modal-items">
                
                <div class="view-content-vote col-sm-12">
                  
                   <div class="view-content-vote-title">
                    <div class="row">
                        <div class="col-sm-12">
                            <img src="/link/resources/images/active_nbbang.PNG"> <span>N빵</span> 0명 냈음
                        </div>
                        <div class="col-sm-12">
                            <strong style="font-size: 20px;"> ￦ 100,000</strong> / 3명
                        </div>
                        
                    </div>
                  </div>
                  
                  <div class="view-content-vote-body">
                      <div class="row">

                          <div class="col-sm-12">
                          
                              <div class="row">
                                  <div class="col-sm-3">
                                      <strong>이재헌 님</strong>
                                  </div>
                                  <div class="col-sm-8">
                                      ￦ 3,000
                                  </div>
                                  <div class="col-sm-1 text-right">
                                      <input type="checkbox" />
                                  </div>
                              </div>
                              
                              <div class="row">
                                  <div class="col-sm-3">
                                      <strong>강희경 님</strong>
                                  </div>
                                  <div class="col-sm-8">
                                      ￦ 3,000
                                  </div>
                                  <div class="col-sm-1 text-right">
                                      <input type="checkbox" />
                                  </div>
                              </div>
                              <div class="row">
                                  <div class="col-sm-3">
                                      <strong>안병민 님</strong>
                                  </div>
                                  <div class="col-sm-8">
                                      ￦ 3,000
                                  </div>
                                  <div class="col-sm-1 text-right">
                                      <input type="checkbox" />
                                  </div>
                              </div>
                              
                              <hr/>
                              
                              <div class="row view-content-vote-footer">
                                  
                              </div>
                          </div>
                      </div>
                  </div>
                </div>
                </div>
                -->
                <!--참가신청뷰 끝-->
                
            </div>
          </div>
          
          <div class="modal-footer" style="padding: 10px; border-top-width: 0px;">
              <div class="col-sm-12">
                      
                       <div class="row">
                           <div class="col-sm-10" style="padding-right: 0px; padding-left: 0px;">
                               <input type="text" class="form-control band-new-command" placeholder="댓글을 남겨주세요" aria-describedby="sizing-addon3"/>
                           </div>
                           <div class="col-sm-2" style="padding-left: 0px; padding-right: 0px;">
                                <button type="button" class="btn btn-default" style="width: 100%; height: 30px;font-size: 90%; color: #5c5a5a">보내기</button>    
                           </div>
                       </div>
                    </div>
          </div>
        </div>

      </div>
      </form>
    </div>
    <!--글 보기 모달 끝--> 

    <script>
		var oEditors = [];
		
			$(function () {
                
				$('[data-toggle="tooltip"]').tooltip()
				
				$('.band-view-contants .btn-success').remove();
                
				// 글 나온것들 중에서 글수정
				
				
				/* 로그인 안하고 새글 작성 누를시 알람 */
				$(".login-after-contents").click(function(){
					alert("밴드가입 및 로그인 후 이용해 주세요.");
				})
				
                /*글 작성 모달 열기*/
                $('.band-new-contents').click(function(){
                	/* $('.bonmumBody').empty() */
					$('#ir1').val("");                    
                	$('#new_contents').modal('show');
                	
                	var bandNo = $('[name=bandNo]').val();

                	$.ajax({
                		type:"GET",
                		url:"bandContentAdd.do",
                		dataType:"text",
                		data:{bandNo:bandNo},
                		success:function(writeNo){
                			$('[name=writeNo]').val(writeNo);
                			/* <input type="hidden" name="writeNo" value=""> */
                		}
                	})
                	
                });
				
				$('#new_contents').on('click', '#addBandHomeWrite', function(){
					
				})
				
				/* 글쓰기 취소할때 삭제하기 */
				$('#new_contents').on('click', '#add-write-del', function(){
					var bandNo = $('[name=writeNo]').val();
                	
					$.ajax({
						type:"GET",
						url:"bandCancelDel.do",
						data:{bandNo:bandNo}
					})
				})
                
                /* 투표모달 열기*/ 
                $('#new_contents').on('click','#addVote',function(event){
                    event.preventDefault();
                    $("#voteForm")[0].reset();
                    /* var sHTML = '<h1>aaaaaaaaaaa</h1>'
                    oEditors.getById["ir1"].exec("PASTE_HTML", [sHTML]); */
                    
                    $('.voteHangmoc > div:gt(1)').remove();
                    num = 2;
                    $('#vote_modal').modal('show');
					
    				
                });
                
                    /* 투표 항목 추가 */
					var num = parseInt(2);
					$('.voteHangPlus').click(function(event){
						event.preventDefault();
						
					    num = num+1;
						
						var row = '<div class="row">'
					                    +'<div class="col-sm-12 modal-vote-contents">'
					                    +'<div class="row">'
					                        +'<div class="col-sm-1">'
					                             +'<span class="vote-num">'+num+'</span>'
					                        +'</div>'
					                        +'<div class="col-sm-11">'
					                             +'<input type="text" placeholder="제목" name="hangmoc"/>'       
					                        +'</div>'
					                    +'</div>'
					                 +'</div>'
					             +'</div>';
					    
						$('.voteHangmoc').append(row);
					})
                
                /* 글쓰기 추가 */
				/* 1. 투표 */
				$('#vote_modal').on('click', '#addVoteDB', function(event){
					var voteQueryString = $('form[name=voteForm]').serialize();
					
					$.ajax({
						type: 'post',
						url: 'bandAddVote.do',
						data : voteQueryString,
						success:function(vote){
							/* var sHTML = '<h1>aaaaaaaaaaa</h1>'
		                    oEditors.getById["ir1"].exec("PASTE_HTML", [sHTML]); */
		                    
		                    var row = '<div class="row contents-view-standart" data-type="vote" data-no="'+vote.voteNo+'" id="seVote-'+vote.voteNo+'" style="border:1px solid #ddd;padding-top: 15px;padding-bottom: 15px;position: relative;background-color: #fcfcfc;">'
		                    		  	+'<div class="col-xs-1">'
		                    				+'<img src="/link/resources/images/active_vote.PNG" class="contents-view-icon" alt="" style="height: 30px; position: relative; top: 5px;"/>'
		                    			+'</div>'
		                    		  	+'<div class="col-xs-9">'
		                    		  		+'<div class="row" style="font-size: 15px;">'
		                    		  			+'<div class="col-xs-12"><span style="color:#34cc6c;font-weight: 1000;">투표</span> 0명 참여</div>'
		                    		  			+'<div class="col-xs-12"><strong style="font-size:19px;">'+vote.title+'</strong></div>'
		                    		  		+'</div>'
		                    		  	+'</div>'
		                    		  	+'<div class="col-xs-2" style="position: relative;top: 5px;">'
		                    		  		/* +'<button type="button" class="btn btn-default btn-sm">수정</button>' */
		                    		  		+'<button type="button" class="btn btn-success btn-sm del-seVote" data-delValue="'+vote.voteNo+'">삭제</button>'
		                    		  	+'</div>'
		                    		 +'</div><br/>';

		                   oEditors.getById["ir1"].exec("PASTE_HTML", [row]);
						}
					})
				})
					
				/* 투표 삭제 */
				
					
                /* todo모달 열기*/ 
                $('#new_contents').on('click','#addTodo',function(event){
                    event.preventDefault();
                    $("#todoForm")[0].reset();
                   	$('.modal-todo-contents ul li:gt(0)').remove();
                    
                    $('#todo_modal').modal('show');
                    
                });
					
				/* Todo 항목추가 */
				$('#todo_modal').on('click', '.add-Todo-Hangmoc', function(event){
					event.preventDefault();
					
					var row = '<li>'
                        	  	+'<input type="text" placeholder="항목 입력" name="hangmoc"/>'
                             +'</li>';
					
					$('.modal-todo-contents ul').append(row);
				})
				
				/* Todo 글 등록하기 */
				$('#todo_modal').on('click', '#addTodoDb', function(){
					var todoQueryString = $('form[name=todoForm]').serialize();
					
					$.ajax({
						type: 'post',
						url: 'bandAddTodo.do',
						data : todoQueryString,
						success:function(todo){
							var row = '<div class="row contents-view-standart" data-type="todo" data-no="'+todo.todoNo+'" id="seTodo-'+todo.todoNo+'" style="border:1px solid #ddd;padding-top: 15px;padding-bottom: 15px;position: relative;background-color: #fcfcfc;">'
			                		  	+'<div class="col-xs-1">'
			                				+'<img src="/link/resources/images/active_todo.PNG" class="contents-view-icon" alt="" style="height: 30px; position: relative; top: 5px;"/>'
			                			+'</div>'
			                		  	+'<div class="col-xs-9">'
			                		  		+'<div class="row" style="font-size: 15px;">'
			                		  			+'<div class="col-xs-12"><span style="color:#34cc6c;font-weight: 1000;">To-Do</span> </div>'
			                		  			+'<div class="col-xs-12"><strong style="font-size:19px;">'+todo.title+'</strong></div>'
			                		  		+'</div>'
			                		  	+'</div>'
			                		  	+'<div class="col-xs-2" style="position: relative;top: 5px;">'
			                		  		/* +'<button type="button" class="btn btn-default btn-sm">수정</button>' */
			                		  		+'<button type="button" class="btn btn-success btn-sm del-seTodo" data-delValue="'+todo.todoNo+'">삭제</button>'
			                		  	+'</div>'
			                		 +'</div><br/>';

							oEditors.getById["ir1"].exec("PASTE_HTML", [row]);
						}
					})
				})
                
                /* join모달 열기*/ 
                $('#new_contents').on('click','#addJoin',function(event){
                    event.preventDefault();
                    $('#join_modal').modal('show');
                    $("#joinForm")[0].reset();
                   	$('.modal-join-contents ul li:gt(0)').remove();
                });
                
				/* join 항목추가 */
				$('#join_modal').on('click', '.add-join-Hangmoc', function(event){
					event.preventDefault();
					
					var row = '<li>'
                        	  	+'<input type="text" placeholder="일정 입력" name="hangmoc"/>'
                             +'</li>';
					
					$('.modal-join-contents ul').append(row);
				})
				
				/* Todo 글 등록하기 */
				$('#join_modal').on('click', '#addJoinDb', function(){
					var joinQueryString = $('form[name=joinForm]').serialize();
					
					$.ajax({
						type: 'post',
						url: 'bandAddJoin.do',
						data : joinQueryString,
						success:function(join){
							var row = '<div class="row contents-view-standart" data-type="join" data-no="'+join.joinNo+'" id="seJoin-'+join.joinNo+'" style="border:1px solid #ddd;padding-top: 15px;padding-bottom: 15px;position: relative;background-color: #fcfcfc;">'
			                		  	+'<div class="col-xs-1">'
			                				+'<img src="/link/resources/images/active_join.PNG" class="contents-view-icon" alt="" style="height: 30px; position: relative; top: 18px;"/>'
			                			+'</div>'
			                		  	+'<div class="col-xs-9">'
			                		  		+'<div class="row" style="font-size: 15px;">'
			                		  			+'<div class="col-xs-12"><span style="color:#34cc6c;font-weight: 1000;">참가 신청서</span> </div>'
			                		  			+'<div class="col-xs-12"><strong style="font-size:19px;">'+join.title+'</strong></div>'
			                		  			+'<div class="col-xs-12"><span style="color: #999; font-weight: 560;">'+join.startDateStr+'</span></div>'
			                		  		+'</div>'
			                		  	+'</div>'
			                		  	+'<div class="col-xs-2" style="position: relative;top: 20px;">'
			                		  		/* +'<button type="button" class="btn btn-default btn-sm">수정</button>' */
			                		  		+'<button type="button" class="btn btn-success btn-sm del-seJoin" data-delValue="'+join.joinNo+'">삭제</button>'
			                		  	+'</div>'
			                		 +'</div><br/>';

							oEditors.getById["ir1"].exec("PASTE_HTML", [row]);
						}
					})
				})
				
				
                 /* n빵모달 열기*/ 
                 // 나중에 만들기 가입기능이 될깨 위에 참고해서 만들어야 한다.
                // 서비스와 sql은 모두 만들었으므로 ajax만 추가하면 된다.
                 $('#new_contents').on('click','#addNbbang',function(event){
                    event.preventDefault();
                    $('#nbbang_modal').modal('show');
                    var writeNo = $('[name=writeNo]').val();
                    
                    $.ajax({
                    	data : {writeNo:writeNo},
                    	type:'get',
                    	url:'bandAddNbbang.do',
                    	dataType:'text',
                    	success:function(nbbSeq){
                    		var row = '<input type="hidden" value="'+nbbSeq+'" name="nbbNo" />';
                    		
                    		$('#nbbang_modal .row:first').prepend(row);
                    		$('#nbbItemsForm').prepend(row);
                    	}
                    })
                });
				
				/* 엔빵 닫기 버튼시 삭제하기*/
				$('#nbbang_modal').on('click', '.nbbang-close', function(event){
					$('#nbbForm input[name=nbbTotalPrice]').val('');
                	$('#nbbItemsForm input[name=nbbNo]').remove();
                	$('.nbbang-priceCal-row').remove();
                	$('.nbbNewMember').prop("disabled", false);
                	
                	$('#nbbang_modal [name=nbbMemCount]').remove();
                	
					var nbbSeq = $('#nbbang_modal [name=nbbNo]').val();
					
					$.ajax({
						data : {nbbSeq:nbbSeq},
                    	type:'get',
                    	url:'bandDelNbbangStart.do'
					})
					$('#nbbang_modal input[name=nbbNo]').remove();
				})
				
				/* 엔빵 items(멤버들) 추가 */
				$('#nbbang_member_modal').on('click', '#addNbbItems', function(){
					var nbbNo = $('[name=nbbNo]').val();
					var people = new Array;
					
					$("input[name=people]:checked").each(function(){
						people.push($(this).val());
					})
					$.ajax({
						type: 'get',
						url: 'bandAddNbbItemsStart.do',
						data : $('#nbbItemsForm').serialize(),
						dataType:'json',
						success:function(nbbang) {
							$('.nbbNewMember').prop("disabled", true);
							
							var totalPrice = $('#nbbForm input[name=nbbTotalPrice]').val();
							var nPrice = totalPrice / nbbang.personCount;
							
							var row = '<input type="hidden" name="nbbMemCount" value="'+nbbang.personCount+'" />';
							$('#nbbForm').prepend(row);
							
							$.each(nbbang.people, function(index, item){
								var row = '<div class="row nbbang-priceCal-row">'
					                		+'<div class="col-sm-3 nbbang-col-2">'
			                    				+'<strong style="padding-left: 15px;">'+item+' 님</strong>'
			               					+'</div>'
			                				+'<div class="col-sm-9 nbbang-price">'
			                   					+'<input type="text" value="'+addComma(Math.ceil(nPrice))+' 원" class="nbbNPrice" readonly style="padding-right: 16px;">'
			                				+'</div>'
			            				  +'</div>';
								
								$('.nbbang-modal-list').append(row);
							})
						}
					})
				})
                
				/* 엔빵에서 총금액입력할때마다 값 저절로 변경 */
				$('#nbbang_modal').on('keyup', '#nbbForm input[name=nbbTotalPrice]', function(){
					var nbbTotalPrice = $('#nbbForm input[name=nbbTotalPrice]').val();
					var nbbCount = $('#nbbForm input[name=nbbMemCount]').val();
					
					var NPrice = nbbTotalPrice / nbbCount;
					
					$('.nbbNPrice').val(Math.ceil(NPrice) +'원');
				})
				
                /* n빵 멤버 모달 열기*/ 
                $('#nbbang_modal').on('click','#nbbang_member',function(event){
                    event.preventDefault();
                    $('#nbbang_member_modal').modal('show');
                });
                
                /* n빵 멤버선택 열기 */
                $('#nbbang_modal').on('click', '.nbbNewMember', function(event){
                	event.preventDefault();
                	var bandNo = $(this).attr('data-value');
                	
                	$('.memberAllCheck').prop('checked', false);
                	$('.nbbang-member-row3').remove();
					
                	$.ajax({
                		type:'get',
                		data:{bandNo:bandNo},
                		dataType:'json',
                		url:'bandNbbMember.do',
                		success:function(result){

							$.each(result, function(index, mem){
								var row = '<div class="row nbbang-member-row3">'
	        	                	  	+'<div class="col-sm-9 nbbang-serch-col2">'
		                   			  		+'<p class="memberIds"> '+mem.name+'님</p>'
		               				  	+'</div>'
		                			  	+'<div class="col-sm-2 text-right">'
		                    		  		+'<input type="checkbox" class="member-checked" name="people" value="'+mem.id+'"/>'
		                			  	+'</div>'
		            				  +'</div>';
		            				  
							$('#nbbang-member-id').append(row);
							})
                		}
                	})
                	//$('#nbbItemsForm input[name=nbbNo]').remove();
                })
                
                /* n빵 이름 검색 */
                $('#nbbang_member_modal').on('click', '.shearchNbbName', function(event){
                	$('.nbbang-member-row3').remove();
                	
                	var bandNo = $(this).attr('data-value');
                	var userName = $('.searchName').val();
                	
                	$('.memberAllCheck').prop('checked', false);
                
	                $.ajax({
	            		type:'get',
	            		data:{bandNo:bandNo, userName:userName},
	            		dataType:'json',
	            		url:'bandNbbNameSearch.do',
	            		success:function(result){
	
							$.each(result, function(index, mem){
								var row = '<div class="row nbbang-member-row3">'
	        	                	  	+'<div class="col-sm-9 nbbang-serch-col2">'
		                   			  		+'<p class="memberIds"> '+mem.name+'님</p>'
		               				  	+'</div>'
		                			  	+'<div class="col-sm-2 text-right">'
		                    		  		+'<input type="checkbox" class="member-checked" name="people" value="'+mem.id+'"/>'
		                			  	+'</div>'
		            				  +'</div>';
		            				  
							$('#nbbang-member-id').append(row);
							})
	            		}
	            	})
	            	//$('#nbbItemsForm input[name=nbbNo]').remove();
                })
                
                // 엔빵 최종등록 (사실 update)
                $('#nbbang_modal').on('click', '#addNbbAndUpdate', function(){
                	var price = $('#nbbForm input[name=nbbTotalPrice]').val();
                	var nbbNo = $('#nbbang_modal input[name=nbbNo]').val();
                	
                	$.ajax({
                		type:'get',
                		data:{nbbNo:nbbNo, price:price},
                		dataType:'json',
                		url:'bandWriteUpdateStart.do',
                		success:function(nbbang){
                			
                			var row = '<div class="row contents-view-standart" data-type="nbb" data-no="'+nbbang.nbbNo+'" id="seNbb-'+nbbang.nbbNo+'" style="border:1px solid #ddd;padding-top: 15px;padding-bottom: 15px;position: relative;background-color: #fcfcfc;">'
			                		  	+'<div class="col-xs-1">'
			                				+'<img src="/link/resources/images/active_nbbang.PNG" alt="" class="contents-view-icon" style="height: 30px; position: relative; top: 10px;"/>'
			                			+'</div>'
			                		  	+'<div class="col-xs-9">'
			                		  		+'<div class="row" style="font-size: 15px;">'
			                		  			+'<div class="col-xs-12"><span style="color:#34cc6c;font-weight: 1000;">N빵</span> </div>'
			                		  			+'<div class="col-xs-12"><strong style="font-size:19px;">￦'+addComma(nbbang.price)+' 원</strong></div>'
			                		  		+'</div>'
			                		  	+'</div>'
			                		  	+'<div class="col-xs-2" style="position: relative;top: 11px;">'
			                		  		/* +'<button type="button" class="btn btn-default btn-sm">수정</button>' */
			                		  		+'<button type="button" class="btn btn-success btn-sm del-seNbb" data-delValue="'+nbbang.nbbNo+'">삭제</button>'
			                		  	+'</div>'
			                		 +'</div><br/>';
			
							oEditors.getById["ir1"].exec("PASTE_HTML", [row]);
                		}
                	})
                	
                	// 전체 삭제
                	$('#nbbForm input[name=nbbTotalPrice]').val('');
                	$('#nbbItemsForm input[name=nbbNo]').remove();
                	$('.nbbang-priceCal-row').remove();
                	$('.nbbNewMember').prop("disabled", false);
                	$('#nbbang_modal [name=nbbMemCount]').remove();
                	$('#nbbang_modal input[name=nbbNo]').remove();
                })
                
                // 엔빵 취소시 삭제 하기
                $('#nbbang_modal').on('click', '#cancelNbbItems', function(){
                	$('#nbbForm input[name=nbbTotalPrice]').val('');
                	$('#nbbItemsForm input[name=nbbNo]').remove();
                	$('.nbbang-priceCal-row').remove();
                	$('.nbbNewMember').prop("disabled", false);
                	
                	$('#nbbang_modal [name=nbbMemCount]').remove();
                	
					var nbbSeq = $('#nbbang_modal [name=nbbNo]').val();
					
					$.ajax({
						data : {nbbSeq:nbbSeq},
                    	type:'get',
                    	url:'bandDelNbbangStart.do'
					})
					$('#nbbang_modal input[name=nbbNo]').remove();
                })
                
                /* 엔빵 멤버 모두 선택 */
                $('#nbbang_member_modal').on('click', '.memberAllCheck', function(event){
                	
                	var allCheck = $('.memberAllCheck').prop('checked');

					$('.member-checked').prop('checked', allCheck);
                })
                
                /* 모달로 등록글 보기*/ 
                $('.band-contents-body').click(function(event){
                    event.preventDefault();
                    var writeNo = $(this).attr("data-value")
                    
                   //$('.band-contents-body .contents-view-standart,.band-contents-body p').each(function(index, item){
                	   
                	$(this).find('.contents-view-standart, p, img').each(function(index, item){
                	
                    	var type = $(item).attr("data-type")
                    	var no = $(item).attr("data-no")
                    	
                    	if(type == 'vote'){
                    		
                    		$.ajax({
                    			type : 'get',
                    			data : {'type':type ,'no':no},
                    			dataType : 'json',
                    			url : 'bandContentDetailView.do',
                    			success : function(map){
                    				
                    				var row = '<div class="modal-items">'
				                            row += '<div class="view-content-vote col-sm-12">'
					                            row += '<div class="view-content-vote-title">'
						                            row += '<div class="row">'
							                            row += '<div class="col-sm-12">'
							                            	row += '<input type="hidden" name="vote-doing-no" vlaue="'+map.main.voteNo+'"/>'
							                          	  	row += '<img src="/link/resources/images/active_vote.PNG"> <span>투표중</span> 0명 참여'
							                            row += '</div>'
							                            row += '<div class="col-sm-12">'
							                            	row += '<strong>'+map.main.title+'</strong>'
							                            row += '</div>'
							                            row += '<div class="col-sm-12">'
							                            
							                            if(map.main.MultipleYn == 'Y'){
							                            	row += '복수선택이 가능합니다.'
							                            }
							                            if(map.main.MultipleYn == 'N'){
							                            	row += '복수선택이 안됩니다..'
							                            }
							                            
							                            row += '</div>'
						                            row += '</div>'
					                            row += '</div>'
					                            row += '<div class="view-content-vote-body">'
						                            row += '<div class="row">'
							                            row += '<div class="col-sm-12">'

							                            if(map.main.multipleYn == 'Y'){
							                            	$.each(map.sub, function(index, item){
																
																row += '<div class="row">'
										                            row += '<div class="col-sm-2">'
										                            	row += '<input type="checkbox" value="'+item.voteItemNo+'" class="doing-vote-click"/>'
										                            row += '</div>'
										                            row += '<div class="col-sm-10">'
										                            	row += item.hangmocSamll
										                            row += '</div>'
									                            row += '</div>'
								                            	row += '<hr/>'
								                            	
															})
							                            }
							                            if(map.main.multipleYn == 'N'){
															$.each(map.sub, function(index, item){
																
																row += '<div class="row">'
										                            row += '<div class="col-sm-2">'
										                            	row += '<input type="radio" value="'+item.voteItemNo+'" class="doing-vote-click"/>'
										                            row += '</div>'
										                            row += '<div class="col-sm-10">'
										                            	row += item.hangmocSamll
										                            row += '</div>'
									                            row += '</div>'
								                            	row += '<hr/>'
								                            	
															})
							                            }
								                            
								                            row += '<div class="row view-content-vote-footer">'
									                            row += '<div class="col-sm-12 text-center">'
									                            	row += '<button type="button" class="btn btn-default doing-vote-end">종료</button>'
									                            row += '</div>'
								                            row += '</div>'
						                          	  row += '</div>'
					                          	  row += '</div>'
				                            row += '</div>'
				                            row += '</div>'
			                            row += '</div>';
			                            
			                            $('.view-detail-body').append(row);
	                    			}
	                    		})
	                    	}
	                    	if(type == 'todo'){
	                    		
	                    		$.ajax({
	                    			type : 'get',
	                    			data : {'type':type ,'no':no},
	                    			dataType : 'json',
	                    			url : 'bandContentDetailView.do',
	                    			success : function(map){
	                    				
	                                    var row = '<div class="modal-items">'
	                                    
	                                    row +='<div class="view-content-vote col-sm-12">'
	                                      
	                                    	row +='<div class="view-content-vote-title">'
		                                    	row +='<div class="row">'
			                                    	row +='<div class="col-sm-12">'
			                                    		row += '<input type="hidden" name="todo-doing-no" vlaue="'+map.main.todoNo+'"/>'
			                                    		row +='<img src="/link/resources/images/active_todo.PNG"> <span>To-Do</span> 1/3개 완료'
			                                    	row +='</div>'
			                                    	row +='<div class="col-sm-12">'
			                                    		row +='<strong>"'+map.main.title+'"</strong>'
			                                    	row +='</div>'
			                                    	row +='<div class="col-sm-12" style="color: #34cc6c;">'
			                                    		row +='참여가 마감되었습니다.'
			                                    	row +='</div>'
		                                    	row +='</div>'
	                                		row +='</div>'
	                                      
	                                    	row +='<div class="view-content-vote-body">'
		                                    	row +='<div class="row">'
			                                    	row +='<div class="col-sm-12">'
			
				                                    	$.each(map.sub, function(index, item){
					                                    	row +='<div class="row">'
						                                    	row +='<div class="col-sm-2">'
						                                    		row +='<input type="checkbox" value="'+item.todoItemNo+'" class="doing-todo-click"/>'
						                                    	row +='</div>'
						                                    	row +='<div class="col-sm-10">'
						                                    		row += item.hangmocSmall
						                                    	row +='</div>'
					                                    	row +='</div>'
					                                    	row +='<hr/>'
				                                    	})          
				                                                  
				                                        row +='<div class="row view-content-vote-footer">'
				                                                      
				                                        row +='</div>'
			                                        row +='</div>'
		                                        row +='</div>'
	                                        row +='</div>'
	                                        row +='</div>'
	                                        row +='</div>'
	                                    
	                            	$('.view-detail-body').append(row);
	                    		}
	                    	})
	                   	 }
                    	if(type == 'join'){
                    		
                    		$.ajax({
                    			type : 'get',
                    			data : {'type':type ,'no':no},
                    			dataType : 'json',
                    			url : 'bandContentDetailView.do',
                    			success : function(map){
                    				
                    				var row = '<div class="modal-items">'
	                                    row +='<div class="view-content-vote col-sm-12">'
	                                    row +='<div class="view-content-vote-title">'
		                                    row +='<div class="row">'
			                                    row +='<div class="col-sm-12">'
			                                    	row += '<input type="hidden" name="join-doing-no" vlaue="'+map.main.JoinNo+'"/>'
			                                    	row +='<img src="/link/resources/images/active_join.PNG"> <span>참가 신청서</span>'
			                                    row +='</div>'
			                                    row +='<div class="col-sm-12">'
			                                    	row +='<strong style="font-size: 20px;">'+map.main.title+'</strong>'
			                                    row +='</div>'
		                                    row +='</div>'
	                                    row +='</div>'
	                                      
	                                    row +='<div class="view-content-vote-body">'
	                                    row +='<div class="row">'
		                                    row +='<div class="col-sm-12" style="padding: 10px 0px 14px 25px;">'
		                                    	row +='<strong>'+map.main.startDateStr+'</strong>'
		                                    row +='</div>'
	                                    row +='<div class="col-sm-12">'
	                                    
	                                    $.each(map.sub, function(index, item){
		                                    row +='<div class="row">'
			                                    row +='<div class="col-sm-2">'
			                                    	row +='<input type="checkbox" value="'+item.joinItemNo+'" class="doing-join-click"/>'
			                                    row +='</div>'
			                                    row +='<div class="col-sm-10">'
			                                    	row +=item.hangmocSmall
			                                    row +='</div>'
		                                    row +='</div>'
		                                    row +='<hr/>'
	                                    })
	                                    
	                                    row +='<div class="row view-content-vote-footer">'
	                                    row +='</div>'
	                                    row +='</div>'
	                                    row +='</div>'
	                                    row +='</div>'
	                                    row +='</div>'
	                                    row +='</div>'
	                                    
	                                    $('.view-detail-body').append(row);
                    			}
                    		})
                    
                   		}
                    	if(type == 'nbb'){
                    		
                    		$.ajax({
                    			type : 'get',
                    			data : {'type':type ,'no':no},
                    			dataType : 'json',
                    			url : 'bandContentDetailView.do',
                    			success : function(map){
                    			
                    				var row ='<div class="modal-items">'
	                                    	row +='<div class="view-content-vote col-sm-12">'
		                                    	row +='<div class="view-content-vote-title">'
			                                    	row +='<div class="row">'
				                                    	row +='<div class="col-sm-12">'
				                                    		row += '<input type="hidden" name="nbb-doing-no" vlaue="'+map.main.nbbNo+'"/>'
				                                    		row +='<img src="/link/resources/images/active_nbbang.PNG"> <span>N빵</span> 0명 냈음'
				                                    	row +='</div>'
				                                    	row +='<div class="col-sm-12">'
				                                    		row +='<strong style="font-size: 20px;"> ￦ '+addComma(map.main.price)+'</strong> / '+map.main.personCount+'명'
				                                    	row +='</div>'
			                                    	row +='</div>'
		                                    	row +='</div>'
		                                    	row +='<div class="view-content-vote-body">'
			                                    	row +='<div class="row">'
			                                    	row +='<div class="col-sm-12">'
			                                    	
			                                    		$.each(map.sub, function(index, item){
			                                    			
					                                    	row +='<div class="row">'
						                                    	row +='<div class="col-sm-3">'
						                                        	row +='<strong>'+item.person+' 님</strong>'
						                                        row +='</div>'
						                                        row +='<div class="col-sm-8">'
						                                        	row +='￦ '+addComma(map.main.price / map.main.personCount)+' 원'
						                                        row +='</div>'
						                                        row +='<div class="col-sm-1 text-right">'
						                                        	row +='<input type="checkbox" value="'+item.nbbItemNo+'" class="doing-nbb-click"/>'
						                                        row +='</div>'
					                                        row +='</div>'
				                                        
			                                    		})      
			                                                 
			                                        row +='<hr/>'
				                                        row +='<div class="row view-content-vote-footer">'
				                                        row +='</div>'
			                                        row +='</div>'
		                                        row +='</div>'
	                                        row +='</div>'
                                        row +='</div>'
                                        row +='</div>'
                                        
                                        $('.view-detail-body').append(row);
                    			}
                    		})
                    	}
                    	if (item.tagName == 'P') {
                    		$('.view-detail-body').append($(item).clone());
                    	} 
                    	
                    	if ($(item).attr("src") && $(item).attr("src").startsWith('/link/resources/images/bandUploadImg/')) {
                    		var imgpath = $(item).attr("src");
                    		if ($('.view-detail-body img[src="'+imgpath+'"]').length == 0) {
	                    		$('.view-detail-body').append($(item).clone());
                    		}
                    	}
                    	/* 
                    	if ($(item).startsWith('<img src="/link/resources/images/bandUploadImg/')) {
							console.log(item)                    		
                    	} */
                    	
                   })
                   
                   
                    $('#view_contents').modal('show');
                });
                    
                /* 밴드 디테일 닫기 뷰 클릭시 */
               $('#view_contents').on('click','.detail-view-close', function(){
            	   
                	$('.view-detail-body .modal-items').remove();
                	$('.view-detail-body p').remove();
                	$('.view-detail-body img').remove();
                })
                
                
                /*이중모달 가능하게하는 소스*/
                $(document).on('hidden.bs.modal', function (event) {
		          if ($('.modal:visible').length) {
                      $('body').addClass('modal-open');
		          }
	           });
                
                /*smartEdit*/
               $('#new_contents').on('shown.bs.modal', function (e) {
            	   
            	    /* if (oEditors.length == 0) { */
	            	   $('iframe').remove();
	                    nhn.husky.EZCreator.createInIFrame({
	                         oAppRef: oEditors,
	                         elPlaceHolder: "ir1",
	                         sSkinURI: "/link/resources/js/jhse/SmartEditor2Skin.html",
	                         fCreator: "createSEditor2"
	                    });
	                   
            	    /* } */
            	    oEditors.getById["ir1"].exec("PASTE_HTML", ['']);
                  // do something...
                })
                /*smartEdit 끝*/
                
                // 등록 버튼
	      	   $("#addBandHomeWrite").click(function(){	// 버튼 아이디
	       	     submitContents();
	       	  })
	       	  
	       	  // 숫자 포멧 하는 스크립트
	            function addComma(num) {
				  var regexp = /\B(?=(\d{3})+(?!\d))/g;
				  return num.toString().replace(regexp, ',');
				}
	            
	            //‘저장’ 버튼을 누르는 등 저장을 위한 액션을 했을 때 submitContents가 호출된다고 가정한다.
	            function submitContents(elClickedObj) {
	               // 에디터의 내용이 textarea에 적용된다.
	               oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD",
	                     []);// 텍스트 아이디
	
	               // 에디터의 내용에 대한 값 검증은 이곳에서
	               // document.getElementById("textAreaContent").value를 이용해서 처리한다.
	               console.log(document.getElementById("ir1").value);
	               try {							// 텍스트 아이디
	                  $("#writeForm").submit();	// 폼 아이디
	               } catch (e) {
	
	               }
	            }
                
			})
			
		   function pasteHTML(filepath){
		      setTimeout(function() {
		          var sHTML = '<img src="/link/resources/images/bandUploadImg/'+filepath+'">';
		          oEditors.getById['ir1'].exec("PASTE_HTML", [sHTML]);
		      }, 5000);
		   }
		
    </script>
	<!--가운데 끝-->