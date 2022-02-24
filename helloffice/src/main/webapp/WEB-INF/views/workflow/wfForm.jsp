<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/common/head.jsp" %>

<body>

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
			<div class="modal-content ps-3 pe-3">
				<div class="modal-header d-flex">
					<div class="col-8"><h6 class="modal-title"><span class="badge bg-light text-black-50">양식 추가</span></h6></div>
					<div class="col-auto d-flex justify-content-end align-items-center ">
						<label class="">태그: </label>&nbsp;
						<div class="" id="selectTag">
							<select class="form-select" aria-label="Default select example">
							<option selected>없음</option>
							<option value="1">One</option>
							<option value="2">Two</option>
							<option value="3">Three</option>
							</select>
						</div>&nbsp;&nbsp;&nbsp;
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					</div>
				</div>
				<div class="modal-body d-flex justify-content-between">
					<div class="col-8">
						<div class="">
							<a class="btn btn-light">문서 이름 입력 &nbsp; <i class="bi bi-exclamation-circle-fill ex_cus"></i>
							</a>
						</div>
						<div class="text-muted mb-4">
							<span class="edit_ex">문서에 대한 설명을 입력해주세요.</span> <a class="btn btn-sm" id="editEx">편집</a>
						</div>
						<div class="tmc_editor ">
							<!-- TinyMCE Editor -->
							<textarea class="tinymce-editor">
								<p>내용을 입력하세요.</p>
							</textarea><!-- End TinyMCE Editor -->
						</div>
						<%-- <div class=""></div> --%>

					</div>
					<div class="col-3 p-4 me-3 ms-3 right_step">
						<div class=""><h6>승인. 참조 대상</h6></div>
						<div class="">단계 추가하기</div>
						<div class="">대상 추가하기</div>

					</div>



				</div>
				<div class="modal-footer d-flex justify-content-between">
					<div class="col-7">
						<button type="button" class="btn btn-info"><i class="bi-plus-lg"></i>&nbsp;커스텀 입력</button>
					</div>
					<div class="col-auto">
						<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
						<button type="button" class="btn btn-primary"><i class="bi-check2"></i>&nbsp;저장하기</button>
					</div>
				</div>
			</div>
		</div>
	</div><!-- End makeWorkflow Modal-->

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
	.tinymce-editor{

	}

	.tmc_editor{
		h
	}

	.right_step{
		background-color: rgb(247, 248, 248);
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
	$("#editEx").click(function(){
		// $("#selectTag").blur();
		// console.log($("#swal2-input"))
		// $("#swal2-input").focus();
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

			if (text) {
				console.log(text);
				$('.edit_ex').html(text);
				Swal.fire(text)
			}

		})()
	})

    $("#makeWorkflow").on('shown.bs.modal', function(){
		$('document').focus();
		// var id = $(':focus');
		// console.log(typeof(id));
		// // $(':focus').shift();
		// console.log(id);
		// $('#makeWorkflow').blur();
		// console.log(id);
		// console.log($(this))
        // $(this).find('#inputName').focus();
    });


});
</script>



	</main>
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>
