<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/head.jsp" %>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="${root}/resources/assets/css/workflowCss/wfForm.css" type="text/css">
	<link rel="stylesheet" href="${root}/resources/assets/css/workflowCss/inputAni.css" type="text/css">
</head>

<body>

	<%@ include file="/WEB-INF/views/common/header.jsp" %>

	<main id="main" class="main">

	<%@ include file="/WEB-INF/views/workflow/wfNav.jsp" %>
	<div class="d-flex dd">
		<div class="form_container col-10 p-4">
			<div class="card card_cus" id="makeWf" data-bs-toggle="modal" data-bs-target="#makeWorkflow">
				<div class="card-body p-0 d-flex align-items-center justify-content-center">
					<div class="text-muted"><i class="bi-plus-lg"></i>&nbsp;워크플로우 만들기</div>
				</div>
			</div>

			<c:forEach items="${wfFormList}" var="f">
			<div class="card card_cus cc_0 group px-3">
				<div class="card-body">
					<h5 class="card-title">${f.formName}</h5>
					<h6 class="mb-2 text-muted">${f.tagName}</h6>
					<a class="mt-4 btn btn-sm btn-primary" href="#">작성하기</a>
					<a class="mt-4 btn btn-sm btn-light border border-light" href="#">작성요청</a>
				</div>
				<div class="hide border border-light rounded  justify-content-center align-items-center shadow bg-body">
					<div class="btn form_edit" data-bs-toggle="tooltip" data-bs-placement="top" title="수정하기"><i class="bi-pencil-fill"></i></div>
					<div class="btn del_form_select" data-bs-toggle="tooltip" data-bs-placement="top" title="삭제"><i class="bi-trash-fill"></i></div>
				</div>
			</div>
			</c:forEach>


			<%--
			<div class="card card_cus">
				<div class="card-body">
					<h5 class="card-title">비품 신청</h5>
					<h6 class=" mb-2 text-muted">구매 신청</h6>
					<a class="btn btn-sm btn-primary" href="#">작성하기</a>
				</div>
			</div> --%>

		</div>

		<div class="col-2 shell_cardTag">
			<div class="card card_tag">
				<div class="card-body">
					<div><a class="btn btn-l btn-primary mt-3 mb-3" data-bs-toggle="modal" data-bs-target="#tagSetting" >태그 관리&nbsp; <i class="bi-gear"></i></a></div>
					<div><a class="btn btn-sm btn-dark rounded-pill mb-2 seaFbyTag" href="#" value="0"><i class="bi-inboxes-fill"></i>&nbsp;모두 보기</a></div>
					<c:forEach items="${tagList}" var="t">
						<div><a class="btn btn-sm btn-light rounded-pill mb-2 seaFbyTag" href="#" value="${t.tagNo}"># ${t.tagName}</a></div>
					</c:forEach>
				</div>

			</div>

		</div>
	</div>
	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

	<!-- tagSetting Modal -->
	<div class="modal fade" id="tagSetting" >
		<div class="modal-dialog modal-dialog-scrollable">
			<div class="modal-content pt-3 tag_modal">
				<div class="modal-body">
					<h4 class="tag_title">태그 관리</h4>
					<div class="mb-5 mt-3 text-muted tag_subtitle">태그별로 사용 그룹을 지정하여 조직 역할 등 용도에 맞게 양식을 관리해보세요.</div>
					<div class="mt-5">
						<%-- 태그 목록 --%>
						<div class="d-flex justify-content-between mb-4">
							<div class="col-9">태그 목록</div>
							<div class="col-auto">
								<%-- <a class="btn btn-sm btn-light" data-bs-toggle="modal" data-bs-target="#tagAdd"> --%>
								<a class="btn btn-sm btn-light" id="tagAddSw">
									<i class="bi-plus-lg"></i><small>&nbsp;태그 추가</small>
								</a>
							</div>
						</div>

						<div class="shell_tagTable">
							<%-- 태그 테이블 --%>
							<div class="tagTable">
								<table class="table table-hover">
									<thead>
										<tr class="text-center">
											<th scope="col">태그</th>
											<th scope="col">이름 수정</th>
											<th scope="col">삭제하기</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${tagList}" var="t">
											<tr class="text-center" style="vertical-align: middle;">
												<td>${t.tagName}</td>
												<td><a class="btn btn-sm upd_tag"><i class="bx bxs-pencil"></i></a></td>
												<td><a class="btn btn-sm del_tag"><i class="bx bxs-trash"></i></a></td>
											</tr>
										</c:forEach>
									</tbody>

								</table>
							</div>
						</div>


					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div><!-- End tagSetting Modal-->

	<!-- tagAdd Modal -->
	<%-- <div class="modal" id="tagAdd" data-bs-backdrop="static">
		<div class="modal-dialog modal-dialog-centered modal-sm">
			<div class="modal-content pt-3 tag_modal">
				<div class="modal-body">
					<h5 class="tag_title">태그 추가</h5>
					<div class="mb-3 mt-3">
						<input type="text" class="form-control" placeholder="태그 이름">
						<div class="mt-4 d-flex justify-content-end">
							<a href="#" class="btn btn-sm btn-light" data-bs-dismiss="modal" >닫기</a>
							<a href="#" class="btn btn-sm btn-primary">저장하기</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div> --%>
	<!-- End tagAdd Modal -->

	<!-- makeWorkflow Modal -->
	<div class="modal fade" id="makeWorkflow" tabindex="-1" data-bs-backdrop="static">
		<div class="modal-dialog modal-xl modal-dialog-scrollable" id="mwfDialog">
			<div class="modal-content px-3 my95size">
				<div class="modal-header d-flex">
					<div class="col-8"><h6 class="modal-title"><span class="badge bg-light text-black-50">양식 추가</span></h6></div>
					<div class="col-auto d-flex justify-content-end align-items-center ">
						<span class="">태그: </span>&nbsp;
						<div class="" id="selectTag">
							<select class="form-select" aria-label="Default select example" tabindex="-1">
								<c:forEach items="${tagList}" var="t">
									<c:choose>
										<c:when test="${t.tagName eq '미분류'}">
											<option value="${t.tagNo}" selected>${t.tagName}</option>
										</c:when>
										<c:otherwise>
											<option value="${t.tagNo}">${t.tagName}</option>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</select>
						</div>&nbsp;&nbsp;&nbsp;
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" tabindex="-1"></button>
					</div>
				</div>
				<div class="modal-body d-flex justify-content-between">
					<div class="col-8">
						<div class="mycontainer" id="formIn">
							<div class="">
								<a class="btn btn-light" id="title_cus" data-bs-toggle="dropdown" href="#" tabindex="-1">
									<div>문서 이름 입력 &nbsp;<i class="bi bi-exclamation-circle-fill ex_cus" ></i>
									</div>
								</a>
								<ul class="dropdown-menu">
									<li>
										<div class="dropdown-item d-flex justify-content-between">
											<input type="text" class="form-control" placeholder="문서 이름 입력" id="formName"> &nbsp;
											<button type="submit" class="btn btn-primary" id="titleSubmit">확인</button>
										</div>
									</li>
								</ul>
							</div>
							<div class="text-muted mb-5">
								<span class="edit_ex">문서에 대한 설명을 입력해주세요.</span> <a class="btn btn-sm" id="editEx">편집</a>
							</div>
							<%-- 내용양식 --%>
							<div class="mb-5" id="wofCon">
								<textarea class="tinymce-editor my_editor">
									<p></p>
								</textarea>
								<div class="" id="">
									<input class="form-control" multiple type="file">
								</div>
							</div>
							<%-- 첨부파일 --%>
							<div class="hide mb-5 f_group" id="wofFile">
								<input class="form-control" multiple type="file">
								<div class="hide border border-light rounded  justify-content-center align-items-center shadow bg-body">
									<div class="btn req_onoff" data-bs-toggle="tooltip" data-bs-placement="top" title="필수 입력"><i class="bi-patch-check-fill"></i></div>
								</div>
							</div>
							<%-- 참조문서 --%>
							<div class="search-bar hide mb-5" id="wofRef">
								<form class="search-form d-flex align-items-center" method="POST" action="#">
									<input type="text" class="form-control" placeholder="참조 문서 검색" title="Enter search keyword">
									<button type="submit" class="btn btn-primary" title="Search"><i class="bi bi-search"></i></button>
								</form>
							</div><!-- End Search Bar -->

							<%-- 다른 커스텀 양식 --%>
							<%-- <div class='group'>
								<input type='text' class="label_name" required>
								<span class='highlight'></span>
								<span class='bar'></span>
								<label>문자 입력 레이블<i class="bi-stars hide"></i></label>
								<div class="hide border border-light rounded  justify-content-center align-items-center shadow bg-body">
									<div class="btn req_onoff" data-bs-toggle="tooltip" data-bs-placement="top" title="필수 입력"><i class="bi-patch-check-fill"></i></div>
									<div class="btn del_select" data-bs-toggle="tooltip" data-bs-placement="top" title="삭제"><i class="bi-trash-fill"></i></div>
								</div>
							</div> --%>


							<%-- 선택양식 --%>
							<%-- <div class="group card">
								<div class="card-header">
									<input type="text" class="label_name" required>
									<span class="highlight"></span>
									<span class="bar"></span>
									<label>선택 입력 레이블<i class="bi-stars hide"></i></label>
								</div>
								<div class="card-body">
									<div class="d-flex">
										<input type="text" class="form-control my_op" placeholder="옵션 이름">
										<a class="btn btn-sm delOp"><i class="bi-x-lg"></i></a>
									</div>
								</div>
								<div class="card-footer">
									<a class="btn btn-sm add_option"><i class="bi-plus-lg"></i>&nbsp;옵션추가하기</a>
								</div>
								<div class="hide border border-light rounded  justify-content-center align-items-center shadow bg-body">
									<div class="btn req_onoff" data-bs-toggle="tooltip" data-bs-placement="top" title="필수 입력"><i class="bi-patch-check-fill"></i></div>
									<div class="btn del_select" data-bs-toggle="tooltip" data-bs-placement="top" title="삭제"><i class="bi-trash-fill"></i></div>
								</div>
							</div> --%>


						</div>

					</div>
					<div class="col-3 p-4 me-5 ms-3 mt-3 right_step h-100">
						<div class="mb-4">승인·참조 대상</div>
						<div class="stepForm">
							<div class="stepShell">
								<div class="card p-2 mb-3">
									<div class="p-2 d-flex justify-content-between align-items-center">
										<div class="steps">1단계</div>
										<button class="btn del_step"><i class="bi-x-lg"></i></button>
									</div>
									<div class="person_list">
										<div class="hide my_boss justify-content-between align-items-center p-2">
											<div class="">
												<i class="bi-person-circle"></i>&nbsp; 조직장
											</div>
											<button class="btn del_my_boss"><i class="bi-x-lg"></i></button>
										</div>
										<div class="hide my_rep justify-content-between align-items-center p-2">
											<div class="">
												<i class="ri-vip-crown-2-fill"></i>&nbsp; 관리자
											</div>
											<button class="btn del_rep"><i class="bi-x-lg"></i></button>
										</div>
									</div>
									<button class="btn ps-1 d-flex"" data-bs-toggle="dropdown">
										<div class="col-2 me-2">
											<i class="bi bi-plus-circle"></i>
										</div>
										<div class="col-auto"><small>대상 추가하기</small></div>
									</button>
									<ul class="dropdown-menu">
										<li class="d-flex justify-content-between align-items-center" data-bs-toggle="tooltip" data-bs-placement="left" title="작성자의 조직장에게 승인을 요청합니다.">
											<i class="bi-person-circle ms-3"></i>
											<div class="dropdown-item" href="#" >
												조직장 승인</div>
											<div class="form-check form-switch">
												<input class="form-check-input onoff_my_boss" type="checkbox">
											</div>
										</li>
										<li class="d-flex justify-content-between align-items-center" data-bs-toggle="tooltip" data-bs-placement="left" title="승인권한을 가진 관리자에게 승인요청을 보냅니다.">
											<i class="ri-vip-crown-2-fill ms-3"></i>
											<div class="dropdown-item" href="#">
												관리자 승인</div>
											<div class="form-check form-switch">
												<input class="form-check-input onoff_rep" type="checkbox">
											</div>
										</li>
										<li class="d-flex justify-content-between align-items-center"  data-bs-toggle="tooltip" data-bs-placement="left" title="특정 구성원을 승인 대상으로 추가합니다.">
											<a class="dropdown-item openSecond" href="# " id="">승인 대상 추가</a>
										</li>
										<li class="d-flex justify-content-between align-items-center" data-bs-toggle="tooltip" data-bs-placement="left" title="이 단계부터 문서를 참조할 대상을 추가합니다.">
											<a class="dropdown-item openSecond" href="#">참조 대상 추가</a>
										</li>
									</ul>
								</div>
							</div>	<!--stepShell end-->
						</div>
						<div class="btn btn-secondary" id="addStep">단계 추가하기</div>

					</div><%-- 오른쪽 승인,참조대상 감싸는 div end --%>

				</div>

				<div class="modal-footer d-flex justify-content-between">
					<div class="col-7">
						<button type="button" class="btn btn-info dropdown-toggle" data-bs-toggle="dropdown"><i class="bi-plus-lg"></i>&nbsp;커스텀 입력</button>
						<ul class="dropdown-menu">
							<li class="d-flex justify-content-between align-items-center">
								<div class="dropdown-item" href="#">내용</div>
								<div class="form-check form-switch">
									<input class="form-check-input" type="checkbox" id="onOffCon" checked>
								</div>
							</li>
							<li class="d-flex justify-content-between align-items-center">
								<div class="dropdown-item" href="#">첨부 파일</div>
								<div class="form-check form-switch">
									<input class="form-check-input" type="checkbox" id="onOffFile" >
								</div>
							</li>
							<li class="d-flex justify-content-between align-items-center">
								<div class="dropdown-item" href="#">참조 문서</div>
								<div class="form-check form-switch">
									<input class="form-check-input" type="checkbox" id="onOffRef">
								</div>
							</li>
							<li id="addChar"><a class="dropdown-item" href="#">문자</a></li>
							<li id="addNum"><a class="dropdown-item" href="#">숫자</a></li>
							<li id="addDate"><a class="dropdown-item" href="#">날짜</a></li>
							<li id="addRadio"><a class="dropdown-item" href="#">선택</a></li>
							<li id="addCheckbox"><a class="dropdown-item" href="#">복수 선택</a></li>
						</ul>
					</div>
					<div class="col-auto">
						<button type="button" class="btn btn-secondary" id="closeForm" data-bs-dismiss="modal">닫기</button>
						<button type="button" class="btn btn-primary" id="saveForm"><i class="bi-check2"></i>&nbsp;저장하기</button>
					</div>
				</div>
			</div>
		</div>
	</div><!-- End makeWorkflow Modal-->

	<%-- 승인대상 추가 모달창 start --%>
	<div class="myModal hide">
		<div class="myModal_overlay"></div>
		<div class="myModal_content">
			<h1>i'm a modal</h1>
			<input type="text" class="hi" autofocus>
			<button class="closeBtn">x</button>
		</div>
	</div>


	<%-- <div class="modal fade" id="appPersonAddModal" tabindex="-1">
		<div class="modal-dialog modal-dialog-scrollable">
		<div class="modal-content">
			<div class="modal-header">
			<h5 class="modal-title">Modal Dialog Scrollable</h5>
			<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
			Non omnis incidunt qui sed occaecati magni asperiores est mollitia. Soluta at et reprehenderit. Placeat autem numquam et fuga numquam. Tempora in facere consequatur sit dolor ipsum. Consequatur nemo amet incidunt est facilis. Dolorem neque recusandae quo sit molestias sint dignissimos.
			<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
			This content should appear at the bottom after you scroll.
			</div>
			<div class="modal-footer">
			<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
			<button type="button" class="btn btn-primary">Save changes</button>
			</div>
		</div>
		</div>
	</div> --%>
	<!-- 승인대상 추가 모달창 End -->


	<script type="text/javascript" src="${root}/resources/assets/js/workflowJs/wfForm.js"></script>





	</main>
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>
