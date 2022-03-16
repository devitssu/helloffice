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

    .careerForm{
        padding: 1rem;
    }

    .careerForm_wrapper{
        padding: 1rem;
        margin-top: 2rem;
    }

    .tp_bt{
        border-top: solid transparent 2rem;
    }

    .pd_r{
        padding-right: 0.5rem;
        font-size: larger;
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
												<div class="section_main_title">${loginEmp.empName} 님의 경력정보 </div>
                                                <div class="section_sub_info mb-3"> 가장 최신의 정보를 기입해주세요. </div>
                                                <form name="careerForm" action="" method="post">
                                                    <div class="careerForm">
                                                        <div class="row mb-3 mt-3" hidden="hidden">
                                                            <label for="empNo" class="col-sm-2 col-form-label">사번</label>
                                                            <div class="col-sm-10">
                                                                <input type="number" class="form-control" id="empNo" name="empNo" value="${careerInfo.empNo}" placeholder="${careerInfo.empNo}">
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-sm-12 p_0" >
                                                                <div class="form-floating">
                                                                    <input type="text" class="form-control" id="compName" name="compName" value="${careerInfo.compName}" placeholder="${careerInfo.compName}">
                                                                    <label for="compName" class="col-form-label"><i class="bx bxs-business pd_r"></i>회사명</label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-sm-8 p_0">
                                                                <div class="form-floating">
                                                                    <input type="text" class="form-control" id="crPosition" name="crPosition" value="${careerInfo.crPosition}" placeholder="${careerInfo.crPosition}">
                                                                    <label for="crPosition" class="col-form-label">역할(직무)</label>
                                                                </div>
                                                            </div>
                                                            <div class="col-sm-4 p_0">
                                                                <div class="form-floating">
                                                                    <input type="text" class="form-control" id="crRank" name="crRank" value="${careerInfo.crRank}" placeholder="${careerInfo.crRank}">
                                                                    <label for="crRank" class="col-form-label">직급</label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-sm-4 p_0">
                                                                <div class="form-floating">
                                                                    <input type="date" class="form-control" id="crEntryDate" name="crEntryDate" value="${careerInfo.crEntryDate}" placeholder="${careerInfo.crEntryDate}">
                                                                    <label for="crEntryDate" class="col-form-label">입사월일</label>
                                                                </div>
                                                            </div>
                                                            <div class="col-sm-4 p_0">
                                                                <div class="form-floating">
                                                                    <input type="date" class="form-control" id="crResignDate" name="crResignDate" value="${careerInfo.crResignDate}" placeholder="${careerInfo.crResignDate}">
                                                                    <label for="crResignDate" class="col-form-label">퇴사월일</label>
                                                                </div>
                                                            </div>
                                                            <div class="col-sm-4 p_0">
                                                                <div class="form-floating">
                                                                    <select class="form-select" id="crJobType" name="crJobType">
                                                                        <option value="${careerInfo.crJobType}">${careerInfo.crJobType}</option>
                                                                        <option value="정규직">정규직</option>
                                                                        <option value="계약직">계약직</option>
                                                                        <option value="파견직">파견직</option>
                                                                        <option value="인턴">인턴</option>
                                                                        <option value="단시간 근로">단시간 근로</option>
                                                                        <option value="임원">임원</option>
                                                                        <option value="프리랜서">프리랜서</option>
                                                                        <option value="기타">기타</option>
                                                                    </select>
                                                                    <label for="crJobType" class="col-form-label">계약유형</label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="text-center m-3">
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