<%@page import="com.kh.helloffice.work.entity.WorkEditDto"%>
<%@page import="com.kh.helloffice.work.dao.WorkEditDao"%>
<%@page import="java.util.List"%>
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
<style type="text/css">
#myProgress {
    width:400px;
    background-color:#ddd;
}
 
#myBar {
    width:400px;
    height:30px;
    background-color:#4CAF50;
}
</style>

</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>

	<main id="main" class="main">
	
	<section class="section dashboard">
	
	<div class="row">


<!-- 비로그인 시 화면 -->
	<c:if test="${empty loginEmp}">
	
	<div class="col-lg-12" id="menubar">
		<div class="card">
			<div class="text-center" style="margin-top: 100px;">
				<img src="/helloffice/resources/assets/img/logo.png" class="rounded" alt="">
			</div>
			<blockquote class="blockquote" style="text-align: center; margin-top: 30px; font-size: 1.2em;">
			  <p>헬로오피스의 모든 서비스는 회원 전용입니다.</p>
			</blockquote>
			<blockquote class="blockquote" style="text-align: center;">
			  <p>로그인 후 이용해주세요!</p>
			</blockquote>
			
			<dl class="row" style="margin: 130px; font-size: 1.2em;">
			  <dt class="col-sm-3"><span><i class="bi bi-person"></i>사람</span></dt>
			  <dd class="col-sm-9">
			    <p>한눈에 볼 수 있는 인사 정보와 회사 정보</p>
			  </dd>
			  <dt class="col-sm-3"><span><i class="bi bi-person"></i>근무</span></dt>
			  <dd class="col-sm-9"><p>간편한 출,퇴근과 조회 서비스</p></dd>
			
			  <dt class="col-sm-3 text-truncate"><span><i class="bi bi-journal-text"></i>게시판</span></dt>
			  <dd class="col-sm-9"><p>전체, 팀 게시판을 통한 편리한 의사소통</p></dd>
			 
			  <dt class="col-sm-3"><span><i class="bi bi-file-earmark-text"></i>워크플로우</span></dt>
			  <dd class="col-sm-9">
			    <dl class="row">
			      <dt class="col-sm-4"><span><i class="bi bi-clock-history"></i>예약</span></dt>
			      <dd class="col-sm-8"><p>신속하고 투명한 전자결제 서비스와 예약관리 서비스</p></dd>
			    </dl>
			  </dd>
			</dl>
			<figure class="text-end" style="margin-right: 150px; font-size: 1.2em">
			  <figcaption class="blockquote-footer">
			    <cite title="Source Title">헬로오피스</cite>
			  </figcaption>
			</figure>
		</div>
	</div>
	</c:if>

