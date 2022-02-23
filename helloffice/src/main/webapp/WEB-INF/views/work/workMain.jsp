<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/head.jsp" %>
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
				            
				          <a class="nav-link dropdown-toggle btn btn-primary" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false" role="button" style="color: white">
				           <span class="material-icons md-18" style="vertical-align: middle">beach_access</span> 
							휴가 사용
				          </a>
				          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
				            <li><a class="dropdown-item btn btn-primary" type="button" data-bs-toggle="modal" data-bs-target="#sum_off" href="#">🌊 여름(바캉스)</a></li>
				            <li><a class="dropdown-item" href="#">🌈 연차</a></li>
				            <li><hr class="dropdown-divider"></li>
				            <li><a class="dropdown-item" href="#">👪 가족돌봄</a></li>
				            <li><a class="dropdown-item" href="#">🎎 결혼, 본인</a></li>
				            <li><a class="dropdown-item" href="#">💊 병가</a></li>
				            <li><a class="dropdown-item" href="#">🚨 비상</a></li>
				            <li><a class="dropdown-item" href="#">✉ 조의-부모/배우자/자녀</a></li>
				          </ul>
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
					      <button type="button" class="btn btn-light" data-bs-toggle="modal" data-bs-target="#workType" href="#">근무 유형<span class="material-icons">check_circle_outline</span></button>
					    </div>
					    <div class="col-md-auto">
					    </div>
					    <div class="col col-lg-2" style="">
					      <button type="button" class="btn btn-light" data-bs-toggle="modal" data-bs-target="#workRepeat" href="#" style="border: 1px solid black"><i class="bi bi-calendar-check"></i> 반복 일정 등록</button>
					    </div>
					  </div>
	        	</div>
	        	<div class="container-fluid" style="margin-left:40px; margin-bottom: 40px">
				  <div class="row" style="margin-bottom: 40px">
				    <div class="col">
				      이번 주 근무
				    </div>
				    <div class="col-6">
				    </div>
				    <div class="col">
				    </div>
				  </div>
				  <div class="row" style="margin-bottom: 40px">
				    <div class="col">
				    	2.21 (월) <button class="btn btn-outline-warning btn-sm" style="border-radius: 10px">오늘</button>
				    </div>
				    <div class="col-6">
				    	<i class="bi bi-wifi"></i>
				    	<button class="btn btn-outline-secondary btn-sm" style="border-radius: 10px">근무</button>
				    	오전 10:00 ~ 오후 07:00
				    </div>
				    <div class="col">
						  <button type="button" class="btn btn-outline-success btn-sm" style="border-radius: 10px">8H</button>
				    	<button class="btn btn-outline-secondary btn-sm" style="border-radius: 10px">1H<i class="bi bi-cup-straw"></i></button>
				    </div>
				  </div>
				  <div class="row" style="margin-bottom: 40px">
				    <div class="col">
				    	2.21 (화)
				    </div>
				    <div class="col-6">
				    	<i class="bi bi-wifi"></i>
				    	<button class="btn btn-outline-secondary btn-sm" style="border-radius: 10px">근무</button>
				    	오전 10:00 ~ 오후 07:00
				    </div>
				    <div class="col">
						  <button type="button" class="btn btn-outline-success btn-sm" style="border-radius: 10px">8H</button>
				    	<button class="btn btn-outline-secondary btn-sm" style="border-radius: 10px">1H<i class="bi bi-cup-straw"></i></button>
				    </div>
				  </div>
				  <div class="row" style="margin-bottom: 40px">
				    <div class="col">
				    	2.21 (수)
				    </div>
				    <div class="col-6">
				    	<i class="bi bi-wifi"></i>
				    	<button class="btn btn-outline-secondary btn-sm" style="border-radius: 10px">근무</button>
				    	오전 10:00 ~ 오후 07:00
				    </div>
				    <div class="col">
						  <button type="button" class="btn btn-outline-success btn-sm" style="border-radius: 10px">8H</button>
				    	<button class="btn btn-outline-secondary btn-sm" style="border-radius: 10px">1H<i class="bi bi-cup-straw"></i></button>
				    </div>
				  </div>
				  <div class="row" style="margin-bottom: 40px">
				    <div class="col">
				    	2.21 (목)
				    </div>
				    <div class="col-6">
				    	<i class="bi bi-wifi"></i>
				    	<button class="btn btn-outline-secondary btn-sm" style="border-radius: 10px">근무</button>
				    	오전 10:00 ~ 오후 07:00
				    </div>
				    <div class="col">
						  <button type="button" class="btn btn-outline-success btn-sm" style="border-radius: 10px">8H</button>
				    	<button class="btn btn-outline-secondary btn-sm" style="border-radius: 10px">1H<i class="bi bi-cup-straw"></i></button>
				    </div>
				  </div>
				  <div class="row" style="margin-bottom: 40px">
				    <div class="col">
				    	2.21 (금)
				    </div>
				    <div class="col-6">
				    	<i class="bi bi-wifi"></i>
				    	<button class="btn btn-outline-secondary btn-sm" style="border-radius: 10px">근무</button>
				    	오전 10:00 ~ 오후 07:00
				    </div>
				    <div class="col">
						  <button type="button" class="btn btn-outline-success btn-sm" style="border-radius: 10px">8H</button>
				    	<button class="btn btn-outline-secondary btn-sm" style="border-radius: 10px">1H<i class="bi bi-cup-straw"></i></button>
				    </div>
				  </div>
				  <div class="row"  style="margin-bottom: 40px">
				    <div class="col">
				      2.21 (토)
				    </div>
				    <div class="col-6">
				    	<i class="bi bi-wifi-off"></i>
				    	쉬는 날
				    </div>
				    <div class="col">
				    </div>
				  </div>
				  <div class="row"  style="margin-bottom: 40px">
				    <div class="col">
				      2.21 (일)
				    </div>
				    <div class="col-6">
				    	<i class="bi bi-wifi-off"></i>
				    	쉬는 날
				    </div>
				    <div class="col">
				    </div>
				  </div>
				  
				</div>
	        </div>
		</div>
	
		<!-- 여름 휴가 Modal -->
