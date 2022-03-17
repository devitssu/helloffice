<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../common/head.jsp" %>

<head>
	<link rel="stylesheet" href="${root}/resources/assets/css/hrCss/hrCss.css" type="text/css">
	<!-- <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script> -->
	<script src="https://cdn.jsdelivr.net/npm/sweetalert"></script>
</head>
<style>
	.ml_title{
		font-size: large;
		font-weight: 600;
	}

	.each_member{
		padding: 0.5rem;
	}
</style>
<body>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
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
											<c:if test="${loginEmp.adminLevel gt 1 }">
												<li class="breadcrumb-item"><a href="/helloffice/mail/send">초대</a></li>
											</c:if>
										</ol>
									</nav>
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
									<!-- 부서리스트 모달 -->
									<c:if test="${loginEmp.adminLevel gt 1}">
										<button type="button" class="btn btn-outline-secondary float_r" data-bs-toggle="modal" data-bs-target="#team_setting">
											<i class="bi bi-gear"></i> 
										</button>
									</c:if>
									<div class="modal fade" id="team_setting" tabindex="-1" aria-hidden="true" style="display: none;">
										<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
											<div class="modal-content">
												<div class="modal-body">
													<div>
														<div>
															<div class="modal_head">
																<div class="modal_head_title">조직도 설정</div>
																<div class="modal_head_subtitle">부서를 추가하거나 삭제하여 관리해보세요.</div>
															</div>
															<div class="modal_mid_button float_r">
																<a class="btn btn-light" id="dept_add">
																	<i class="bi bi-plus-circle"></i> 부서 추가하기 
																</a>
															</div>
															<div class="modal_body">
																<div id="showDept_box"> 
																	<table class="table table-hover">
																		<tbody>
																			<c:forEach items="${deptList}" var="dl">
																				<tr>
																					<td class="col-sm-8">${dl.depName}</td>
																					<td class="text-center"><a class="btn btn-sm" id="dept_udt"><i class="bi bi-pencil-fill"></i></a></td>
																					<td class="text-center"><a class="btn btn-sm" id="dept_del"><i class="bi bi-trash-fill"></i></a></td>
																				</tr>
																			</c:forEach>
																		</tbody>
																	</table>
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
									<!-- 부서리스트 모달 -->
								</div>
								
								<div class="card-body">
									<div id="deptManaging_box">
										<div class="list-group list-group-flush">
											<button type="button" class="list-group-item list-group-item-action deptListName" aria-current="true">
												<a class="a_tag_black_bold" href="#">전체</a>
											</button>
											<c:forEach items="${deptList}" var="dl">
												<button type="button" class="list-group-item list-group-item-action deptListName">
													<a class="a_tag_black" href="#">${dl.depName}</a>
												</button>
											</c:forEach>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-8">
							<div class="card card_radius">
								<div class="card_header">
									<div class="dataTable-search float_r">
										<input type="text" class="dataTable-input" placeholder="Search..." name="keyword" id="keyword">
										<button type="button" class="btn getSearchList"><i class="bx bx-search-alt-2"></i></ㅠ>
									</div>
								</div>
								<div class="card-body pt-2">
									<div class="tab-content" id="v-pills-tabContent col-7 col-sm-9">
										<div class="">
											<div class="tab-pane fade show active" id="v-pills-all" role="tabpanel" aria-labelledby="v-pills-all-tab">
												<div class="getMemberByDept">
													<div class="table table-hover ">
														<div>
															<div class="row" style="border-bottom: solid 3px slategrey; padding: 0.5rem;">
																<div class="col-sm-3 ml_title" hidden="hidden">#</div>
																<div class="col-sm-3 ml_title" style="padding-left: 1.3rem;">이름</div>
																<div class="col-sm-2 ml_title">직급</div>
																<div class="col-sm-4 ml_title">직무</div>
																<div class="col-sm-3 ml_title">연락처</div>
															</div>
														</div>
														<div class="list-group" style="border: solid 1px transparent;">
															<div class="area_reset" style="padding-top: 1rem;">
																<c:forEach items="${myTeamList}" var="ml">
																	<div onclick="goMemberPage(${ml.empNo})" class="each_member row list-group-item-action">
																	<div class="memberNo" hidden="hidden">${ml.empNo}</div>
																		<div class="col-sm-3">${ml.empName}</div>
																		<div class="col-sm-2">${ml.empRank}</div>
																		<div class="col-sm-4">${ml.empPosition}</div>
																		<div class="col-sm-3">${ml.phone}</div>
																	</div>
																</c:forEach>
															</div>
														</div>
													</div>
												</div>
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
		</div>
	</section>
	</main>
	<script type="text/javascript" src="${root}/resources/assets/js/hrJs/hrJs.js"></script>
	<script>
		function goMemberPage(empNo){
			window.location.href="/helloffice/hr/teamList/memberPage/"+empNo;
		}
	</script>
	
	<%@ include file = "../common/footer.jsp" %>
</body>
</html>