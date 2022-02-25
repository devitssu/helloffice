<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/common/head.jsp" %>

<body>

	<%@ include file="/WEB-INF/views/workflow/inputAni.jsp" %>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>

	<main id="main" class="main">

	<%@ include file="/WEB-INF/views/workflow/wfNav.jsp" %>
	<div class="d-flex">
		<div class="form_container col-10 p-4">
			<div class="card card_cus" id="makeWf" data-bs-toggle="modal" data-bs-target="#makeWorkflow">
				<div class="card-body p-0 d-flex align-items-center justify-content-center">
					<div class="text-muted"><i class="bi-plus-lg"></i>&nbsp;워크플로우 만들기</div>
				</div>
			</div>

			<div class="card card_cus">
				<div class="card-body">
					<h5 class="card-title">비품 신청</h5>
					<h6 class=" mb-2 text-muted">구매 신청</h6>
					<a class="btn btn-sm btn-primary" href="#">작성하기</a>
				</div>
			</div>


			<div class="card card_cus">
				<div class="card-body">
					<h5 class="card-title">비품 신청</h5>
					<h6 class=" mb-2 text-muted">구매 신청</h6>
					<a class="btn btn-sm btn-primary" href="#">작성하기</a>
				</div>
			</div>

			<div class="card card_cus">
				<div class="card-body">
					<h5 class="card-title">비품 신청</h5>
					<h6 class=" mb-2 text-muted">구매 신청</h6>
					<a class="btn btn-sm btn-primary" href="#">작성하기</a>
				</div>
			</div>

			<div class="card card_cus">
				<div class="card-body">
					<h5 class="card-title">비품 신청</h5>
					<h6 class=" mb-2 text-muted">구매 신청</h6>
					<a class="btn btn-sm btn-primary" href="#">작성하기</a>
				</div>
			</div>

			<div class="card card_cus">
				<div class="card-body">
					<h5 class="card-title">비품 신청</h5>
					<h6 class=" mb-2 text-muted">구매 신청</h6>
					<a class="btn btn-sm btn-primary" href="#">작성하기</a>
				</div>
			</div>

		</div>

		<div class="col-2">
			<div class="card card_tag">
				<div class="card-body">
					<div><a class="btn btn-l btn-primary mt-3 mb-3" data-bs-toggle="modal" data-bs-target="#tagSetting" >태그 관리&nbsp; <i class="bi-gear"></i></a></div>
					<div><a class="btn btn-sm btn-dark rounded-pill mb-2" href="#"><i class="bi-inboxes-fill"></i> 모두 보기</a></div>
					<div><a class="btn btn-sm btn-light rounded-pill mb-2" href="#"># 구매 신청</a></div>
					<div><a class="btn btn-sm btn-light rounded-pill mb-2" href="#"># 복리 후생</a></div>
					<div><a class="btn btn-sm btn-light rounded-pill mb-2" href="#"># 비용 처리</a></div>
					<div><a class="btn btn-sm btn-light rounded-pill mb-2" href="#"># 계약</a></div>
					<div><a class="btn btn-sm btn-light rounded-pill mb-2" href="#"># 업무 신청</a></div>
					<div><a class="btn btn-sm btn-light rounded-pill mb-2" href="#"># 미분류</a></div>
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

						<%-- 태그 테이블 --%>
						<div class="tagTable">
							<table class="table table-hover">
								<thead>
									<tr>
										<th scope="col">태그</th>
										<th scope="col">사용 그룹</th>
										<th scope="col">양식 추가, 수정</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>구매 신청</td>
										<td>ㅇㅇ</td>
										<td>
											<div class="form-check form-switch">
												<input class="form-check-input" type="checkbox" id="flexSwitchCheckDefault">
											</div>
										</td>
									</tr>
								</tbody>

							</table>

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
	<div class="modal fade" id="makeWorkflow" tabindex="-1">
		<div class="modal-dialog modal-xl modal-dialog-scrollable">
			<div class="modal-content px-3 my95size">
				<div class="modal-header d-flex">
					<div class="col-8"><h6 class="modal-title"><span class="badge bg-light text-black-50">양식 추가</span></h6></div>
					<div class="col-auto d-flex justify-content-end align-items-center ">
						<span class="">태그: </span>&nbsp;
						<div class="" id="selectTag">
							<select class="form-select" aria-label="Default select example" tabindex="-1">
							<option selected>없음</option>
							<option value="1">One</option>
							<option value="2">Two</option>
							<option value="3">Three</option>
							</select>
						</div>&nbsp;&nbsp;&nbsp;
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" tabindex="-1"></button>
					</div>
				</div>
				<div class="modal-body d-flex justify-content-between">
					<div class="col-8">
						<div class="mycontainer" id="formIn">
							<div class="">
								<a class="btn btn-light" id="title_cus" data-bs-toggle="dropdown" href="#" tabindex="-1">문서 이름 입력 &nbsp;<i class="bi bi-exclamation-circle-fill ex_cus" ></i></a>
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
									<p>내용을 입력하세요.</p>
								</textarea>
							</div>
							<%-- 첨부파일 --%>
							<div class="hide mb-5" id="wofFile">
								<input class="form-control" type="file">
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
								<input type='text' required>
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
									<input type="text" required>
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
										<li class="d-flex justify-content-between align-items-center">
											<i class="bi-person-circle ms-3"></i>
											<div class="dropdown-item" href="#" data-bs-toggle="tooltip" data-bs-placement="left" title="작성자의 조직장에게 승인을 요청합니다.">
												조직장 승인</div>
											<div class="form-check form-switch">
												<input class="form-check-input onoff_my_boss" type="checkbox">
											</div>
										</li>
										<li class="d-flex justify-content-between align-items-center">
											<i class="ri-vip-crown-2-fill ms-3"></i>
											<div class="dropdown-item" href="#" data-bs-toggle="tooltip" data-bs-placement="left" title="승인권한을 가진 관리자에게 승인요청을 보냅니다.">
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
						<button type="button" class="btn btn-primary"><i class="bi-check2"></i>&nbsp;저장하기</button>
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

	<style type="text/css">
	.form_container {
		display: grid;
		grid-template-columns: 1fr 1fr 1fr 1fr;
		grid-template-rows: 1fr 1fr 1fr;
		gap: 1em 1em;
		grid-auto-flow: row;
		grid-template-areas:
			". . . ."
			". . . ."
			". . . .";
	}
	.card_cus{
		height:180px;
		min-width:200px;
		margin: 0;
	}

	#makeWf:hover {
		background-color: rgb(247, 248, 248);
		cursor: pointer;
	}

	.card_tag{
		text-align:center;
		/* background-color : transparent; */
		position: absolute;
		right: 50px;
		top: 250px;
	}

	/* .modal:nth-of-type(even) {
		z-index: 1062 !important;
	}
	.modal-backdrop.show:nth-of-type(even) {
		z-index: 1061 !important;
	} */

	.tag_modal{
		padding-right :12px;
		padding-left: 12px;
	}

	.tag_title{
		font-weight: bold;
	}

	.tag_subtitle{
		font-size: 0.7rem;
	}

	.tagTable{
		border: 1px solid grey;
	}

	.ex_cus{
		color :red;
	}

	.edit_ex{
		font-size:0.8rem;
	}

	#title_cus{
		font-size:1.8rem;
		color:grey;
	}


	.right_step{
		background-color: rgb(247, 248, 248);
	}

	.right_step>.btn-secondary{
		width:100%
	}

	.my_boss>div{
		color :purple;
	}

	.my_rep>div{
		color: darkgoldenrod;
	}

	/* .di_cus{
		width: 500px;
	} */

	.hide{
		display: none;
	}

	.group{
		position: relative;
	}
	.group>.hide{
		/* width: 90px; */
		position:absolute;
		right: 10px;
		top: -20px;
		z-index:5000;
	}

	.group:hover>.hide{
		display: flex;
		/* color: grey; */
	}

	.req_onoff, .del_select{
		color: black;
	}

	.group>.hide>.btn:hover{
		background-color: gainsboro !important;
	}

	.modal-content.my95size {
		height: auto;
		min-height: 90%;
	}

	.group label>i{
		color:red;
	}


	.tox{
		height: auto !important;
		min-height: 350px !important;
	}

	.group>.card-body{
		padding: 10px 10px 10px 5px;
	}

	.group>.card-footer{
		padding: 10px 10px 10px 5px;
	}

	/* .modal:nth-of-type(even) {
    z-index: 1060 !important;
}
.modal-backdrop.show:nth-of-type(even) {
    z-index: 1061 !important;
} */

	.myModal{
  box-shadow: 0 10px 20px rgba(0,0,0, 0.19), 0 6px 6px rgba(0, 0, 0, 0.23);
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  /* display: flex; */
  justify-content:center;
  align-items:center;
	z-index:1060;
}
.myModal_overlay{
	position:absolute;
	/* top:0;
	left:0; */
	/* z-index:1052; */
	width:100%;
	height:100%;
	background-color:rgba(0, 0, 0, 0.5);
}

