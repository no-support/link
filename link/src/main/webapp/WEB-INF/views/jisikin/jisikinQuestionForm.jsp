<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>Link 지식인 > Q&A > 질문하기</title>
    <link rel="shortcut icon" type="image/x-icon" href="/link/resources/images/shortcut-icon.PNG">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="/link/resources/css/blog/blog.css">
	<link rel="stylesheet" href="/link/resources/css//jisikin/jisikinmain.css">
	<link rel="stylesheet" href="/link/resources/css//jisikin/jisikinQna.css">
	<link rel="stylesheet" href="/link/resources/css//jisikin/jisikinQuestion.css">
	<link rel="stylesheet" href="/link/resources/css//jisikin/jisikinQuestionForm.css">
	<script type="text/javascript" src="/link/resources/js/jisikin_se2/js/HuskyEZCreator.js"></script>
</head>
<body class="ifr_qna" marginwidth="0" marginheight="0">
    <%@ include file="../common/nav.jsp" %>
<div class="container">
   <%@include file="jisikin-nav.jsp" %>
</div>
   
   
   <!-- 메인 컨텐츠 시작 -->
<!-- 질문 섹션-->
<div class="container">
    <div class="row">
    <div class="col-sm-10">
	       <form name="questionForm" id="questionForm" action="questionform.do" method="POST">
	           <!-- 제목 -->
	            <div class="sub_qna_title_area"> 
	            <div class="article"> 
	                <h3><label for="title"><img src="/link/resources/images/q-question.PNG" width="75" height="36" alt="질문"></label></h3>
	                <div class="input_box">
	                    <!-- 인풋박스에 포커싱 갈 경우 on_focus 클래스 추가 -->
	                    <input type="text" name="title" id="title" maxlength="80" class="txt_type" style="color:#333;" value="">
	                </div>
	                <!-- 도움말 말풍선 --> 
	                <div class="layer_balloon_help _help_layer" style="top:-12px; right:-139px; display:none"> 
	                    <p class="main_desc"><strong>정확한 답변을 원하시나요?<br>궁금한 점을 바로 알 수 <br>있도록 작성해 보세요</strong>(최소5자).</p> 
	                    <h5>예문</h5> 
	                    <ul class="order"> 
	                    <li><img src="https://ssl.pstatic.net/static/kin/09renewal/blank.gif" width="1" height="1" alt="1" class="num1"> 콧 등에 땀이 맺힐 때 화장<br>수정 방법은?</li>
	                    <li><img src="https://ssl.pstatic.net/static/kin/09renewal/blank.gif" width="1" height="1" alt="2" class="num2"> 허리가 아픈 사람은 딱딱한<br>바닥에서 자는게 좋은가요?</li>
	                    </ul> 
	                    <div class="bg_bottom"></div> 
	                </div> 
	                <!-- //도움말 말풍선 --> 
	            </div> 
	            <div class="article2 " id="au_title_tip"> 
	                <span class="desc">(<span id="au_title_cnt">0</span>/80자)</span>
	            </div>
	        </div>
	        <!-- 스마트에디터 사진-->
	        <div>
	        		<textarea rows="10" class="form-control" name="contents" id="jisikin_content"></textarea>
	        </div>
	        <!-- -->
	        
	        <div class="sub_qna_btn_area sub_qna_btn_area2" id="au_submit_button">
			<div class="btn_c2">
				<button type="button" class="button_style is_primary _register">다음단계</button>
			</div>
			<div class="btn_r">	
				<button type="button" class="button_style _write_cancel">작성취소</button>
			</div>
		</div>
	  <div class="setting" style="display: none;">
	       <!-- 태그 -->
	        <div class="box_type2" style="clear: both; display: block;" id="au_tag">
	            <!-- 도움말 말풍선 -->
	            <div class="layer_balloon_help _help_layer" style="top: 0px; right: -142px; display: none;">
	                    <p class="main_desc"><strong>질문에 관심 있는 답변자에게<br>잘 배달될 수 있도록 태그를<br>입력해주세요.</strong></p>
	                <div class="bg_bottom"></div> 
	            </div>
	            <!-- //도움말 말풍선 --> 
	
	    <!-- 태그 입력 영역 --> 
	    <div class="qna_tag _highlightBox question">
	        <div class="inner">
	
	            <h4><strong>태그</strong></h4>
	
	
	            <div class="tag_input_wrap _tagInputWrapper">
	                <span class="sharp">#</span>
	                <input type="text" name="tag" class="_tagInput" value="" placeholder="질문에 맞는 태그를 입력해주세요 (최대 10개)" title="태그 입력">
	                <a href="#" class="btn_add _tagAddBtn _clickcode:tag.add">추가</a>
	            </div>
	            <div class="tag_list _tagListArea" style="display: none; height:30px;">
	                <ul id="tag_box">
	                </ul>
	            </div>
	        </div>	
	    </div>
	        </div>
	    <!-- //태그 입력 영역 -->
	
	          <div class="tip_info" style="display: block;" id="au_directory_tip">
	            <img src="https://ssl.pstatic.net/static/kin/09renewal/ico_tip2.gif" width="18" height="11" alt="TIP">
	                더 빠르고 정확한 답변을 받기 위해 질문에 맞는 <strong>질문 분야를 필수 선택</strong>해주세요.
	        </div> 
	
	       <!-- 카테고리 선택 영역 -->
	        <div class="box_type2" style="clear: both; display: block;" id="au_directory"> 
	            <!-- 도움말 말풍선 --> 
	            <div class="layer_balloon_help _help_layer" style="top: 0px; right: -142px; display: none;"> 
	                <p class="main_desc"><strong>질문을 해결해줄 수 있는<br> 답변자에게 배달될 수 있도록<br>세부 질문 분야까지 선택해주세요.</strong></p>
	                <div class="bg_bottom"></div> 
	            </div>
	            <!-- //도움말 말풍선 --> 
	
	            <div class="sub_qna_dir _highlightBox" id="au_directory_input">
	                <div class="inner"  style="padding-bottom : 10px;">
	                    <select id="category" name="parentCategory">
		                    	<option value="">분야선택</option>
	                    	<c:forEach var="c" items="${categories }">
		                    	<option value="${c.no }">${c.name }</option>
	                    	</c:forEach>
	                    </select>
	                    
	                    <select id="subCategory" name="categoryNo">
	                    	<option value="">국어</option>
	                    </select>
	                </div>
	            </div> 
	        </div>
	
	         <!-- 설정 -->
	          <div class="box_type3" style="display: block; z-index: 1100;  padding-top: 20px;" id="au_option">
	            <!-- 도움말 말풍선 --> 
	            <div class="layer_balloon_help _help_layer" style="top: 0px; right: -142px; display: none;"> 
	                <p class="main_desc"><strong>추가 설정을 활용해보세요.</strong></p> 
	                <h5>추가내공</h5>
	                <p class="desc">내공을 추가하면 답변을 좀더<br>신속히 받을 수 있습니다.</p>
	                <div class="bg_bottom"></div> 
	            </div> 
	            <!-- //도움말 말풍선 --> 
	                <div class="sub_qna_q_set _highlightBox">
	            <fieldset> 
	                    <div class="inner">
	                        <dl class="list_type">
	                        <dt class="dt_type3"><strong>추가내공</strong></dt>
	                        <dd class="dd_type7">
	                            <a href="#" id="betPointLayerBtn" class="btn_ btn_set_point _clickcode:set.point" role="button">내공 설정하기</a>
	
	                            <div id="betPointInfo" class="oto_info">
	                                채택한 답변자에게 추가내공을 드리며, 질문자에게도 추가내공을 돌려드립니다.
	                            </div>
	
	                            <div id="betPointInfoWithSelection" class="_layer_additionPoints oto_info_after" style="display: none">
	                                내공 <em class="_betPointInInfo num_point"></em>을 채택한 답변자에게 드립니다.<a href="#" class="_unselectBetPointInInfo btn_reset _clickcode:set.pointreset" role="button" aria-label="추가내공값 초기화"><span class="ico_reset"></span></a>
	                            </div>
	                            <!-- 추가내공 설정 레이어 -->
	                            <div id="betPointLayer" class="layer_base2 layer_type1 _hideWhenResize" style="display:none;z-index:1000;top:35px;left:0;width:257px;">
	                                <div class="title_wrap">
	                                    <h1 class="title">추가내공 설정</h1>
	                                </div>
	                                <div class="group_input_point_added input_box _clickcode:set.pointwrite">
	                                    <input type="number" max="${LOGIN_USER.mentalPoint }" id="betPoint" name="mentalPoint" placeholder="직접입력" class="input_point_added _clearWhenResize" title="내공 입력">
	                                    <a id="betPointDelete" href="#" class="btn_close" role="button">
	                                        <img src="https://ssl.pstatic.net/static/kin/09renewal/btn_close_layer.gif" width="14" height="14" alt="닫기">
	                                    </a>
	                                </div>
	                                <div class="my_point">보유내공 <em>${LOGIN_USER.mentalPoint }</em></div>
	                                <div class="group_button">
	                                    <a id="betPointCancel" href="#" role="button" class="button button_default _clickcode:set.pointcancel">취소</a>
	                                    <a id="betPointSubmit" href="#" role="button" class="button button_primary _clickcode:set.pointok">확인</a>
	                                </div>
	                            </div>
	                            <!-- //추가내공 설정 레이어 -->
	                        </dd> 
	                        <dt><strong>공개설정</strong></dt> 
	                        <dd class="dd_type2" style="z-index: -1;">
	                            <span class="first">별명 
	                            <!-- 공개 설정 레이어 --> 
                                <select id="secretYN" name="secretYn">
                                	<option value="N" selected="selected">비공개</option>
                                	<option value="Y">공개</option>
                                </select>
	                            </span>
	                            <!-- //공개 설정 레이어 --> 
	                        </dd>
	                        </dl>
	
	
	                    </div>	
	            </fieldset> 
	                </div> 
	        </div>
	          <!-- 등록 -->
	          <div class="sub_qna_btn_area" id="au_submit_button2" style="display: block;">
	            <div class="btn_c2">
	                <button type="button" id="submit-question" class="button_style is_primary _register _clickcode:sbm.ok">질문등록</button>
	            </div>
	            <div class="btn_r">
	                <button type="button" class="button_style _write_cancel _clickcode:sbm.cancel">작성취소</button>
	            </div>
	        </div>
	  </div>
	       </form>
       </div>
    </div>
