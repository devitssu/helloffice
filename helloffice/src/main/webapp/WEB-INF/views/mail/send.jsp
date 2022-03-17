<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../common/head.jsp" %>

<head>
	<link rel="stylesheet" href="${root}/resources/assets/css/hrCss/hrCss.css" type="text/css">
	<script src="https://cdn.ckeditor.com/4.8.0/full-all/ckeditor.js"></script>
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
									<h1 style="padding-bottom: 0.5rem">초대</h1>
									<nav>
										<ol class="breadcrumb">
											<li class="breadcrumb-item"><a href="/helloffice/hr/teamList">구성원</a></li>
											<li class="breadcrumb-item"><a href="/helloffice/hr/teamReport">팀리포트</a></li>
											<li class="breadcrumb-item active">초대</li>
											<!-- <li class="breadcrumb-item"><a href="contract">계약</a></li> -->
										</ol>
									</nav>
								</div>
								<div class="navbar_content_r">
									<!-- <button type="button" class="btn btn-outline-secondary">
										<a href="sendingInvite" class="a_tag_black"><i class="bi bi-plus-circle"></i> 구성원 추가하기</a>
									</button> -->
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
            <!-- 페이지 내용 -->
			<div class="body">
				<section class="section">
					<div class="row">
						<div class="col-lg-12">
							<div class="card card_radius">
                                <!-- <div class="container-fluid">
                                    <div class="navbar_content_l">
                                        <button onclick="history.back()" class="button_none_deco">
                                            <h1 style="padding: 1.5rem 0rem"><i class="bi bi-arrow-left"></i></h1>
                                        </button>
                                    </div>
                                </div> -->
								<div class="invite_wrapper">
                                    <div style="margin: auto; width: 55vw; padding-top: 3rem;">
                                        <div class="invite_header">
                                            <div class="modal_head_title"> 구성원 추가 </div>
                                            <div class="modal_head_subtitle"> 구성원 추가하기 위한 메일을 보내세요. </div>
                                        </div>
                                        <div class="invite_contents">
                                            <div class="title_mid"> 필수정보 </div>
                                            <div class="col-sm-12">
												<form method="post" action="./doSend">
													<div class="row">
														<div class="col-md-12">
															<div class="form-floating mb-3">
																<input type="text" class="form-control" id="empName" name="empName" placeholder="초대할 사원의 이름을 입력하세요">
																<label for="empName"> 이름을 입력하세요 </label>
															</div>
														</div>
														<div class="col-md-12">
															<div class="form-floating mb-3">
																<input type="email" class="form-control" id="email" name="email" placeholder="Email">
																<label for="email">email@example.com</label>
															</div>
														</div>
														<div class="col-md-12">
															<div class="form-floating mb-3">
																<input type="text" class="form-control" id="empPosition" name="empPosition" placeholder=" 역할(직무) ">
																<label for="empPosition"> 역할(직무) </label>
															</div>
														</div>
														<div class="col-md-6">
															<div class="form-floating mb-3">
																<select id="empRank" name="empRank" class="form-select" aria-label="Default select example">
																	<option value="" selected>직급</option>
																	<option value="인턴">인턴</option>
																	<option value="사원">사원</option>
																	<option value="대리">대리</option>
																	<option value="과장">과장</option>
																	<option value="부장">부장</option>
																	<option value="대표">대표</option>
																</select>
																<label for="empRank">직급</label>
															</div>
														</div>
														<div class="col-md-6">
															<div class="form-floating mb-3">
																<select id="adminLevel" name="adminLevel" class="form-select" aria-label="Default select example">
																	<option value="" selected>관리레벨</option>
																	<option value="1"> 1 : [인턴, 사원, 대리] </option>
																	<option value="2"> 2 : [과장, 부장] </option>
																	<option value="3"> 3 : [대표] </option>
																</select>
																<label for="empRank"> 관리레벨 </label>
															</div>
														</div>
														
														<!-- <div class="form-floating mb-3">
															<input type="date" class="form-control" id="entryDate" name="entryDate" placeholder="입사일을 설정해주세요">
															<label for="entryDate">  입사일을 설정해주세요 </label>
														</div> -->
														<div class="col-md-6">
															<div class="form-floating mb-3">
																<select class="form-select" id="depName" name="depName" placeholder=" 부서 ">
																	<c:forEach items="${deptList}" var="dl">
																		<option value="${dl.depName}">${dl.depName}  [부서 번호 : ${dl.depNo}]</option>
																	</c:forEach>
																</select>
																<label for="depName"> 부서 </label>
															</div>
														</div>
														<div class="col-md-6">
															<div class="form-floating mb-3">
																<select class="form-select" id="depNo" name="depNo" placeholder=" 부서번호 ">
																	<c:forEach items="${deptList}" var="dl">
																		<option value="${dl.depNo}">${dl.depNo}</option>
																	</c:forEach>
																</select>
																<label for="depNo"> <i class="ri-alert-fill"></i> 선택한 부서의 부서번호를 선택해주세요. </label>
															</div>
														</div>
														<div class="col-md-12" style="">
															<textarea class="tinymce-editor" name="body" value=""></textarea>
														</div>

													</div>
                                                    <div class="d-grid gap-2 mt-3 mb-3">
                                                        <button class="btn btn-primary" type="submit">전송하기</button>
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