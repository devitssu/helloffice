<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/head.jsp" %>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="resources/assets/css/workCss/off.css" type="text/css">
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>

	<main id="main" class="main">

	<!-- 메뉴바 -->
		<div class="col-lg-12" id="menubar">
			<div class="card">
				<nav class="navbar navbar-expand-md navbar-white bg-white">
				    <div class="container-fluid" style="; margin: 4px;">
				        <div class="navbar-collapse collapse w-100 order-1 order-md-0 dual-collapse2">
				            <ul class="navbar-nav me-auto">
				                <li class="nav-item active">
				                    <a class="nav-link" href="workMain">
									📆당일 근무 조회
									</a>
				                </li>
				                <li class="nav-item">
				                    <a class="nav-link" href="workMonth">
				          			📚이번 달 근무 조회
									</a>
				                </li>
				            </ul>
				        </div>
				        <div class="nav-link mx-auto order-0" title="현재 날짜">
								  <div class="navbar-brand mx-auto" id="current_date"></div>
				            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target=".dual-collapse2">
				                <span class="navbar-toggler-icon"></span>
				            </button>
				        </div>
				        <div class="navbar-collapse collapse w-100 order-3 dual-collapse2">
				            <ul class="navbar-nav ms-auto">
				            	<li>
					         	 <a class="nav-link btn btn-primary" href="/helloffice/workflow"  style="color: white"> <!--id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false" role="button">-->
						           <span class="material-icons md-18" style="vertical-align: middle">beach_access</span> 
									휴가 사용
					          	</a>
					          	</li>
					            <li class="nav-item" style="margin-left: 20px; margin-right: 10px">
					          		<a class="nav-link" href="/helloffice/off">📚 휴가 내역</a>
					        	</li>
				            </ul>
				        </div>
				    </div>
				</nav>
			</div>
		</div>
		

	<!-- 예정휴가 -->
	<div class="off_t1">
		<div class="off_c1">
			<div class="off_c1_1" style="width: 100%; text-align: center;">🌊예정 휴가</div>
		</div>
	</div>
	<div class="col-lg-12">
		<div class="card">
			<div class="container-fluid">
				<div class="off_c2">
					<div class="off_c2_1">
						<div class="off_c2_2">
							<img src="https://static.flex.team/time-tracking/man-on-float-tube.svg" class="sc-8grlmu eabhLn" style="">
							<p class="off_c2_2_1">신청한 휴가가 없습니다.</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 지난휴가 -->
	<div class="off_t1">
		<div class="off_c1">
			<div class="off_c1_1">🌋지난 휴가</div>
		</div>
	</div>
	<div class="col-lg-12">
		<div class="card">
			<div class="container-fluid">
				<div class="off_c2">
					<div class="off_c2_1">
						<div class="off_c2_2">
							<img src="https://static.flex.team/time-tracking/woman-on-float-tube.svg" class="sc-8grlmu eabhLn">
							<p class="off_c2_2_1">사용한 휴가 기록이 없습니다.</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<script type="text/javascript">
    
    date = new Date();
    year = date.getFullYear();
    month = date.getMonth() + 1;
    day = date.getDate();
    
    function getweek() {
    var week = new Array('일', '월', '화', '수', '목', '금', '토');
    var today = new Date().getDay();
    var todayLabel = week[today];
    return todayLabel;
    }
    document.getElementById("current_date").innerHTML = year + "년 " + month + "월 " + day + "일 " + "(" + getweek() + ")";


    setInterval("dpTime()",1000);
    function dpTime(){
      var now = new Date();
      hours = now.getHours();
      minutes = now.getMinutes();
      seconds = now.getSeconds();
      
      if (hours > 12){
        hours -= 12;
        ampm = "오후 "; 
      }else{
        ampm = "오전 "; 
      }
      if (hours < 10){ 
        hours = "0" + hours; 
      } if (minutes < 10){
        minutes = "0" + minutes; 
      } if (seconds < 10){ 
        seconds = "0" + seconds; 
      } 
      document.getElementById("dpTime").innerHTML = ampm + hours + ":" + minutes + ":" + seconds; }
    
    </script>
    

	</main>
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>