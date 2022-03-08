<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/head.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="resources/assets/css/workCss/workMain.css" type="text/css">
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>

	<main id="main" class="main">
	
	<section class="section dashboard">
	
	<div class="row">


        <!-- 메뉴바 -->
		<div class="col-lg-12" id="menubar">
			<div class="card">
				<nav class="navbar navbar-expand-md navbar-white bg-white">
				    <div class="container-fluid" style="; margin: 4px;">
				        <div class="navbar-collapse collapse w-100 order-1 order-md-0 dual-collapse2">
				            <ul class="navbar-nav me-auto">
				                <li class="nav-item active">
				                    <a class="nav-link" href="workMonth">
									📆이번 달 근무 조회
									</a>
				                </li>
				                <li class="nav-item">
				                    <a class="nav-link" href="workYear">
				          			📚이번 년도 근무 조회
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
        
        
		<!-- 모든 근무들 조회 -->
		<div class="col-lg-12">
	        <div class="card week-wrap">
	        	<div class="container-fluid">
	        		<div style="margin-left: 7px; margin-bottom: 100px; margin-top: 40px;">
					  	<form action="/helloffice/adminWorkMain" method="post">
					  		<div style="float: left;">
					  		<select class="form-select form-select-sm" style="width: 105px" name="searchType">
					  			<option value="all" <c:out value="${map.searchType == 'all'?'selected':''}"/> > 전체</option>
					  			<option value="empNo" <c:out value="${map.searchType == 'empNo'?'selected':''}"/> >회원 번호</option>
					  			<option value="inDate" <c:out value="${map.searchType == 'inDate'?'selected':''}"/> >출근 날짜</option>
					  		</select>
					  		</div>
					  		<div class="input-group mb-3 input-group input-group-sm mb-3" style="width: 230px; float: left;">
							  <input type="text" name="searchValue" value="${map.searchValue}" class="form-control" aria-label="Recipient's username" aria-describedby="button-addon2">
							  <button class="btn btn-outline-secondary" type="submit" id="button-addon2">검색</button>
							</div>
					  	</form>
					</div>
						${map.count}개의 게시물이 있습니다.
					  <c:forEach items="${map.list }" var="w">
					  <table class="table table-hover" style="margin-top: 10px; font-size: 1.5em;">
					   		<thead>
						    <tr>
						    	<th>회원 번호 : ${w.empNo }</th>
						      <th scope="col">
						      	<a href="/helloffice/workMain/detail/${w.inDate}">
								<fmt:parseDate var="weekInDate" value="${w.inDate}" pattern="yyyyMMdd"></fmt:parseDate>
								<fmt:formatDate value="${weekInDate}" pattern="yyyy-MM-dd(EE)"></fmt:formatDate>
								</a>
							  </th>
						    	<td>
						    	<fmt:parseDate var="weekInTime" value="${w.inTime}" pattern="HHmmss"></fmt:parseDate>
								<fmt:formatDate value="${weekInTime}" pattern="HH:mm(a)"></fmt:formatDate>
								</td>
						    	<td>
								<fmt:parseDate var="weekOutTime" value="${w.outTime}" pattern="HHmmss"></fmt:parseDate>
								<fmt:formatDate value="${weekOutTime}" pattern="HH:mm(a)"></fmt:formatDate>
								</td>
						    </tr>
						  </thead>
						</table>
					  </c:forEach>
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
    
    
    </section>
    
		
	</main>
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>