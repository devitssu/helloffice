<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../common/head.jsp" %>

<style>
	#pagetitle_c{
		margin:auto;
		padding-top:15px;
	}
	
	.nav-pills .nav-link .active{
		background-color: black;
		display: inline-flex;
	}

	.nav-pills .nav-link{
		display: inline-flex;
		width: 108%;
	}
	
	.nav-link{
		color: black;
	}
	
	.VP_wrapper{
		display: inline-block;
		padding: 0.5rem;
	}

	.outer-wrapper{
		min-width: min-content;
	}

	.profile .profile-card .social-links button{
		font-size: 20px;
		display: inline-block;
		color: rgba(1, 41, 112, 0.5);
		line-height: 0;
		margin-right: 10px;
		transition: 0.3s;
	}

	.modal-left{
		width: 15vw; 
		min-width: 200px; 
		background-color: aliceblue; 
		text-align: center;
	}

	.modal .modal_dialog{
		min-width: 700px;
		width: 80vw;
		background-color: aquamarine;
	}

	.sub-info{
		color: gray;
		font-size: 80%;
	}

	.info-box{
		background-color: rgba(225, 239, 255, 0.6);
		border-radius: 10px; 
		height: 200px;
	}

	.info-box .info-box-title{
		color: rgba(128, 128, 128, 0.6);
		text-align: center;
		font-size: x-small;
		padding-top: 6rem;
	}

	.info-box .info-box-desc{
		color: rgba(128, 128, 128, 0.5);
		text-align: center;
		font-size: xx-small;
	}

	.box-size-manage{
		width: 60vw;
		padding: 0.5rem;
	}

	.margin-div{
		margin: 1rem;
	}
</style>
	
