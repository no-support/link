<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>Link Band > Add</title>
    <link rel="shortcut icon" type="image/x-icon" href="/link/resources/images/shortcut-icon.PNG">
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="/link/resources/css/band/band.css">
</head>
<body class="band-back">                                 
<!--네비 시작-->
<%@include file="bandMainNav.jsp" %>
<!--네비끝-->
    <div class="add-band-container ">
        <div class="row">
        	<form action="addBand.do" method="post">
            <div class="col-sm-12 band-add-name text-left">
                <strong>밴드 이름</strong>
            </div>
           
                <div class="col-sm-12 ">
                    <input type="text" class="band-add-text2 band-add-text" maxlength="50" placeholder="밴드 이름 입력" name="name">
                </div>
                <div class="col-sm-12 text-left" style="height: 20px">
                    <label class="overlap"></label>
                </div>
                
                <div class="row"> 
                   <div class="col-sm-12">
                       <div class="row add-main-padding">
                        <div class="col-sm-5 band-selLogo-img">
                            <img src="/link/resources/images/bandLogoImg/band_logo_1.PNG" >
                            <input type="hidden" value="/link/resources/images/bandLogoImg/band_logo_1.PNG" class="imgVale" name="photo"/>
                        </div>
                        <div class="col-sm-7">
                            <div class="row">
                                <div class="col-sm-4 add-sel-margin">
                                    커버 선택
                                </div>
                                <div class="col-sm-8 text-right add-img-select">
                                    <span id="currImgPage">1</span>/6 
                                    <button type="button" class="btn btn-default add-img-btn" id="logo_pre" >&lt;</button>
                                    <button type="button" class="btn btn-default add-img-btn" id="logo_next" >&gt;</button>
                                </div>
                            </div>
                            <div id="addBandViewImg" class="row">
								<!-- 
                                <a href="#">
                                <div class="col-sm-3 new-add-band-img">
                                    <img src="/link/resources/images/band_photo_add.PNG" class="add-img-select2">
                                </div>
                                </a>
								 -->
								<c:forEach items="${logoImgs }" var="img">
									<a href="#" data-value = ${img.no } class="addBandImg">
		                                <div class="col-sm-3 many-logo-img" data-img-value="${img.no }">
		                                    <img src="/link/resources/images/bandLogoImg/${img.name }.PNG" class="add-img-select2">
		                                </div>
	                                </a>
								</c:forEach>

                            </div>
                        </div>
                    </div>
                    <!--사진 선택 끝-->

                    <div class="row text-left add-photo-info">
                        밴드이름과 사진은 개설 후에도 변경할 수 있어요
                    </div>

                    <div class="row">
                        <div class="text-left col-sm-12 add-band-open">
                            <strong>밴드 공개</strong>
                        </div>
                        <div class="col-sm-12 band-add-option">
                            <div class="row">

                                <div class="col-sm-4">
                                   <div class="row add-option">
                                        <div class="col-sm-2 test-right add-check-margin-right" >
                                            <input type="radio" name="bandTypeOption" value="allSecret">
                                        </div>
                                        <div class="col-sm-10 text-left add-check-margin-left">
                                            <div class="col-sm-12">
                                              <strong>비공개 밴드</strong>
                                           </div>
                                           <div class="col-sm-12 add-option-font">
                                               밴들와 게시글이 공개되지 않습니다. 초대를 통해서만 가입할 수 있습니다.
                                           </div>
                                        </div>
                                   </div> 
                                </div>

                                <div class="col-sm-4">
                                   <div class="row add-option">
                                        <div class="col-sm-2 test-right add-check-margin-right">
                                            <input type="radio" name="bandTypeOption" value="onluNameOpen">
                                        </div>
                                        <div class="col-sm-10 text-left add-check-margin-left">
                                            <div class="col-sm-12">
                                              <strong>밴드명 공개 밴드</strong>
                                           </div>
                                           <div class="col-sm-12 add-option-font">
                                               누구나 밴드를 검색해 찾을 수 있지만,  게시물은 멤버만 볼 수 있습니다.
                                           </div>
                                        </div>
                                   </div> 
                                </div>

                                <div class="col-sm-4">
                                   <div class="row add-option">
                                        <div class="col-sm-2 test-right add-check-margin-right">
                                            <input type="radio" name="bandTypeOption" value="Allopen" checked="checked">
                                        </div>
                                        <div class="col-sm-10 text-left add-check-margin-left">
                                            <div class="col-sm-12">
                                              <strong>공개 밴드</strong>
                                           </div>
                                           <div class="col-sm-12 add-option-font">
                                               누구나 밴드를 검색해 찾을 수 있고, 게시물을 볼 수 있습니다.
                                           </div>
                                        </div>
                                   </div> 
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--밴드 옵션 종료-->
					
                    <div class="row">
                        <div class="col-sm-12 text-center add-btn-sort">
                            <button type="reset" class="btn btn-default">취소</button>
                            <input type="submit" value="완료" class="btn btn-primary"/>
                        </div>
                    </div>
                </div>
            </div>
            </form>
        </div>
    </div>
    <script type="text/javascript">
    	$(function(){
    		$('#addBandViewImg').on("click", ".many-logo-img", function(event){
    			event.preventDefault();
    			var kuyngro = $(this).find('img').attr("src");
    			$('.band-selLogo-img').find('img').attr('src',kuyngro);
    			$('.imgVale').val(kuyngro);
    			console.log($('.imgVale').val())
    		})
    		
    		$('#logo_next').click(function(){
    			var pageNum = $('#currImgPage').text();
    			var currPage = parseInt(pageNum) + 1;
    			$('#currImgPage').text(currPage); 
    			
    			$('#logo_pre').attr("disabled", false);
    			
    			if(currPage > 5){
    				$('#logo_next').attr("disabled", true);
    			}
    			
    			var begin = parseInt(pageNum) * 7 + 1;
    			var end = parseInt(begin) + 7;
    			
    			$('#addBandViewImg').find(".addBandImg").remove();
    			
    			$.ajax({
    				type:"GET",
    				url:"changeLogo.do?begin="+begin+"&end="+end,
    				dataType:"json",
    				success:function(imgs){
    					
    						$.each(imgs, function(index,img){
    							var row = '<a href="#" data-value = "'+img.no+'" class="addBandImg">'
	                   			 	+'<div class="col-sm-3 many-logo-img" data-img-value='+img.no+'>'
	                    				+'<img src="/link/resources/images/bandLogoImg/'+img.name+'.PNG" class="add-img-select2">'
	                				+'</div>'
	            				+'</a>';
	            				$('#addBandViewImg').append(row);
    						})
    				}
    			})
    		});
    		$('#logo_pre').click(function(){
    			var pageNum = $('#currImgPage').text();
    			var currPage = parseInt(pageNum) - 1;
    			$('#currImgPage').text(currPage); 
    			
    			$('#logo_next').attr("disabled", false);
    			
    			if(currPage < 2){
    				$('#logo_pre').attr("disabled", true);
    			}
    			
    			var begin = Math.floor(parseInt(pageNum) / 6 + 1);
    			var end = parseInt(begin) + 7;
    			console.log(begin);
    			console.log(end);
    			$('#addBandViewImg').find(".addBandImg").remove();
    			
    			$.ajax({
    				type:"GET",
    				url:"changeLogo.do?begin="+begin+"&end="+end,
    				dataType:"json",
    				success:function(imgs){
    					
    						$.each(imgs, function(index,img){
    							var row = '<a href="#" data-value = "'+img.no+'" class="addBandImg">'
	                   			 	+'<div class="col-sm-3 many-logo-img" data-img-value='+img.no+'>'
	                    				+'<img src="/link/resources/images/bandLogoImg/'+img.name+'.PNG" class="add-img-select2">'
	                				+'</div>'
	            				+'</a>';
	            				$('#addBandViewImg').append(row);
    						})
    				}
    			})
    			
    		})
    		
    		$('.new-add-band-img').click(function(event){
    			event.preventDefault();
    			
    		})
    		$('[name=name]').keyup(function(){
    			var nameValue = $('[name=name]').val();
				if(nameValue == ""){
					$('.overlap').text("");	
					return;
				}
				
    			$.ajax({
    				type:"GET",
    				url:"overlapName.do?bandName="+nameValue,
    				dataType:"text",
    				success:function(status){
    					
						if(status == "Y"){
							$('.overlap').css("color", "red");
							$('.overlap').text("중복되었습니다. 다른 이름을 사용해주세요.");
							$('[type=submit]').attr("disabled", true)
						}
						
						if(status == "N"){
							$('.overlap').css("color", "green");
							$('.overlap').text("사용할 수 있는 이름입니다.");
							$('[type=submit]').attr("disabled", false)
						}
    				}
    			})
    		})
    	})
    </script>
</body>
</html>