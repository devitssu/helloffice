<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../common/head.jsp" %>

<head>
	<link rel="stylesheet" href="${root}/resources/assets/css/hrCss/hrCss.css" type="text/css">
    <link rel="stylesheet" href="${root}/resources/assets/css/workCss/workMain.css" type="text/css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert"></script>
    <script src="https://cdn.jsdelivr.net/npm/clipboard@2.0.10/dist/clipboard.min.js"></script>

</head>
</head>

<style>
	.insanote_wrapper{
        padding: 1rem 0rem;
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
						<div class="col-lg-4">
							<div class="card card_radius" style="height:95%">
								<div class="card_header text-center">
                                    <div class="margin-div">
                                        <div class="section profile outer-wrapper">
                                            <div class="card-body profile-card pt-4 d-flex flex-column align-items-center">
                                                <img src="../../resources/assets/img/profile/user_empty.png" alt="" class="rounded-circle mb-3">
                                                    <div class="profile_name">${memberInfo.empName}</div>
                                                    <div class="profile_depName">
                                                        <span class="profile_depName">${memberInfo.depName}</span>
                                                        <span class="profile_empPosition">${memberInfo.empPosition}</span>
                                                    </div>
                                                <div class="social-links mt-2">
                                                    <!-- a태그 클릭하면 각 정보들 클립보드에 복사하는 스크립트 작업 해야됨 -->
                                                    <span id="phone_icon" class="profile_icon" data-bs-toggle="tooltip" data-bs-placement="bottom" title="" data-clipboard-text="${memberInfo.phone}" data-bs-original-title=${memberInfo.phone}><i class="bi bi-telephone"></i></span> &nbsp;
                                                    <span id="email_icon" class="profile_icon" data-bs-toggle="tooltip" data-bs-placement="bottom" title="" data-clipboard-text="${memberInfo.email}" data-bs-original-title=${memberInfo.email}><i class="bi bi-envelope"></i></span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
								</div>
								<div class="card-body">
									<div class="margin-div">
                                        <div>
                                            <div class="align-items-start" style="padding-top: 1rem;">
                                                <div class="nav flex-column nav-pills me-3" style="display: block;" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                                                    <button class="nav-link active" id="v-pills-home-tab" data-bs-toggle="pill" data-bs-target="#v-pills-home" type="button" role="tab" aria-controls="v-pills-home" aria-selected="true">
                                                        <div>
                                                            <div class="bi bi-person-fill" style="display:inline-block; padding-right: 5px;"></div>
                                                            <div style="display:inline-block"><span>인사정보</span></div>  
                                                        </div> 
                                                    </button>
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
                                                    <c:if test="${loginEmp.adminLevel gt 1}">
                                                        <button class="nav-link" id="v-pills-hrNote-tab" data-bs-toggle="pill" data-bs-target="#v-pills-hrNote" type="button" role="tab" aria-controls="v-pills-hrNote" aria-selected="false">
                                                            <div>
                                                                <div class="bi bi-clipboard-check" style="display:inline-block; padding-right: 5px;"></div>
                                                                <div style="display:inline-block"><span>인사노트</span></div>  
                                                            </div> 
                                                        </button>
                                                    </c:if>
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
                                                                                <a onclick="goInsaPage(${memberInfo.empNo})"> <i class="bx bxs-pencil float_r" style="color: lightslategray;"></i></a> 
                                                                            </c:if>
                                                                        </h5>
                                                                        <div class="row">
                                                                            <div class="col-lg-4 col-md-4 label section_title"> 조직 </div>
                                                                            <div class="col-lg-8 col-md-8 section_info"> ${memberInfo.depName} </div>
                                                                        </div>

                                                                        <div class="row">
                                                                            <div class="col-lg-4 col-md-4 label section_title"> 직급 </div>
                                                                            <div class="col-lg-8 col-md-8 section_info"> ${memberInfo.empRank} </div>
                                                                        </div>

                                                                        <c:if test="${loginEmp.adminLevel gt 1}">
                                                                            <div class="row">
                                                                                <div class="col-lg-4 col-md-4 label section_title"> 관리레벨 </div>
                                                                                <div class="col-lg-8 col-md-8 section_info"> ${memberInfo.adminLevel} </div>
                                                                            </div>
                                                                        </c:if>
                                                    
                                                                        <div class="row">
                                                                            <div class="col-lg-4 col-md-4 label section_title">역할</div>
                                                                            <div class="col-lg-8 col-md-8 section_info"> ${memberInfo.empPosition} </div>
                                                                        </div>
                                                    
                                                                        <div class="row">
                                                                            <div class="col-lg-4 col-md-4 label section_title">입사일</div>
                                                                            <div class="col-lg-8 col-md-8 section_info"> ${memberInfo.entryDate}</div>
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
                                                                                        <h2 class="modal-title" id="exampleModalLabel" style="margin-bottom: 32px;"> ${memberInfo.empName }님의 근무유형</h2>
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
                                                                                                                ${memberInfo.entryDate} &nbsp; ~
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
                                                                            <c:if test="${loginEmp.adminLevel gt 1}">
                                                                                <a onclick="goBasicPage(${memberInfo.empNo})"> <i class="bx bxs-pencil float_r" style="color: lightslategray;"></i></a> 
                                                                            </c:if>
                                                                        </h5>
                                                                        <div class="row">
                                                                            <div class="col-lg-4 col-md-4 label section_title">이메일</div>
                                                                            <div class="col-lg-8 col-md-8 section_info">${memberInfo.email}</div>
                                                                        </div>
                                                    
                                                                        <div class="row">
                                                                            <div class="col-lg-4 col-md-4 label section_title">이름</div>
                                                                            <div class="col-lg-8 col-md-8 section_info">${memberInfo.empName}</div>
                                                                        </div>
                                                    
                                                                        <div class="row">
                                                                            <div class="col-lg-4 col-md-4 label section_title">내 소개</div>
                                                                            <div class="col-lg-8 col-md-8 section_info"> ${memberInfo.empInfo} </div>
                                                                        </div>
    
                                                                        <div class="row">
                                                                            <div class="col-lg-4 col-md-4 label section_title">휴대전화</div>
                                                                            <div class="col-lg-8 col-md-8 section_info"> ${memberInfo.phone} </div>
                                                                        </div>
    
                                                                        <div class="row">
                                                                            <div class="col-lg-4 col-md-4 label section_title">주민등록번호</div>
                                                                            <div class="col-lg-8 col-md-8 section_info">${memberInfo.resiNo}</div>
                                                                        </div>
    
                                                                        <div class="row">
                                                                            <div class="col-lg-4 col-md-4 label section_title">집 주소</div>
                                                                            <div class="col-lg-8 col-md-8 section_info"> ${memberInfo.address} </div>
                                                                        </div>
    
                                                                        <div class="row">
                                                                            <div class="col-lg-4 col-md-4 label section_title">급여계좌</div>
                                                                            <div class="col-lg-8 col-md-8 section_info"> ${memberInfo.bank} &nbsp; ${memberInfo.bankAcc}</div>
                                                                        </div>
        
                                                                            <!-- <div class="row">
                                                                                <div class="col-lg-4 col-md-4 label section_title">건강보험 피부양자 수</div>
                                                                                <div class="col-lg-8 col-md-8 section_info"> ${memberInfo.dependentNum} 명 </div>
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
                                                                            <div class="col-lg-8 col-md-8 section_info"> ${memberInfo.dependentNum} 명</div>
                                                                        </div>
    
                                                                        <div class="row">
                                                                            <div class="col-lg-4 col-md-4 label section_title">4대보험 제외여부</div>
                                                                            <div class="col-lg-8 col-md-8 section_info"> 4대보험 제외대상자가 아닙니다.</div>
                                                                        </div>
                                                                    </div>
    
                                                                    <div class="one_section">
                                                                        <h5 class="section_main_title">경력</h5>
                                                                        <c:if test="${memberInfo.compName ne null}">
                                                                            <div class="row">
                                                                                <div class="col-lg-4 col-md-4 label section_title">${memberInfo.crJobType}</div>
                                                                                <div class="col-lg-8 col-md-8 p_0">
                                                                                    <div class="col-lg-8 col-md-8 section_info">${memberInfo.compName} &nbsp; ${memberInfo.crPosition} &nbsp; ${memberInfo.crRank}</div>
                                                                                    <div class="col-lg-8 col-md-8 section_sub_info">${memberInfo.crEntryDate} ~ ${memberInfo.crResignDate}</div>
                                                                                </div>
                                                                            </div>
                                                                        </c:if>
                                                                        <c:if test="${memberInfo.compName eq null}">
                                                                            <div class="col-lg-12 section_title">경력 정보가 아직 등록되지 않았습니다.</div>
                                                                        </c:if>
                                                                    </div>
                                                                        
                                                                    <div class="one_section">
                                                                        <h5 class="section_main_title">학력</h5>
                                                                        <c:if test="${memberInfo.acaName ne null}">
                                                                            <div class="row">
                                                                                <div class="col-lg-4 col-md-4 label section_title">${memberInfo.acaType}</div>
                                                                                <div class="col-lg-8 col-md-8 p_0">
                                                                                    <div class="col-lg-8 col-md-8 section_info">${memberInfo.acaName} ${memberInfo.major} ${memberInfo.graduState}</div>
                                                                                    <div class="col-lg-8 col-md-8 section_sub_info">${memberInfo.enrollDate} ~ ${memberInfo.graduDate}</div>
                                                                                </div>
                                                                            </div>
                                                                        </c:if>
                                                                        <c:if test="${memberInfo.acaName eq null}">
                                                                            <div class="col-lg-12 section_title">학력 정보가 아직 등록되지 않았습니다.</div>
                                                                        </c:if>
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
                                                                            <div class="col-lg-8 col-md-8 section_info"> 17일 </div>
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
                                                                            <div class="col-lg-8 col-md-8 section_info"> D-1074</div>
                                                                        </div>
                                                                    </div>
                                                                    
                                                                    <div class="one_section">
                                                                        <h5 class="section_main_title">휴가사용내역</h5>
                                                                        <div class="row text-center">
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
                                                                        <form action="" method="post">
                                                                            <input id="noteWriter" name="noteWriter" value="${loginEmp.empName}" hidden></input>
                                                                            <input id="empNo" name="empNo" value="${empNo}" hidden></input>
                                                                            <p>
                                                                                <textarea id="noteContents" name="noteContents" placeholder="직원에 대한 평가나 기록을 남겨두세요." rows="4" class="insa_textarea"></textarea>
                                                                            </p>
                                                                            <div class="align-items-center" style="display: flex; padding: 0rem 0rem 1rem;">
                                                                                <input type="submit" value="저장하기" class="btn btn-outline-secondary" style="margin: auto;"></input>
                                                                            </div>
                                                                        </form>
                                                                        <div class="">
                                                                            <div class="">
                                                                                <div id="note_area">
                                                                                    <c:forEach items="${insanote}" var="insa">
                                                                                        <div class="col-12 insanote_wrapper">
                                                                                            <label for="inputNanme4" class="form-label">${insa.noteWriter}</label> &nbsp; <span class="section_sub_info">${insa.noteDate}</span>
                                                                                            <span id="noteNo" hidden>${insa.noteNo}</span><span id="empNo" hidden>${empNo}</span>
                                                                                            <span class="float_r"> 
                                                                                                <c:if test="${loginEmp.empName eq insa.noteWriter}">
                                                                                                    <button id="insanote_del" class="badge border-danger border-1 text-danger"> 삭제 </button> 
                                                                                                </c:if>
                                                                                            </span>
                                                                                            <div class="form-control" id="inputNanme4">
                                                                                                ${insa.noteContents}
                                                                                            </div>
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
        swal("${mi.phone}", "클립보드에 전화번호가 복사되었습니다!", {
            button: false,
            timer: 1500,
        });
        e.clearSelection();
    })

    $("#email_icon").val();
    var clipboard = new ClipboardJS('#email_icon');
    clipboard.on('success', function(e){
        swal("${mi.email}", "클립보드에 이메일이 복사되었습니다!", {
            button: false,
            timer: 1500,
        });
        e.clearSelection();
    })

    // 인사 페이지로 이동하기
    function goInsaPage(empNo){
        window.location.href="/helloffice/hr/teamList/memberPage/editInsaPage/"+empNo;
    }

    function goBasicPage(empNo){
        window.location.href="/helloffice/hr/teamList/memberPage/editBasicPage/"+empNo;
    }    

    function goCareerPage(empNo){
        window.location.href="/helloffice/hr/teamList/memberPage/editCareerPage/"+empNo;
    }

    function goAcademicPage(empNo){
        window.location.href="/helloffice/hr/teamList/memberPage/editAcademicPage/"+empNo;
    }    

    
    


    </script>
    <%@ include file = "../common/footer.jsp" %>
</body>
</html>