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
									<h1 style="padding-bottom: 0.5rem">팀리포트</h1>
									<nav>
										<ol class="breadcrumb">
											<li class="breadcrumb-item"><a href="teamList">구성원</a></li>
											<li class="breadcrumb-item active">팀리포트</li>
											<c:if test="${loginEmp.adminLevel gt 1 }">
												<li class="breadcrumb-item"><a href="/helloffice/mail/send">초대</a></li>
											</c:if>
											<!-- <li class="breadcrumb-item"><a href="contract">계약</a></li> -->
										</ol>
									</nav>
								</div>
								<div class="navbar_content_r">
									<button type="button" class="btn btn-info rounded-pill">
										<a href="/helloffice/workMain" class="a_tag">근무/휴가 상세 정보 조회 </a>
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
								<div class="card_header margin-div">
									<div class="modal_head_title">팀리포트</div>
									<div class="modal_head_subtitle">팀의 근태상황을 미리 파악하여 <br> 업무일정을 계획합니다</div>
								</div>
								<div class="card-body">
										<div class="list-group list-group-flush" id="v-pills-tab" role="tablist" style="padding-top: 10px;">
											<button type="button" class="list-group-item list-group-item-action" id="v-pills-all-tab" data-bs-toggle="pill" data-bs-target="#v-pills-all" type="button" role="tab" aria-controls="v-pills-all" aria-selected="false">
												<i class="bi bi-calendar-check float_r"></i>
												주기별 근무
											</button>
											<button type="button" class="list-group-item list-group-item-action" id="v-pills-1-tab" data-bs-toggle="pill" data-bs-target="#v-pills-1" type="button" role="tab" aria-controls="v-pills-1" aria-selected="false">
												<i class="bi bi-emoji-sunglasses float_r"></i>
												연차사용현황
											<button type="button" class="list-group-item list-group-item-action" id="v-pills-2-tab" data-bs-toggle="pill" data-bs-target="#v-pills-2" type="button" role="tab" aria-controls="v-pills-2" aria-selected="false"> 
												<i class="bi bi-exclamation-octagon float_r"></i>
												업무밀도
											</button>
										</div><!-- End List group with Links and buttons -->
								</div>
							</div>
						</div>
						<div class="col-lg-8">
							<div class="card card_radius">
								<div class="card-body pt-2">
									<div class="tab-content" id="v-pills-tabContent col-7 col-sm-9">
										<div class="tab-pane fade show active" id="v-pills-all" role="tabpanel" aria-labelledby="v-pills-all-tab">
											<div class="card_header">
												<div class="report_midtitle">주기별근무</div> 
											</div>
											<div class="">
												<table class="table table-hover">
													<thead>
														<tr>
															<th scope="col" hidden="hidden">#</th>
															<th scope="col">이름</th>
															<th scope="col">직무</th>
															<th colspan="3"></th>
														</tr>
													</thead>
													<tbody>
														<c:forEach items="${teamList}" var="t">
															<tr>
																<th scope="row" hidden="hidden">1</th>
																<td>${t.empName}</td>
																<td>${t.empPosition}</td>
																<td style="width: 70%;">
																	<div class="progress" style="margin-top: 5px">
																		<div class="progress-bar" role="progressbar" style="width: 75%" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"></div>
																	</div>
																</td>
															</tr>
														</c:forEach>
													</tbody>
												</table>
											</div>
											<!-- <div style="padding-top: 1rem;">
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
											</div> -->
										</div>
										<div class="tab-pane fade" id="v-pills-1" role="tabpanel" aria-labelledby="v-pills-1-tab">
											<div class="card_header">
												<div class="report_midtitle">연차사용현황</div> 
											</div>
											<div class="">
												<table class="table table-hover">
													<thead>
														<tr>
															<th scope="col" hidden="hidden">#</th>
															<th scope="col">이름</th>
															<th scope="col">팀</th>
															<th scope="col">직무</th>
															<th scope="col">잔여일수</th>
															<th scope="col">총계</th>
														</tr>
													</thead>
													<tbody>
														<c:forEach items="${teamList}" var="t">
															<tr>
																<th scope="row" hidden="hidden">2</th>
																<td>${t.empName}</td>
																<td>${t.depName}</td>
																<td>${t.empPosition}</td>
																<td>0일</td>
																<td>4개</td>
															</tr>
														</c:forEach>
													</tbody>
												</table>
											</div>
											<!-- <div style="padding-top: 1rem;">
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
											</div> -->
										</div>
										<div class="tab-pane fade" id="v-pills-2" role="tabpanel" aria-labelledby="v-pills-2-tab">
											<div class="card_header">
												<div class="report_midtitle">업무밀도</div> 
											</div>
											<div class="">
												<table class="table table-hover">
													<thead>
														<tr>
															<th scope="col" hidden="hidden">#</th>
															<th scope="col">이름</th>
															<th scope="col">팀</th>
															<th scope="col">직무</th>
															<th scope="col"></th>
														</tr>
													</thead>
													<tbody>
														<c:forEach items="${teamList}" var="t">
															<tr>
																<th scope="row" hidden="hidden">1</th>
																<td>${t.empName}</td>
																<td>${t.depName}</td>
																<td>${t.empPosition}</td>
																<td>
																	<span class="badge bg-primary float_r"><i class="bi bi-star me-1"></i> good
																	</span>
																</td>
															</tr>
														</c:forEach>
													</tbody>
												</table>
											</div>
											<!-- <div style="padding-top: 1rem;">
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
											</div> -->
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</section>
			</div>
			<!-- 페이지 내용 -->

		</section>
		
	</main>
	
	<%@ include file = "../common/footer.jsp" %>
</body>
</html>