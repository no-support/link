<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>

<head>
    <title>Link : TV 메인</title>
    <link rel="shortcut icon" type="image/x-icon" href="../../../resources/images/shortcut-icon.PNG">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" type="image/x-icon" href="/mj/kurly/images/header_footer/tab-logo02.png">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>

    <script>
        google.charts.load('current', {
            'packages': ['corechart']
        });
        google.charts.setOnLoadCallback(drawVisualization);

        function drawVisualization() {
            var data = google.visualization.arrayToDataTable([
                ['Month', '횟수'],
                ['전체 재생수', 165, ],
                ['전체 동영상', 135, ],
                ['재생 목록', 157, ],
                ['좋아요', 150, ],
                ['댓글', 200, ]
            ]);
            var options = {
                title: '채널 통계표',
                vAxis: {
                    title: ''
                },
                hAxis: {
                    title: ''
                },
                seriesType: 'bars',
                series: {
                    5: {
                        type: 'line'
                    }
                }
            };

            var chart = new google.visualization.ColumnChart(document.getElementById('chart_div'));
            chart.draw(data, options);
        }
    </script>




    <style>
        .navbar-nav>li>a:hover,
        .navbar-nav>li>a {
            background-color: indigo;
        }

        .nav .open>a,
        .nav .open>a:focus,
        .nav .open>a:hover {
            background-color: indigo;

        }

        a:hover,
        a:focus {
            text-decoration: none;
        }

        .main-nav {
            background-color: indigo;

        }

        .blog-main-javer {
            position: relative;
            top: 5px;
            font-size: 15px;
            color: white;
            font-weight: 800;
        }

        .blog-main-blog {
            position: relative;
            top: 8px;
            font-size: 24px;
            color: white;
        }

        .btn-green {
            background-color: white;
            color: white;
            padding: 2px 6px;
        }

        .glyphicon-search {
            font-size: 23px;
            color: black;
        }

        .blog-navbar-id {
            color: white;
            position: relative;
            bottom: 3px;
            font-size: 13px;
            font-weight: bold;
            margin-right: 10px;
            cursor: pointer;
        }


        .glyphicon-triangle-bottom {
            margin-left: 5px;
        }

        .blog-navbar-img {
            position: relative;
            bottom: 3px;
            width: 30px;
        }

        .blog-navbar-right {
            position: relative;
        }

        .glyphicon glyphicon-triangle-bottom {
            color: white;
            font-size: 7px;
        }

        .bell {
            display: inline-block;
            position: relative;
            width: 60px;
            height: 50px;
            border-right: 1px solid white;
            border-left: 1px solid white;
            padding-right: 5px;

        }

        .envelope {
            display: inline-block;
            position: relative;
            width: 60px;
            height: 50px;
            border-right: 1px solid white;
        }

        .glyphicon-bell {
            color: white;
            position: relative;
            font-size: 20px;
            padding: 13px;
        }

        .glyphicon-envelope {
            color: white;
            position: relative;
            font-size: 20px;
            padding: 12px 20px;
        }

        .caret {
            color: white;
        }

        ul,
        li {
            list-style: none;
        }



        .tv-side-menu {
            border: 1px solid #CECECE;
            cursor: pointer;
            width: 180px;
            padding: 15px 30px 15px 30px;
            border-radius: 20px;
            margin: 2px;
            font-family: Georgia, "맑은 고딕";
            text-align: center;
        }

        .tv-side-menu:hover {
            color: white;
            background-color: indigo;
        }

        .tv-side-menubar {
            position: fixed;
            top: 150px;
            left: 100px;
            font-size: 15px;
        }

        .tv-side-menu a {
            text-decoration: none;
            color: black;

        }

        .tv-content-header {
            font-size: 20px;
            text-align: left;
            margin-top: 50px;
        }

        .tv-content-header a {
            text-decoration: none;
            color: black;
        }

        /*---------------------------네브-------------------------------------------------*/


        .tv-my-benner {
            height: 200px;
    
        }
        .btn-video-upload{
            border: 1px solid indigo;
            color: white;
            background-color: indigo;
            margin-right: 20px;
        }
    </style>

</head>