</div>

<script>

$("#category").change(function(){
 		var parentNo = $("[name=parentCategory]").val();
 	
		$.ajax({
			url:"subCategory.do",
			data:{parentNo:parentNo},
			dataType:"JSON",
			success:function(result){
				console.log(result);
				$("#subCategory").empty();
				var de = "<option value=''>상위 선택</option>";
				$("#subCategory").append(de);
				
				$.each(result,function(index, item){
					var html = "<option value='"+item.no+"'>"+item.name+"</option>";
					$("#subCategory").append(html);
				})
				
			}
		})
	})

	/* 스마트에디터 사진 */
	function pasteHTML(filepath){
		setTimeout(function() {
	    	var sHTML = '<img src="/link/resources/js/jisikin_se2/photo_uploader/upload/'+filepath+'">';
	    	oEditors.getById['jisikin_content'].exec("PASTE_HTML", [sHTML]);
		}, 5000);
	}

	/* 스마트에디터 */
	var oEditors = [];
	
	nhn.husky.EZCreator.createInIFrame({
		oAppRef: oEditors,
   		elPlaceHolder: "jisikin_content",
   		sSkinURI: "/link/resources/js/jisikin_se2/SmartEditor2Skin.html",
    		fCreator: "createSEditor2",
    		htParams : {
				fOnBeforeUnload : function() {
				}
			}
		// 이페이지 나오기 alert 삭제
		});
	
	