<!-- 사원 로그인 시 화면 -->
	<c:if test="${not empty loginEmp && 1 == loginEmp.adminLevel}">
	
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
					         	 <a class="nav-link btn btn-primary" href="/helloffice/workflow/wfForm"  style="color: white"> <!--id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false" role="button">-->
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
          
          
        <!-- 오늘 근무 출퇴근 조회 -->
		<div class="col-lg-12">
	        <div class="card">
	        	<div style="width: 100%;">
				  <div class="row" style="margin : 30px; font-size: 1.2em">
				    <div class="col">
				     <strong><div roll="button" data-bs-toggle="modal" data-bs-target="#workType" href="#">💻 ${loginEmp.empName}(${loginEmp.empRank})님의 당일 근무</div></strong> 
				    </div>
				    <div class="col">
				      <span class="material-icons">
						login 출근
						</span>
				    </div>
				    <div class="col">
				      <span class="material-icons">
						logout 퇴근
						</span>
				    </div>
				  </div>
				  <div class="row" style="margin : 30px;">
				    <div class="col">
				    	<a style="font-size: 50px; font-weight: 1.5em; color: gray" title="초과근무"> 🔥
				    	<c:if test="${empty outTime2 }">
				    	</c:if>
							<c:if test="${not empty outTime2 }"> 0
							 </c:if>
						</a>
				    </div>
				    <div class="col">
					    <a style="font-size: 50px; font-weight: 1.5em; color: black">
					    	<fmt:parseDate var="viewInTime" value="${workEmp.inTime}" pattern="HHmmss"></fmt:parseDate>
							<fmt:formatDate value="${viewInTime}" pattern="a HH:mm"></fmt:formatDate>
					    </a>
				    </div>
				    <div class="col" style="font-size: 50px; font-weight: 1.5em; color: gray">
				    	<a style="font-size: 50px; font-weight: 1.5em; color: black">
					    	<fmt:parseDate var="viewInTime" value="${outTime.outTime}" pattern="HHmmss"></fmt:parseDate>
							<fmt:formatDate value="${viewInTime}" pattern="a HH:mm"></fmt:formatDate>
					    </a>
				    </div>
				  </div>
				</div>
			</div>
		</div>
        
        <!-- 주단위 조회 -->
		<div class="col-lg-12">
	        <div class="card week-wrap">
	        	<div class="container-fluid">
	        		<figure style="margin: 20px; margin-top: 40px;">
					  <figcaption class="blockquote-footer">
					    근무 간편 조회 <cite title="Source Title">(최근)</cite>
					  </figcaption>
					</figure>
					  <c:forEach items="${weekList }" var="w">
					  <table class="table table-hover" style="margin-top: 10px; font-size: 1.5em;">
					   		<thead>
						    <tr>
						      <th scope="col">근무 일 : 
								<fmt:parseDate var="weekInDate" value="${w.inDate}" pattern="yyyyMMdd"></fmt:parseDate>
								<fmt:formatDate value="${weekInDate}" pattern="yyyy-MM-dd(EE)"></fmt:formatDate>
							  </th>
						    	<td>출근 시간 :
						    	<fmt:parseDate var="weekInTime" value="${w.inTime}" pattern="HHmmss"></fmt:parseDate>
								<fmt:formatDate value="${weekInTime}" pattern="HH:mm(a)"></fmt:formatDate>
								</td>
						    	<td>퇴근 시간 : 
								<fmt:parseDate var="weekOutTime" value="${w.outTime}" pattern="HHmmss"></fmt:parseDate>
								<fmt:formatDate value="${weekOutTime}" pattern="HH:mm(a)"></fmt:formatDate>
								</td>
						    </tr>
						  </thead>
						</table>
					  </c:forEach>
					  <button type="button" class="btn btn-danger btn-sm" data-bs-toggle="modal" data-bs-target="#exampleModal" style="float: right; margin-top: 10px; margin-bottom: 30px;">근무 수정/삭제 요청</button>
				   </div>
				</div>
	        </div>
	      </c:if>
		
		
		
		
	
	
	
