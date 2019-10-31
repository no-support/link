<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<div class="row band-photo">
		<div class="row band-photo-title">
			<div class="col-sm-6">
				<strong>전체 사진</strong> <span>7</span>
			</div>
			<div class="col-sm-6 text-right">
				<button type="button" class="btn btn-default">사진 올리기</button>
			</div>
		</div>
		<input type="hidden" name="bandNo" value="${param.bandNo}">
		<div class="row band-photo-sort-row">
			<div class="col-sm-6">
				<select>
					<option>최신순 보기</option>
					<option>날짜별 보기</option>
				</select>

			</div>
			<div class="col-sm-6 text-right">
				<a href="#">관리</a>
			</div>
		</div>
		<div class="row band-photos-row">
			

		</div>
	</div>
	
	<script>
		$(function(){
			
			/* 밴드 이미지 보기 */
			var bandNo = $('[name=bandNo]').val();
			
			$.ajax({
				data:{bandNo : bandNo},
				dateType:'json',
				type:'get',
				url:'bandWriteContentPhoto.do',
				success:function(write){
					
					$.each(write, function(index, item){
						
						var row = '<div class="col-sm-4">'
						      		+ '<a href="#">'
						      			+'<img src="/link/resources/images/bandUploadImg/'+item.photoName+'">'
							  		+ '</a>'
							  	+ '</div>';
						$('.band-photos-row').append(row);
					})
				}
			})
		})
	</script>
