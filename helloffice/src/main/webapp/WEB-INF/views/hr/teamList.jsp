<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../common/head.jsp" %>

<style>
	.navbar_pagetitle{
		margin:auto;
		padding-top:15px;
	}					

	.navbar_content_l{
		padding-left: 1rem;
		float: left;
	}

	.navbar_content_r{
		padding-top: 10px;
		padding-right: 1rem;
		float: right;
	}
	/*  상단 navbar 설정  */
	
	.card_radius{
		border-radius: 25px;
	}

	.card_header{
		border-bottom: 0.5px solid grey;
		padding: 1rem;
		display: block;
	}

	.float_r{
		float: right;
	}

	.modal_head{
		padding: 2rem 1rem;
	}

	.modal_head_title{
		font-size: xx-large;
		font-weight: 600;
		padding-bottom: 10px;
	}

	.modal_head_subtitle{
		font-size: medium;
		color: darkgray;
	}

	.modal_mid_button{
		padding: 1.5rem 1rem;
		font-size: larger;
		font-weight: 500;
		color: #0d6efd;
		background-color: rgba(100, 148, 237, 0.07);
	}

	.modal_mid_button  :hover{
		background-color: rgba(100, 148, 237, 0.5);
	}

	.modal_body{
		padding: 2rem 1rem;
		background-color: azure;
	}

	/* tree 구조 */

	.tree_main{
		font-size: large;
	}
	
	.tree_sub{
		padding: 0.5rem 1rem;
	}

	/* 본문 */

	.insa_text_title{
		font-size: larger;
		font-weight: 600;
		padding: 1rem;
	}

	.insa_textarea{
		line-height: 1.55;
		width: 100%;
		border: 0px solid rgb(99, 114, 131);
		border-radius: 10px;
		padding: 12px;
		background-color: rgba(99, 114, 131, 0.02);
		font-size: 14px;
		box-sizing: border-box;
		font-weight: 500;
		box-shadow: rgb(29 56 83 / 8%) 0px 0px 0px 1px inset, rgb(0 0 0 / 4%) 0px 1px 1px 0px inset;
		outline: none;
		resize: none;
	}

	/* 개인 페이지 */

	.a_tag{
		text-decoration: none;
		text-decoration-line: none;
		color: white;
	}

	.margin-div{
		margin: 1rem;
	}


    .title_mid{
        padding: 1.5rem 0rem 0.5rem;
        font-size: larger;
    }
	
    .button_none_deco{
        text-decoration: none;
        border: none;
        background-color: transparent;
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
		display: inline-block;
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

			<!-- 상단 navbar -->
			<div class="col-lg-12">
				<div class="card">
					<div class="container-fluid">
						<div class="pagetitle navbar_pagetitle">
							<div class="navbar_content">
								<div class="navbar_content_l">
									<h1 style="padding-bottom: 0.5rem">구성원</h1>
									<nav>
										<ol class="breadcrumb">
											<li class="breadcrumb-item active">구성원</li>
											<li class="breadcrumb-item"><a href="teamReport">팀리포트</a></li>
											<li class="breadcrumb-item"><a href="invite">초대</a></li>
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
			<!-- 상단 navbar 끝-->

			<!-- 페이지 내용 -->
			<div class="body">
				<section class="section">
					<div class="row">
						<div class="col-lg-4">
							<div class="card card_radius" style="height:94%">
								<div class="card_header">
									<div style="display: inline-block; padding: 7px;"> Helloffice </div>
									<!-- team setting modal -->
									<button type="button" class="btn btn-outline-secondary float_r" data-bs-toggle="modal" data-bs-target="#team_setting">
										<i class="bi bi-gear"></i> 
									</button>
									<div class="modal fade" id="team_setting" tabindex="-1" aria-hidden="true" style="display: none;">
										<div class="modal-dialog modal-dialog-centered modal-lg">
											<div class="modal-content">
												<div class="modal-body">
													<div>
														<div>
															<div class="modal_head">
																<div class="modal_head_title">조직도 설정</div>
																<div class="modal_head_subtitle">조직을 새롭게 구성해봅시다.</div>
															</div>
															
															<div type="button" id="team_adding" class="modal_mid_button"> <i class="bi bi-plus-circle"></i> 조직 추가하기 </div>
															<div class="modal_body">
																<div class="tree">
																	<ul class="sidebar-nav" id="team_tree">
																		<li class="nav-item">
																			<div class="nav-link collapsed" data-bs-target="#team1" data-bs-toggle="collapse"> 
																				<div class="tree_main"> 대표 </div>
																			</div>
																			<ul id="team1" class="nav-content collapse" data-bs-parent="#team_tree">
																				<li>
																					<div class="tree_sub">이사</div>
																				</li>
																				<li>
																					<div class="tree_sub">수행팀</div>
																				</li>
																			</ul>
																			<div class="nav-link collapsed" data-bs-target="#team2" data-bs-toggle="collapse" href="#"> 
																				<div class="tree_main"> 마케팅팀 </div>
																			</div>
																			<ul id="team2" class="nav-content collapse" data-bs-parent="#team_tree">
																				<li>
																					<div class="tree_sub">마케팅1팀</div>
																				</li>
																				<li>
																					<div class="tree_sub">마케팅2팀</div>
																				</li>
																			</ul>
																			<div class="nav-link collapsed" data-bs-target="#team3" data-bs-toggle="collapse" href="#"> 
																				<div class="tree_main"> 영업팀 </div>
																			</div>
																			<div class="nav-link collapsed" data-bs-target="#team3" data-bs-toggle="collapse" href="#"> 
																				<div class="tree_main"> 디자인팀 </div>
																			</div>
																		</li>
																	</ul>
																</div>
															</div>
														</div>
													</div>
												</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
													<button type="button" class="btn btn-primary" data-bs-dismiss="modal">Save changes</button>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="card-body">
										<div class="list-group list-group-flush" id="v-pills-tab" role="tablist" style="padding-top: 10px;">
											<button type="button" class="list-group-item list-group-item-action" id="v-pills-all-tab" data-bs-toggle="pill" data-bs-target="#v-pills-all" type="button" role="tab" aria-controls="v-pills-all" aria-selected="false">
												전체
												<i class="bi bi-file-earmark-person float_r"></i>
											</button>
											<button type="button" class="list-group-item list-group-item-action" id="v-pills-1-tab" data-bs-toggle="pill" data-bs-target="#v-pills-1" type="button" role="tab" aria-controls="v-pills-1" aria-selected="false">
												대표
												<span class="badge bg-light text-dark float_r">1</span>
											</button>
											<button type="button" class="list-group-item list-group-item-action" id="v-pills-2-tab" data-bs-toggle="pill" data-bs-target="#v-pills-2" type="button" role="tab" aria-controls="v-pills-2" aria-selected="false"> 
												마케팅팀 
												<span class="badge bg-light text-dark float_r">2</span>
											</button>
											<button type="button" class="list-group-item list-group-item-action" id="v-pills-3-tab" data-bs-toggle="pill" data-bs-target="#v-pills-3" type="button" role="tab" aria-controls="v-pills-3" aria-selected="false"> 
												영업팀 
												<span class="badge bg-light text-dark float_r">3</span>
											</button>
											<button type="button" class="list-group-item list-group-item-action" id="v-pills-4-tab" data-bs-toggle="pill" data-bs-target="#v-pills-4" type="button" role="tab" aria-controls="v-pills-4" aria-selected="false"> 
												디자인팀 
												<span class="badge bg-light text-dark float_r">4</span>
											</button>
										</div><!-- End List group with Links and buttons -->
								</div>
							</div>
						</div>
						<div class="col-lg-8">
							<div class="card card_radius">
								<div class="card_header">빈공간~</div>
								<div class="card-body pt-2">
									<div class="tab-content" id="v-pills-tabContent col-7 col-sm-9">
										<div class="tab-pane fade show active" id="v-pills-all" role="tabpanel" aria-labelledby="v-pills-all-tab">
											<div class="">
												<table class="table table-hover">
													<thead>
														<tr>
															<th scope="col" hidden="hidden">#</th>
															<th scope="col">이름</th>
															<th scope="col">팀</th>
															<th scope="col">직무</th>
															<th scope="col">연락처</th>
															<th scope="col">근무상태</th>
														</tr>
													</thead>
													<tbody>
														<tr>
															<th scope="row" hidden="hidden">1</th>
															<td>심일용</td>
															<td>대표</td>
															<td>ceo</td>
															<td>010-0101-0101</td>
															<td>on</td>
														</tr>
														<tr>
															<th scope="row" hidden="hidden">2</th>
															<td>심이용</td>
															<td>대표</td>
															<td>수행비서</td>
															<td>010-1234-4321</td>
															<td>on</td>
														</tr>
														<tr>
															<th scope="row" hidden="hidden">3</th>
															<td>심삼용</td>
															<td>마케팅</td>
															<td>sns마케터</td>
															<td>010-3423-2342</td>
															<td>on</td>
														</tr>
														<tr>
															<th scope="row" hidden="hidden">4</th>
															<td>심사용</td>
															<td>영업</td>
															<td>북미영업사원</td>
															<td>010-1234-1234</td>
															<td>휴가</td>
														</tr>
														<tr>
															<th scope="row" hidden="hidden">5</th>
															<td>심오용</td>
															<td>디자인</td>
															<td>그래픽 디자이너</td>
															<td>010-0101-1010</td>
															<td>휴가</td>
														</tr>
													</tbody>
												</table>
											</div>
											
											<div style="padding-top: 1rem;">
												<nav aria-label="Page navigation example">
													<ul class="pagination justify-content-center ">
														<li class="page-item">
														<a class="page-link" href="#" aria-label="Previous">
															<span aria-hidden="true">«</span>
														</a>
														</li>
														<li class="page-item"><a class="page-link" href="#">1</a></li>
														<li class="page-item"><a class="page-link" href="#">2</a></li>
														<li class="page-item"><a class="page-link" href="#">3</a></li>
														<li class="page-item">
														<a class="page-link" href="#" aria-label="Next">
															<span aria-hidden="true">»</span>
														</a>
														</li>
													</ul>
												</nav>
											</div>
										</div>
										<div class="tab-pane fade" id="v-pills-1" role="tabpanel" aria-labelledby="v-pills-1-tab">
											<div class="">
												<table class="table table-hover">
													<thead>
														<tr>
															<th scope="col" hidden="hidden">#</th>
															<th scope="col">이름</th>
															<th scope="col">팀</th>
															<th scope="col">직무</th>
															<th scope="col">연락처</th>
															<th scope="col">근무상태</th>
														</tr>
													</thead>
													<tbody>
														<tr>
															<th scope="row" hidden="hidden">1</th>
															<td>심일용</td>
															<td>대표</td>
															<td>ceo</td>
															<td>010-0101-0101</td>
															<td>on</td>
														</tr>
														<tr>
															<th scope="row" hidden="hidden">2</th>
															<td>심이용</td>
															<td>대표</td>
															<td>수행비서</td>
															<td>010-1234-4321</td>
															<td>on</td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
										<div class="tab-pane fade" id="v-pills-2" role="tabpanel" aria-labelledby="v-pills-2-tab">
											<div class="">
												<table class="table table-hover">
													<thead>
														<tr>
															<th scope="col" hidden="hidden">#</th>
															<th scope="col">이름</th>
															<th scope="col">팀</th>
															<th scope="col">직무</th>
															<th scope="col">연락처</th>
															<th scope="col">근무상태</th>
														</tr>
													</thead>
													<tbody>
														<tr>
															<th scope="row" hidden="hidden">3</th>
															<td>심삼용</td>
															<td>마케팅</td>
															<td>sns마케터</td>
															<td>010-3423-2342</td>
															<td>on</td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
										<div class="tab-pane fade" id="v-pills-3" role="tabpanel" aria-labelledby="v-pills-3-tab">
											<div class="">
												<table class="table table-hover">
													<thead>
														<tr>
															<th scope="col" hidden="hidden">#</th>
															<th scope="col">이름</th>
															<th scope="col">팀</th>
															<th scope="col">직무</th>
															<th scope="col">연락처</th>
															<th scope="col">근무상태</th>
														</tr>
													</thead>
													<tbody>
														<tr>
															<th scope="row" hidden="hidden">4</th>
															<td>심사용</td>
															<td>영업</td>
															<td>북미영업사원</td>
															<td>010-1234-1234</td>
															<td>휴가</td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
										<div class="tab-pane fade" id="v-pills-4" role="tabpanel" aria-labelledby="v-pills-4-tab">
											<div class="">
												<table class="table table-hover">
													<thead>
														<tr>
															<th scope="col" hidden="hidden">#</th>
															<th scope="col">이름</th>
															<th scope="col">팀</th>
															<th scope="col">직무</th>
															<th scope="col">연락처</th>
															<th scope="col">근무상태</th>
														</tr>
													</thead>
													<tbody>
														<tr>
															<th scope="row" hidden="hidden">5</th>
															<td>심오용</td>
															<td>디자인</td>
															<td>그래픽 디자이너</td>
															<td>010-0101-1010</td>
															<td>휴가</td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</section>
			</div>
			<!-- 페이지 내용 -->
		
			<div class="col-lg-12">
				<div class="card">
					<img src="../../../resources/assets/img/hr/ham.jpg" alt="Profile" class="rounded-circle">
					<div class="card-body">
						<h5 class="card-title">${teamList.empName }</h5>
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
		
		<div class="col-lg-6">
		</div>
		</div>
		</div>
	</section>
	</main>
	
	<%@ include file = "../common/footer.jsp" %>
</body>
</html>