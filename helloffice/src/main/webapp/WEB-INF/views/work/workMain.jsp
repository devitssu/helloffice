<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/head.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
				    <div class="container-fluid">
				        <div class="navbar-collapse collapse w-100 order-1 order-md-0 dual-collapse2">
				            <ul class="navbar-nav me-auto">
				                <li class="nav-item active">
				                    <a class="nav-link" href="workMain">
									<i class="bi bi-person-fill"></i>
									내 스케줄
									</a>
				                </li>
				                <li class="nav-item">
				                    <a class="nav-link" href="workMember">
				                    <i class="bi bi-people-fill"></i>
				          			구성원 스케줄
									</a>
				                </li>
				            </ul>
				        </div>
				        <div class="nav-link mx-auto order-0">
				            <a class="navbar-brand mx-auto" href="#"><i class="bi bi-chevron-left"></i></a>
				            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target=".dual-collapse2">
				                <span class="navbar-toggler-icon"></span>
				            </button>
				        </div>
				        <div class="nav-link mx-auto order-0">
				            <a class="navbar-brand mx-auto" href="#"> 2.21 - 2.27 </a>
				            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target=".dual-collapse2">
				                <span class="navbar-toggler-icon"></span>
				            </button>
				        </div>
				        <div class="nav-link mx-auto order-0">
				            <a class="navbar-brand mx-auto" href="#"><i class="bi bi-chevron-right"></i></a>
				            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target=".dual-collapse2">
				                <span class="navbar-toggler-icon"></span>
				            </button>
				        </div>
				        <div class="nav-link mx-auto order-0">
				            <a class="navbar-brand mx-auto" href="#">오늘</a>
				            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target=".dual-collapse2">
				                <span class="navbar-toggler-icon"></span>
				            </button>
				        </div>
				        <div class="navbar-collapse collapse w-100 order-3 dual-collapse2">
				            <ul class="navbar-nav ms-auto">
				            <li class="nav-item dropdown">
				            
				          <a class="nav-link btn btn-primary" href="/helloffice/workflow"  style="color: white"> <!--id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false" role="button">-->
				           <span class="material-icons md-18" style="vertical-align: middle">beach_access</span> 
							휴가 사용
				          </a>
				          <!-- <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
				            <li><a class="dropdown-item btn btn-primary" type="button" data-bs-toggle="modal" data-bs-target="#sum_off" href="#">🌊 여름(바캉스)</a></li>
				            <li><a class="dropdown-item" href="#">🌈 연차</a></li>
				            <li><hr class="dropdown-divider"></li>
				            <li><a class="dropdown-item" href="#">👪 가족돌봄</a></li>
				            <li><a class="dropdown-item" href="#">🎎 결혼, 본인</a></li>
				            <li><a class="dropdown-item" href="#">💊 병가</a></li>
				            <li><a class="dropdown-item" href="#">🚨 비상</a></li>
				            <li><a class="dropdown-item" href="#">✉ 조의-부모/배우자/자녀</a></li>
				          </ul> -->
				        	</li>
				            <li class="nav-item">
				          <a class="nav-link" href="/helloffice/off">&nbsp;&nbsp;&nbsp;휴가 신청 내역</a>
				        	</li>
				        
				            </ul>
				        </div>
				    </div>
				</nav>
			</div>
		</div>
          
          
        <!-- 간편 조회 -->
		<div class="col-lg-12">
	        <div class="card">
	        	<div class="container-fluid"  style="width: 100%;">
				  <div class="row" style="margin : 40px;">
				    <div class="col">
				      총 예정 근무 
				      <a class="btn btn-success" role="button" style="border-radius: 20px">GOOD</a>
				    </div>
				    <div class="col-6">
				      근무 상세
				    </div>
				    <div class="col">
				      유급 휴가 
				      <a><i class="bi bi-question-circle"></i></a>
				    </div>
				  </div>
				  <div class="row" style="margin : 40px;">
				    <div class="col">
				      <a style="font-size: 50px; font-weight: 1.5em">40</a><a>시간</a>
				    </div>
				    <div class="col-6">
				      <a style="font-size: 50px; font-weight: 1.5em; color: black">💻 40 </a>
				      <a style="font-size: 50px; font-weight: 1.5em; color: gray" title="zz"> 🔥 0</a>
				    </div>
				    <div class="col" style="font-size: 50px; font-weight: 1.5em; color: gray">
				      없음
				    </div>
				  </div>
				  <div class="row" style="margin : 40px;">
				    <div class="col"><div class="progress progress-bar bg-info" role="progressbar" style="width: 25%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div></div>
				    <div class="col-3"><div class="progress progress-bar bg-info" role="progressbar" style="width: 25%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div></div>
				  </div>
				  <div class="row"  style="margin : 40px;">
				    <div class="col-8">
				    <a>* 자동 근무 기록</a>
				    <a>오전 10:00 ~ 오후 07:00</a>
				    </div>
				    <div class="col-4"></div>
				  </div>
				</div>
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
					    <div class="col-md-auto">
					    </div>
					    <div class="col col-lg-2" style="">
					    	<a href="/helloffice/workMain/detail">
					      <button type="button" class="btn btn-light" style="border: 1px solid black"><i class="bi bi-calendar-check"></i>근무 수정/삭제</button>
					      	</a>
					    </div>
					  </div>
	        	</div>
	        	<div class="container-fluid" style="margin-left:40px; margin-bottom: 40px">
				  <div class="row" style="margin-bottom: 40px">
				    <div style="font-size: 1.5em" class="col">
				      이번 주 총 근무 일 수 : ${list.size() } 
				      
				    </div>
				    <div class="col-6">
				    </div>
				    <div class="col">
				    </div>
				  </div>
				  <jsp:useBean id="now" class="java.util.Date"/>
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
		
		
		<!-- 근무 유형 Modal -->
		<div class="modal fade" id="workType" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<h2 class="modal-title" id="exampleModalLabel" style="margin-bottom: 32px;"> ${loginEmp.empName }님의 근무유형</h2>
					</div>
					<div class="modal-body" style="padding: 32px;">
						<div style="margin-top: 16px;">
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
    
    </section>
    
		
	</main>
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>