<!-- 관리자 급 로그인 시 화면 -->
	<c:if test="${not empty loginEmp && 3 == loginEmp.adminLevel}">
	
	<!-- 메뉴바 -->
		<div class="col-lg-12" id="menubar">
			<div class="card">
				<nav class="navbar navbar-expand-md navbar-white bg-white">
				    <div class="container-fluid" style="; margin: 4px;">
				        <div class="navbar-collapse collapse w-100 order-1 order-md-0 dual-collapse2">
				            <ul class="navbar-nav me-auto">
				                <li class="nav-item active">
				                    <a class="nav-link" href="adminWorkMain">
									📆사원 근무 수정, 삭제
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
				            	
					            <li class="nav-item" style="margin-left: 20px; margin-right: 10px">
					          		<a class="nav-link" href="adminOff">
				          			📚휴가 관리
									</a>
					        	</li>
				            </ul>
				        </div>
				    </div>
				</nav>
			</div>
		</div>
					  
				
		<!-- 근무 수정,삭제 요청 알림 -->
	<div class="col-lg-4" style="margin-left: auto; margin-right: auto;">
		<div class="card week-wrap">
			<div class="container-fluid">
				<!-- 근무 수정 -->
				<div class="card-body" style=" height: 325px; overflow: auto;">
	              <h5 class="card-title">근무 수정 요청</h5>
	            <c:forEach items="${editList}" var="e">
				  <div class="activity" style="margin-bottom: -10px;">
	                <div class="activity-item d-flex">
	                  <div class="activite-label">사원 번호 : ${e.empNo}</div>
	                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                  <i class='bi bi-circle-fill activity-badge text-success align-self-start'></i>
	                  <div class="activity-content">
	                  	<a href="/helloffice/workMain/detail/${e.editDate}">
						<fmt:parseDate var="weekInDate" value="${e.editDate}" pattern="yyyyMMdd"></fmt:parseDate>
						<fmt:formatDate value="${weekInDate}" pattern="yyyy-MM-dd(EE)"></fmt:formatDate>
						</a>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<fmt:parseDate var="weekOutTime" value="${e.editIntime}" pattern="HH:mm"></fmt:parseDate>
						<fmt:formatDate value="${weekOutTime}" pattern="HH시 mm분"></fmt:formatDate>
						~
						<fmt:parseDate var="weekOutTime" value="${e.editOuttime}" pattern="HH:mm"></fmt:parseDate>
						<fmt:formatDate value="${weekOutTime}" pattern="HH시 mm분"></fmt:formatDate>
	                  </div>
	                </div>
	              </div>
	            </c:forEach>
            	</div>
            	<hr>
            	<!-- 근무 삭제 -->
            	<div class="card-body" style="margin-top: -15px; height: 310px; overflow: auto;">
	              <h5 class="card-title">근무 삭제 요청</h5>
	              <c:forEach items="${delList}" var="d">
				  <div class="activity" style="margin-bottom: -10px;">
	                <div class="activity-item d-flex">
	                  <div class="activite-label">사원 번호 : ${d.empNo}</div>
	                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                  <i class='bi bi-circle-fill activity-badge text-danger align-self-start'></i>
	                  <div class="activity-content">
	                  	<a href="/helloffice/workMain/detail/${d.editDate}">
						<fmt:parseDate var="weekInDate" value="${d.editDate}" pattern="yyyyMMdd"></fmt:parseDate>
						<fmt:formatDate value="${weekInDate}" pattern="yyyy-MM-dd(EE)"></fmt:formatDate>
						</a>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<fmt:parseDate var="weekOutTime" value="${d.editIntime}" pattern="HH:mm"></fmt:parseDate>
						<fmt:formatDate value="${weekOutTime}" pattern="HH시 mm분"></fmt:formatDate>
						~
						<fmt:parseDate var="weekOutTime" value="${d.editOuttime}" pattern="HH:mm"></fmt:parseDate>
						<fmt:formatDate value="${weekOutTime}" pattern="HH시 mm분"></fmt:formatDate>
	                  </div>
	                </div>
	              </div>
	            </c:forEach>
            	</div>
			</div>
		</div>
	</div>
	
	
	<!-- 연차 촉구, 정산 가이드 알림 -->
	<div class="col-lg-4" style="margin-left: auto; margin-right: auto;">
		<div class="card week-wrap">
			<div class="container-fluid">
				
				
				<!-- 연차 촉구 6개월 -->
				<div class="card-body" style=" height: 325px; overflow: auto;">
	              <h5 class="card-title">연차 촉구 임박<span> | 6개월, 10일 이내</span></h5>
	            <c:forEach items="${urgeOneList}" var="e">
				  <div class="activity" style="margin-bottom: -10px;">
	                <div class="activity-item d-flex">
	                  <div class="activite-label">사원 번호 : ${e.empNo}</div>
	                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                  <i class='bi bi-circle-fill activity-badge text-success align-self-start'></i>
	                  <div class="activity-content">
	                  	<fmt:parseDate var="weekInDate" value="${e.urgeDate}" pattern="yyyyMMdd"></fmt:parseDate>
						<fmt:formatDate value="${weekInDate}" pattern="yyyy-MM-dd(EE)"></fmt:formatDate>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						확인 여부 : ${e.urgeConfirm}
	                  </div>
	                </div>
	              </div>
	            </c:forEach>
            	</div>
            	<hr>
            	<!-- 연차 촉구 2개월 -->
            	<div class="card-body" style="margin-top: -15px; height: 310px; overflow: auto;">
	              <h5 class="card-title">연차 촉구 임박<span> | 2개월, 10일 이내</span></h5>
	              <c:forEach items="${urgeTwoList}" var="ee">
				  <div class="activity" style="margin-bottom: -10px;">
	                <div class="activity-item d-flex">
	                  <div class="activite-label">사원 번호 : ${ee.empNo}</div>
	                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                  <i class='bi bi-circle-fill activity-badge text-danger align-self-start'></i>
	                  <div class="activity-content">
	                  	<fmt:parseDate var="weekInDate" value="${ee.urgeDate}" pattern="yyyyMMdd"></fmt:parseDate>
						<fmt:formatDate value="${weekInDate}" pattern="yyyy-MM-dd(EE)"></fmt:formatDate>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						확인 여부 : ${ee.urgeConfirm}
	                  </div>
	                </div>
	              </div>
	            </c:forEach>
            	</div>
			</div>
		</div>
	</div>
	
	
		<!-- 휴가 정산 관리 가이드 알림 -->
	<div class="col-lg-4" style="margin-left: auto; margin-right: auto;">
		<div class="card week-wrap">
			<div class="container-fluid">
				<!-- 휴가 정산 -->
				<div class="card-body" style="height: 310px; overflow: auto;">
	              <h5 class="card-title">휴가 정산</h5>
	              <c:forEach items="${calList}" var="ee">
				  <div class="activity" style="margin-bottom: -10px;">
	                <div class="activity-item d-flex">
	                  <div class="activite-label">사원 번호 : ${ee.empNo}</div>
	                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                  <i class='bi bi-circle-fill activity-badge text-success align-self-start'></i>
	                  <div class="activity-content">
	                  	<fmt:parseDate var="weekInDate" value="${ee.calDate}" pattern="yyyyMMdd"></fmt:parseDate>
						<fmt:formatDate value="${weekInDate}" pattern="yyyy-MM-dd(EE)"></fmt:formatDate>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						승인 여부 : ${ee.calYn}
	                  </div>
	                </div>
	              </div>
	            </c:forEach>
            	</div>
			</div>
		</div>
	</div>
	
	

		
		
		
	</c:if>







