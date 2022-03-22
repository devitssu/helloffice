<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../common/head.jsp" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.Date" %> 

<head>
	<link rel="stylesheet" href="${root}/resources/assets/css/hrCss/hrCss.css" type="text/css">
    <link rel="stylesheet" href="${root}/resources/assets/css/workCss/workMain.css" type="text/css">
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
                                                                            <c:if test="${loginEmp.adminLevel gt 1}">
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
                                                    
                                                                        <c:if test="${loginEmp.adminLevel gt 1}">
                                                                            <div class="row">
                                                                                <div class="col-lg-4 col-md-4 label section_title"> 관리레벨 </div>
                                                                                <div class="col-lg-8 col-md-8 section_info"> ${loginEmp.adminLevel} </div>
                                                                            </div>
                                                                        </c:if>

                                                                        <div class="row">
                                                                            <div class="col-lg-4 col-md-4 label section_title">역할</div>
                                                                            <div class="col-lg-8 col-md-8 section_info"> ${loginEmp.empPosition} </div>
                                                                        </div>
                                                    
                                                                        <div class="row">
                                                                            <div class="col-lg-4 col-md-4 label section_title">입사일</div>
                                                                            <div class="col-lg-8 col-md-8 section_info"> ${loginEmp.entryDate}</div>
                                                                        </div>
                                                    
                                                                        <div class="row" roll="button" data-bs-toggle="modal" data-bs-target="#workType" href="#">
                                                                            <div class="col-lg-4 col-md-4 label section_title">근무유형</div>
                                                                            <div class="col-lg-8 col-md-8 p_0">
                                                                                <div class="col-lg-8 col-md-8 section_info">고정 출퇴근</div>
                                                                                <div class="section_sub_info">출퇴근 09:00 ~ 18:00, 주 40시간 근무, 쉬는날 - 토,일</div>
                                                                            </div>
                                                                        </div>
                                                                        <!-- 근무 유형 Modal -->
                                                                        <div class="modal fade" id="workType" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                                            <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg">
                                                                                <div class="modal-content">
                                                                                    <div class="modal-header">
                                                                                        <h2 class="modal-title" id="exampleModalLabel" style="margin-bottom: 32px;"> ${loginEmp.empName }님의 근무유형</h2>
                                                                                    </div>
                                                                                    <div class="modal-body" style="padding: 32px;">
                                                                                        <div style="margin-top: -10px;">
                                                                                            <div class="worktype_c">
                                                                                                <div class="worktype_c1">
                                                                                                    적용기간
                                                                                                </div>
                                                                                                <div class="worktype_c2">
                                                                                                    
                                                                                                </div>
                                                                                                <div class="worktype_c3">
                                                                                                    <div class="worktype_c3_1">
                                                                                                        <div class="worktype_c3_1_1">
                                                                                                            <span class="worktype_c3_1_1_1">
                                                                                                                ${loginEmp.entryDate} &nbsp; ~ 
                                                                                                            </span>
                                                                                                            <div class="worktype_c3_1_1_2">
                                                                                                                <div class="worktype_c3_1_1_2_1">적용중</div>
                                                                                                            </div>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>
                                                                                            <div class="worktype_c">
                                                                                                <div class="worktype_c1">
                                                                                                    근무유형
                                                                                                </div>
                                                                                                <div class="worktype_c2">
                                                                                                    
                                                                                                </div>
                                                                                                <div class="worktype_c3">
                                                                                                    <div class="worktype_c3_1">
                                                                                                        <div class="worktype_c3_1_1">
                                                                                                            <span class="worktype_c3_1_1_1">
                                                                                                                기본 - 고정 출·퇴근
                                                                                                            </span>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>
                                                                                            <div class="worktype_c">
                                                                                                <div class="worktype_c1">
                                                                                                    계약유형
                                                                                                </div>
                                                                                                <div class="worktype_c2">
                                                                                                    
                                                                                                </div>
                                                                                                <div class="worktype_c3">
                                                                                                    <div class="worktype_c3_1">
                                                                                                        <div class="worktype_c3_1_1">
                                                                                                            <span class="worktype_c3_1_1_1">
                                                                                                                통상근무 주 40시간
                                                                                                            </span>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>
                                                                                            <div class="worktype_c">
                                                                                                <div class="worktype_c1">
                                                                                                    근무시간 계산 주기
                                                                                                </div>
                                                                                                <div class="worktype_c2">
                                                                                                    
                                                                                                </div>
                                                                                                <div class="worktype_c3">
                                                                                                    <div class="worktype_c3_1">
                                                                                                        <div class="worktype_c3_1_1">
                                                                                                            <span class="worktype_c3_1_1_1">
                                                                                                                주기 시작 요일: 월요일
                                                                                                            </span>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>
                                                                                            <div class="worktype_c">
                                                                                                <div class="worktype_c1">
                                                                                                    일 평균 근무시간
                                                                                                </div>
                                                                                                <div class="worktype_c2">
                                                                                                    
                                                                                                </div>
                                                                                                <div class="worktype_c3">
                                                                                                    <div class="worktype_c3_1">
                                                                                                        <div class="worktype_c3_1_1">
                                                                                                            <span class="worktype_c3_1_1_1">
                                                                                                                근무 8시간, 휴게 1시간
                                                                                                            </span>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>
                                                                                            <div class="worktype_c">
                                                                                                <div class="worktype_c1">
                                                                                                    출·퇴근 시간
                                                                                                </div>
                                                                                                <div class="worktype_c2">
                                                                                                    
                                                                                                </div>
                                                                                                <div class="worktype_c3">
                                                                                                    <div class="worktype_c3_1">
                                                                                                        <div class="worktype_c3_1_1">
                                                                                                            <span class="worktype_c3_1_1_1">
                                                                                                                오전 09:00 ~ 오후 06:00
                                                                                                            </span>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>
                                                                                            <div class="worktype_c">
                                                                                                <div class="worktype_c1">
                                                                                                    일하는 날
                                                                                                </div>
                                                                                                <div class="worktype_c2">
                                                                                                    
                                                                                                </div>
                                                                                                <div class="worktype_c3">
                                                                                                    <div class="worktype_c3_1">
                                                                                                        <div class="worktype_c3_1_1">
                                                                                                            <span class="worktype_c3_1_1_1">
                                                                                                                월, 화, 수, 목, 금
                                                                                                            </span>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>
                                                                                            <div class="worktype_c">
                                                                                                <div class="worktype_c1">
                                                                                                    유급휴일
                                                                                                </div>
                                                                                                <div class="worktype_c2">
                                                                                                    
                                                                                                </div>
                                                                                                <div class="worktype_c3">
                                                                                                    <div class="worktype_c3_1">
                                                                                                        <div class="worktype_c3_1_1">
                                                                                                            <span class="worktype_c3_1_1_1">
                                                                                                                일요일
                                                                                                            </span>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>
                                                                                            <div class="worktype_c">
                                                                                                <div class="worktype_c1">
                                                                                                    근무시간
                                                                                                </div>
                                                                                                <div class="worktype_c2">
                                                                                                    
                                                                                                </div>
                                                                                                <div class="worktype_c3">
                                                                                                    <div class="worktype_c3_1">
                                                                                                        <div class="worktype_c3_1_1">
                                                                                                            <span class="worktype_c3_1_1_1">
                                                                                                                주 40시간 (월 평균 174시간)
                                                                                                            </span>
                                                                                                        </div>
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
                                                                            <c:if test="${myCareer ne null}">
                                                                                <a onclick="goCareerPage(${loginEmp.empNo})"> <i class="bx bxs-pencil float_r" style="color: lightslategray;"></i></a> 
                                                                            </c:if>
                                                                            <c:if test="${myCareer eq null}">
                                                                                <a onclick="goCareerFirstPage()"> <i class="bx bxs-pencil float_r" style="color: lightslategray;"></i></a> 
                                                                            </c:if>
                                                                        </h5>
                                                                        <c:if test="${myCareer ne null}">
                                                                            <div class="row">
                                                                                <div class="col-lg-4 col-md-4 label section_title">${myCareer.crJobType}</div>
                                                                                <div class="col-lg-8 col-md-8 p_0">
                                                                                    <div class="col-lg-8 col-md-8 section_info">${myCareer.compName} &nbsp; ${myCareer.crPosition} &nbsp; ${myCareer.crRank}</div>
                                                                                    <div class="col-lg-8 col-md-8 section_sub_info">${myCareer.crEntryDate} ~ ${myCareer.crResignDate}</div>
                                                                                </div>
                                                                            </div>
                                                                        </c:if>
                                                                        <c:if test="${myCareer eq null}">
                                                                            <div class="col-lg-12 section_title">경력 정보가 아직 등록되지 않았습니다.</div>
                                                                        </c:if>
                                                                    </div>
                                                                    <div class="one_section">
                                                                        <h5 class="section_main_title">학력
                                                                            <c:if test="${myAca ne null}">
                                                                                <a onclick="goAcademicPage(${loginEmp.empNo})"> <i class="bx bxs-pencil float_r" style="color: lightslategray;"></i></a> 
                                                                            </c:if>
                                                                            <c:if test="${myAca eq null}">
                                                                                <a onclick="goAcademicFirstPage()"> <i class="bx bxs-pencil float_r" style="color: lightslategray;"></i></a> 
                                                                            </c:if>
                                                                        </h5>
                                                                        <c:if test="${myAca ne null}">
                                                                            <div class="row">
                                                                                <div class="col-lg-4 col-md-4 label section_title">${myAca.acaType}</div>
                                                                                <div class="col-lg-8 col-md-8 p_0">
                                                                                    <div class="col-lg-8 col-md-8 section_info">${myAca.acaName} ${myAca.major} ${myAca.graduState}</div>
                                                                                    <div class="col-lg-8 col-md-8 section_sub_info">${myAca.enrollDate} ~ ${myAca.graduDate}</div>
                                                                                </div>
                                                                            </div>
                                                                        </c:if>
                                                                        <c:if test="${myAca eq null}">
                                                                            <div class="col-lg-12 section_title">학력 정보가 아직 등록되지 않았습니다.</div>
                                                                        </c:if>
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
                                                                            <div class="col-lg-8 col-md-8 section_info">
                                                                                <c:choose>
                                                                                    <c:when test="${loginEmp.empRank eq '인턴'}">
                                                                                        연봉 25,000,000원
                                                                                    </c:when>
                                                                                    <c:when test="${loginEmp.empRank eq '사원'}">
                                                                                        연봉 30,000,000원
                                                                                    </c:when>
                                                                                    <c:when test="${loginEmp.empRank eq '대리'}">
                                                                                        연봉 35,000,000원
                                                                                    </c:when>
                                                                                    <c:when test="${loginEmp.empRank eq '과장'}">
                                                                                        연봉 40,000,000원
                                                                                    </c:when>
                                                                                    <c:when test="${loginEmp.empRank eq '부장'}">
                                                                                        연봉 45,000,000원
                                                                                    </c:when>
                                                                                    <c:when test="${loginEmp.empRank eq '대표'}">
                                                                                        연봉 50,000,000원
                                                                                    </c:when>
                                                                                </c:choose>
                                                                                <div class="col-lg-8 col-md-8 section_sub_info" style="padding-top: 5px; font-weight: 600;">
                                                                                    ${loginEmp.entryDate} ~ ${date}
                                                                                    <script>
                                                                                        let date = new Date("${loginEmp.entryDate}");
                                                                                        
                                                                                        date.setFullYear(date.getFullYear() + 1);
                                                                                        document.write(date.toISOString().substr(0,10) );
                                                                                    </script>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
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
                                                                        <h5 class="section_main_title">휴가현황
                                                                            <a href='/helloffice/off' class="badge rounded-pill bg-secondary float_r">
                                                                                <div style="text-align: right;">상세정보 조회</div>
                                                                            </a>
                                                                        </h5>
                                                                        <div class="row">
                                                                            <div class="col-lg-4 col-md-4 label section_title"> 남은 연차 </div>
                                                                            <div class="col-lg-8 col-md-8 section_info"> 14일 </div>
                                                                        </div>
                                                    
                                                                        <div class="row">
                                                                            <div class="col-lg-4 col-md-4 label section_title"> 여름휴가 </div>
                                                                            <div class="col-lg-8 col-md-8 section_info"> 3일(24시간) 
                                                                                <span class="section_sub_info"> 
                                                                                    &nbsp; 사용기한 D-288
                                                                                </span>
                                                                            </div>
                                                                        </div>
    
                                                                        <div class="row">
                                                                            <div class="col-lg-4 col-md-4 label section_title"> 보건 휴가 </div>
                                                                            <div class="col-lg-8 col-md-8 section_info"> 1일(8시간) <span class="section_sub_info"> &nbsp; 사용기한 D-13 </span></div>
                                                                        </div>
    
                                                                        <div class="row">
                                                                            <div class="col-lg-4 col-md-4 label section_title"> 리프레시 휴가 </div>
                                                                            <div class="col-lg-8 col-md-8 section_info"> D-1074 </div>
                                                                        </div>
                                                                    </div>
                                                                    
                                                                    <div class="one_section">
                                                                        <h5 class="section_main_title">휴가사용내역</h5>
                                                                        <div class="row">
                                                                            <div class="info-box text-center" style="padding-top: 3rem;">
                                                                                <div class="row">
                                                                                    <div class="col-lg-4 col-md-4 label section_title"> [정기 연차 휴가] </div>
                                                                                    <div class="col-lg-8 col-md-8 section_info"> 사용일 : 2022-01-06 </div>
                                                                                </div>
                                                                                <div class="row">
                                                                                    <div class="col-lg-4 col-md-4 label section_title"> [정기 연차 휴가] </div>
                                                                                    <div class="col-lg-8 col-md-8 section_info"> 사용일 : 2022-02-21 </div>
                                                                                </div>
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
                                                                        <h5 class="section_main_title"> 필요 문서</h5>
                                                                        <div class="row">
                                                                            <div class="col-lg-6 col-md-4 label section_title"> 주민등록등본 
                                                                                <a href="https://www.gov.kr/main?a=AA020InfoCappViewApp&CappBizCD=13100000015&HighCtgCD=A01010001&Mcode=10200" target="_blank">[링크]</a>
                                                                            </div>
                                                                            <div class="col-lg-6 col-md-8 section_info">
                                                                                <a class="a_tag_black" href="/helloffice/workflow/wfForm">제출하기</a>
                                                                            </div>
                                                                        </div>
                                                                        
                                                                        <div class="row">
                                                                            <div class="col-lg-6 col-md-4 label section_title"> 가족관계증명서 
                                                                                <a href="https://efamily.scourt.go.kr/index.jsp" target="_blank" class="">[링크]</a>
                                                                            </div>
                                                                            <div class="col-lg-6 col-md-8 section_info">
                                                                                
                                                                                <a class="a_tag_black" href="/helloffice/workflow/wfForm">제출하기</a>
                                                                            </div>
                                                                        </div>
                                                    
                                                                        <div class="row">
                                                                            <div class="col-lg-6 col-md-4 label section_title"> 건강보험자격득실확인서 
                                                                                <a href="https://www.nhis.or.kr/nhis/index.do" target="_blank" class="">[링크]</a>
                                                                            </div>
                                                                            <div class="col-lg-6 col-md-8 section_info">
                                                                                <a class="a_tag_black" href="/helloffice/workflow/wfForm">제출하기</a>
                                                                            </div>
                                                                        </div>
                                                                        
                                                                        <c:if test="${myCareer ne null}">
                                                                            <div class="row">
                                                                                <div class="col-lg-6 col-md-4 label section_title"> ${myCareer.compName} 의 경력증명서 </div>
                                                                                <div class="col-lg-6 col-md-8 section_info" type="button"> <a class="a_tag_black" href="/helloffice/workflow/wfForm">제출하기</a> </div>
                                                                            </div>
                                                                        </c:if>
                                                                        
                                                                        <c:if test="${myAca ne null}">
                                                                            <div class="row">
                                                                                <div class="col-lg-6 col-md-4 label section_title"> ${myAca.acaName} 의 학위증명서 </div>
                                                                                <div class="col-lg-6 col-md-8 section_info" type="button"> <a class="a_tag_black" href="/helloffice/workflow/wfForm">제출하기</a> </div>
                                                                            </div>
                                                                        </c:if>
                                                                    </div>
                                                                    
                                                                    <div class="one_section">
                                                                        <h5 class="section_main_title">증명서 발급</h5>
                                                                        <div class="row">
                                                                            <div class="col-lg-4 col-md-4 label section_title">재직증명서</div>
                                                                            <div class="col-lg-8 col-md-8 p_0">
                                                                                <span class="col-lg-8 col-md-8 section_sub_info">재직을 증명하는 문서입니다.</span>
                                                                                <a class="a_tag_black" href="/helloffice/workflow/wfForm"> &nbsp; 신청하기</a>
                                                                            </div>
                                                                        </div>
    
                                                                        <div class="row">
                                                                            <div class="col-lg-4 col-md-4 label section_title">경력증명서</div>
                                                                            <div class="col-lg-8 col-md-8 p_0">
                                                                                <span class="col-lg-8 col-md-8 section_sub_info">경력을 증명하는 문서입니다.</span>
                                                                                <a class="a_tag_black" href="/helloffice/workflow/wfForm"> &nbsp; 신청하기</a>
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

    function goCareerFirstPage(){
        window.location.href="/helloffice/hr/myPage/createCareerPage";
    }

    function goAcademicPage(empNo){
        window.location.href="/helloffice/hr/myPage/editAcaPage/"+empNo;
    }    

    function goAcademicFirstPage(){
        window.location.href="/helloffice/hr/myPage/createAcaPage";
    }    

    </script>
    <%@ include file = "../common/footer.jsp" %>
</body>
</html>