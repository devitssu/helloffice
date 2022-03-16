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
						<div class="pagetitle">
							<div class="navbar_content">
								<div class="navbar_content_l2">
									<button onclick="history.back()" class="button_none_deco">
                                        <h1 style="padding: 1.5rem 0rem;"><i class="bi bi-arrow-left"></i></h1>
                                    </button>
									<div class="navbar_content_l2_title">돌아가기</div>
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
						<div class="col-lg-8" style="margin: auto;">
							<div class="card card_radius">
								<div class="card-body pt-2 myPage_box_editPage">
									<div class="">
										<div class="">
											<div class="card-body">
												<h5 class="section_main_title mb-5">${loginEmp.empName} 님의 인사정보 </h5>
												<form class="g-3" action="" method="post">
													<div class="row mb-3" hidden="hidden">
														<label for="empNo" class="col-sm-2 col-form-label">사번</label>
														<div class="col-sm-10">
															<input type="number" class="form-control" id="empNo" name="empNo" value="${loginEmp.empNo}" placeholder="${loginEmp.empNo}">
														</div>
													</div>
													<div class="row mb-3">
														<label for="depName" class="col-sm-2 col-form-label">조직</label>
														<div class="col-sm-10">
															<select id="depName" name="depName" class="form-select" aria-label="Default select example">
																<option value="${loginEmp.depName}" selected>${loginEmp.depName}</option>
																<c:forEach items="${deptList}" var="dl">
																	<option value="${dl.depName }">${dl.depName}</option>
																</c:forEach>
															</select>
														</div>
													</div>
													<div class="row mb-3">
														<label for="inputEmpLevel" class="col-sm-2 col-form-label">직급</label>
														<div class="col-sm-10">
															<select id="inputEmpLevel" name="empRank" class="form-select" aria-label="Default select example">
																<option value="${loginEmp.empRank}" selected>${loginEmp.empRank}</option>
																<option value="인턴">인턴</option>
																<option value="사원">사원</option>
																<option value="대리">대리</option>
																<option value="과장">과장</option>
																<option value="부장">부장</option>
																<option value="대표">대표</option>
															</select>
														</div>
													</div>
													<div class="row mb-3">
														<label for="adminLevel" class="col-sm-2 col-form-label">관리레벨</label>
														<div class="col-sm-10">
															<select id="adminLevel" name="adminLevel" class="form-select" aria-label="Default select example">
																<option value="${loginEmp.adminLevel}" selected>${loginEmp.adminLevel}</option>
																<option value="1"> 1 : [인턴, 사원, 대리] </option>
																<option value="2"> 2 : [과장, 부장] </option>
																<option value="3"> 3 : [대표] </option>
															</select>
														</div>
													</div>
													<div class="row mb-3">
														<label for="empPosition" class="col-sm-2 col-form-label">역할</label>
														<div class="col-sm-10">
															<input type="text" class="form-control" id="empPosition" name="empPosition" value="${loginEmp.empPosition}" placeholder="${loginEmp.empPosition}">
														</div>
													</div>
													<div class="row mb-3">
														<label for="entryDate" class="col-sm-2 col-form-label">입사일</label>
														<div class="col-sm-10">
															<input type="date" class="form-control" id="entryDate" name="entryDate" value="${loginEmp.entryDate}" placeholder="${loginEmp.entryDate}">
														</div>
													</div>
													<div class="row mb-5">
														<label for="workType" class="col-sm-2 col-form-label">근무유형</label>
														<div class="col-sm-10">
															<div class="col-lg-8 col-md-8 section_info">고정 출퇴근</div>
															<div class="section_sub_info">출퇴근 09:00 ~ 18:00, 주 40시간 근무, 쉬는날 - 토,일</div>
															
														</div>
													</div>
														
													<div class="text-center">
														<button type="reset" class="btn btn-secondary">Reset</button>
														<button type="submit" class="btn btn-primary">수정하기</button>
													</div>
												</form>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</section>
			</div>
		</section>
    </main>	
    <%@ include file = "../common/footer.jsp" %>
</body>
</html>	
								
								
								
								
								
								
								
								
								
								