<body>
   <%@include file="common/nav.jsp" %>
    <div class="container" style="margin-top:100px; ">
        <div class="row">
            <div>
                <ul class="tv-side-menubar">
                    <li class="tv-side-menu" onclick="location.href='home.do'">홈</li>
                   <li class="tv-side-menu" onclick="location.href='rank.do?category=best'">인기</li>
                   <li class="tv-side-menu chk-user" data-login="${not empty LOGIN_USER ? 'Y' : 'N' }" data-url="history.do?sort=recent">최근 본 동영상</li>
                   <li class="tv-side-menu chk-user" data-login="${not empty LOGIN_USER ? 'Y' : 'N' }" data-url="history.do?sort=later">나중에 볼 동영상</li>
                   <li class="tv-side-menu chk-user" data-login="${not empty LOGIN_USER ? 'Y' : 'N' }" data-url="history.do?sort=like">좋아요 한 동영상</li>
                   <li class="tv-side-menu chk-user" data-login="${not empty LOGIN_USER ? 'Y' : 'N' }" data-url="mychannel.do">내 채널 가기</li>
                </ul>
            </div>

            <!--사이드메뉴 끝------------------------------------->
            <div class="container-fluid">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="row">
                            <div class="tv-my-benner">
                                <img src="" style="width: 100%; height: 100%" alt="">
                                <div style="border: 1px solid; color: white; background-color: indigo; height: 250px; text-align: center; padding-top: 50px;">
                                    <span style="font-size: 100px; font-family: fantasy;">MY Chanel</span></div>

                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12-sm">
                        <h2 class="page-header">링크 TV</h2>
                    </div>
                </div>
            </div>
            <div><button class="btn btn-primary pull-right btn-video-upload" data-toggle="modal" data-target="#myModal">동영상 등록</button></div>
            <div><button class="btn btn-primary pull-right btn-video-upload" data-toggle="modal" data-target="#myModal2">재생목록 등록</button></div>
            <div class="container">
                <ul class="nav nav-tabs">
                    <li class="active"><a data-toggle="tab" href="#home">홈</a></li>
                    <li><a data-toggle="tab" href="#menu1">재생 목록</a></li>
                    <li><a data-toggle="tab" href="#menu2">동영상</a></li>
                    <li><a data-toggle="tab" href="#menu3">댓글</a></li>    
                </ul>

                <div class="tab-content">
                    <div id="home" class="tab-pane fade in active">
                        <div>
                            <div id="chart_div" style="width:100%; height: 100%;"></div>
                        </div>
                    </div>
               
                <div id="menu1" class="tab-pane fade">
                    <div>재생목록 이름</div>
                   <div class="my-playlsit-box" style="width: 250px; float: left">
                        <img src="/final/rain_image.png" style="width: 100%; padding: 5px;" alt="">
                   </div>
                   <div class="my-playlsit-box" style="width: 250px; float: left">
                        <img src="/final/rain_image.png" style="width: 100%; padding: 5px;" alt="">
                   </div>
                   <div class="my-playlsit-box" style="width: 250px; float: left">
                        <img src="/final/rain_image.png" style="width: 100%; padding: 5px;" alt="">
                   </div>
                   <div class="my-playlsit-box" style="width: 250px; float: left">
                        <img src="/final/rain_image.png" style="width: 100%; padding: 5px;" alt="">
                   </div>
                   
                </div>
                <div id="menu2" class="tab-pane fade">
                
                <div class="my-playlsit-box" style="width: 250px; float: left">
                        <img src="/final/rain_image.png" style="width: 100%; padding: 5px;" alt="">
                   </div>
                </div>
                <div id="menu3" class="tab-pane fade">
                
                </div>
            </div>

        </div>
                                <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                          <div class="modal-dialog">
                            <div class="modal-content">
                              <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">    <span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="myModalLabel">동영상 등록</h4>
                              </div>
                              <div class="modal-body">
                                <form method="post" action="" enctype="multipart/form-data" >
                                    <label class="inline-form">동영상 제목</label>
                                    <input class="form-control" type="text" name="title" >
                                    <label class="inline-form">재생목록 선택</label>
                                    <select class="form-control">
                                        <option>asd</option>
                                        <option>asd</option>
                                        <option>asd</option>
                                    </select>
                                    <label class="inline-form">동영상 선택</label>
                                    <input class="form-control" type="file" name="video" id="">
                                    <label class="inline-form">썸네일 선택</label>
                                    <input class="form-control" type="file" name="thumbnail" id="">
                                    
                                </form>
                              </div>
                              <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
                                <button type="button" class="btn btn-primary">등록</button>
                              </div>
                            </div>
                          </div>
                        </div>
                        <div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                          <div class="modal-dialog">
                            <div class="modal-content">
                              <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="myModalLabel">재생목록 등록</h4>
                              </div>
                              <div class="modal-body">
                                <form action="">
                                    <label class="inline-form">재생목록 이름</label>
                                    <input class="form-control" type="text" name="playlist" id="">
                                    
                                </form>
                              </div>
                              <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
                                <button type="button" class="btn btn-primary">등록</button>
                              </div>
                            </div>
                          </div>
                        </div>


</div>
</div> 
    <script>

    </script>

</body>

</html>
