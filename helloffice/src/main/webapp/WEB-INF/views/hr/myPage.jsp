<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../common/head.jsp" %>

<head>
	<link rel="stylesheet" href="${root}/resources/assets/css/hrCss/hrCss.css" type="text/css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert"></script>
    <script src="https://cdn.jsdelivr.net/npm/clipboard@2.0.10/dist/clipboard.min.js"></script>

</head>
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
						<div class="col-lg-4">
							<div class="card card_radius" style="height:95%">
								<div class="card_header text-center">
                                    <div class="margin-div">
                                        <div class="section profile outer-wrapper">
                                            <div class="card-body profile-card pt-4 d-flex flex-column align-items-center">
                                                <img src="../resources/assets/img/profile/${loginEmp.changeName}" alt="" class="rounded-circle mb-3">
                                                <div class="profile_name">${loginEmp.empName}</div>
                                                <div class="profile_depName">
                                                    <span class="profile_depName">${loginEmp.depName}</span>
                                                    <span class="profile_empPosition">${loginEmp.empPosition}</span>
                                                </div>
                                                <div class="social-links mt-2">
                                                    <!-- a태그 클릭하면 각 정보들 클립보드에 복사하는 스크립트 작업 해야됨 -->
                                                    <span id="phone_icon" class="profile_icon" data-bs-toggle="tooltip" data-bs-placement="bottom" title="" data-clipboard-text="${loginEmp.phone}" data-bs-original-title=${loginEmp.phone}><i class="bi bi-telephone"></i></span> &nbsp;
                                                    <span id="email_icon" class="profile_icon" data-bs-toggle="tooltip" data-bs-placement="bottom" title="" data-clipboard-text="${loginEmp.email}" data-bs-original-title=${loginEmp.email}><i class="bi bi-envelope"></i></span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
								</div>
								<div class="card-body">
									<div class="margin-div">
                                        <div>
                                            <div class="d-flex align-items-start" style="padding-top: 1rem;">
                                                <div class="nav flex-column nav-pills me-3" style="display: block;" id="v-pills-tab" role="tablist" aria-orientation="vertical">
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
                                                    <!-- <button class="nav-link" id="v-pills-salary-tab" data-bs-toggle="pill" data-bs-target="#v-pills-salary" type="button" role="tab" aria-controls="v-pills-salary" aria-selected="false">
                                                        <div>
                                                            <div class="bi bi-credit-card" style="display:inline-block; padding-right: 5px;"></div>
                                                            <div style="display:inline-block"><span>급여정보</span></div>  
                                                        </div> 
                                                    </button> -->
                                                    <button class="nav-link" id="v-pills-vacation-tab" data-bs-toggle="pill" data-bs-target="#v-pills-vacation" type="button" role="tab" aria-controls="v-pills-vacation" aria-selected="false">
                                                        <div>
                                                            <div class="bi bi-music-note-beamed" style="display:inline-block; padding-right: 5px;"></div>
                                                            <div style="display:inline-block"><span>휴가</span></div>  
                                                        </div> 
                                                    </button>
                                                    <!-- <button class="nav-link" id="v-pills-worktime-tab" data-bs-toggle="pill" data-bs-target="#v-pills-worktime" type="button" role="tab" aria-controls="v-pills-worktime" aria-selected="false">
                                                        <div>
                                                            <div class="bi bi-clock" style="display:inline-block; padding-right: 5px;"></div>
                                                            <div style="display:inline-block"><span>근무시간</span></div>  
                                                        </div> 
                                                    </button> -->
                                                    <button class="nav-link" id="v-pills-files-tab" data-bs-toggle="pill" data-bs-target="#v-pills-files" type="button" role="tab" aria-controls="v-pills-files" aria-selected="false">
                                                        <div>
                                                            <div class="bi bi-printer-fill" style="display:inline-block; padding-right: 5px;"></div>
                                                            <div style="display:inline-block"><span>문서 및 증명서 발급</span></div>  
                                                        </div> 
                                                    </button>
                                                    <!-- <c:if test="${loginEmp.adminLevel eq 1}">
                                                        <button class="nav-link" id="v-pills-hrNote-tab" data-bs-toggle="pill" data-bs-target="#v-pills-hrNote" type="button" role="tab" aria-controls="v-pills-hrNote" aria-selected="false">
                                                            <div>
                                                                <div class="bi bi-clipboard-check" style="display:inline-block; padding-right: 5px;"></div>
                                                                <div style="display:inline-block"><span>인사노트</span></div>  
                                                            </div> 
                                                        </button>
                                                    </c:if> -->
                                                </div>
                                            </div>
                                        </div>
                                    </div>
								</div>
							</div>
						</div>
                        <div class="col-lg-8">
                            <div class="card card_radius">
                                <div class="card-body pt-2 myPage_box_r">
                                    <div class="">
                                        <div class="">
                                            <div class="">
                                                <div class="box-size-manage">
                                                    <div class="tab-content" id="v-pills-tabContent">

                                                        <!-- 인사정보 -->
                                                        <div class="tab-pane fade active show" id="v-pills-home" role="tabpanel" aria-labelledby="v-pills-home-tab">
                                                            <div>
                                                                <div class="profile-overview" id="profile-overview">
                                                                    <div class="one_section">
                                                                        <h5 class="section_main_title">인사정보 
                                                                            <c:if test="${loginEmp.adminLevel eq 1}">
                                                                                <a href="myPage/editInsaPageM"> <i class="bx bxs-pencil float_r" style="color: lightslategray;"></i></a> 
                                                                            </c:if>
                                                                        </h5>
                                                                        <div class="row">
                                                                            <div class="col-lg-4 col-md-4 label section_title"> 조직 </div>
                                                                            <div class="col-lg-8 col-md-8 section_info"> ${loginEmp.depName} </div>
                                                                        </div>

                                                                        <div class="row">
                                                                            <div class="col-lg-4 col-md-4 label section_title"> 직급 </div>
                                                                            <div class="col-lg-8 col-md-8 section_info"> ${loginEmp.empRank} </div>
                                                                        </div>
                                                    
                                                                        <div class="row">
                                                                            <div class="col-lg-4 col-md-4 label section_title">역할</div>
                                                                            <div class="col-lg-8 col-md-8 section_info"> ${loginEmp.empPosition} </div>
                                                                        </div>
                                                    
                                                                        <div class="row">
                                                                            <div class="col-lg-4 col-md-4 label section_title">입사일</div>
                                                                            <div class="col-lg-8 col-md-8 section_info"> ${loginEmp.entryDate}</div>
                                                                        </div>
                                                    
                                                                        <div class="row" type="button">
                                                                            <div class="col-lg-4 col-md-4 label section_title">근무유형</div>
                                                                            <div class="col-lg-8 col-md-8 p_0">
                                                                                <div class="col-lg-8 col-md-8 section_info">고정 출퇴근</div>
                                                                                <div class="section_sub_info">출퇴근 09:00 ~ 18:00, 주 40시간 근무, 쉬는날 - 토,일</div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                
                                                                    <div class="one_section">
                                                                        <h5 class="section_main_title">기본정보
                                                                            <a href="myPage/editBasicPageM"> <i class="bx bxs-pencil float_r" style="color: lightslategray;"></i></a> 
                                                                        </h5>
                                                                        <div class="row">
                                                                            <div class="col-lg-4 col-md-4 label section_title">이메일</div>
                                                                            <div class="col-lg-8 col-md-8 section_info">${loginEmp.email}</div>
                                                                        </div>
                                                    
                                                                        <div class="row">
                                                                            <div class="col-lg-4 col-md-4 label section_title">이름</div>
                                                                            <div class="col-lg-8 col-md-8 section_info">${loginEmp.empName}</div>
                                                                        </div>
                                                    
                                                                        <div class="row">
                                                                            <div class="col-lg-4 col-md-4 label section_title">내 소개</div>
                                                                            <div class="col-lg-8 col-md-8 section_info"> ${loginEmp.empInfo} </div>
                                                                        </div>
    
                                                                        <div class="row">
                                                                            <div class="col-lg-4 col-md-4 label section_title">휴대전화</div>
                                                                            <div class="col-lg-8 col-md-8 section_info"> ${loginEmp.phone} </div>
                                                                        </div>
    
                                                                        <div class="row">
                                                                            <div class="col-lg-4 col-md-4 label section_title">주민등록번호</div>
                                                                            <div class="col-lg-8 col-md-8 section_info">${loginEmp.resiNo}</div>
                                                                        </div>
    
                                                                        <div class="row">
                                                                            <div class="col-lg-4 col-md-4 label section_title">집 주소</div>
                                                                            <div class="col-lg-8 col-md-8 section_info"> ${loginEmp.address} </div>
                                                                        </div>
    
                                                                        <div class="row">
                                                                            <div class="col-lg-4 col-md-4 label section_title">급여계좌</div>
                                                                            <div class="col-lg-8 col-md-8 section_info"> ${loginEmp.bank} &nbsp; ${loginEmp.bankAcc}</div>
                                                                        </div>
                                                                        
                                                                        <!-- <div class="row">
                                                                            <div class="col-lg-4 col-md-4 label section_title">건강보험 피부양자 수</div>
                                                                            <div class="col-lg-8 col-md-8 section_info"> ${loginEmp.dependentNum} 명 </div>
                                                                        </div> -->
                                                                    </div>    
    
                                                                    <div class="one_section">
                                                                        <h5 class="section_main_title">공제정보</h5>
                                                                        <div class="row">
                                                                            <div class="col-lg-4 col-md-4 label section_title">원천징수세율</div>
                                                                            <div class="col-lg-8 col-md-8 section_info">100%</div>
                                                                        </div>
    
                                                                        <div class="row">
                                                                            <div class="col-lg-4 col-md-4 label section_title">공제대상 가족 수</div>
                                                                            <div class="col-lg-8 col-md-8 section_info"> ${loginEmp.dependentNum} 명</div>
                                                                        </div>
    
                                                                        <div class="row">
                                                                            <div class="col-lg-4 col-md-4 label section_title">4대보험 제외여부</div>
                                                                            <div class="col-lg-8 col-md-8 section_info"> 4대보험 제외대상자가 아닙니다.</div>
                                                                        </div>
                                                                    </div>
    
                                                                    <div class="one_section">
                                                                        <h5 class="section_main_title">경력
                                                                            <a onclick="goCareerPage(${loginEmp.empNo})"> <i class="bx bxs-pencil float_r" style="color: lightslategray;"></i></a> 
                                                                        </h5>
                                                                        <div class="row">
                                                                            <div class="col-lg-4 col-md-4 label section_title">${myCareer.crJobType}</div>
                                                                            <div class="col-lg-8 col-md-8 p_0">
                                                                                <div class="col-lg-8 col-md-8 section_info">${myCareer.compName} &nbsp; ${myCareer.crPosition} &nbsp; ${myCareer.crRank}</div>
                                                                                <div class="col-lg-8 col-md-8 section_sub_info">${myCareer.crEntryDate} ~ ${myCareer.crResignDate}</div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                        
                                                                    <div class="one_section">
                                                                        <h5 class="section_main_title">학력
                                                                            <a onclick="goAcademicPage(${loginEmp.empNo})"> <i class="bx bxs-pencil float_r" style="color: lightslategray;"></i></a> 
                                                                        </h5>
                                                                        <div class="row">
                                                                            <div class="col-lg-4 col-md-4 label section_title">${myAca.acaType}</div>
                                                                            <div class="col-lg-8 col-md-8 p_0">
                                                                                <div class="col-lg-8 col-md-8 section_info">${myAca.acaName} ${myAca.major} ${myAca.graduState}</div>
                                                                                <div class="col-lg-8 col-md-8 section_sub_info">${myAca.enrollDate} ~ ${myAca.graduDate}</div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>		
                                                            </div>
                                                        </div>
                                    
                                                        <!-- 계약정보 -->
                                                        <div class="tab-pane fade" id="v-pills-contract" role="tabpanel" aria-labelledby="v-pills-contract-tab">
                                                            <div>
                                                                <div class="profile-overview" id="profile-overview">
                                                                    <div class="one_section">
                                                                        <h5 class="section_main_title">계약정보</h5>
                                                                        <div class="row">
                                                                            <div class="col-lg-4 col-md-4 label section_title"> 계약형태 </div>
                                                                            <div class="col-lg-8 col-md-8 section_info"> 정규직 </div>
                                                                        </div>
                                                    
                                                                        <div class="row">
                                                                            <div class="col-lg-4 col-md-4 label section_title"> 포괄임금 계약 </div>
                                                                            <div class="col-lg-8 col-md-8 section_info"> 해당사항없음 </div>
                                                                        </div>
                                                                    
                                                                        <div class="row">
                                                                            <div class="col-lg-4 col-md-4 label section_title"> 근로계약기간 </div>
                                                                            <div class="col-lg-8 col-md-8 section_info"> ${loginEmp.entryDate} ~ 종료일(미정) </div>
                                                                        </div>
                                                    
                                                                        <div class="row">
                                                                            <div class="col-lg-4 col-md-4 label section_title"> 계약금액</div>
                                                                            <div class="col-lg-8 col-md-8 section_info">고정 출퇴근</div>
                                                                        </div>
                                                                    </div>
                                                                    <!-- <h5 class="card-title">계약서</h5>
                                                                    <div class="row">
                                                                        <div class="col-lg-4 col-md-4 label">이메일</div>
                                                                        <div class="col-lg-8 col-md-8">forforfor@gmail.com</div>
                                                                    </div> -->
                                                                </div>		
                                                            </div>
                                                        </div>
                                                        
                                                        <!-- 급여정보 -->
                                                        <div class="tab-pane fade" id="v-pills-salary" role="tabpanel" aria-labelledby="v-pills-salary-tab">
                                                            <div>
                                                                <div class="profile-overview" id="profile-overview">
                                                                    <div class="one_section">
                                                                        <h5 class="section_main_title">급여</h5>
                                                                        <div class="row">
                                                                            <div class="info-box">
                                                                                <div class="info-box-title"> 급여명세서가 아직 없음 ^^ </div>
                                                                                <div class="info-box-desc"> sorry </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    
                                                                    <div class="one_section">
                                                                        <h5 class="section_main_title">지급내역</h5>
                                                                        <div class="row">
                                                                            <div class="info-box">
                                                                                <div class="info-box-title"> 수당 지급 항목이 아직 없음 ^^ </div>
                                                                                <div class="info-box-desc"> sorry </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    
                                                                    <div class="one_section">
                                                                        <h5 class="section_main_title">공제내역</h5>
                                                                        <div class="row">
                                                                            <div class="info-box">
                                                                                <div class="info-box-title"> 필수 기타 공제내역이 아직 없음 ^^ </div>
                                                                                <div class="info-box-desc"> sorry </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>		
                                                            </div>
                                                        </div>
                                                        
                                                        <!-- 휴가 -->
                                                        <div class="tab-pane fade" id="v-pills-vacation" role="tabpanel" aria-labelledby="v-pills-vacation-tab">
                                                            <div>
                                                                <div class="profile-overview" id="profile-overview">
                                                                    <div class="one_section">
                                                                        <h5 class="section_main_title">휴가현황</h5>
                                                                        <div class="row">
                                                                            <div class="col-lg-4 col-md-4 label section_title"> 남은 연차 </div>
                                                                            <div class="col-lg-8 col-md-8 section_info"> 없음 </div>
                                                                        </div>
                                                    
                                                                        <div class="row">
                                                                            <div class="col-lg-4 col-md-4 label section_title"> 여름휴가 </div>
                                                                            <div class="col-lg-8 col-md-8 section_info"> 3일(24시간) <span class="section_sub_info">사용기한 D-310 </span></div>
                                                                        </div>
    
                                                                        <div class="row">
                                                                            <div class="col-lg-4 col-md-4 label section_title"> 보건 휴가 </div>
                                                                            <div class="col-lg-8 col-md-8 section_info"> 1일(8시간) <span class="section_sub_info">사용기한 D-4</span></div>
                                                                        </div>
    
                                                                        <div class="row">
                                                                            <div class="col-lg-4 col-md-4 label section_title"> 리프레시 휴가 </div>
                                                                            <div class="col-lg-8 col-md-8 section_info"> D-1095 <span class="section_sub_info">2025.02.23에 사용가능</span></div>
                                                                        </div>
                                                                    </div>
                                                                    
                                                                    <div class="one_section">
                                                                        <h5 class="section_main_title">휴가사용내역</h5>
                                                                        <div class="row">
                                                                            <div class="info-box">
                                                                                <div class="info-box-title"> 아직 휴가 사용 내역이 없습니다 ^^ </div>
                                                                                <div class="info-box-desc"> :) </div>
                                                                            </div>
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
                                                                    <div class="one_section">
                                                                        <h5 class="section_main_title"> 내 문서</h5>
                                                                        <div class="row">
                                                                            <div class="col-lg-4 col-md-4 label section_title"> 주민등록등본 </div>
                                                                            <div class="col-lg-8 col-md-8 section_info" type="button"> 링크 </div>
                                                                        </div>
                                                    
                                                                        <div class="row">
                                                                            <div class="col-lg-4 col-md-4 label section_title"> 가족관계증명서 </div>
                                                                            <div class="col-lg-8 col-md-8 section_info" type="button"> 링크 </div>
                                                                        </div>
                                                    
                                                                        <div class="row">
                                                                            <div class="col-lg-4 col-md-4 label section_title"> 건강보험자격득실확인서 </div>
                                                                            <div class="col-lg-8 col-md-8 section_info" type="button"> 링크 </div>
                                                                        </div>
                                                    
                                                                        <div class="row">
                                                                            <div class="col-lg-4 col-md-4 label section_title"> 연봉계약서</div>
                                                                            <div class="col-lg-8 col-md-8 section_info" type="button"> 링크 </div>
                                                                        </div>
    
                                                                        <div class="row">
                                                                            <div class="col-lg-4 col-md-4 label section_title"> 근로계약서 </div>
                                                                            <div class="col-lg-8 col-md-8 section_info" type="button">링크 </div>
                                                                        </div>
    
                                                                        <div class="row">
                                                                            <div class="col-lg-4 col-md-4 label section_title"> 이력서 </div>
                                                                            <div class="col-lg-8 col-md-8 section_info" type="button"> 링크 </div>
                                                                        </div>
    
                                                                        <div class="row">
                                                                            <div class="col-lg-4 col-md-4 label section_title"> 학위증명서 </div>
                                                                            <div class="col-lg-8 col-md-8 section_info" type="button">링크</div>
                                                                        </div>
                                                                    </div>
                                                                    
                                                                    <div class="one_section">
                                                                        <h5 class="section_main_title">증명서 발급</h5>
                                                                        <div class="row">
                                                                            <div class="col-lg-4 col-md-4 label section_title">재직증명서</div>
                                                                            <div class="col-lg-8 col-md-8 p_0">
                                                                                <span class="col-lg-8 col-md-8 section_info">재직을 증명하는 문서입니다.</span>
                                                                                <a class="btn" href="/helloffice/workflow">발급하기</a>
                                                                            </div>
                                                                        </div>
    
                                                                        <div class="row">
                                                                            <div class="col-lg-4 col-md-4 label section_title">경력증명서</div>
                                                                            <div class="col-lg-8 col-md-8 p_0">
                                                                                <span class="col-lg-8 col-md-8 section_info">경력을 증명하는 문서입니다.</span>
                                                                                <a class="btn" href="helloffice/workflow">발급하기</a>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>		
                                                            </div>
                                                        </div>
                                                        
                                                        <!-- 인사노트 -->
                                                        <div class="tab-pane fade" id="v-pills-hrNote" role="tabpanel" aria-labelledby="v-pills-hrNote-tab">
                                                            <div>
                                                                <div class="profile-overview" id="profile-overview">
                                                                    <div class="one_section">
                                                                        <h5 class="section_main_title"> 인사노트 작성 </h5>
                                                                        <p>
                                                                            <textarea placeholder="직원에 대한 평가나 기록을 남겨두세요." rows="4" class="insa_textarea">
                                                                            </textarea>
                                                                        </p>
                                                                        <div class="align-items-center" style="display: flex; padding: 0.5rem;">
                                                                            <input type="submit" value="저장하기" class="btn btn-outline-secondary" style="margin: auto;"></input>
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
                            </div>
                        </div>
					</div>
				</section>
			</div>
        </section>
    </main>	
    <script type="text/javascript" src="${root}/resources/assets/js/hrJs/hrJs.js"></script>
    <script>
        
    // 프로필 전화번호, 이메일 정보 클립보드에 복사하기 

    $("#phone_icon").val();
    var clipboard = new ClipboardJS('#phone_icon');
    clipboard.on('success', function(e){
        swal("클립보드에 전화번호가 복사되었습니다!", {
            button: false,
            timer: 1500,
        });
        e.clearSelection();
    })

    $("#email_icon").val();
    var clipboard = new ClipboardJS('#email_icon');
    clipboard.on('success', function(e){
        swal("클립보드에 이메일이 복사되었습니다!", {
            button: false,
            timer: 1000,
        });
        e.clearSelection();
    })

    // 인사 페이지로 이동하기
    function goInsaPage(empNo){
        window.location.href="/helloffice/hr/myPage/editInsaPage/"+empNo;
    }

    function goBasicPage(empNo){
        window.location.href="/helloffice/hr/myPage/editBasicPage/"+empNo;
    }    

    function goCareerPage(empNo){
        window.location.href="/helloffice/hr/myPage/editCareerPage/"+empNo;
    }

    function goAcaPage(empNo){
        window.location.href="/helloffice/hr/myPage/editAcaPage/"+empNo;
    }    

    </script>
    <%@ include file = "../common/footer.jsp" %>
</body>
</html>