.myModal_content{
	background-color: white;
	padding:  50px 100px;
	text-align: center;
	position:relative;
	top: 0px;
	border-radius:5px;
	box-shadow: 0 10px 20px rgba(0,0,0, 0.19), 0 6px 6px rgba(0, 0, 0, 0.23);
	width: 60%;
	/* z-index:1060; */
}


	</style>

	<script type="text/javascript">
	//====== 배너 달기 ======
	$(document).ready(function() {

	// 기존 css에서 플로팅 배너 위치(top)값을 가져와 저장한다.
	var floatPosition = parseInt($(".card_tag").css('top'));
	// 250px 이런식으로 가져오므로 여기서 숫자만 가져온다. parseInt( 값 );

	$(window).scroll(function() {
		// 현재 스크롤 위치를 가져온다.
		var scrollTop = $(window).scrollTop();
		var newPosition = scrollTop + floatPosition + "px";

		/* 애니메이션 없이 바로 따라감
		$("#floatMenu").css('top', newPosition);
		 */

		$(".card_tag").stop().animate({
			"top" : newPosition
		}, 400);

	}).scroll();

	// ====== #tagAddSw 태그 추가 ======
	$("#tagAddSw").click(function() {

		(async () => {
			const { value: formValue } = await Swal.fire({
				title: '태그 추가하기',
				input: 'text',
				inputPlaceholder: '태그 이름',

				// html:
				// 	'<input id="swal-input1" class="swal2-input">',
				// focusConfirm: false,
				// preConfirm: () => {
				// 	return [
				// 		document.getElementById('swal-input1').value
				// 	]
				// },
				confirmButtonText: '저장',
				showCancelButton: true,
				cancelButtonText: '닫기'
			})

			if (formValue) {
				// Swal.fire(JSON.stringify(formValue))
				Swal.fire(
					'',
					formValue +' (이)가 추가되었습니다.',
					'success'
				);
				// Swal.fire(`: ${formValue}`);
				console.log(formValue);
				// console.log(formValue[0]);
			}
		})()
	})

	// ====== #editEx 양식 문서 설명 편집 ======
	$("#editEx").on('click', function(){
		(async () => {
			const { value: text } = await Swal.fire({
				input: 'textarea',
				inputLabel: '문서 설명 입력',
				inputPlaceholder: '문서에 대한 설명을 입력하세요.',
				// inputAttributes: {
				// 	'aria-label': 'Type your message here'
				// },
				confirmButtonText: '확인',
				showCancelButton: true,
				cancelButtonText: '취소'
			})

			if($('.edit_ex').text() == '문서에 대한 설명을 입력해주세요.'){
				if (text) {
					$('.edit_ex').text(text);
				}
			} else{
				if (text) {
					$('.edit_ex').text(text);
				}else{
					$('.edit_ex').text('문서에 대한 설명을 입력해주세요.');
				}
			}
			// if (text) {
			// 	// $('#swal2-input').text(text);
			// 	console.log(text);
			// 	$('.edit_ex').html(text);
			// 	Swal.fire(text)
			// }

		})()
	})


	// $.fn.modal.Constructor.prototype._enforceFocus = function() {};

    // $(document).on('shown.bs.modal', '#makeWorkflow', function(){
    $('#makeWorkflow').on('shown.bs.modal', function(){
		// $(document).off('focusin.modal');
		$("#mce_0_ifr").attr("tabindex", "-1");
		console.log($(this));
		// let id = $(':focus');
		// console.log(id);
		// $(this).focusout();
		// $(this).focusout();
		// $(document).focus();
		// var id = $(':focus');
		// console.log(typeof(id));
		// // $(':focus').shift();
		// console.log(id);
		// $('#makeWorkflow').blur();
		// console.log(id);
		// console.log($(this))
        // $(this).find('#inputName').focus();
    });

	// ====== #titleSubmit 문서 이름 =======
	let originTitle = '문서 이름 입력 &nbsp;<i class="bi bi-exclamation-circle-fill ex_cus" ></i>';

	$("#titleSubmit").click(function(){
		if($('#formName').val() != "" ){
			$("#title_cus").html($('#formName').val());
			$("#title_cus").css('color', 'black');
		}else{
			$("#title_cus").html(originTitle);
			$("#title_cus").css('color', 'grey');
		}
	})

	// ====== 내용, 첨부파일, 참조문서 checked에 따른 변화 =======
	$("#onOffCon").change(function() {
		if($("#onOffCon").is(":checked")){
			$("#wofCon").removeClass("hide");
		}else{
			$("#wofCon").addClass("hide");
		}
	});
	$("#onOffFile").change(function() {
		if($("#onOffFile").is(":checked")){
			$("#wofFile").removeClass("hide");
		}else{
			$("#wofFile").addClass("hide");
		}
	});
	$("#onOffRef").change(function() {
		if($("#onOffRef").is(":checked")){
			$("#wofRef").removeClass("hide");
		}else{
			$("#wofRef").addClass("hide");
		}
	});

	// ====== 각종 커스텀 넣기 ======
	let charLabel = "<div class='group'><input type='text' required><span class='highlight'></span><span class='bar'></span><label>문자 입력 레이블<i class='bi-stars hide'></i></label>"
				+ "<div class='hide border border-light rounded  justify-content-center align-items-center shadow bg-body'><div class='btn req_onoff' data-bs-toggle='tooltip' data-bs-placement='top' title='필수 입력'><i class='bi-patch-check-fill'></i></div>"
				+ "<div class='btn del_select' data-bs-toggle='tooltip' data-bs-placement='top' title='삭제'><i class='bi-trash-fill'></i></div></div></div>";
	$("#addChar").click(function() {
		$("#formIn").append(charLabel);
	})
	let numLabel = "<div class='group'><input type='text' required><span class='highlight'></span><span class='bar'></span><label>숫자 입력 레이블<i class='bi-stars hide'></i></label>"
				+ "<div class='hide border border-light rounded  justify-content-center align-items-center shadow bg-body'><div class='btn req_onoff' data-bs-toggle='tooltip' data-bs-placement='top' title='필수 입력'><i class='bi-patch-check-fill'></i></div>"
				+ "<div class='btn del_select' data-bs-toggle='tooltip' data-bs-placement='top' title='삭제'><i class='bi-trash-fill'></i></div></div></div>";
	$("#addNum").click(function() {
		$("#formIn").append(numLabel);
	})
	let dateLabel = "<div class='group'><input type='text' required><span class='highlight'></span><span class='bar'></span><label>날짜 입력 레이블<i class='bi-stars hide'></i></label>"
				+ "<div class='hide border border-light rounded  justify-content-center align-items-center shadow bg-body'><div class='btn req_onoff' data-bs-toggle='tooltip' data-bs-placement='top' title='필수 입력'><i class='bi-patch-check-fill'></i></div>"
				+ "<div class='btn del_select' data-bs-toggle='tooltip' data-bs-placement='top' title='삭제'><i class='bi-trash-fill'></i></div></div></div>";
	$("#addDate").click(function() {
		$("#formIn").append(dateLabel);
	})

	// ====== 선택 양식, 복수 선택 양식 커스텀 ======
	let radioLabel = "<div class='group card'><div class='card-header'><input type='text' required><span class='highlight'></span><span class='bar'></span><label>선택 입력 레이블<i class='bi-stars hide'></i></label></div>"
				+ "<div class='card-body'><div class='d-flex'><input type='text' class='form-control my_op' placeholder='옵션 이름'><a class='btn btn-sm delOp'><i class='bi-x-lg'></i></a></div></div>"
				+ "<div class='card-footer'><a class='btn btn-sm add_option'><i class='bi-plus-lg'></i>&nbsp;옵션추가하기</a></div>"
				+ "<div class='hide border border-light rounded  justify-content-center align-items-center shadow bg-body'><div class='btn req_onoff' data-bs-toggle='tooltip' data-bs-placement='top' title='필수 입력'><i class='bi-patch-check-fill'></i></div>"
				+ "<div class='btn del_select' data-bs-toggle='tooltip' data-bs-placement='top' title='삭제'><i class='bi-trash-fill'></i></div></div></div>"
	$("#addRadio").click(function() {
		$("#formIn").append(radioLabel);
	})

	let checkboxLabel = "<div class='group card'><div class='card-header'><input type='text' required><span class='highlight'></span><span class='bar'></span><label>복수 선택 입력 레이블<i class='bi-stars hide'></i></label></div>"
				+ "<div class='card-body'><div class='d-flex'><input type='text' class='form-control my_op' placeholder='옵션 이름'><a class='btn btn-sm delOp'><i class='bi-x-lg'></i></a></div></div>"
				+ "<div class='card-footer'><a class='btn btn-sm add_option'><i class='bi-plus-lg'></i>&nbsp;옵션추가하기</a></div>"
				+ "<div class='hide border border-light rounded  justify-content-center align-items-center shadow bg-body'><div class='btn req_onoff' data-bs-toggle='tooltip' data-bs-placement='top' title='필수 입력'><i class='bi-patch-check-fill'></i></div>"
				+ "<div class='btn del_select' data-bs-toggle='tooltip' data-bs-placement='top' title='삭제'><i class='bi-trash-fill'></i></div></div></div>"
	$("#addCheckbox").click(function() {
		$("#formIn").append(checkboxLabel);
	})

	let optionLabel = "<div class='d-flex'><input type='text' class='form-control my_op' placeholder='옵션 이름'><a class='btn btn-sm delOp'><i class='bi-x-lg'></i></a></div>";
	$(document).on('click', '.add_option', function() {
		// console.log($(this));
		let $targetOp = $(this).parent().parent().find('div:eq(1)');
		// console.log($targetOp);
		$targetOp.append(optionLabel);
	})

	// ====== 클릭한 옵션만 삭제하기 ======
	$(document).on('click', '.delOp', function() {
		console.log($(this));
		$(this).parent().remove();
		// let index = $('.delOp').index(this);
		// console.log(index);
		// let st = 'user_delete?member_id='+$('.ad').eq(index).text()
		// if(confirm("정말로 삭제하시겠습니까?")){
		// 	$(location).attr('href', st);
		// }
	})

	// ====== 모든 양식 필수 입력 처리 ======
	$(document).on('click', '.req_onoff', function() {
		// console.log($(this).css('color'))
		//필수입력 안누르면(현재 검정색이면)
		if($(this).css('color') == 'rgb(33, 37, 41)'){
			$(this).parent().parent().find('label>i').removeClass('hide');
			$(this).css('color', 'rgb(0, 128, 0)');
			// console.log("녹색으로 변한 후 "+$(this).css('color'))
		//필수입력 취소하면(현재 녹색이면)
		}else if($(this).css('color') == 'rgb(0, 128, 0)'){
			$(this).parent().parent().find('label>i').addClass('hide');
			$(this).css('color', 'rgb(33, 37, 41)');
			// console.log("검정으로 변한 후 "+$(this).css('color'))
		}
	});

	// ====== 모든 양식 삭제하기 ======
	$(document).on('click', '.del_select', function(){
		$(this).parent().parent().remove();
	})

	// ====== 단계 추가하기 =======
	let stepNum = $('.stepShell').length;
	let stepLabel = "";
	$(document).on('click', '#addStep', function() {
		stepNum = $('.stepShell').length+1;
		stepLabel = "<div class='stepShell'><div class='card p-2 mb-3'><div class='p-2 d-flex justify-content-between align-items-center'><div class='steps'>"+ stepNum +"단계</div><button class='btn del_step'><i class='bi-x-lg'></i></button></div>"
						+ "<div class='person_list'><div class='hide my_boss justify-content-between align-items-center p-2'><div class=''><i class='bi-person-circle'></i>&nbsp; 조직장</div><button class='btn del_my_boss'><i class='bi-x-lg'></i></button></div>"
						+ "<div class='hide my_rep justify-content-between align-items-center p-2'><div class=''><i class='ri-vip-crown-2-fill'></i>&nbsp; 관리자</div><button class='btn del_rep'><i class='bi-x-lg'></i></button></div></div>"

						+ "<button class='btn ps-1 d-flex' data-bs-toggle='dropdown'><div class='col-2 me-2'><i class='bi bi-plus-circle'></i></div><div class='col-auto'><small>대상 추가하기</small></div></button>"
						+ "<ul class='dropdown-menu'><li class='d-flex justify-content-between align-items-center'><i class='bi-person-circle ms-3'></i><div class='dropdown-item' href='#' data-bs-toggle='tooltip' data-bs-placement='left' title='작성자의 조직장에게 승인을 요청합니다.'>조직장 승인</div>"
						+ "<div class='form-check form-switch'><input class='form-check-input onoff_my_boss' type='checkbox'></div></li>"
						+ "<li class='d-flex justify-content-between align-items-center'><i class='ri-vip-crown-2-fill ms-3'></i><div class='dropdown-item' href='#' data-bs-toggle='tooltip' data-bs-placement='left' title='승인권한을 가진 관리자에게 승인요청을 보냅니다.'>"
						+ "관리자 승인</div><div class='form-check form-switch'><input class='form-check-input onoff_rep' type='checkbox'></div></li>"
						+ "<li class='d-flex justify-content-between align-items-center'  data-bs-toggle='tooltip' data-bs-placement='left' title='특정 구성원을 승인 대상으로 추가합니다.'><a class='dropdown-item openSecond' href='# ' id=''>승인 대상 추가</a></li>"
						+ "<li class='d-flex justify-content-between align-items-center' data-bs-toggle='tooltip' data-bs-placement='left' title='이 단계부터 문서를 참조할 대상을 추가합니다.'><a class='dropdown-item openSecond' href='#'>참조 대상 추가</a></li></ul></div></div>";
		// console.log($(this));
		// console.log($('.stepShell').length);
		// console.log(stepNum);
		$('.stepForm').append(stepLabel);
		// console.log(stepNum);
		// let index1 = $('.stepShell').index($(this));
		// console.log(index1);
	})

	// ====== 클릭한 단계만 삭제하기 ======
	$(document).on('click', '.del_step', function() {
		// console.log($(this));
		let index = $('.del_step').index(this);
		// console.log("클릭한 것 인덱스 : "+index);
		// console.log("길이 : " +$('.stepShell').length);
		// console.log($(this).parent().parent().parent());
		$(this).parent().parent().parent().remove();
		// console.log("삭제 후 길이 : " +$('.stepShell').length);
		// console.log($('.stepShell').find('div.steps'));
		$('.stepShell').each(function(i) {
			$('.stepShell').find('div.steps').eq(i).text(i+1 +'단계');
		});
		// $('.stepShell').find('div.steps').text($('.stepShell').length+'단계');
		// let st = 'user_delete?member_id='+$('.ad').eq(index).text()
		// if(confirm("정말로 삭제하시겠습니까?")){
		// 	$(location).attr('href', st);
		// }
	})

	// ====== 조직장, 관리자 승인 checked에 따른 변화 =======
	$(document).on('change', ".onoff_my_boss", function(){
		if($(this).is(":checked")){
			console.log("ddd");
			$(this).parent().parent().parent().parent().find('.my_boss').removeClass("hide");
			$(this).parent().parent().parent().parent().find('.my_boss').addClass('d-flex');
		}else{
			$(this).parent().parent().parent().parent().find('.my_boss').addClass("hide");
			$(this).parent().parent().parent().parent().find('.my_boss').removeClass('d-flex');
		}
	});

	$(document).on('click', '.del_my_boss', function(){
		$(this).parent().eq(0).addClass('hide');
		$(this).parent().eq(0).removeClass('d-flex');
		$(this).parent().parent().parent().find('.onoff_my_boss').prop('checked', false);
	})

	$(document).on('change', ".onoff_rep", function(){
		if($(this).is(":checked")){
			$(this).parent().parent().parent().parent().find('.my_rep').removeClass("hide");
			$(this).parent().parent().parent().parent().find('.my_rep').addClass('d-flex');
		}else{
			$(this).parent().parent().parent().parent().find('.my_rep').addClass("hide");
			$(this).parent().parent().parent().parent().find('.my_rep').removeClass('d-flex');
		}
	});

	$(document).on('click', '.del_rep', function(){
		$(this).parent().eq(0).addClass('hide');
		$(this).parent().eq(0).removeClass('d-flex');
		$(this).parent().parent().parent().find('.onoff_rep').prop('checked', false);
	})

	// ====== 승인대상 추가 모달창 ======
	const openSecond = document.querySelectorAll(".openSecond");
	const myModal = document.querySelector(".myModal");
	const myModal_overlay = myModal.querySelector(".myModal_overlay");
	const closeBtn = myModal.querySelector(".closeBtn");

	const openModal = () => {
		alert("dd")
		console.log(this)
		myModal.classList.remove('hide');
		myModal.classList.add('d-flex');
	}

	$(document).on('click', '.openSecond', function(){
		$('.myModal').removeClass('hide');
		$('.myModal').addClass('d-flex');

		// myModal.classList.remove('hide');
		// myModal.classList.add('d-flex');
	})

	// openSecond.forEach(os => {
	// 	os.addEventListener("click", openModal);
	// });

	// openSecond.addEventListener("click", openModal);
	// openSecond.addEventListener("click", function(){
	// 	this.nextSibling.nextSibling.classList.remove('d-flex');
	// 	this.nextSibling.nextSibling.classList.remove('hide');
	// 	this.nextSibling.nextSibling.classList.add('d-flex');
	// 	myModal.previousSibling.querySelector(".openSecond")
	// 	myModal.classList.remove('hide');
	// 	myModal.classList.add('d-flex');
	// });

	// 두번째 모달창 닫기ㅣㅣㅣㅣㅣ
	// const closeModal = () => {
		// 	myModal.classList.add('hide');
	// 	myModal.classList.remove('d-flex');
	// }
	// myModal_overlay.addEventListener("click", closeModal);
	// closeBtn.addEventListener("click", closeModal);
	myModal_overlay.addEventListener("click", function(){
		// console.log(this);
		this.parentNode.classList.add('hide')
		this.parentNode.classList.remove('d-flex')
	});
	closeBtn.addEventListener("click", function(){
		// console.log(this);
		this.parentNode.parentNode.classList.add('hide')
		this.parentNode.parentNode.classList.remove('d-flex')

	});

	// ====== 양식 창을 저장 안하고 닫기 누르면 확인창 띄우고, 작성 취소하면 변경 내용 사라지게 하기
	$('#closeForm').on('click', function(){
		()
	})



});
</script>



	</main>
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>
