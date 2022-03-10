<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../common/head.jsp" %>

<head>
	<link rel="stylesheet" href="${root}/resources/assets/css/hrCss/hrCss.css" type="text/css">
</head>

<style>
	.myPage_box_editPage{
		max-height: fit-content;
		min-height: fit-content;
		overflow: scroll;
		margin: 5rem 2rem 1rem;
	}
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
															<input type="text" class="form-control" id="empNo" placeholder="${loginEmp.empNo}">
														</div>
													</div>
													<div class="row mb-3">
														<label for="inputDeptName" class="col-sm-2 col-form-label">조직</label>
														<div class="col-sm-10">
															<input type="text" class="form-control" id="inputDeptName" placeholder="${loginEmp.depName}">
														</div>
													</div>
													<div class="row mb-3">
														<label for="inputEmpLevel" class="col-sm-2 col-form-label">직급</label>
														<div class="col-sm-10">
															<input type="text" class="form-control" id="inputName" placeholder="${loginEmp.empRank}">
														</div>
													</div>
													<div class="row mb-3">
														<label for="inputName" class="col-sm-2 col-form-label">역할</label>
														<div class="col-sm-10">
															<input type="text" class="form-control" id="inputName" placeholder="${loginEmp.empPosition}">
														</div>
													</div>
													<div class="row mb-3">
														<label for="inputName" class="col-sm-2 col-form-label">입사일</label>
														<div class="col-sm-10">
															<input type="date" class="form-control" id="inputName" placeholder="${loginEmp.entryDate}">
														</div>
													</div>
													<div class="row mb-5">
														<label for="inputName" class="col-sm-2 col-form-label">근무유형</label>
														<button class="btn btn-light col-sm-10">
															<!-- <input type="text" class="form-control" id="inputName" placeholder="${loginEmp.empName}"> -->
														</button>
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
								
								
								
								
								
								
								
								
								
								