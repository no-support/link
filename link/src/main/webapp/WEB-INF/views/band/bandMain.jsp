<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>Link Band</title>
    <link rel="shortcut icon" type="image/x-icon" href="/link/resources/images/shortcut-icon.PNG">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/link/resources/css/band/band.css">
<link rel="stylesheet" href="/link/resources/css/blog.css">
<link rel="stylesheet" href="/link/resources/css/main.css">
</head>
<body class="band-back">
	<!--네비 시작-->
	<%@include file="bandMainNav.jsp"%>
	<!--네비끝-->
	<div class="container">
		<div class="row">
			<div class="col-sm-8">
				<h3>내 목록</h3>
			</div>
			<div class="col-sm-4 band-option-top">
				<div class=" text-right">
					<a href="" class="glyphicon glyphicon-cog">목록편집</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="" class="glyphicon glyphicon-list-alt">밴드가이드</a>
				</div>
			</div>
		</div>

		<div class="row text-center">
			<div class="col-sm-12">

				<div class="row band-each">
					<c:if test="${loginYn eq true }">
						<div class="sample-band-hover">
							<a href="addBand.do">
								<div class="col-sm-3">
									<div class="row text-center">
										<div class="col-sm-12 band-add-top">
											<img src="/link/resources/images/band_plus.PNG">
											<div class="col-sm-12">밴드 추가하기</div>
										</div>
									</div>
								</div>
							</a>
						</div>
					</c:if>
					<c:choose>
						<c:when test="${loginYn eq true || not empty bands}">
							<c:forEach items="${bands }" var="band">

								<div class="sample-band-hover">
									<a href="bandhome.do?bandNo=${band.no }">
										<div class="col-sm-3">
											<div class="row">
												<div class="col-sm-12">
													<img src="${band.photo }" class="band-into-photo">
												</div>
											</div>
											<div class="row text-left band-into-name">
												<div class="col-sm-12">${band.name }</div>
												<div class="col-sm-12 band-buttom">멤버 ${band.joinCount }
												</div>
											</div>
										</div>
									</a>
								</div>

							</c:forEach>
						</c:when>
						<c:otherwise>
							<c:if test="${loginYn eq false}">
								<div class="test-center">
									<label style="font-size: 70px; padding-top: 100px; padding-bottom: 90px;">로그인을
										먼저 해주세요</label>
								</div>
							</c:if>
							<c:if test="${loginYn eq true }">
								<div class="test-center">
									<label>가입된 밴드가 없습니다.</label>
								</div>
							</c:if>
						</c:otherwise>
					</c:choose>

				</div>
			</div>
		</div>
		<!--밴드 목록  끝-->
	</div>
	<div class="container-fluid second-back">
		<div class="container">
			<div class="row">
				<!--인기글 시작-->
				<div class="col-sm-5 isu-top">인기글</div>
				<div class="col-sm-7 text-right isu-more">
					<a href="#" class="">더보기 ></a>
				</div>
			</div>

			<div class="row">

				<a href="#">
					<div class="col-sm-6 band-isu-contents isu-border isu-margin">
						<div class="row ">
							<div class="col-sm-12 isu-title">
								<span class="isu-title2 ">안녕하세요 인기글1 입니다.</span>
							</div>
						</div>
						<div class="row isu-border-top">
							<div class="col-sm-9 isu-contents">
								<span> 02. 빅토리앵 사르두의 희곡 '라 토스카(La Tosca)'를 주세페 자코사와 루이지
									일리카가 오페라 대본으로 만들었습니다. 1900년 로마에서 초연됐고, 전세계 오페라하우스에서 4~5위 정도의 매우
									높은 </span>
							</div>
							<div class="col-sm-3 isu-photo">
								<img src="/link/resources/images/band.png" class="isu-photo2">
							</div>
						</div>
					</div>
				</a> <a href="#">
					<div class="col-sm-6 band-isu-contents isu-border">
						<div class="row ">
							<div class="col-sm-12 isu-title">
								<span class="isu-title2 ">안녕하세요 인기글1 입니다.</span>
							</div>
						</div>
						<div class="row isu-border-top">
							<div class="col-sm-9 isu-contents">
								<span> 02. 빅토리앵 사르두의 희곡 '라 토스카(La Tosca)'를 주세페 자코사와 루이지
									일리카가 오페라 대본으로 만들었습니다. 1900년 로마에서 초연됐고, 전세계 오페라하우스에서 4~5위 정도의 매우
									높은 </span>
							</div>
							<div class="col-sm-3 isu-photo">
								<img src="/link/resources/images/band.png" class="isu-photo2">
							</div>
						</div>
					</div>
				</a>

			</div>
			<!--인기글 끝-->

			<!-- 밴드추천 시작-->
			<div class="row chchen-band-top">
				<!--인기글 시작-->
				<div class="col-sm-5 isu-top">이런 밴드는 어때요</div>
				<div class="col-sm-7 text-right isu-more">
					<a href="#" class="">더보기 ></a>
				</div>
			</div>

			<div class="row">
				
				<c:forEach var="band" items="${notJoinBands }" begin="0" end="7">
					<div class="col-sm-6 chuchen-margin">
						<a href="bandhome.do?bandNo=${band.no }">
							<div class="row">
								<div class="col-sm-3">
									<img src="${band.photo }" class="chuchen-photo">
								</div>
								<div class="col-sm-9 cuchen-band-margin">
									<div class="row">
										<div class="col-sm-12 chuchen-band-title">
											<strong>${band.name }</strong>
										</div>
									</div>
									<div class="row">
										<div class="col-sm-12 chuchen-band-info">저희는 다이어트 밴드입니다.
											밴드에 언제든 가입해주세요</div>
									</div>
								</div>
							</div>
						</a>
					</div>
				</c:forEach>

			</div>

		</div>

	</div>
</body>
</html>