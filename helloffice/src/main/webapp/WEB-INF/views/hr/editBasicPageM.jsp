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
												<h5 class="section_main_title mb-5">${loginEmp.empName} 님의 기본정보 </h5>
												<form name="basicForm" action="" method="post">
													<div class="row mb-3" hidden="hidden">
														<label for="empNo" class="col-sm-2 col-form-label">사번</label>
														<div class="col-sm-10">
															<input type="number" class="form-control" id="empNo" name="empNo" value="${loginEmp.empNo}" placeholder="${loginEmp.empNo}">
														</div>
													</div>
													<div class="row mb-3">
														<label for="email" class="col-sm-2 col-form-label">이메일</label>
														<div class="col-sm-10">
															<input type="text" class="form-control" id="email" name="email" value="${loginEmp.email}" placeholder="${loginEmp.email}">
														</div>
													</div>
													<div class="row mb-3">
														<label for="empName" class="col-sm-2 col-form-label">이름</label>
														<div class="col-sm-10">
															<input type="text" class="form-control" id="empName" name="empName" value="${loginEmp.empName}" placeholder="${loginEmp.empName}">
														</div>
													</div>
													<div class="row mb-3">
														<label for="empInfo" class="col-sm-2 col-form-label">내 소개</label>
														<div class="col-sm-10">
															<input type="text" class="form-control" id="empInfo" name="empInfo" value="${loginEmp.empInfo}" placeholder="${loginEmp.empInfo}">
														</div>
													</div>
													<div class="row mb-3">
														<label for="phone" class="col-sm-2 col-form-label">휴대전화</label>
														<div class="col-sm-10">
															<input type="text" class="form-control" id="phone" name="phone" value="${loginEmp.phone}" placeholder="${loginEmp.phone}">
														</div>
													</div>
													<div class="row mb-3">
														<label for="resiNo" class="col-sm-2 col-form-label">주민등록번호</label>
														<div class="col-sm-10">
															<input type="text" class="form-control" id="resiNo" name="resiNo"  value="${loginEmp.resiNo}" placeholder="${loginEmp.resiNo}">
														</div>
													</div>
													<div class="row mb-3">
														<label for="address" class="col-sm-2 col-form-label">집주소</label>
														<div class="col-sm-10">
															<input type="text" class="form-control" id="address" name="address" value="${loginEmp.address}" placeholder="${loginEmp.address}">
														</div>
													</div>
													<div class="row mb-3">
														<label for="inputBank" class="col-sm-2 col-form-label">급여계좌</label>
														<div class="col-sm-3">
															<select id="inputBank" name="bank" class="form-select" aria-label="Default select example">
																<option value="${loginEmp.bank}"selected>${loginEmp.bank}</option>
																<option value="NH농협">NH농협</option>
																<option value="KB국민">KB국민</option>
																<option value="카카오뱅크">카카오뱅크</option>
																<option value="신한">신한</option>
																<option value="우리">우리</option>
																<option value="IBK기업">IBK기업</option>
																<option value="하나">하나</option>
																<option value="새마을">새마을</option>
																<option value="대구">대구</option>
																<option value="부산">부산</option>
																<option value="케이뱅크">케이뱅크</option>
																<option value="우체국">우체국</option>
																<option value="SC제일">SC제일</option>
																<option value="경남">경남</option>
																<option value="수협">수협</option>
																<option value="광주">광주</option>
																<option value="전북">전북</option>
																<option value="토스뱅크">토스뱅크</option>
																<option value="저축은행">저축은행</option>
																<option value="중국공상">중국공상</option>
																<option value="JP모간">JP모간</option>
																<option value="BNF파리바">BNF파리바</option>
																<option value="씨티">씨티</option>
																<option value="제주">제주</option>
																<option value="KDB산업">KDB산업</option>
																<option value="SBI저축은행">SBI저축은행</option>
																<option value="산림조합">산림조합</option>
																<option value="BOA">BOA</option>
																<option value="HSBC">HSBC</option>
																<option value="중국">중국</option>
																<option value="도이치">도이치</option>
																<option value="중국건설">중국건설</option>
															</select>
														</div>
														<div class="col-sm-7">
															<input type="text" class="form-control" id="bankAcc" name="bankAcc" value="${loginEmp.bankAcc}" placeholder="${loginEmp.bankAcc}">
														</div>
													</div>
													<!-- <div class="row mb-5">
														<label for="inputName" class="col-sm-4 col-form-label">건강보험 피부양자 수</label>
														<button class="btn btn-light col-sm-8">
															<input type="text" class="form-control" id="inputName" placeholder="${loginEmp.empName}">
														</button>
													</div> -->
														
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
								
								
								
								
								
								
								
								
								
								