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

<!-- 사원 페이지 -->
<c:if test="${not empty loginEmp && 1 == loginEmp.adminLevel}">

<!-- 메뉴바 -->
		<div class="col-lg-12" id="menubar">
			<div class="card">
				<nav class="navbar navbar-expand-md navbar-white bg-white">
				    <div class="container-fluid" style="; margin: 4px;">
				        <div class="navbar-collapse collapse w-100 order-1 order-md-0 dual-collapse2">
				            <ul class="navbar-nav me-auto">
				                <li class="nav-item active">
				                    <a class="nav-link" href="workMain" style="color: black; vertical-align: middle;">
										<span class="material-icons" style="vertical-align: middle;">undo</span>
										근무 페이지로 돌아가기
									</a>
				                </li>
				                <li class="nav-item active">
				                    <a class="nav-link" href="off" style="color: black; vertical-align: middle;">
										<span class="material-icons" style="vertical-align: middle;">undo</span>
										휴가 페이지로 돌아가기
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
				            	
				            </ul>
				        </div>
				    </div>
				</nav>
			</div>
		</div>
        
        
	<!-- 사원 연차 정산 메인 -->
	<div class="col-lg-12">
		<div class="card week-wrap">
			<div class="container-fluid">
				<div style="margin-left: 7px; margin-bottom: 100px; margin-top: 25px;">
					<button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#exampleModal" style="float: right; margin-bottom: 20px;">연차 정산 요청</button>
					<table class="table table-striped border border-3 table-bordered" style="text-align: center;">
					  <thead>
					    <tr>
					      <th scope="col">정산서 번호</th>
					      <th scope="col">신청 날짜</th>
					      <th scope="col">정산 금액</th>
					      <th scope="col">승인 여부</th>
					      <th scope="col">지급 여부</th>
					      <th scope="col">반려 사유</th>
					    </tr>
					  </thead>
					  <tbody>
					  <c:forEach var="row" items="${empList}">
					    <tr>
					      <td scope="row">${row.calNo}</td>
					      <td>
							<fmt:parseDate var="weekInDate" value="${row.calDate}" pattern="yyyyMMdd"></fmt:parseDate>
							<fmt:formatDate value="${weekInDate}" pattern="yyyy-MM-dd(EE)"></fmt:formatDate>
					      </td>
					      <td>${row.calAmount}</td>
					      <td>${row.calYn}</td>
					      <td>${row.calPayYn}</td>
					      <td>${row.calReason}</td>
					    </tr>
					  </c:forEach>
					  </tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</c:if>







<!-- 관리자 페이지 -->
<c:if test="${not empty loginEmp && 3 == loginEmp.adminLevel}">

        <!-- 메뉴바 -->
		<div class="col-lg-12" id="menubar">
			<div class="card">
				<nav class="navbar navbar-expand-md navbar-white bg-white">
				    <div class="container-fluid" style="; margin: 4px;">
				        <div class="navbar-collapse collapse w-100 order-1 order-md-0 dual-collapse2">
				            <ul class="navbar-nav me-auto">
				                <li class="nav-item active">
				                    <a class="nav-link" href="workMain" style="color: black; vertical-align: middle;">
										<span class="material-icons" style="vertical-align: middle;">undo</span>
										관리자 페이지 돌아가기
									</a>
				                </li>
				                <li class="nav-item active">
				                    <a class="nav-link" href="adminOff" style="color: black; vertical-align: middle;">
										<span class="material-icons" style="vertical-align: middle;">undo</span>
										휴가 관리 페이지 돌아가기
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
				            		<a class="nav-link" href="useDoOff">
									📋연차 촉구 관리
									</a>
					          	</li>
				            </ul>
				        </div>
				    </div>
				</nav>
			</div>
		</div>
        
        
	<!-- 관리자 연차 정산 메인 -->
	<div class="col-lg-12">
		<div class="card week-wrap">
			<div class="container-fluid">
				<div style="margin-left: 7px; margin-bottom: 100px; margin-top: 25px;">
					    <table class="table table-striped border border-3 table-bordered" style="text-align: center;">
					  <thead>
					    <tr>
					      <th scope="col">정산서 번호</th>
					      <th scope="col">사원 번호</th>
					      <th scope="col">신청 날짜</th>
					      <th scope="col">정산 금액</th>
					      <th scope="col">승인 여부</th>
					      <th scope="col">지급 여부</th>
					      <th scope="col">반려 사유</th>
					    </tr>
					  </thead>
					  <tbody>
					  <c:forEach var="row" items="${adminList}">
					    <tr>
					      <td scope="row"><a href="${path}/helloffice/calView.do?calNo=${row.calNo}">${row.calNo}</a></td>
					      <td scope="row">${row.empNo}</td>
					      <td>
							<fmt:parseDate var="weekInDate" value="${row.calDate}" pattern="yyyyMMdd"></fmt:parseDate>
							<fmt:formatDate value="${weekInDate}" pattern="yyyy-MM-dd(EE)"></fmt:formatDate>
					      </td>
					      <td>${row.calAmount}</td>
					      <td>${row.calYn}</td>
					      <td>${row.calPayYn}</td>
					      <td>${row.calReason}</td>
					    </tr>
					  </c:forEach>
					  </tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
    