<div class="modal fade" id="sum_off" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<div class="modal-hc">
					<div class="modal-hcc1">
						<div class="modal-hl">
							<div class="modal-hll" style="min-width: 0px; margin: 0px; position: relative">
								<div class="modal-hll-wrap" >
									<div style="margin-right: 12px">
									🌊
									</div>
									<div class="modal-title">
									여름(바캉스) 휴가
									</div>
								</div>
							</div>
						<div class="modal-hlr" style="margin-left: 8px">
						</div>
						</div>
						<div class="modal-hr">
							<div class="modal-hr1">
								<div class="modal-hr1-1">유급</div>
							</div>
							<div class="modal-hr2">
								<div class="modal-hr2-1">D-000</div>
							</div>
							<div class="modal-hr3">
								<div class="modal-hr3-1">00일 가능</div>
							</div>
						</div>
					</div>
					<div class="modal-hcc2">
						 <div class="modal-hcc2l" role="button">
							<div class="modal-hcc2l-1">
								<div class="modal-hcc2l-1-1">
									<div class="modal-hcc2l-1-1-1"><span class="material-icons">event</span></div>
								</div>
								<div class="modal-hcc2l-1-2">
									<div class="modal-hcc2l-1-2-1">
										<div class="modal-hcc2l-1-2-1-1">
											<input class="modal-hcc2l-1-2-1-1-1" type="text" value="2022. 02. 22" style="border-radius: 4px">
										</div>
									</div>
									<label class="modal-hcc2l-1-2-2">시작일
									</label>
								</div>
								<div class="modal-hcc2l-1-3">
									<div class="modal-hcc2l-1-3-1">
										<div class="modal-hcc2l-1-3-1-1"><span class="material-icons">arrow_drop_down</span></div>
									</div>
								</div>
							</div>
						</div>
						 <div class="modal-hcc2r" role="button">
						 	<div class="modal-hcc2r-1">
								<div class="modal-hcc2r-1-1"></div>
									<div class="modal-hcc2r-1-2">
										<div class="modal-hcc2r-1-2-1">
											<input class="modal-hcc2r-1-2-1-1" type="text" value="2022. 02. 04">
										</div>
										<label class="modal-hcc2r-1-2-2">종료일
										</label>
									</div>
									<div class="modal-hcc2r-1-3">
										<div class="modal-hcc2r-1-3-1">
											<div class="modal-hcc2l-1-3-1-1"><span class="material-icons">arrow_drop_down</span></div>
										</div>
									</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="modal-body">
	      		<ul class="modal-contentzone-ul">
					<li class="bodyli">
						<div class="bodyli-1">
							<div class="balls"></div>
								0월 00일 (요일)
						</div>
						<div class="bodyli-2">
							<div class="bodyli-2-1">
								<select name="off_offtype" class="form-select" aria-label="Default select example">
									<option value="allday" selected>하루종일</option>
									<option value="morning">오전 반차</option>
									<option value="afternoon">오후 반차</option>
								</select>
							</div>
						</div>
					</li>
					<li class="bodyli">
						<div class="bodyli-1">
							<div class="balls"></div>
							0월 00일 (요일)
						</div>
						<div class="bodyli-2">
							<div class="bodyli-2-1">
								<select name="off_offtype" class="form-select" aria-label="Default select example">
									<option value="allday" selected>하루종일</option>
									<option value="morning">오전 반차</option>
									<option value="afternoon">오후 반차</option>
								</select>
							</div>
						</div>
					</li>
					<li class="bodyli">
						<div class="bodyli-1">
							<div class="balls"></div>
							0월 00일 (요일)
						</div>
						<div class="bodyli-2">
							<div class="bodyli-2-1">
								<select name="off_offtype" class="form-select" aria-label="Default select example">
									<option value="allday" selected>하루종일</option>
									<option value="morning">오전 반차</option>
									<option value="afternoon">오후 반차</option>
								</select>
							</div>
						</div>
					</li>
				</ul>
				<textarea class="modalTextarea" placeholder="메시지 입력 (선택)" style="overflow-x: hidden; overflow-y:auto; height: 116px;"></textarea>
			</div>
			<div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
	        <button type="submit" class="btn btn-primary">등록하기</button> <!-- form 삽입 -->
			</div>
		</div>
	</div>
