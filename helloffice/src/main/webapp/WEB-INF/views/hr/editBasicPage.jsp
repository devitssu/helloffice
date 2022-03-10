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
												<h5 class="section_main_title mb-5">${loginEmp.empName} 님의 기본정보 </h5>
												<form class="g-3">
													<div class="row mb-3">
														<label for="email" class="col-sm-2 col-form-label">이메일</label>
														<div class="col-sm-10">
															<input type="text" class="form-control" id="email" placeholder="${loginEmp.email}">
														</div>
													</div>
													<div class="row mb-3">
														<label for="empName" class="col-sm-2 col-form-label">이름</label>
														<div class="col-sm-10">
															<input type="text" class="form-control" id="empName" placeholder="${loginEmp.empName}">
														</div>
													</div>
													<div class="row mb-3">
														<label for="empInfo" class="col-sm-2 col-form-label">내 소개</label>
														<div class="col-sm-10">
															<input type="text" class="form-control" id="empInfo" placeholder="${loginEmp.empInfo}">
														</div>
													</div>
													<div class="row mb-3">
														<label for="phone" class="col-sm-2 col-form-label">휴대전화</label>
														<div class="col-sm-10">
															<input type="text" class="form-control" id="phone" placeholder="${loginEmp.phone}">
														</div>
													</div>
													<div class="row mb-3">
														<label for="resiNo" class="col-sm-3 col-form-label">주민등록번호</label>
														<div class="col-sm-9">
															<input type="text" class="form-control" id="resiNo" placeholder="${loginEmp.resiNo}">
														</div>
													</div>
													<div class="row mb-3">
														<label for="address" class="col-sm-2 col-form-label">집주소</label>
														<div class="col-sm-10">
															<input type="text" class="form-control" id="address" placeholder="${loginEmp.address}">
														</div>
													</div>
													<div class="row mb-3">
														<label for="inputBank" class="col-sm-2 col-form-label">급여계좌</label>
														<div class="col-sm-3">
															<select id="bank" class="form-select">
																<option value="${loginEmp.bank}" selected>${loginEmp.bank}</option>
																<option value="다른거">다른거</option>
															</select>
														</div>
														<div class="col-sm-7">
															<input type="text" class="form-control" id="bAccount" placeholder="${loginEmp}">
														</div>
													</div>
													<div class="row mb-5">
														<label for="inputName" class="col-sm-4 col-form-label">건강보험 피부양자 수</label>
														<button class="btn btn-light col-sm-8">
															<!-- <input type="text" class="form-control" id="inputName" placeholder="${loginEmp.empName}"> -->
														</button>
													</div>
														
													<div class="text-center">
														<button type="reset" class="btn btn-secondary">reset</button>
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
								
								
								
								
								
								
								
								
								
								