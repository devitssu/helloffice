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
            <!-- 페이지 내용 -->
			<div class="body">
				<section class="section">
					<div class="row">
						<div class="col-lg-12">
							<div class="card card_radius">
                                <div class="container-fluid">
                                    <div class="navbar_content_l">
                                        <button onclick="history.back()" class="button_none_deco">
                                            <h1 style="padding: 1.5rem 0rem"><i class="bi bi-arrow-left"></i></h1>
                                        </button>
                                    </div>
                                </div>
								<div class="invite_wrapper">
                                    <div style="margin: auto; width: 55vw;">
                                        <div class="invite_header">
                                            <div class="modal_head_title"> 구성원 추가 </div>
                                            <div class="modal_head_subtitle"> 구성원 추가하기 위한 메일을 보내세요. </div>
                                        </div>
                                        <div class="invite_contents">
                                            <div class="title_mid"> 필수정보 </div>
                                            <div class="col-sm-12">
												<form method="post" action="/mail/mailSend">
													<div class="">
														<div class="form-floating mb-3">
															<input type="text" class="form-control" id="name" name="name" placeholder="이름을 입력하세요">
															<label for="empName"> 이름을 입력하세요 </label>
														</div>
														<div class="form-floating mb-3">
															<input type="email" class="form-control" id="email" name="email" placeholder="Email" name="receiveMail">
															<label for="email">email@example.com</label>
														</div>
														<div class="form-floating mb-3">
															<input type="date" class="form-control" id="entryDate" name="entryDate" placeholder="입사일을 설정해주세요">
															<label for="entryDate">  입사일을 설정해주세요 </label>
														</div>
														<div class="form-floating mb-3">
															<input type="text" class="form-control" id="empPosition" name="empPosition" placeholder=" 역할(직무) ">
															<label for="empPosition"> 역할(직무) </label>
														</div>
														<div class="form-floating mb-3">
															<select class="form-control" id="depName" name="depName" placeholder=" 부서 ">
																<option> 조직을 선택해주세요 </option>
																<option value="1">대표</option>
																<option value="2">마케팅</option>
																<option value="3">영업팀</option>
																<option value="4">디자인팀</option>
															</select>
															<label for="depName"> 조직 </label>
														</div>
														<div class="clearfix"></div>
														<div class="styled-input">
															<textarea name="message" placeholder="메세지를 입력하세요"></textarea>
														</div>
													</div>
													<div class="d-grid gap-2 mt-3 mb-5">
                                                        <a href="teamList" class="btn btn-primary" type="submit">전송하기</a>
                                                    </div>
                                                </form>
                                            </div> <span style="color:red;">${message}</span>
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