<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<div class="row band-member">
		<div class="row band-photo-title">
			<div class="col-sm-6">
				<strong>멤버</strong> <span style="color: #34cc6c">7</span>
			</div>
			<div class="col-sm-5 text-right" style="padding-right: 0px">
				<button type="button" class="btn btn-default">멤버 초대하기</button>
			</div>
			<div class="col-sm-1">
				<a href="#" class="dropdown-toggle" data-toggle="dropdown"
					aria-expanded="false"> <img
					src="/link/resources/images/band_new_option.PNG">
				</a>
				<ul class="dropdown-menu" role="menu">
					<li><a href="#">Excel 다운로드</a></li>
					<li><a href="#">인쇄하기</a></li>
				</ul>
			</div>
		</div>

		<div class="row band-member-search-row">
			<div class="col-sm-11">
				<input type="text" placeholder="멤버 검색" />
			</div>
			<div class="col-sm-1">
				<a href="#" class="glyphicon glyphicon-search"></a>
			</div>
		</div>

		<div class="row band-members-row">
			<div class="row">
				<div class="col-sm-9">
					<strong>멤버</strong>
				</div>
				<div class="col-sm-3 text-right">
					<select>
						<option>이름 순</option>
						<option>최근 가입 순</option>
					</select>
				</div>
			</div>
			<div class="row band-members-2">
			<!-- 
				<div class="row">
					<div class="col-sm-2">
						<strong>이재헌 님</strong>
					</div>
					<div class="col-sm-3">
						<img src="/link/resources/images/band_leader.PNG" />
					</div>
					<div class="col-sm-7 text-right">
						<a href="#"><span class="glyphicon glyphicon-cog"></span></a>
					</div>
				</div>

				<div class="row">
					<div class="col-sm-2">
						<strong>김철수 님</strong>
					</div>
					<div class="col-sm-3"></div>
					<div class="col-sm-7 text-right">
						<a href="#"><span class="glyphicon glyphicon-cog"></span></a>
					</div>
				</div>

				<div class="row">
					<div class="col-sm-2">
						<strong>김미영 님</strong>
					</div>
					<div class="col-sm-3"></div>
					<div class="col-sm-7 text-right">
						<a href="#"><span class="glyphicon glyphicon-cog"></span></a>
					</div>
				</div>
				 -->
			</div>
		</div>
		<div class="row band-members-buttom">
			<a href="#">
				<div class="col-sm-2">
					<img src="/link/resources/images/band_member_add.PNG" />
				</div>
				<div class="col-sm-10">가입 전 멤버 등록</div>
			</a>
		</div>
	</div>

	<script>
		$(function(){
			
			$.ajax({
				type:'get',
				data:{bandNo:'${param.bandNo}'},
				dataType:'json',
				url:'bandNbbMember.do',
				success:function(result){
					
					$.each(result, function(index, item){
						var row = '<div class="row">'
								row += '<div class="col-sm-2">'
								 	row += '<strong>'+item.name+' 님</strong>'
								 row += '</div>'
								 row += '<div class="col-sm-3">'
								 
								 	//row += '<img src="/link/resources/images/band_leader.PNG" />'
								 	
								 row += '</div>'
									 row += '<div class="col-sm-7 text-right">'
									 row += '<a href="#"><span class="glyphicon glyphicon-cog"></span></a>'
								 row += '</div>'
							 row += '</div>';
							 
						$('.band-members-2').append(row);	
					})
					$('.band-members-2 .row:first>.col-sm-3').append('<img src="/link/resources/images/band_leader.PNG" />');
				}
			})
		})
	</script>