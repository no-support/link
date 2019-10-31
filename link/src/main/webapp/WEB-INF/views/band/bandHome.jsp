<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>Link Band > Home</title>
    <link rel="shortcut icon" type="image/x-icon" href="/link/resources/images/shortcut-icon.PNG">
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/link/resources/js/jhse/js/HuskyEZCreator.js"charset="utf-8"></script>
    <link rel="stylesheet" href="/link/resources/css/band/band.css">
</head>
<body class="band-back">
<!--네비 시작-->
<%@include file="bandMainNav.jsp" %>
<!--네비 끝-->
   
    <!--세컨 네비-->
    <div class="band-secon-nav text-center">
       <span class="home-mainText" data-value="bandHomeMainContents.do"><a href="#">전체글</a></span>
       <span class="home-photo" data-value="bandHomePhoto.do"><a href="#">사진첩</a></span>
       <span class="home-cal" data-value="bandHome-cal.jsp"><a href="#">일정</a></span>
       <span class="home-member" data-value="bandHomeMember.do"><a href="#">멤버</a></span>
    </div>
   <!--세컨 네비끝-->
     
    <!--본문-->
    <div class="container">
        <div class="row">
           <!--왼쪽 시작-->
            <div class="col-sm-3" style="width: 260px;">
                <div class="row">
                   <a href="#">
                        <div class="col-sm-12">
                            <img src="${bandInfo.photo }" class="band-main-photo" alt="">
                        </div>
                    </a>
                    
                    <div class="col-sm-12 band-home-name">
                        <a href="#">
                             <p class="band-main-name">${bandInfo.name }</p>   
                        </a>
                    </div>
                    
                    <div class="row main-gan">
                        <div class="col-sm-4">
                            <a href="#">
                                <p class="black-color">멤버 ${bandInfo.joinCount }</p>
                            </a>
                        </div>
                         <c:if test="${joinYn eq 'Y' && not empty LOGIN_USER}">
	                        <div class="col-sm-5">
	                            <a href="#">
	                                <span class="glyphicon glyphicon-plus black-color">초대</span>
	                            </a>
	                        </div>
                        </c:if>
                    </div>
                    <c:if test="${joinYn eq 'N' || empty LOGIN_USER}">
						<div class="col-sm-12">
							<button class="btn btn-default" style="background-color: #474e60; color: white; height: 45px; width: 200px; font-weight: 550; margin-bottom: 15px;" data-toggle="modal" data-target="#exampleModal">밴드 가입하기</button>
							<input type="hidden" value="${joinYn }" name="joinYn" id="joinYn">
							
						</div>
                    </c:if>
                    <div class="row">
                        <div class="col-sm-12 band-info">
                            <p>밴드와 게시글이 공개되지 않습니다. 초대를 통해서만 가입할 수 있습니다.</p>
                        </div>
                    </div>
                    
                    <hr class="band-info-hr"/>
                    
                    <c:if test="${joinYn eq 'Y' && not empty LOGIN_USER}">
	                    <div class="row"> 
	                        <div class="col-sm-12 band-info-option">
	                           <a href="#">
	                                <span class=" glyphicon glyphicon-cog">밴드설정</span>
	                            </a>
	                         </div>
	                    </div>
					</c:if>
                </div>
            </div>
            <!--왼쪽 끝-->
            
            <!--===============================================-->
            <!--가운데-->
            
            <!-- 전체글(본문) -->
            <div class="col-sm-6" style="margin-left: 0px; padding-left: 0px" id="bandHome-center">
            <input type="hidden" name="bandNo" value="${param.bandNo }">
            </div>
            <!--가운데 끝-->
             <!--===============================================-->
             
             
            
            <!--오른쪽-->
            <div class="col-sm-3">
              <!--일정시작-->
               <div class="iljung-table">
               <!--일정 타이틀-->
                <div class="row iljung-title">
                    <div class="col-sm-10">
                        <strong>다가오는 일정</strong>
                    </div>
                    <div class="col-sm-2"> 
                        1
                        <!--일정 수-->
                    </div>
                    <div class="col-sm-12" style="padding-left: 7px; padding-right: 7px; margin-top: 10px;">
                        <hr class="iljung-kyungkye"/>
                    </div>
                </div>
                <!--일정 타이틀 끝-->
                
                <!--일정1-->
                <div class="row" style="padding: 0px 12px 12px 12px;">
                   <a href="#" style="color: black;">
                    <div class="col-sm-3 text-center" style="padding-right: 0px;">
                        <p style="font-size: 15px; margin-bottom: 0px;">25</p>
                        <span style="font-size: 11px;">7월</span>
                    </div>
                    <div class="col-sm-9" style="padding-left: 0px;">
                        <div class="row">
                            <div class="col-sm-12" style="font-size: 13px;"><strong>일정1</strong></div>
                            <div class="col-sm-12" style="font-size: 11px;">하루종일-8월1일</div>
                            <div class="col-sm-12" style="font-size: 11px"><span style="color: #34cc6c;margin-right: 7px">참석1</span>
                            <span style="margin-right: 7px">불참석0</span>
                            <span style="margin-right: 7px">미정0</span>
                            </div>
                        </div>
                    </div>
                    </a>
                 </div>
                 <!--일정1 끝-->
                 
                 <!--일정2-->
                <div class="row" style="padding: 0px 12px 12px 12px;">
                   <a href="#" style="color: black;">
                    <div class="col-sm-3 text-center" style="padding-right: 0px;">
                        <p style="font-size: 15px; margin-bottom: 0px;">25</p>
                        <span style="font-size: 11px;">7월</span>
                    </div>
                    <div class="col-sm-9" style="padding-left: 0px;">
                        <div class="row">
                            <div class="col-sm-12" style="font-size: 13px;"><strong>일정2</strong></div>
                            <div class="col-sm-12" style="font-size: 11px;">하루종일-8월1일</div>
                            
                        </div>
                    </div>
                    </a>
                 </div>
                 <!--일정2 끝-->
                 
                  <!--일정3-->
                <div class="row" style="padding: 0px 12px 12px 12px;">
                   <a href="#" style="color: black;">
                    <div class="col-sm-3 text-center" style="padding-right: 0px;">
                        <p style="font-size: 15px; margin-bottom: 0px;">25</p>
                        <span style="font-size: 11px;">7월</span>
                    </div>
                    <div class="col-sm-9" style="padding-left: 0px;">
                        <div class="row">
                            <div class="col-sm-12" style="font-size: 13px;"><strong>일정3</strong></div>
                            <div class="col-sm-12" style="font-size: 11px;">오전 1:00</div>
                            
                        </div>
                    </div>
                    </a>
                 </div>
                 <!--일정3 끝-->
                 
                </div>
                <!--일정 끝-->
                
                <!--채팅-->
                <div class="iljung-table">
                   <div class="row iljung-title">
                        <div class="col-sm-7">
                            <strong>채팅</strong>
                        </div>
                        <div class="col-sm-5 text-right"><a href="#">
                            <p style="color: #34cc6c">새 채팅</p></a>
                        </div>
                        <div class="col-sm-12" style="padding-left: 7px; padding-right: 7px;">
                            <hr class="iljung-kyungkye"/>
                        </div>
                   </div>
                   
                   <!--채팅 1-->
                   <div class="row" style="padding: 10px;">
                      <a href="#" style="color: black;">
                       <div class="col-sm-12" style="font-size: 13px;">
                           <strong>채팅1</strong>
                       </div>
                       <div class="col-sm-12" style="font-size: 13px; color: #646668">
                           안녕하시오..
                       </div>
                      </a>
                   </div>
                   <!--채팅1 끝-->
                   
                   <!--채팅 1-->
                   <div class="row" style="padding: 10px;">
                      <a href="#" style="color: black;">
                       <div class="col-sm-12" style="font-size: 13px;">
                           <strong>채팅2</strong>
                       </div>
                       <div class="col-sm-12" style="font-size: 13px; color: #646668">
                           반가워요
                       </div>
                      </a>
                   </div>
                   <!--채팅1 끝-->
                </div>
                <!--채팅 끝-->
                
                <!--최근 올린 사진-->
                <div class="iljung-table">
                   <div class="row iljung-title">
                        <div class="col-sm-7">
                            <strong>최근사진</strong>
                        </div>
                        <div class="col-sm-5 text-right home-go-photo"><a href="#">
                            <p style="color:#999">더보기</p></a>
                        </div>
                        <div class="col-sm-12" style="padding-left: 7px; padding-right: 7px;">
                            <hr class="iljung-kyungkye"/>
                        </div>
                        <div class="row choisin-photo-form">
                        
                        </div>
            
                   </div>
                </div>
                <!--최근 올린사진 끝-->
                
            </div>
            <!--오른쪽 끝-->
        </div>
    </div>
    
    <!-- 가입하기 모달 -->
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">

	  	<form action="bandJoin.do" method="post">
	    <div class="modal-content" style="width: 350px; position: relative; left: 120px; top: 65px;">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">밴드 회원가입</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	      	<strong>${bandInfo.name }</strong>에 가입을 하시겠습니까?
	      </div>
	      <div class="modal-footer">
	      	<input type="hidden" value="${bandInfo.no }" name="bandNo">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
	        <button type="submit" class="btn btn-primary">가입하기</button>
	      </div>
	    </div>
	    </form>
	    
	  </div>
	</div>
    <!-- 가입하기 모달 끝 -->
    
    <script>
			$(function () {
				
				// 밴드 글 클릭시 메인 이동
				$('.band-home-name').click(function(event){
					event.preventDefault();
					
					$.ajax({
         				url:'bandHomeMainContents.do',
         				data:{bandNo:'${param.bandNo}'},
         				success:function(result){
							$('#bandHome-center').html(result); 
         				}
         			})
				})
                
				$('.home-go-photo').click(function(event){
					event.preventDefault();
					
					$.ajax({
         				url:'bandHomePhoto.do',
         				data:{bandNo:'${param.bandNo}'},
         				success:function(result){
							$('#bandHome-center').html(result); 
         				}
         			})
				})
				
				/* 밴드 이미지 보기 */
    			var bandNo = $('[name=bandNo]').val();
				
                /* 가운데 내용 바꾸기 */
                $('.band-secon-nav span').click(function(event){
                	event.preventDefault();
         			var fileName = $(this).attr('data-value');
         			var joinYn = $('#joinYn').val();   
         			var joinMembers = $('#joinMembers').val();
         			/* var memberId = $('#memberId').val(); */
         			
         			$.ajax({
         				url:fileName,
         				data:{bandNo:'${param.bandNo}', joinYn:joinYn, joinMembers:joinMembers},
         				success:function(result){
							$('#bandHome-center').html(result); 
         				}
         			})
                })
                
                $('.band-secon-nav .home-mainText').trigger("click");
                

                // 밴드 이미지 가져오기
    			$.ajax({
    				data:{bandNo : bandNo},
    				dateType:'json',
    				type:'get',
    				url:'bandWriteContentPhoto.do',
    				success:function(write){
    					$.each(write, function(index, item){
    					
    						if(index < 6){	
	    						var row = '<div class="col-sm-4 choisin-photo-form2">'
	    						      		+ '<a href="#">'
	    						      			+'<img src="/link/resources/images/bandUploadImg/'+item.photoName+'"class="choisin-photo" alt=""/>'
	    							  		+ '</a>'
	    							  	+ '</div>';
	    							  	
	    						$('.choisin-photo-form').append(row);
    						} else {
    							return false;
    						}
    					})
    				}
    			})
                
			}) 
    </script>
</body>
</html>