</div>

		
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


		<!-- 근무 수정/삭제 Modal -->
		<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		    <form action="editInsert.do" method="post">
			      <div class="modal-header">
			        <h3 class="modal-title" id="exampleModalLabel"  style="margin-bottom: 30px;">근무 수정/삭제 요청</h3>
			        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" style="margin-bottom: 30px;"></button>
			      </div>
			      <div class="modal-body">
			          <div class="input-group mb-3">
						<select name="editType" value="${dto.editType}" class="form-select" id="offOx inputGroupSelect01">
							<option selected disabled="disabled">[필수] 수정/삭제 선택</option>
							<option value="E">수정</option>
							<option value="D">삭제</option>
					    </select>
					  </div>
			          <div class="input-group mb-3">
						<span class="input-group-text" id="inputGroup-sizing-default">사원 번호</span>
						<input readonly="readonly" size="20" name="empNo" id="empNo" type="text" value="${loginEmp.empNo}" placeholder="${loginEmp.empNo}" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
					  </div>
			          <div class="input-group mb-3">
						<span class="input-group-text" id="inputGroup-sizing-default">&nbsp;&nbsp;근무 일&nbsp;&nbsp;</span>
						<input size="20" name="editDate" id="editDate" type="text" value="${dto.editDate}" placeholder="YYYYMMDD" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
						<!-- <input size="20" name="editDate" id="editDate" type="date" required pattern="required" value="${dto.editDate}" placeholder="사원 번호를 입력해주세요" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default"> -->
					  </div>
					  
					  <div class="input-group mb-3">
						<span class="input-group-text" id="inputGroup-sizing-default">출근 시간</span>
						<input size="20" name="editIntime" id="editIntime" max="24:00" type="time" value="${dto.editIntime}" placeholder="근무 수정의 경우 변경할 시간으로 선택해주세요" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
					  </div>
					  <div class="input-group mb-3">
						<span class="input-group-text" id="inputGroup-sizing-default">퇴근 시간</span>
						<input size="20" name="editOuttime" id="editOuttime" type="time" value="${dto.editOuttime}" placeholder="삭제는 선택하지 않으셔도 됩니다." class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
					  </div>
					  <div class="input-group" style="margin-bottom: 20px;">
						<span class="input-group-text">요청 사유</span>
						<textarea name="editContent" id="editContent"  class="form-control" aria-label="With textarea">${dto.editContent}</textarea>
					  </div>
			      </div>
			      <div class="modal-footer">
			      	<button type="submit" class="btn btn-primary">요청</button>
			        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
			      </div>
		    </form>
		    </div>
		  </div>
		</div>



		
	</div>
	
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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