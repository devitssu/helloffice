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
        
        <!-- 주단위 조회 -->
		<div class="col-lg-12">
	        <div class="card week-wrap">
	        	<div class="container-fluid" style="margin:40px">
	        		<div class="row">
					    <div class="col">
					      <button type="button" class="btn btn-light" data-bs-toggle="modal" data-bs-target="#workType" href="#">근무 유형</button>
					    </div>
					  </div>
	        	</div>
	        	<div class="container-fluid" style="margin-left:40px; margin-bottom: 40px">
				  <div class="row" style="margin-bottom: 40px">
				    <div style="font-size: 1.5em" class="col">
				      이번 달 총 근무 일 수 : ${inoutNo.size()}
				      
				    </div>
				    <div class="col-6">
				    </div>
				    <div class="col">
				    </div>
				  </div>
					  <c:forEach items="${list }" var="w">
					  <div class="row"  style="margin-bottom: 40px">
					    <div role="button" data-bs-toggle="modal" data-bs-target="#workRepeat" class="col-4" style="font-size: 2em">
					      <a href="/helloffice/workMain/detail/${w.inDate}">✨${w.inDate}</a>
					      
					    </div>
					    <div class="col-4" style="font-size: 2em">
					    	👋
					    	<span style="font-size: 0.8em">출근 : ${w.inTime}</span>
					    </div>
					    <div class="col-4" style="font-size: 2em">
					    	👏
					    	<span style="font-size: 0.8em">퇴근 : ${w.outTime}</span> 
					    </div>
					  </div>
					  </c:forEach>
				</div>
	        </div>
		</div>
					  <c:if test="${page.startPage != 1}" ><a href="${page.startPage - 1}">이전</a></c:if>
					  <c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">
					  	<c:if test="${page.currentPage != i and i <= page.lastPage}"><a href="${i}">${i}</a> &nbsp	</c:if>
					  	<c:if test="${page.currentPage == i and i <= page.lastPage}">${i} &nbsp</c:if>
					  </c:forEach>
					  <c:if test="${page.endPage < page.lastPage}"><a href="${page.endPage + 1}">다음</a></c:if>
				
					
					
					
					
					
					
					
					
					
						
		
		<!-- 근무 유형 Modal -->
		<div class="modal fade" id="workType" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<h2 class="modal-title" id="exampleModalLabel" style="margin-bottom: 32px;"> ${loginEmp.empName }님의 근무유형</h2>
					</div>
					<div class="modal-body" style="padding: 32px;">
						<div style="margin-top: -10px;">
							<div class="worktype_c">
								<div class="worktype_c1">
									적용기간
								</div>
								<div class="worktype_c2">
									
								</div>
								<div class="worktype_c3">
									<div class="worktype_c3_1">
										<div class="worktype_c3_1_1">
											<span class="worktype_c3_1_1_1">
												2022-02-23 ~ 
											</span>
											<div class="worktype_c3_1_1_2">
												<div class="worktype_c3_1_1_2_1">적용중</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="worktype_c">
								<div class="worktype_c1">
									근무유형
								</div>
								<div class="worktype_c2">
									
								</div>
								<div class="worktype_c3">
									<div class="worktype_c3_1">
										<div class="worktype_c3_1_1">
											<span class="worktype_c3_1_1_1">
												기본 - 고정 출·퇴근
											</span>
										</div>
									</div>
								</div>
							</div>
							<div class="worktype_c">
								<div class="worktype_c1">
									계약유형
								</div>
								<div class="worktype_c2">
									
								</div>
								<div class="worktype_c3">
									<div class="worktype_c3_1">
										<div class="worktype_c3_1_1">
											<span class="worktype_c3_1_1_1">
												통상근무 주 40시간
											</span>
										</div>
									</div>
								</div>
							</div>
							<div class="worktype_c">
								<div class="worktype_c1">
									근무시간 계산 주기
								</div>
								<div class="worktype_c2">
									
								</div>
								<div class="worktype_c3">
									<div class="worktype_c3_1">
										<div class="worktype_c3_1_1">
											<span class="worktype_c3_1_1_1">
												주기 시작 요일: 월요일
											</span>
										</div>
									</div>
								</div>
							</div>
							<div class="worktype_c">
								<div class="worktype_c1">
									일 평균 근무시간
								</div>
								<div class="worktype_c2">
									
								</div>
								<div class="worktype_c3">
									<div class="worktype_c3_1">
										<div class="worktype_c3_1_1">
											<span class="worktype_c3_1_1_1">
												근무 8시간, 휴게 1시간
											</span>
										</div>
									</div>
								</div>
							</div>
							<div class="worktype_c">
								<div class="worktype_c1">
									출·퇴근 시간
								</div>
								<div class="worktype_c2">
									
								</div>
								<div class="worktype_c3">
									<div class="worktype_c3_1">
										<div class="worktype_c3_1_1">
											<span class="worktype_c3_1_1_1">
												오전 09:00 ~ 오후 06:00
											</span>
										</div>
									</div>
								</div>
							</div>
							<div class="worktype_c">
								<div class="worktype_c1">
									일하는 날
								</div>
								<div class="worktype_c2">
									
								</div>
								<div class="worktype_c3">
									<div class="worktype_c3_1">
										<div class="worktype_c3_1_1">
											<span class="worktype_c3_1_1_1">
												월, 화, 수, 목, 금
											</span>
										</div>
									</div>
								</div>
							</div>
							<div class="worktype_c">
								<div class="worktype_c1">
									유급휴일
								</div>
								<div class="worktype_c2">
									
								</div>
								<div class="worktype_c3">
									<div class="worktype_c3_1">
										<div class="worktype_c3_1_1">
											<span class="worktype_c3_1_1_1">
												일요일
											</span>
										</div>
									</div>
								</div>
							</div>
							<div class="worktype_c">
								<div class="worktype_c1">
									근무시간
								</div>
								<div class="worktype_c2">
									
								</div>
								<div class="worktype_c3">
									<div class="worktype_c3_1">
										<div class="worktype_c3_1_1">
											<span class="worktype_c3_1_1_1">
												주 40시간 (월 평균 174시간)
											</span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
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
    
    
    </section>
    
		
	</main>
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>