<body>
	<%@ include file = "../common/header.jsp" %>
	
	<main id="main" class="main">
	<section class="section">
		<div class="row">
	
			<!-- 페이지 타이틀 -->
			<div class="col-lg-12" id="menubar">
				<div class="card">
					<div class="container-fluid">
						<div class="pagetitle" id="pagetitle_c">
							<h1 style="padding-bottom: 0.5rem"> 구성원 </h1>
							<nav>
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="/">홈</a></li>
								<li class="breadcrumb-item"> 인사 페이지 </li>
								<li class="breadcrumb-item active"> 구성원 </li>
							</ol>
							</nav>
						</div>
					</div>
				</div>
			</div>

			<!-- 보더 탭 -->
			<div class="col-lg-9">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title"></h5>
			
							<!-- Bordered Tabs Justified -->
							<ul class="nav nav-tabs nav-tabs-bordered d-flex" id="borderedTabJustified" role="tablist">
							<li class="nav-item flex-fill" role="presentation">
								<button class="nav-link w-100 active" id="home-tab" data-bs-toggle="tab" data-bs-target="#bordered-justified-home" type="button" role="tab" aria-controls="home" aria-selected="false"> Team List</button>
							</li>
							<li class="nav-item flex-fill" role="presentation">
								<button class="nav-link w-100" id="profile-tab" data-bs-toggle="tab" data-bs-target="#bordered-justified-profile" type="button" role="tab" aria-controls="profile" aria-selected="false">Profile</button>
							</li>
							<li class="nav-item flex-fill" role="presentation">
								<button class="nav-link w-100" id="contact-tab" data-bs-toggle="tab" data-bs-target="#bordered-justified-contact" type="button" role="tab" aria-controls="contact" aria-selected="true">Contact</button>
							</li>
							</ul>
						<div class="tab-content pt-2" id="borderedTabJustifiedContent">
							<div class="tab-pane fade active show" id="bordered-justified-home" role="tabpanel" aria-labelledby="home-tab">
								<div class="card">
									<div class="card-body">
										<h5 class="card-title"> 마케팅팀  </h5>
						
										<!-- Table with hoverable rows -->
										<table class="table table-hover">
										<thead>
											<tr>
											<th scope="col" hidden="hidden">#</th>
											<th scope="col">이름</th>
											<th scope="col">닉네임</th>
											<th scope="col">직무</th>
											<th scope="col">상태</th>
											<th scope="col">근무 시작일</th>
											</tr>
										</thead>
										<tbody>
											<tr>
											<th scope="row" hidden="hidden">1</th>
											<td>Brandon Jacob</td>
											<td>BJ</td>
											<td>Designer</td>
											<td>28</td>
											<td>2016-05-25</td>
											</tr>
											<tr>
											<th scope="row" hidden="hidden">2</th>
											<td>Bridie Kessler</td>
											<td>BK</td>
											<td>Developer</td>
											<td>35</td>
											<td>2014-12-05</td>
											</tr>
											<tr>
											<th scope="row" hidden="hidden">3</th>
											<td>Ashleigh Langosh</td>
											<td>AL</td>
											<td>Finance</td>
											<td>45</td>
											<td>2011-08-12</td>
											</tr>
											<tr>
											<th scope="row" hidden="hidden">4</th>
											<td>Angus Grady</td>
											<td>AG</td>
											<td>HR</td>
											<td>34</td>
											<td>2012-06-11</td>
											</tr>
											<tr>
											<th scope="row" hidden="hidden">5</th>
											<td>Raheem Lehner</td>
											<td>RL</td>
											<td>Dynamic Division Officer</td>
											<td>47</td>
											<td>2011-04-19</td>
											</tr>
											<tr>
											<th scope="row" hidden="hidden">6</th>
											<td>Brandon Jacob</td>
											<td>BJ</td>
											<td>Designer</td>
											<td>28</td>
											<td>2016-05-25</td>
											</tr>
											<tr>
											<th scope="row" hidden="hidden">7</th>
											<td>Bridie Kessler</td>
											<td>BK</td>
											<td>Developer</td>
											<td>35</td>
											<td>2014-12-05</td>
											</tr>
											<tr>
											<th scope="row" hidden="hidden">8</th>
											<td>Ashleigh Langosh</td>
											<td>AL</td>
											<td>Finance</td>
											<td>45</td>
											<td>2011-08-12</td>
											</tr>
											<tr>
											<th scope="row" hidden="hidden">9</th>
											<td>Angus Grady</td>
											<td>AG</td>
											<td>HR</td>
											<td>34</td>
											<td>2012-06-11</td>
											</tr>
											<tr>
											<th scope="row" hidden="hidden">10</th>
											<td>Raheem Lehner</td>
											<td>RL</td>
											<td>Dynamic Division Officer</td>
											<td>47</td>
											<td>2011-04-19</td>
											</tr>
									
										</tbody>
										</table>
									</div>
									</div>
							</div>
							<div class="tab-pane fade" id="bordered-justified-profile" role="tabpanel" aria-labelledby="profile-tab">
								Nesciunt totam et. Consequuntur magnam aliquid eos nulla dolor iure eos quia. Accusantium distinctio omnis et atque fugiat. Itaque doloremque aliquid sint quasi quia distinctio similique. Voluptate nihil recusandae mollitia dolores. Ut laboriosam voluptatum dicta.
							</div>
							<div class="tab-pane fade" id="bordered-justified-contact" role="tabpanel" aria-labelledby="contact-tab">
								Saepe animi et soluta ad odit soluta sunt. Nihil quos omnis animi debitis cumque. Accusantium quibusdam perspiciatis qui qui omnis magnam. Officiis accusamus impedit molestias nostrum veniam. Qui amet ipsum iure. Dignissimos fuga tempore dolor.
							</div>
						</div>
					</div>
				</div>
			</div>
		
		
			<div class="col-lg-3">
				<div class="card">
					<img src="../../../resources/assets/img/hr/ham.jpg" alt="Profile" class="rounded-circle">
					<div class="card-body">
						<h5 class="card-title"> 2dragon Sim </h5>
						<p> kh 아카데미를 인수하는 그날까지...</p>
						<p> 마케팅 </p>
						<p> 데이터 전문가</p>
						<p>010-0100-1010</p>
						
						<br>
						
						<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modalDialogScrollable">
						정보 보기
						</button>
						
						<!-- 모달창 : Modal Dialog Scrollable -->
						<div class="modal fade" id="modalDialogScrollable" tabindex="-1">
							<div class="modal-dialog modal-dialog-scrollable" style="position: absolute; left: 15%;" >
								<div class="modal-content"style="width:70vw; min-width: 850px;">
							
									<!-- 모달 헤드 -->
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
														<div class="align-items-center">유진이</div>
														<div class="align-items-center">Web Designer</div>
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
											<div class="modal-body">
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
																	설마 이것도..?
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>


									<!-- 모달 내용 -->
									<div class="modal-body">
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
															설마 이것도..?
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
		
		<div class="col-lg-6">
		</div>
		</div>
		</div>
	</section>
	</main>
	
	<%@ include file = "../common/footer.jsp" %>
</body>
</html>