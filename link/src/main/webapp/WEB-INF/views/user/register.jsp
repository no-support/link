<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>Link : 회원가입</title>
	<link rel="shortcut icon" type="image/x-icon" href="../../../resources/images/shortcut-icon.PNG">
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
	<link href="https://fonts.googleapis.com/css?family=Jura|Marck+Script|Russo+One|Sacramento&display=swap" rel="stylesheet">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="/link/resources/css/user/registerform.css">
	<link rel="stylesheet" href="/link/resources/css/user/loginform.css">
</head>
<body>
<div class="container">
    <div class="row">-
           <div class="col-sm-4 col-sm-offset-4">
                <span class="main-naver"><a href="/link/home.do"><span style="" class="main-null-img glyphicon glyphicon-link"></span>
                        <span style="">L</span><span style="color:#E62600;">i</span><span style="color:#FCC800;">n</span><span style="color:#00B658">k</span> </a></span>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-6 col-sm-offset-3">   
                <form id="register_form" method="post" name="fr" action="addUser.do" enctype="multipart/form-data">
                  <div class="form-group well">  
                    <div>
                        <label>아이디</label><label id="idmsg" style="padding-left:10px;"></label>
                        <input class="register-input form-control" id="confirmid" type="text" value="" name="id"/>
                    </div>
                    <div>  
                        <label>비밀번호</label>
                        <input class="register-input form-control" type="password" value="" name="password"/>
                    </div>
                    <div>
                        <label>비밀번호 확인</label>
                        <input class="register-input form-control" type="password" value="" name="passwordconfirm"/>
                    </div>
                    <div style="margin-bottom: 50px;">
                        <label>닉 네 임</label>
                        <input class="register-input form-control" type="text" value="" name="nickName"/>
                    </div>
                    <div>
                        <label>이 름</label>
                        <input class="register-input form-control" type="text" value="" name="name"/>
                    </div>
                    <div>
                        <label>성별</label><br/>
                        <select class="register-input form-control" name="gender">
                            <option value="남자" selected="selected">남자</option>
                            <option value="여자">여자</option>
                        </select>
                    </div>
                    <div style="margin-bottom: 20px;">
                           <div>
                            <label>휴대전화</label>  
                            <div class="form-group">
	                            <select class="register-input" id="phone-pre" name="phonepre">
	                                <option value="010" selected="selected">010</option>
	                                <option value="02">02</option>
	                                <option value="070">070</option>
	                                <option value="055">055</option>
	                            </select>  
	                            <input class="register-input" type="text" id="phone-post" value="" name="phonepost"/>
	                            <input type="hidden" id="phonebox" value="" name="phone"/>
                            </div> 
                           </div>
                      </div>
                      <div>
						<strong style="font-size: 14px; letter-spacing: -1px;">유저 프로필 이미지</strong>
					</div>
					<div>
						<img id="blogImg" src="/link/resources/images/profile.jpg" width="200" height="200">  
					</div>
					<div>
						<span>유저 프로필 사진에 등록됩니다.</span> <input style="margin-top: 10px;" class="form-control" type="file" id="mainImg" name="mainImg" />
					</div>
                    <div>
                       <button class="form-control btn btn-primary btn-register" type="submit">가입하기</button>
                    </div>
                  </div>
                </form>
                
            </div>
        </div>
</div>
<div class="container">
</div>
<script>
// 프로필 사진
$(function(){
	function readURL(input) {
	    if (input.files && input.files[0]) {
	        var reader = new FileReader();
	
	        reader.onload = function (e) {
	            $('#blogImg').attr('src', e.target.result);
	        }
	
	        reader.readAsDataURL(input.files[0]);
	    }
	}
	
	$("#mainImg").change(function(){
	    readURL(this);
	});
})


	$(".btn-register").click(function(){
		if(fr.id.value == "") {

		    alert("아이디를 입력해 주세요.");

		    fr.id.focus();

		    return false;

		  }

		  else if(fr.password.value == "") {

		    alert("비밀번호를 입력해 주세요.");

		    fr.password.focus();

		    return false;

		  }

		  else 
			  alert("회원가입 완료!");
		 
		var pre = $("[name=phonepre]").val();
		var post = $("#phone-post").val();
		
		$("#phonebox").val(pre+post);
		$("#register_form").submit();
		
			  return true;
	})

	$("#confirmid").keyup(function(){
		var id = $("#confirmid").val();
		console.log("1",id);
		
		$.ajax({
			url:"confirmid.do",
			data:{id:id},
			dataType:"json",
			success:function(result){
				$("#idmsg").empty();  
				var checkhtml = '<label style="color:red;">이미 존재하는 아이디입니다.</label>';
				$("#idmsg").append(checkhtml);
			},
			error:function(){ 
				$("#idmsg").empty();
				var checkhtml = '<label style="color:blue;">사용가능한 아이디입니다.</label>';
				$("#idmsg").append(checkhtml);
			}
		})
	})
</script>
</body>
</html>