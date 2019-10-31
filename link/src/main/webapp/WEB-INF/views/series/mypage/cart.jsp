<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>Link : 시리즈</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<style type="text/css">
    /* div {border: 1px dotted red} */
    .img-size {width: 70px; height: 100px;}
    td{vertical-align: middle !important;}
</style>
</head>
<body>
<%@ include file="../common/jstl.jsp" %>
<%@ include file="../common/nav.jsp" %>
<div class="container">
<h3>${LOGIN_USER.nickName }님의 장바구니에 담긴 상품입니다.</h3>
<h3>${LOGIN_USER.nickName }님의 포인트 <fmt:formatNumber type="number" maxFractionDigits="3" value="${LOGIN_USER.point }"></fmt:formatNumber>원</h3>
    <form id="cart-form" action="" method="post">
		<div><input id="checkall" type="checkbox">전체</div>
		<table class="table table-condensed well">
               <colgroup>
                  <col width="3%">
                  <col width="10%">
                  <col width="25%">
                  <col width="*">
                  <col width="10%">
                  <col width="10%">
               </colgroup>
               <tbody>
               		<c:forEach var="cart" items="${carts }">
						<tr>
							<td><input type="checkbox" name="chk" value="${cart.eno }" style=""></td>
							<td><a href="../detail.do?vodno=${cart.vno }"><img class="img-size" src="/link/resources/images/series/vods/${cart.img }"></a></td>
							<td><a href="../detail.do?vodno=${cart.vno }">${cart.vtitle }</a></td>
							<td><a href="../detail.do?vodno=${cart.vno }">${cart.etitle }</a></td>
							<td><span class="episode-price"><fmt:formatNumber type="number" maxFractionDigits="3" value="${cart.price }"></fmt:formatNumber></span>원</td>
							<td><button class="btn">삭제</button></td>
						</tr>
					</c:forEach>
               </tbody>
        </table>
        <div style="margin-bottom: 30px;" >
	        	<button class="btn btn-default" type="button" id="btn-delete">선택상품 삭제</button>
	            <button class="btn" type="button" id="btn-order">선택상품 구매</button>
            <div class="pull-right">결제 금액(<span class="checked">0</span>건 선택) : <strong id="total-price-box">0</strong>원</div>
        </div >

    </form>
</div>
<script type="text/javascript">
	$(function(){
		$("#btn-delete").click(function() {
			$("#cart-form").attr("action", 'delete.do');
			$("#cart-form").submit();
		});
		
		$("#btn-order").click(function() {
			$("#cart-form").attr("action", 'order.do');
			$("#cart-form").submit();
		});
		
		$("#checkall").change(function(){
	        if($("#checkall").prop("checked")){
	            $("input[name=chk]").prop("checked",true);
	        }else{
	            $("input[name=chk]").prop("checked",false);
	        }
		    var checked = $("input:checkbox[name=chk]:checked").length;
		    $(".checked").text(checked);
		    
		    changePrice();
	    });
		
		$("input[name=chk]").change(function(){
	    	var checked = $("input:checkbox[name=chk]:checked").length;
		    $(".checked").text(checked);
		    
		    changePrice();
	    });
		
		function changePrice() {
			var totalPrice = 0;
			$('input[name=chk]:checked').each(function(index, checkbox) {
				var price = parseInt($(checkbox).parents("tr").find("span").text().replace(/,/g, ''));
				totalPrice += price;
			});
			$("#total-price-box").text(new Number(totalPrice).toLocaleString());
		}
	})
</script>
</body>