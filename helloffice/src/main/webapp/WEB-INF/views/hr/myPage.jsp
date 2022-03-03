<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../common/head.jsp" %>

<head>
	<link rel="stylesheet" href="${root}/resources/assets/css/hrCss/hrCss.css" type="text/css">
</head>

<style>
	
</style>
<body>
	<%@ include file = "../common/header.jsp" %>
	
	<main id="main" class="main">
		<section class="section">
			<!-- 상단 navbar -->
			<div class="col-lg-12">
				<div class="card">
					<div class="container-fluid">
						<div class="pagetitle navbar_pagetitle">
							<div class="navbar_content">
								<div class="navbar_content_l">
									<h1 style="padding-bottom: 0.5rem">초대</h1>
									<nav>
										<ol class="breadcrumb">
											<li class="breadcrumb-item"><a href="teamList">구성원</a></li>
											<li class="breadcrumb-item"><a href="teamReport">팀리포트</a></li>
											<li class="breadcrumb-item active">초대</li>
											<li class="breadcrumb-item"><a href="contract">계약</a></li>
										</ol>
									</nav>
								</div>
								<div class="navbar_content_r">
									<button type="button" class="btn btn-primary">
										<a href="sendingInvite" class="a_tag"><i class="bi bi-plus-circle"></i> 구성원 추가하기</a>
									</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 상단 navbar 끝 -->

			<!-- 페이지 내용 -->
			<div class="body">
				<section class="section">
					<div class="row">
						<div class="col-lg-12">
							<div class="card card_radius">
								<div class="card_header">
									ㅎㅇㅎㅇ
								</div>
								<div class="card-body">
									ㅎㅇㅎㅇㅎㅇㅎㅇ
								</div>
							</div>
						</div>
					</div>
				</section>
			</div>

            <div class="col-lg-12">
				<div class="card">
					<img src="../../../resources/assets/img/hr/ham.jpg" alt="Profile" class="rounded-circle">
					<div class="card-body">
						<h5 class="card-title">심이용</h5>
						<p> 이 회사 내가 접수한다... </p>
						<p> 대표 </p>
						<p> 수행비서 </p>
						<p> 010-1234-1234 </p>
						
						<br>
						
						<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modalDialogScrollable">
						정보 보기
						</button>
						
						<div class="modal fade" id="modalDialogScrollable" tabindex="-1">
							<div class="modal-dialog modal-dialog-scrollable modal-fullscreen">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title">... </h5>
									</div>
									<div style="margin: 1rem;">
										<div class="modal-left">
											<!-- 좌상단 프로필 -->
											<div class="margin-div">
												<div class="section profile outer-wrapper">
													<div class="card-body profile-card pt-4 d-flex flex-column align-items-center">
														<img src="../../../resources/assets/img/hr/ham.jpg" alt="Profile" class="rounded-circle">
														<div class="align-items-center">심이용</div>
														<div class="align-items-center">수행비서</div>
														<div class="social-links mt-2">
															<!-- a태그 클릭하면 각 정보들 클립보드에 복사하는 스크립트 작업 해야됨 -->
															<a class="telephone" data-bs-toggle="tooltip" data-bs-placement="bottom" title="" data-bs-original-title="010-0100-1010"><i class="bi bi-telephone"></i></a> &nbsp;
															<a class="mail" data-bs-toggle="tooltip" data-bs-placement="bottom" title="" data-bs-original-title="testipnida@gmail.com"><i class="bi bi-envelope"></i></a>
														</div>
													</div>
												</div>
											</div>
											<!-- 왼쪽 탭키 Vertical Pills Tabs -->
											<div class="margin-div">
												<div style="display: inline-block; left: 10%; min-width: 185px;">
													<div class="d-flex align-items-start">
														<div class="nav flex-column nav-pills me-3" id="v-pills-tab" role="tablist" aria-orientation="vertical">
															<button class="nav-link active" id="v-pills-home-tab" data-bs-toggle="pill" data-bs-target="#v-pills-home" type="button" role="tab" aria-controls="v-pills-home" aria-selected="true">
																<div>
																	<div class="bi bi-person-fill" style="display:inline-block; padding-right: 5px;"></div>
																	<div style="display:inline-block"><span>인사정보</span></div>  
																</div> 
															</button>
															<button class="nav-link" id="v-pills-contract-tab" data-bs-toggle="pill" data-bs-target="#v-pills-contract" type="button" role="tab" aria-controls="v-pills-contract" aria-selected="false">
																<div>
																	<div class="bi bi-file-earmark-text" style="display:inline-block; padding-right: 5px;"></div>
																	<div style="display:inline-block"><span>계약정보</span></div>  
																</div> 
															</button>
															<button class="nav-link" id="v-pills-salary-tab" data-bs-toggle="pill" data-bs-target="#v-pills-salary" type="button" role="tab" aria-controls="v-pills-salary" aria-selected="false">
																<div>
																	<div class="bi bi-credit-card" style="display:inline-block; padding-right: 5px;"></div>
																	<div style="display:inline-block"><span>급여정보</span></div>  
																</div> 
															</button>
															<button class="nav-link" id="v-pills-vacation-tab" data-bs-toggle="pill" data-bs-target="#v-pills-vacation" type="button" role="tab" aria-controls="v-pills-vacation" aria-selected="false">
																<div>
																	<div class="bi bi-music-note-beamed" style="display:inline-block; padding-right: 5px;"></div>
																	<div style="display:inline-block"><span>휴가</span></div>  
																</div> 
															</button>
															<button class="nav-link" id="v-pills-worktime-tab" data-bs-toggle="pill" data-bs-target="#v-pills-worktime" type="button" role="tab" aria-controls="v-pills-worktime" aria-selected="false">
																<div>
																	<div class="bi bi-clock" style="display:inline-block; padding-right: 5px;"></div>
																	<div style="display:inline-block"><span>근무시간</span></div>  
																</div> 
															</button>
															<button class="nav-link" id="v-pills-files-tab" data-bs-toggle="pill" data-bs-target="#v-pills-files" type="button" role="tab" aria-controls="v-pills-files" aria-selected="false">
																<div>
																	<div class="bi bi-printer-fill" style="display:inline-block; padding-right: 5px;"></div>
																	<div style="display:inline-block"><span>문서 및 증명서 발급</span></div>  
																</div> 
															</button>
															<button class="nav-link" id="v-pills-hrNote-tab" data-bs-toggle="pill" data-bs-target="#v-pills-hrNote" type="button" role="tab" aria-controls="v-pills-hrNote" aria-selected="false">
																<div>
																	<div class="bi bi-clipboard-check" style="display:inline-block; padding-right: 5px;"></div>
																	<div style="display:inline-block"><span>인사노트</span></div>  
																</div> 
															</button>
														</div>
													</div>
												</div>
											</div>
										</div>

										<div class="modal-right" style="background-color:antiquewhite;">
											
												<div class="card">
													<div class="card-body">
														<!-- <h5 class="card-title">Vertical Pills Tabs</h5> -->
														<div class="VP_wrapper">
															<div class="box-size-manage">
																<div class="tab-content" id="v-pills-tabContent">

																	<!-- 인사정보 -->
																	<div class="tab-pane fade active show" id="v-pills-home" role="tabpanel" aria-labelledby="v-pills-home-tab">
																		<div>
																			<div class="profile-overview" id="profile-overview">
																				<h5 class="card-title"></h5>
																				
																				<h5 class="card-title">인사정보</h5>
																				<div class="row">
																					<div class="col-lg-3 col-md-4 label"> 조직 </div>
																					<div class="col-lg-9 col-md-8"> 디자인팀 </div>
																				</div>
															
																				<div class="row">
																					<div class="col-lg-3 col-md-4 label">역할</div>
																					<div class="col-lg-9 col-md-8"> 웹디자이너 </div>
																				</div>
															
																				<div class="row">
																					<div class="col-lg-3 col-md-4 label">입사일</div>
																					<div class="col-lg-9 col-md-8">2021.12.12</div>
																				</div>
															
																				<div class="row" type="button">
																					<div class="col-lg-3 col-md-4 label">근무유형</div>
																					<div class="col-lg-9 col-md-8">
																						<div class="col-lg-9 col-md-8">고정 출퇴근</div>
																						<div class="col-lg-9 col-md-8 sub-info">출퇴근 09:00 ~ 18:00, 주 40시간 근무, 쉬는날 - 토,일</div>
																					</div>
																				</div>
															
																				<h5 class="card-title">기본정보</h5>
																				<div class="row">
																					<div class="col-lg-3 col-md-4 label">이메일</div>
																					<div class="col-lg-9 col-md-8">forforfor@gmail.com</div>
																				</div>
															
																				<div class="row">
																					<div class="col-lg-3 col-md-4 label">이름</div>
																					<div class="col-lg-9 col-md-8">유진이</div>
																				</div>
															
																				<div class="row">
																					<div class="col-lg-3 col-md-4 label">내 소개</div>
																					<div class="col-lg-9 col-md-8"> 제주도 사는 싱어송라이터 </div>
																				</div>

																				<div class="row">
																					<div class="col-lg-3 col-md-4 label">휴대전화</div>
																					<div class="col-lg-9 col-md-8"> 010-0100-1010 </div>
																				</div>

																				<div class="row">
																					<div class="col-lg-3 col-md-4 label">주민등록번호</div>
																					<div class="col-lg-9 col-md-8">000000-0000000</div>
																				</div>

																				<div class="row">
																					<div class="col-lg-3 col-md-4 label">집 주소</div>
																					<div class="col-lg-9 col-md-8"> 제주특별자치도 제주시 첨단로 4 901호 </div>
																				</div>

																				<div class="row">
																					<div class="col-lg-3 col-md-4 label">급여계좌</div>
																					<div class="col-lg-9 col-md-8"> 농협은행  302-3939-2929-29 </div>
																				</div>

																				<div class="row">
																					<div class="col-lg-3 col-md-4 label">건강보험 피부양자</div>
																					<div class="col-lg-9 col-md-8"> 대상 분류 (언니) </div>
																				</div>

																				<h5 class="card-title">공제정보</h5>
																				<div class="row">
																					<div class="col-lg-3 col-md-4 label">근로소득세 원천징수세율</div>
																					<div class="col-lg-9 col-md-8">100%</div>
																				</div>

																				<div class="row">
																					<div class="col-lg-3 col-md-4 label">공제대상 가족 수</div>
																					<div class="col-lg-9 col-md-8">1명</div>
																				</div>

																				<div class="row">
																					<div class="col-lg-3 col-md-4 label">4대보험 제외여부</div>
																					<div class="col-lg-9 col-md-8">4대보험 제외대상자가 아닙니다.</div>
																				</div>

																				<h5 class="card-title">경력</h5>
																				<div class="row">
																					<div class="col-lg-3 col-md-4 label">인턴</div>
																					<div class="col-lg-9 col-md-8">
																						<div class="col-lg-9 col-md-8">회사명 직무 직급</div>
																						<div class="col-lg-9 col-md-8 sub-info">2018.01 ~ 2019.01</div>
																					</div>
																				</div>
																				

																				<h5 class="card-title">학력</h5>
																				<div class="row">
																					<div class="col-lg-3 col-md-4 label">대학교(4년제 이상)</div>
																					<div class="col-lg-9 col-md-8">
																						<div class="col-lg-9 col-md-8">학교명 학과 졸업여부</div>
																						<div class="col-lg-9 col-md-8 sub-info">2016.01 ~ 2020.01</div>
																					</div>
																				</div>
																			</div>		
																		</div>
																	</div>
												
																	<!-- 계약정보 -->
																	<div class="tab-pane fade" id="v-pills-contract" role="tabpanel" aria-labelledby="v-pills-contract-tab">
																		<div>
																			<div class="profile-overview" id="profile-overview">
																				<h5 class="card-title"></h5>
																				
																				<h5 class="card-title">계약정보</h5>
																				<div class="row">
																					<div class="col-lg-3 col-md-4 label "> 계약형태 </div>
																					<div class="col-lg-9 col-md-8"> 정규직 </div>
																				</div>
															
																				<div class="row">
																					<div class="col-lg-3 col-md-4 label"> 포괄임금 계약 </div>
																					<div class="col-lg-9 col-md-8"> ? </div>
																				</div>
															
																				<div class="row">
																					<div class="col-lg-3 col-md-4 label"> 근로계약기간 </div>
																					<div class="col-lg-9 col-md-8"> 입사일 ~ 종료일 </div>
																				</div>
															
																				<div class="row">
																					<div class="col-lg-3 col-md-4 label"> 계약금액</div>
																					<div class="col-lg-9 col-md-8">고정 출퇴근</div>
																				</div>
															
																				<h5 class="card-title">계약서</h5>
																				<div class="row">
																					<div class="col-lg-3 col-md-4 label">이메일</div>
																					<div class="col-lg-9 col-md-8">forforfor@gmail.com</div>
																				</div>
																			</div>		
																		</div>
																	</div>
																	
																	<!-- 급여정보 -->
																	<div class="tab-pane fade" id="v-pills-salary" role="tabpanel" aria-labelledby="v-pills-salary-tab">
																		<div>
																			<div class="profile-overview" id="profile-overview">
																				<h5 class="card-title"></h5>
																				
																				<h5 class="card-title">급여</h5>
																				<div class="row">
																					<div class="info-box">
																						<div class="info-box-title"> 급여명세서가 아직 없음 ^^ </div>
																						<div class="info-box-desc"> sorry </div>
																					</div>
																				</div>
															
																				<h5 class="card-title">지급내역</h5>
																				<div class="row">
																					<div class="info-box">
																						<div class="info-box-title"> 수당 지급 항목이 아직 없음 ^^ </div>
																						<div class="info-box-desc"> sorry </div>
																					</div>
																				</div>
															
																				<h5 class="card-title">공제내역</h5>
																				<div class="row">
																					<div class="info-box">
																						<div class="info-box-title"> 필수 기타 공제내역이 아직 없음 ^^ </div>
																						<div class="info-box-desc"> sorry </div>
																					</div>
																				</div>
																			</div>		
																		</div>
																	</div>
																	
																	<!-- 휴가 -->
																	<div class="tab-pane fade" id="v-pills-vacation" role="tabpanel" aria-labelledby="v-pills-vacation-tab">
																		<div>
																			<div class="profile-overview" id="profile-overview">
																				<h5 class="card-title"></h5>
																				
																				<h5 class="card-title">휴가현황</h5>
																				<div class="row">
																					<div class="col-lg-3 col-md-4 label"> 남은 연차 </div>
																					<div class="col-lg-9 col-md-8"> 없음 </div>
																				</div>
															
																				<div class="row">
																					<div class="col-lg-3 col-md-4 label"> 여름휴가 </div>
																					<div class="col-lg-9 col-md-8"> 3일(24시간) <span class="sub-info">사용기한 D-310 </span></div>
																				</div>

																				<div class="row">
																					<div class="col-lg-3 col-md-4 label"> 보건 휴가 </div>
																					<div class="col-lg-9 col-md-8"> 1일(8시간) <span class="sub-info">사용기한 D-4</span></div>
																				</div>

																				<div class="row">
																					<div class="col-lg-3 col-md-4 label"> 리프레시 휴가 </div>
																					<div class="col-lg-9 col-md-8"> D-1095 <span class="sub-info">2025.02.23에 사용가능</span></div>
																				</div>
															
																				<h5 class="card-title">휴가사용내역</h5>
																				<div class="row">
																					<div class="info-box">
																						<div class="info-box-title"> 아직 휴가 사용 내역이 없습니다 ^^ </div>
																						<div class="info-box-desc"> :) </div>
																					</div>
																				</div>
																			</div>		
																		</div>
																	</div>
																	
																	<!-- 근무시간 -->
																	<div class="tab-pane fade" id="v-pills-worktime" role="tabpanel" aria-labelledby="v-pills-worktime-tab">
																	
																	</div>
																	
																	<!-- 문서 및 증명서 발급 -->
																	<div class="tab-pane fade" id="v-pills-files" role="tabpanel" aria-labelledby="v-pills-files-tab">
																		<div>
																			<div class="profile-overview" id="profile-overview">
																				<h5 class="card-title"></h5>
																				
																				<h5 class="card-title"> 내 문서</h5>
																				<div class="row">
																					<div class="col-lg-3 col-md-4 label "> 주민등록등본 </div>
																					<div class="col-lg-9 col-md-8"> 링크 </div>
																				</div>
															
																				<div class="row">
																					<div class="col-lg-3 col-md-4 label"> 가족관계증명서 </div>
																					<div class="col-lg-9 col-md-8"> 링크 </div>
																				</div>
															
																				<div class="row">
																					<div class="col-lg-3 col-md-4 label"> 건강보험자격득실확인서 </div>
																					<div class="col-lg-9 col-md-8"> 링크 </div>
																				</div>
															
																				<div class="row">
																					<div class="col-lg-3 col-md-4 label"> 연봉계약서</div>
																					<div class="col-lg-9 col-md-8"> 링크 </div>
																				</div>

																				<div class="row">
																					<div class="col-lg-3 col-md-4 label"> 근로계약서 </div>
																					<div class="col-lg-9 col-md-8">링크 </div>
																				</div>

																				<div class="row">
																					<div class="col-lg-3 col-md-4 label"> 이력서 </div>
																					<div class="col-lg-9 col-md-8"> 링크 </div>
																				</div>

																				<div class="row">
																					<div class="col-lg-3 col-md-4 label"> 학위증명서 </div>
																					<div class="col-lg-9 col-md-8">링크</div>
																				</div>
															
																				<h5 class="card-title">증명서 발급</h5>
																				<div class="row">
																					<div class="col-lg-3 col-md-4 label">재직증명서</div>
																					<div class="col-lg-9 col-md-8">
																						<span>재직을 증명하는 문서입니다.</span>
																						<button class="btn">발급하기</button>
																					</div>
																				</div>

																				<div class="row">
																					<div class="col-lg-3 col-md-4 label">경력증명서</div>
																					<div class="col-lg-9 col-md-8">
																						<span>경력을 증명하는 문서입니다.</span>
																						<button class="btn">발급하기</button>
																					</div>
																				</div>
																			</div>		
																		</div>
																	</div>
																	
																	<!-- 인사노트 -->
																	<div class="tab-pane fade" id="v-pills-hrNote" role="tabpanel" aria-labelledby="v-pills-hrNote-tab">
																		<div>
																			<div class="insa_text_title">인사노트작성</div>
																		</div>
																		<textarea placeholder="직원에 대한 평가나 기록을 남겨두세요." rows="4" class="insa_textarea" style="overflow-y: auto; overflow-wrap: break-word; height: 110px;">
																		</textarea>
																		<div class="align-items-center" style="display: flex; padding: 0.5rem;">
																			<button class="btn btn-outline-secondary" style="margin: auto;">저장하기</button>
																		</div>
																		
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
											
										</div>
									<!-- 모달 푸터 -->
									<!-- 
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
										<button type="button" class="btn btn-primary">Save changes</button>
									</div> 
									-->		
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
			<!-- End Modal Dialog Scrollable-->
            </div>
        </section>
    </main>	
    <%@ include file = "../common/footer.jsp" %>
</body>
</html>