// 등록 버튼
$("#submit-question").click(function(){
	if(questionForm.title.value == "") {

	    alert("제목을 입력해 주세요.");

	    questionForm.title.focus();

	    return false;

	  }
	
	  else if( $("._tagListArea ul").html().trim() == "") {

		    alert("태그를 등록해 주세요.");

		    questionForm.tag.focus();

		    return false;

		  }
	
	  else if(questionForm.parentCategory.value == "") {

		    alert("카테고리를 등록해 주세요.");

		    questionForm.parentCategory.focus();

		    return false;

		  }
	
	  else if(questionForm.categoryNo.value == "") {

		    alert("상세 카테고리를 등록해 주세요.");

		    questionForm.categoryNo.focus();

		    return false;

		  }
	
	  else if(questionForm.mentalPoint.value == "") {

		    alert("내공을 등록해 주세요.");

		    questionForm.mentalPoint.focus();

		    return false;

		  }

	  else 
	alert("질문 등록 성공!");
	submitContents();
	return true;
})
	
	
	//‘저장’ 버튼을 누르는 등 저장을 위한 액션을 했을 때 submitContents가 호출된다고 가정한다.
	function submitContents(elClickedObj) {
		// 에디터의 내용이 textarea에 적용된다.
		oEditors.getById["jisikin_content"].exec("UPDATE_CONTENTS_FIELD",
				[]);

		// 에디터의 내용에 대한 값 검증은 이곳에서
		// document.getElementById("textAreaContent").value를 이용해서 처리한다.
		console.log(document.getElementById("jisikin_content").value);
		try {
			$("#questionForm").submit();
		} catch (e) {

		}
	}
	

    /* 별명 */
    $("._layer_menu_text").click(function(){
        $(".layer_idmenu ").css("display","block");
        return false;
    })
    
    $("._data_open_y").click(function(){
        $("._layer_menu_text").text("공개");
        $(".layer_idmenu ").css("display","none");
        return false;
    })
    
    $("._data_open_n").click(function(){
        $("._layer_menu_text").text("비공개");
        $(".layer_idmenu ").css("display","none");
        return false;
    }) 
    
    /* 태그 */
    $("._tagAddBtn").click(function(){
        var tag = $("._tagInput").val();
        $("._tagListArea").css("display","block");
        
        /*<li><span class="tag">#가자</span> <a href="#" class="_clickcode:tag.del _tagDelete _param('가자')"><span class="ico_cancel">태그 추가 취소</span></a></li>*/
        
        var html = '<input type="hidden" name="tags" value="'+tag+'">';
        html += '<li>';
        html += '<span class="tag">#'+tag+'</span> <a href="#" val="#'+tag+'")><span class="ico_cancel">태그 추가 취소</span></a>';
        html += '</li>';
        
        $("._tagListArea ul").append(html);
        $("._tagInput").val("");
        return false;
    })
    
    $('#tag_box').on("click", ".ico_cancel", function(){
        $(this).parents("li").remove();
        return false;
    })
    
    /* 내공 */
    $("#betPointLayerBtn").click(function(){
        $("#betPointLayer").css("display","block");
        return false;
    })
    
    
    $("#betPointCancel").click(function(){
        $("#betPointLayer").css("display","none");
        $("#betPointInfoWithSelection").css("display","none");
        $("#betPointInfo").css("display","block");
        return false;
    })
    
    $("#betPointSubmit").click(function(){
        var betPoint = $("#betPoint").val();
        
        $("#betPointLayer").css("display","none");
        $("#betPointInfo").css("display","none");
        $(".num_point").text(betPoint);
        $("#betPointInfoWithSelection").css("display","block");
        return false;
    })
    
    /* 다음 단계 */
    $("._register").click(function(){
        $("#au_submit_button").css("display","none");
        $(".setting").css("display", "block");                      
    });
    
    /* 취소 버튼 설정 생기기 */
    $("._write_cancel").click(function(){
        $("#au_submit_button").css("display","block");
        $(".setting").css("display", "none");   
    })
    
    /* 설정 활성화 */
    $(".qna_tag, .sub_qna_dir, .sub_qna_q_set").click(function(){
        $(".qna_tag, .sub_qna_dir, .sub_qna_q_set").removeClass("box_highlight_on");
        $("#title").removeClass("on_focus");
        $(this).addClass("box_highlight_on");
    });
    
    
    /* 설정 도움말 */
    $(".article , #au_tag, #au_directory, #au_option").hover(function(){
        $(this).children(".layer_balloon_help").css("display","block");
    }, function(){
    	$(this).children(".layer_balloon_help").css("display","none");
    });
    
	/* 제목 */
	$("#title").click(function(){
		$(this).addClass("on_focus");
	})
    
    $(document).ready(function(){
         
        $('.dropdown,.dropdown-menu').hover(function(){

          if($(window).width()>=768){
            $(this).addClass('open').trigger('shown.bs.dropdown', relatedTarget)
            return false;
          }
          
        },function(){
          if($(window).width()>=768){
            $(this).removeClass('open').trigger('hidden.bs.dropdown', relatedTarget)
            return false;
          }
        })
          
      })
    </script>
</body>
</html>