$(function(){
	$('.blogmain_login').click(function(){
		var host = location.host;
		var returnUrl = location.pathname;
		var queryString = location.search.substr(1).replace(/&/g, ',');
		location.href = '/link/loginform.do?returnUrl=' + returnUrl + '&queryString=' + queryString;
		return false;
	});	

	$('.blognav_logout_btn').click(function(){
		var host = location.host;
		var returnUrl = location.pathname;
		var queryString = location.search.substr(1).replace(/&/g, ',');
		location.href = '/link/logout.do?returnUrl=' + returnUrl + '&queryString=' + queryString;
		return false;
	});
});