</div>
		
		
		<!-- 근무 유형 Modal -->
		<div class="modal fade" id="workType" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<h2 class="modal-title" id="exampleModalLabel" style="margin-bottom: 32px;">윤종혁님의 근무유형</h2>
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

		<!-- 반복 일정 Modal-->
		<div class="modal fade" id="workRepeat" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg">
				<div class="modal-content">
					<div class="modal-body repeatbody">
						<div class="rebody1">
							<div class="rebody1_1">
								<div class="rebody1_1_1">
									<div class="rebody1_1_1_1">
										반복 일정
									</div>
									<div class="rebody1_1_1_2">
										<div class="rebody1_1_1_2_1"></div>
									</div>
								</div>
							</div>
							<div class="rebody1_2">
								<div class="rebody1_2_1">
									<div class="rebody1_2_1_1">
										<div class="rebody1_2_1_1_1">
											<span class="rebody1_2_1_1_1_1">👀</span>
										</div>
										<div class="rebody1_2_1_1_2">
											등록된 근무가 없습니다
										</div>
									</div>
									<div class="rebody1_2_1_2" type="button">
										<div class="rebody1_2_1_2_1">
											<span class="material-icons">add</span>
										</div>
										<div class="rebody1_2_1_2_2">
											<span class="rebody1_2_1_2_2_1">시간 입력하기</span>
										</div>
									</div>
								</div>
								<div class="rebody1_2_2">
									<div class="rebody1_2_2_1">
										<button class="rebody_btn_1">하</button>
										<button class="rebody_btn_2">루</button>
										<button class="rebody_btn_1">시</button>
										<button class="rebody_btn_2">작</button>
										<button class="rebody_btn_1"></button>
										<button class="rebody_btn_2"></button>
										<button class="rebody_btn_1"></button>
										<button class="rebody_btn_2"></button>
										<button class="rebody_btn_1"></button>
										<button class="rebody_btn_2"></button>
										<button class="rebody_btn_1"></button>
										<button class="rebody_btn_2"></button>
										<button class="rebody_btn_1"></button>
										<button class="rebody_btn_2"></button>
										<button class="rebody_btn_1"></button>
										<button class="rebody_btn_2"></button>
										<button class="rebody_btn_1"></button>
										<button class="rebody_btn_2"></button>
										<button class="rebody_btn_1"></button>
										<button class="rebody_btn_2"></button>
										<button class="rebody_btn_1"></button>
										<button class="rebody_btn_2"></button>
										<button class="rebody_btn_1"></button>
										<button class="rebody_btn_2">끝</button>
									</div>
								</div>
							</div>
						</div>

						<div class="rebody2">
							<div class="rebody2_1">
								<button class="rebody_2_1_1">반복 요일 select</button>
								<button class="rebody_2_1_1">datepicker</button>
								<button class="rebody_2_1_1">datepicker</button>
							</div>
							<div class="rebody2_2">
								<button type="button" class="btn btn-light rebody2_2_1" data-bs-dismiss="modal" style="border: none;">취소</button>
								<button type="button" class="btn btn-primary rebody2_2_2" data-bs-dismiss="modal">입력완료</button>
							</div>
						</div>

						
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