</c:if>
</div>  
    
    <!-- 연차 정산서 작성 Modal -->
		<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		    <form action="calInsert.do" method="post">
			      <div class="modal-header">
			        <h3 class="modal-title" id="exampleModalLabel"  style="margin-bottom: 30px;">연차 정산 요청</h3>
			      </div>
			      <div class="modal-body">
			      <h5 style="width: 100%; text-align: center;">사원 정보</h5>
			        <table class="table align-middle border border-1 table-bordered">
					  <thead>
					    <tr class="table-info">
					      <th scope="col">사원번호</th>
					      <th scope="col">성명</th>
					      <th scope="col">직급</th>
					      <th scope="col">부서</th>
					      <th scope="col">입사일</th>
					    </tr>
					  </thead>
					  <tbody>
					    <tr>
					      <th>${loginEmp.empNo}</th>
					      <td>${loginEmp.empName}</td>
					      <td>${loginEmp.empRank}</td>
					      <td>${loginEmp.depNo}</td>
					      <td>${loginEmp.entryDate}</td>
					    </tr>
					  </tbody>
					</table>
					<h5 style="width: 100%; text-align: center; margin-top: 50px; margin-bottom: 20px;" title=" 1일 연차 수당 = 통상임금(근속수당/식비 포함 가능, 초과근무수당X) / 통상 근무시간">연차 정산서 작성 💬</h5>
			          <div class="input-group mb-3">
			            <span class="input-group-text" id="inputGroup-sizing-default" title="통상임금(근속수당/식비 포함 가능, 초과근무수당X)">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;월 급여&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						<input  id="nu1" size="20" type="text" placeholder="통상임금을 입력해주세요." class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
					  </div>
			          <div class="input-group mb-3">
			            <span class="input-group-text" id="inputGroup-sizing-default" title="통상근무시간(초과근무시간X)">&nbsp;월 근무 시간</span>
						<input  id="nu2" size="20" type="text" placeholder="월 근무시간을 입력해주세요." class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" onblur="hour()">
					  </div>
			          <div class="input-group mb-3">
			            <span class="input-group-text" id="inputGroup-sizing-default" >&nbsp;&nbsp;&nbsp;&nbsp;시급 계산&nbsp;&nbsp; </span>
						<input  id="num1" size="20" type="text" placeholder="시급을 입력해주세요.(자동계산ON)" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
					  </div>
			          <div class="input-group mb-3">
			            <span class="input-group-text" id="inputGroup-sizing-default" title="주 근무시간 / 근무 일수(토요일이 무급이라면 X)">1일 근무시간</span>
						<input id="num2" size="20" type="text" placeholder="1일 근무시간을 계산하여 입력해주세요." class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
					  </div>
			          <div class="input-group mb-3">
			            <span class="input-group-text" id="inputGroup-sizing-default">&nbsp;&nbsp;&nbsp;잔여 연차&nbsp;&nbsp;&nbsp;</span>
						<input id="num3" size="20" type="text" placeholder="잔여연차 조회" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" disabled="disabled" value="3">
					  </div>
			          <div class="input-group mb-3">
			          	<span class="input-group-text" id="inputGroup-sizing-default" style="color: white; background-color: grey;" onclick="add(), inputNumberFormat(resultwon)">정산 금액 작성</span>
						<input name="calAmount" id="resultwon" size="20" type="text" placeholder="계산을 클릭시 정산금액을 알 수 있습니다." class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
					  </div>
					  <figure class="text-end" style="margin: 20px; margin-top: 40px;">
					  <figcaption class="blockquote-footer">
					  	잘못된 정보를 기입 시 반려될 수도 있습니다.
					  </figcaption>
					  </figure>
			      </div>
			      <div class="modal-footer">
			      	<input name="empNo" type="text" value="${loginEmp.empNo}" hidden="">
			      	<button type="submit" class="btn btn-primary">요청</button>
			        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
			      </div>
		    </form>
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
    
    //원하는 페이지로 이동시 검색조건, 키워드 값을 유지하기 위해
    function list(page) {
		location.href ="${path}/helloffice/adminWorkMain?curPage="+page+"&searchType-${map.searchType}" + "&searchValue=${map.searchValue}";
	}
    
    
	//화페 콤마 붙이기
    function inputNumberFormat(obj) {
        obj.value = comma(uncomma(obj.value));
    }

    function comma(str) {
        str = String(str);
        return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
    }

    function uncomma(str) {
        str = String(str);
        return str.replace(/[^\d]+/g, '');
    }

    //곱하기
    function add() {
		var num1 = document.all.num1.value;
		var num2 = document.all.num2.value;
		var num3 = document.all.num3.value;
		document.all.resultwon.value = parseInt(num1) * parseInt(num2) * parseInt(num3);
	}

    function hour(){
    	var nu1 = document.all.nu1.value;
		var nu2 = document.all.nu2.value;
		document.all.num1.value = parseInt(nu1) / parseInt(nu2);
    }
    
    
    </script>
    
    
    </section>
    
		
	</main>
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>