$(document).ready(function() {

	//====== 배너 달기 ======
	// 기존 css에서 플로팅 배너 위치(top)값을 가져와 저장한다.
	var floatPosition = parseInt($(".card_tag").css('top'));

	$(window).scroll(function() {
		// 현재 스크롤 위치
		var scrollTop = $(window).scrollTop();
		var newPosition = scrollTop + floatPosition + "px";

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
				confirmButtonText: '저장',
				showCancelButton: true,
				cancelButtonText: '닫기'
			});

			if (formValue) {
				// ====== 태그 중복 체크
				$.ajax({
					url: 'wfForm/tagDupCheck',
					method: 'POST',
					data: {tagName: formValue},
					success: function(d){
						console.log("중복된 태그 개수 :: "+d);
						if(d > 0){
							Swal.fire(
								'잠시만요!',
								'이미 존재하는 태그입니다.\n (이름 = '+formValue+')',
								'warning'
							);
						}else{
							Swal.fire(
								'',
								formValue +' (이)가 추가되었습니다.',
								'success'
							);
							// console.log(formValue);
							$.ajax({
								url: 'wfForm/addTag',
								method: 'POST',
								data: {tagName: formValue},
								success: function(d){
									console.log("from controller :: " +d);
									$('.shell_tagTable').load(location.href+' .shell_tagTable');
									$('.shell_cardTag').load(location.href+' .shell_cardTag');
									$('#selectTag').load(location.href+' #selectTag');
								},
								error: function(){
									console.log("태그 추가에서 error!!!");
								}
							})
						}
					},
					error: function(){
						console.log("중복체크에서 에러");
					}
				})
			}
		})()
	})

	// ====== 태그 삭제하기 ======
	$(document).on('click', '.del_tag', function(){
		let index = $('.del_tag').index($(this));
		let targetTag = $(this).parent().parent().children().eq(0).text();

		Swal.fire({
			title: '정말로 삭제하시겠습니까?',
			text: "삭제하면 태그가 지정되지 않은 양식은 '미분류'로 이동하며, 한 번 삭제한 태그는 되돌릴 수 없습니다.",
			icon: 'warning',
			showCancelButton: true,
			// confirmButtonColor: '#3085d6',
			// cancelButtonColor: '#d33',
			confirmButtonText: '삭제',
			cancelButtonText: '닫기',
			reverseButtons: true, // 버튼 순서 거꾸로

		}).then((result) => {
			if (result.isConfirmed) {
				Swal.fire(
					'태그가 삭제되었습니다.',
					'',
					'success'
				);

				$.ajax({
					url: 'wfForm/deleteTag',
					method: 'POST',
					data: {tagName : targetTag},
					success: function(d){
						console.log("from controller :: " +d);
						$('.shell_tagTable').load(location.href+' .shell_tagTable');
						$('.shell_cardTag').load(location.href+' .shell_cardTag');
						$('#selectTag').load(location.href+' #selectTag');
					},
					error: function(){
						console.log("error~~");
					}
				})
			}
		});

	})

	// ====== 태그 수정하기 ======
	$(document).on('click', '.upd_tag', function(){
		let targetTag = $(this).parent().parent().children().eq(0).text();
		(async () => {
			const { value: formValue } = await Swal.fire({
				title: '태그 수정하기',
				input: 'text',
				inputPlaceholder: '태그 이름',
				confirmButtonText: '저장',
				showCancelButton: true,
				cancelButtonText: '닫기'
			})

			if (formValue) {
				// ====== 태그 중복 체크
				$.ajax({
					url: 'wfForm/tagDupCheck',
					method: 'POST',
					data: {tagName: formValue},
					success: function(d){
						// console.log("중복된 태그 개수 :: "+d);
						if(d > 0){
							Swal.fire(
								'잠시만요!',
								'이미 존재하는 태그입니다.\n (이름 = '+formValue+')',
								'warning'
							);
						}else{
							Swal.fire(
								'',
								formValue +' 로 수정되었습니다.',
								'success'
							);
							// console.log(formValue);
							let paramBody = {tagName: targetTag, toChange: formValue};
							$.ajax({
								url: 'wfForm/updateTag',
								method: 'POST',
								data: JSON.stringify(paramBody),
								contentType: 'application/json',
								success: function(d){
									console.log("from controller :: " +d);
									// $('.tagTable').find('tbody').append(beforeName+formValue+afterName);
									$('.shell_tagTable').load(location.href+' .shell_tagTable');
									$('.shell_cardTag').load(location.href+' .shell_cardTag');
									$('#selectTag').load(location.href+' #selectTag');
								},
								error: function(){
									console.log("error!~!~!");
								}
							})
						}
					}
				})
			}
		})()
	});

	// ====== #editEx 양식 문서 설명 편집 ======
	$("#editEx").on('click', function(){
		(async () => {
			const { value: text } = await Swal.fire({
				input: 'textarea',
				inputLabel: '문서 설명 입력',
				inputPlaceholder: '문서에 대한 설명을 입력하세요.',
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

		})()
	})

	// ====== 양식 창을 저장 안하고 닫기 누르면 확인창 띄우고, 작성 취소하면 변경 내용 사라지게 하기
	let newForm = "";

	// 감지할 타겟
	let target = document.querySelector('#makeWorkflow>.modal-dialog');

	// 변경을 감지했을 때 실행할 부분
	let callback = (mutations) => {
		// console.log("변경감지");
		let newForm = document.querySelector('#makeWorkflow>.modal-dialog *').innerHTML;
		// console.log(newForm == originalForm[0]);

		if(newForm != originalForm[0]){
			// console.log("달라ㅏㅏ")
			$('.closeForm').removeAttr('data-bs-dismiss');
			$(document).on('click', '.closeForm', function(){
				Swal.fire({
					title: '작성을 취소하시겠습니까?',
					text: "취소하면 작성 중인 내용이 모두 사라집니다.",
					icon: 'warning',
					confirmButtonText: '작성 취소하기',
					confirmButtonColor: '#d33',
					showCancelButton: true,
					cancelButtonColor: '#6c757d',
					cancelButtonText: '닫기',
				// allowOutsideClick: false,
				}).then((result) => {

					if (result.isConfirmed) {
						// $.ajaxSetup({
						// global: false
						// });
						window.location.reload();
						// Swal.fire(
						// 	'작성을 취소하였습니다!',
						// '작성 중인 내용이 모두 사라졌습니다.',
						// 'success'
						// )
						// $('#makeWorkflow').load(window.location.href + '#makeWorkflow');
						// history.go(0);
					}
				})
			})

		}else{
			// console.log('같은펌')
			$('.closeForm').attr('data-bs-dismiss', 'modal');
		}
	};

	let observer;

	// 감지 설정
	let config = {
	childList: true,	// 타겟의 하위 요소 추가 및 제거 감지
	attributes: true,	// 타켓의 속성 변경를 감지
	characterData: true,	// 타겟의 데이터 변경 감지
	subtree: true,	// 타겟의 자식 노드 아래로도 모두 감지
	//   attributeOldValue: false,	// 타겟의 속성 변경 전 속성 기록
	//   characterDataOldValue: false	// 타겟의 데이터 변경 전 데이터 기록
	};

	let originalForm = new Array();
	let flag = 0;
	// $("#mce_0_ifr").attr("tabindex", "-1");
    // $(document).on('shown.bs.modal', '#makeWorkflow', function(){
	$('#makeWorkflow').on('shown.bs.modal', function () {
		$('.tox-tinymce-aux').css('z-index', '1000');
		observer = new MutationObserver(callback)
		observer.observe(target, config);
		originalForm.push(document.querySelector('#makeWorkflow>.modal-dialog *').innerHTML);
		console.log(originalForm.length);
    });

	$('#makeDoc').on('shown.bs.modal', function () {
        $(".tox-tinymce-aux").css("z-index", "1000");
    });


	// ====== #titleSubmit 문서 이름 =======
	let originTitle = "문서 이름 입력 &nbsp;<i class='bi bi-exclamation-circle-fill ex_cus' ></i>";

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
	let charLabel = "<div class='group char_group'><input type='text' class='label_name' required><span class='highlight'></span><span class='bar'></span><label>문자 입력 레이블<i class='bi-stars hide'></i></label>"
				+ "<div class='hide border border-light rounded  justify-content-center align-items-center shadow bg-body'><div class='btn req_onoff' data-bs-toggle='tooltip' data-bs-placement='top' title='필수 입력'><i class='bi-patch-check-fill'></i></div>"
				+ "<div class='btn del_select' data-bs-toggle='tooltip' data-bs-placement='top' title='삭제'><i class='bi-trash-fill'></i></div></div></div>";
	$("#addChar").click(function() {
		$("#formIn").append(charLabel);
	})
	let numLabel = "<div class='group num_group'><input type='text' class='label_name' required><span class='highlight'></span><span class='bar'></span><label>숫자 입력 레이블<i class='bi-stars hide'></i></label>"
				+ "<div class='hide border border-light rounded  justify-content-center align-items-center shadow bg-body'><div class='btn req_onoff' data-bs-toggle='tooltip' data-bs-placement='top' title='필수 입력'><i class='bi-patch-check-fill'></i></div>"
				+ "<div class='btn del_select' data-bs-toggle='tooltip' data-bs-placement='top' title='삭제'><i class='bi-trash-fill'></i></div></div></div>";
	$("#addNum").click(function() {
		$("#formIn").append(numLabel);
	})
	let dateLabel = "<div class='group date_group'><input type='text' class='label_name' required><span class='highlight'></span><span class='bar'></span><label>날짜 입력 레이블<i class='bi-stars hide'></i></label>"
				+ "<div class='hide border border-light rounded  justify-content-center align-items-center shadow bg-body'><div class='btn req_onoff' data-bs-toggle='tooltip' data-bs-placement='top' title='필수 입력'><i class='bi-patch-check-fill'></i></div>"
				+ "<div class='btn del_select' data-bs-toggle='tooltip' data-bs-placement='top' title='삭제'><i class='bi-trash-fill'></i></div></div></div>";
	$("#addDate").click(function() {
		$("#formIn").append(dateLabel);
	})

	// ====== 선택 양식, 복수 선택 양식 커스텀 ======
	let radioLabel = "<div class='group card'><div class='card-header'><input type='text' class='label_name' required><span class='highlight'></span><span class='bar'></span><label>선택 입력 레이블<i class='bi-stars hide'></i></label></div>"
				+ "<div class='card-body'><div class='d-flex'><input type='text' class='form-control my_op' placeholder='옵션 이름'><a class='btn btn-sm delOp'><i class='bi-x-lg'></i></a></div></div>"
				+ "<div class='card-footer'><a class='btn btn-sm add_option'><i class='bi-plus-lg'></i>&nbsp;옵션추가하기</a></div>"
				+ "<div class='hide border border-light rounded  justify-content-center align-items-center shadow bg-body'><div class='btn req_onoff' data-bs-toggle='tooltip' data-bs-placement='top' title='필수 입력'><i class='bi-patch-check-fill'></i></div>"
				+ "<div class='btn del_select' data-bs-toggle='tooltip' data-bs-placement='top' title='삭제'><i class='bi-trash-fill'></i></div></div></div>"
	$("#addRadio").click(function() {
		$("#formIn").append(radioLabel);
	})

	let checkboxLabel = "<div class='group card'><div class='card-header'><input type='text' class='label_name' required><span class='highlight'></span><span class='bar'></span><label>복수 선택 입력 레이블<i class='bi-stars hide'></i></label></div>"
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
	})

	// ====== 모든 양식 필수 입력 처리 ======
	$(document).on('click', '.req_onoff', function() {
		//필수입력 안누르면(현재 검정색이면)
		if($(this).css('color') == 'rgb(33, 37, 41)'){
			$(this).parent().parent().find('label>i').removeClass('hide');
			$(this).css('color', 'rgb(0, 128, 0)');
		//필수입력 취소하면(현재 녹색이면)
		}else if($(this).css('color') == 'rgb(0, 128, 0)'){
			$(this).parent().parent().find('label>i').addClass('hide');
			$(this).css('color', 'rgb(33, 37, 41)');
		}
	});

	// ====== 모든 양식 삭제하기 ======
	$(document).on('click', '.del_select', function(){
		$(this).parent().parent().remove();
	})

	// ====== 단계 추가하기 =======
	// let stepNum = $('.stepShell').length;
	let stepLabel = "";
	$(document).on('click', '.addStep', function () {
		// console.log($(this).parent().find(".stepShell"));
		let countShell = $(this).parent().find('.stepShell').length;
		let stepNum = countShell + 1;
		stepLabel = `<div class="stepShell">
						<div class="card p-2 mb-3">
							<div class="p-2 d-flex justify-content-between align-items-center">
								<div class="steps">${stepNum}단계</div>
								<button class="btn del_step" tabindex="-1"><i class="bi-x-lg"></i></button>
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
							<button class="btn ps-1 d-flex" data-bs-toggle="dropdown" tabindex="-1">
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
					</div>`;

		$(this).parent().find($('.stepForm')).append(stepLabel);
	})

	// ====== 클릭한 단계만 삭제하기 ======
	$(document).on('click', '.del_step', function() {
		// let index = $(".del_step").index(this);
		let stepF = $(this).parent().parent().parent().parent();
		let stepS = $(this).parent().parent().parent();
		stepS.remove();
		stepF.find('.stepShell').each(function(ind, item) {
			$(item).find('div.steps').text(ind+1 +'단계');
		});
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

	$(document).on('click', '.del_per', function () {
		$(this).parent().remove();
	})

	// ====== 승인대상 추가 모달창 ======

	let targetAdd1 = '<div class="my_per justify-content-between align-items-center p-2 d-flex"><img src="/helloffice/resources/assets/img/favicon.png" width="25px"><div class="per_name">&nbsp; ';
	let targetAdd2 = '</div><button class="btn del_per" tabindex="-1"><i class="bi-x-lg"></i></button></div>';

	const openSecond = document.querySelectorAll(".openSecond");
	const myModal = document.querySelector(".myModal");
	const myModal_overlay = myModal.querySelector(".myModal_overlay");
	const closeBtn = myModal.querySelector(".closeBtn");


	$(document).on('click', '.openSecond', function () {
		const th = $(this);
		$.ajax({
			url: 'wfForm/getHrList',
			method: 'GET',
			// data
			success: function (d) {
				let dynaMyModal = "";
				d.forEach(function (ele, ind) {
					dynaMyModal += `<option value="${ele.empName}" data-badge="">${ele.empName}(${ele.depName}/${ele.empPosition})</option>`;
				})
				if ($('.myPerSel').children().length < d.length) {
					$('.myPerSel').append(dynaMyModal);
				}

				// $(".myPerSel").select2({
				// 	closeOnSelect: false
				// });
				$('.myModal').addClass('d-flex');
				$.getAndApply(th);
			},
			error() {
				console.log("승인대상추가실패ㅐㅐㅐ");
			}
		})

	})

	// 두번째 모달창 닫기 ======
	myModal_overlay.addEventListener("click", function () {
		$(".myPerSel").val(null).trigger("change");
		this.parentNode.classList.add('hide');
		this.parentNode.classList.remove('d-flex');
	});
	closeBtn.addEventListener("click", function () {
		$(".myPerSel").val(null).trigger("change");
		this.parentNode.parentNode.classList.add('hide');
		this.parentNode.parentNode.classList.remove('d-flex');
	});

	// 대상 선택완료 시 ======
	$.getAndApply = function (tar) {
		const ttt = tar;

		$(document).off('click', '.choosePer').on("click", ".choosePer", function () {
			console.log(ttt);
			let selValArr = $(this).parent().find(".myPerSel").val();
			let finalTargetAdd = "";
			selValArr.forEach(ele => {
				let targetAdd3 = targetAdd1 + ele + targetAdd2;
				finalTargetAdd += targetAdd3;
			});
			$(ttt).parent().parent().parent().find('.person_list').append(finalTargetAdd);
			$('.myPerSel').val(null).trigger('change');
			$(this).parent().parent().addClass("hide");
			$(this).parent().parent().removeClass("d-flex");
			console.log("=========");
		})
	}

	// ====== 태그 별 양식 조회 ======
	$(document).on("click", ".seaFbyTag", function () {
		//색깔 바꾸기
		$(this).parent().parent().find(".seaFbyTag").each(function (ind, it) {
			$(it).removeClass("btn-dark");
		})
		$(this).addClass("btn-dark");

		//태그 이름 갖고오기
		let tagNa = $(this).text().substring(2);
		let tagNu = $(this).attr("value");

		$.ajax({
			url: 'wfForm/getFormTag',
			method: 'GET',
			data: { tagNo: tagNu },
			dataType: 'json',
			success: function (d) {
				console.log(d);
				let custem = '';
				$('.cc_0').remove();
				$(d).each(function (ind, it) {
					custem = '<div class="card card_cus cc_0 group px-3">'
						+ '<div class="card-body py-2 d-flex flex-column"><div style="height: 86.19px;"><h5 class="card-title">'+it.formName+'</h5></div><div><h6 class="mb-2 text-muted">'+it.tagName+'</h6></div>'
						+ '<div class="align-self-end"><a class="my-2 btn btn-sm btn-primary make_doc" href="#" data-bs-toggle="modal" data-bs-target="#makeDoc">작성하기</a> <a class="my-2 btn btn-sm btn-light border border-light" href="#">작성요청</a></div></div>'
						+ '<div class="hide border border-light rounded justify-content-center align-items-center shadow bg-body"><div class="btn form_edit" data-bs-toggle="tooltip" data-bs-placement="top" title="수정하기"><i class="bi-pencil-fill"></i></div>'
						+ '<div class="btn del_form_select" data-bs-toggle="tooltip" data-bs-placement="top" title="삭제"><i class="bi-trash-fill"></i></div></div></div>';
					$(".form_container").append(custem);
				})
				// $(".dd").load(location.href + " .dd");
			},
			error: function () {
				console.log("태그별 양식조회 실패ㅐㅐ");
			}
		})
	})



	// ====== 만든 양식 추가 ======

	//필수입력 포함하여 obj에 넣는 함수
	function pushToObj(obj, str0, ind0, it0) {
		if ($(it0).find('label>i.bi-stars').hasClass('hide')) {
			obj = {
                cusType: str0,
				cusName: $(it0).find(".label_name").val(),
				cusReq: 'N',
                cusOrder: ind0,
				cusOp: new Array()
			};
			// arr.push(obj);
			// obj.push([ind0, $(it0).find(".label_name").val(), 0]);
		} else {
			obj = {
                cusType: str0,
				cusName: $(it0).find(".label_name").val(),
				cusReq: 'Y',
                cusOrder: ind0,
				cusOp: new Array()
			};
			// arr.push(obj);
			// obj.push([ind0, $(it0).find(".label_name").val(), 1]);
		}
		return obj;
	}


	$(document).on("click", ".saveForm", function () {

		// 폼 정보
		let formTitle = $('#makeWorkflow').find('#title_cus').text();
		let formDet = $('#makeWorkflow').find('.edit_ex').text();

		// 태그 정보
		let selTag = $("#makeWorkflow").find('#selectTag option:selected').val();

		// 내용 정보
		let cusCon = '0';
		if (!$('#wofCon').hasClass('hide')) {
			cusCon = document.querySelector("#mce_0_ifr").contentWindow.document.getElementById("tinymce").innerHTML;
		}

		// 양식첨부

		// 첨부파일
		let cusFile_ = {};
		let beFile = "1";
		if ($(".f_group").hasClass("hide")) {
			beFile = "0";
		}
		let fileReq = 'N';
		if ($(".f_group").find(".req_onoff").css("color") == "rgb(0, 128, 0)") {
			fileReq = 'Y';
		}
		cusFile_ = { beFile_: beFile, fileReq_: fileReq };

		// 승인 정보
		let appArr = [];
		let appObj = {};
		if ($('#makeWorkflow').find('.per_name').length > 0) {
			$('#makeWorkflow').find('.stepShell').each(function (index, item) {
				let perArr = [];
				$(item).find('.my_per').each(function (ind, it) {
					perArr.push($(it).find('.per_name').text().trim());
				})
				appObj = {
					stepOrder: index,
					stepArr: perArr
				}
				appArr.push(appObj);
			})
		}
		// else {
		// 	let perArr = [];
		// 	appObj = {
		// 		stepOrder: -1,
		// 		stepPArr: perArr
		// 	};
		// 	appArr.push(appObj);
		// }

		// 커스텀 정보
		let formArr = [];
		let formObj = {};
		let reObj = {};
		//몇번째 group인지 확인하고 넣기
		$('#makeWorkflow').find('.group').each(function (ind, it){
			if ($(it).find('label').text().match('문자')) {
				reObj = pushToObj(formObj, "문자", ind, it);
			}
			else if ($(it).find('label').text().match('숫자')) {
				reObj = pushToObj(formObj, "숫자", ind, it);
			}
			else if ($(it).find('label').text().match('날짜')) {
				reObj = pushToObj(formObj, "날짜", ind, it);
			}
			else if ($(it).find('label').text().match('복수 선택')) {
				reObj = pushToObj(formObj, "복수 선택", ind, it);
				let mulop = [];
				$(it).find('.card-body input').each(function (ind1, it1) {
					mulop.push($(it1).val());
					// console.log(typeof(formObj.cusOp));
				})
				reObj.cusOp = mulop;
			}
			else if ($(it).find('label').text().match('선택 입력')) {
				reObj = pushToObj(formObj, "선택 입력", ind, it);
				let oneop = [];
				$(it).find('.card-body input').each(function (ind1, it1) {
					oneop.push($(it1).val());
				})
				reObj.cusOp = oneop;
			}
			formArr.push(reObj);
		})

		// console.log(formObj);
		console.log(formTitle);
		console.log(formDet);
		console.log(selTag);
		console.log(formArr);

		// const Toast = Swal.mixin({
		// 	toast: true,
		// 	position: 'bottom-start',
		// 	showConfirmButton: false,
		// 	timer: 3000,
		// 	timerProgressBar: true,
		// 	didOpen: (toast) => {
		// 		toast.addEventListener('mouseenter', Swal.stopTimer)
		// 		toast.addEventListener('mouseleave', Swal.resumeTimer)
		// 	}
		// })

		// Toast.fire({
		// 	icon: 'success',
		// 	title: '양식을 만들었습니다.'
		// })
		$.ajax({
			url: 'wfForm/addWfForm',
			method: 'POST',
			data: JSON.stringify({
				formName: formTitle,
				formDetail: formDet,
				tagNo: selTag,
				objArr: formArr,
				conDb: cusCon,
				cusFile: cusFile_,
				approveArr: appArr,
			}),
			contentType: 'application/json',
			success: function (d) {
				console.log("양식추가 success :: " + d);
				Swal.fire({
					title: 'SUCCESS',
					text:'양식이 성공적으로 추가되었습니다.',
					icon:'success'
				}).then(function () {
					location.reload();
				});
			},
			error: function () {
				console.log("양식추가 에러");
			}
		})
	});


	// ====== 만든 양식 삭제하기 ======
	$(document).on('click', '.del_form_select', function () {
		// let selFormName = $(this).parent().prev().find('.text-muted').val();
		let selFormName = $(this).parent().prev().find(".card-title").text();
		let selFormNo = $(this).parent().prev().find(".card_formNo").text();

		Swal.fire({
			title: selFormName+' 양식을 정말로 삭제하시겠습니까?',
			text: "이 동작은 되돌릴 수 없습니다.",
			icon: 'warning',
			showCancelButton: true,
			// confirmButtonColor: '#3085d6',
			// cancelButtonColor: '#d33',
			confirmButtonText: '삭제하기',
			cancelButtonText: '닫기',
			reverseButtons: true, // 버튼 순서 거꾸로

		}).then((result) => {
			if (result.isConfirmed) {

				const Toast = Swal.mixin({
					toast: true,
					position: 'bottom-start',
					showConfirmButton: false,
					timer: 3000,
					timerProgressBar: true,
					didOpen: (toast) => {
						toast.addEventListener('mouseenter', Swal.stopTimer)
						toast.addEventListener('mouseleave', Swal.resumeTimer)
					}
				})

				Toast.fire({
					icon: 'success',
					title: '양식을 삭제했습니다.'
				})

				$.ajax({
					url: 'wfForm/deleteWfForm',
					method: 'POST',
					data: {formNo : selFormNo},
					success: function(d){
						console.log("from controller :: " +d);
						$(".dd").load(location.href + " .dd");
					},
					error: function(){
						console.log("error~~");
					}
				})
			}
		});

		// $(this).parent().parent().remove();
	})

	// ====== 양식 상세 조회 ======

	let charApp1 = "<br><div class='group char_mygroup mt-2 mb-2'><input type='text' class='label_name' required tabindex='-1'><span class='highlight'></span><span class='bar'></span><label>";
	let charApp2 = "<i class='bi-stars hide'></i></label></div>";

	let numApp1 = "<br><div class='group num_mygroup mt-2 mb-2'><input type='text' class='label_name' required tabindex='-1'><span class='highlight'></span><span class='bar'></span><label>";
	let numApp2 = "<i class='bi-stars hide'></i></label></div>";

	let dateApp1 = '<br><div class="date_mygroup" tabindex="-1"><div><label class="mb-2">';
	let dateApp2 = '<i class="bi-stars hide" style="color: red;"></i></label></div><input class="picker form-control" mbsc-input placeholder="Please select..." tabindex="-1"/></div>';

	let selOneApp1 = '<br><div class="oneSel_mygroup mt-3 mb-5" style="margin-bottom: 4.8rem;" tabindex="-1"><label>';
	let selOneApp2 = '<i class="bi-stars hide" style="color: red;"></i></label><select class="wide niceselect" tabindex="-1"><option data-display="선택하세요">미선택</option>';
	let selOneApp3 = "</select></div>";

	let multiApp1 = '<br><div class="multiSel_mygroup ftco-section" tabindex="-1"><label class="mb-1">';
	let multiApp2 = '<i class="bi-stars hide" style="color: red;"></i></label><div class="container"><div class="row justify-content-center"><div class="d-flex justify-content-center align-items-center"><select class="js-select2" multiple="multiple" tabindex="-1">';
	let multiApp3 = '</select></div></div></div></div>';


	$(document).on("click", ".make_doc", function () {

		let selFName = $(this).parent().parent().find('.card-title').text();
		let selFNo = $(this).parent().parent().find(".card_formNo").text();

		$.ajax({
			url: 'wfForm/getEachForm',
			method: 'GET',
			data: { formNo: selFNo },
			// dataType: 'json',
			success: function (d) {
				$(".shell_mfc");
				$('.myFcontainer').empty();
				console.log(d);
				console.log(d[0].formName);
				console.log(d[0].formCon);
				console.log(d[0].formCon != "0");
				$(".title_cus1").text(d[0].formName);
				$(".f_no1").text(d[0].formNo);
				$(".edit_ex1").text(d[0].formDetail);
				$(".fTag").text(d[0].tagName);
				$(".wofCon1").addClass("hide");
				$(".wofCon1 iframe").get(0).contentWindow.document.body.innerHTML = '<p><br data-mce-bogus="1"></p>';
				if (d[0].formCon != "0") {
					$(".wofCon1").removeClass("hide");
					// console.log(d[0].formCon);
					$(".wofCon1 iframe").get(0).contentWindow.document.body.innerHTML = d[0].formCon;
					console.log($(".wofCon1 iframe").get(0).contentWindow.document.body.innerHTML);
				}
				$(d).each(function (index, item) {
					if (item.cusType == "문자") {
						// console.log((d[index-1].cusLabel).split('^'));
						let ncharApp2 = "";
						if (item.cusReq == "Y") {
							ncharApp2 = charApp2.replace(" hide", "");
						} else {
							ncharApp2 = charApp2;
						}
						let charApp = charApp1 + item.cusLabel + ncharApp2;
						$(".myFcontainer").append(charApp);
					}
					if (item.cusType == "숫자") {
						// console.log((d[index-1].cusLabel).split('^'));
						let nnumApp2 = "";
						if (item.cusReq == "Y") {
							nnumApp2 = numApp2.replace(" hide", "");
						} else {
							nnumApp2 = numApp2;
						}
						let numApp = numApp1 + item.cusLabel + nnumApp2;
						$(".myFcontainer").append(numApp);
					}
					if (item.cusType == "날짜") {
						let ndateApp1 = "";
						if (item.cusReq == "Y") {
							ndateApp2 = dateApp2.replace(" hide", "");
						} else {
							ndateApp2 = dateApp2;
						}
						let dateApp = dateApp1 + item.cusLabel + ndateApp2;
						$(".myFcontainer").append(dateApp);
						mobiscroll.datepicker(".picker", {
							theme: "material",
							themeVariant: "light",
							controls: ["calendar"],
							selectMultiple: true,
							dateFormat: "YYYY-MM-DD",
						});
					}
					if (item.cusType == "옵션") {
						if (d[index - 1].cusType == "선택 입력") {
							// console.log(item.cusLabel);
							let trimedArr = item.cusLabel.trim().split("^");
							trimedArr.forEach(function (ele, ind) {
								let ele1 = ele.trim();
								trimedArr[ind] = ele1;
							});
							//앞
							let nselOneApp2 = "";
							if (d[index - 1].cusReq == "Y") {
								nselOneApp2 = selOneApp2.replace(" hide", "");
							} else {
								nselOneApp2 = selOneApp2;
							}
							let selOneAppA = selOneApp1 + d[index - 1].cusLabel + nselOneApp2;

							//중간
							let selOneAppB = "";
							trimedArr.forEach(function (ele, ind) {
								selOneAppB += '<option value="' + ele + '">' + ele + '</option>';
							});
							//최종
							let selOneApp = selOneAppA + selOneAppB + selOneApp3;
							// console.log(selOneApp);
							$(".myFcontainer").append(selOneApp);

						} else if (d[index - 1].cusType == "복수 선택") {
							// console.log("복수선택---------");
							let trimedArr = item.cusLabel.trim().split("^");
							trimedArr.forEach(function (ele, ind) {
								let ele1 = ele.trim();
								trimedArr[ind] = ele1;
							});
							// console.log(trimedArr);
							//앞
							let nmultiApp2 = "";
							if (d[index - 1].cusReq == "Y") {
								nmultiApp2 = multiApp2.replace(" hide", "");
							} else {
								nmultiApp2 = multiApp2;
							}
							let multiAppA = multiApp1 + d[index - 1].cusLabel + nmultiApp2;

							//중간
							let multiAppB = "";
							trimedArr.forEach(function (ele, ind) {
								multiAppB += '<option value="' + ele + '" data-badge="">' + ele + '</option>';
							});
							//최종
							let multiApp = multiAppA + multiAppB + multiApp3;
							// console.log(multiApp);
							$(".myFcontainer").append(multiApp);
							$('.js-select2').select2({
								closeOnSelect: false
							});
						}
					}
				})
				$(".niceselect").niceSelect();
                $(".nice-select").attr("tabindex", "-1");
			},
			error: function () {
				console.log("양식상세조회 실패~~");
			}
		});

		$.ajax({
			url: 'wfForm/getEachStep',
			method: 'GET',
			data: { formNo: selFNo },
			// dataType: 'json',
			success: function (d) {
				console.log(d);
				$('#makeDoc .stepForm').empty();
				if (d.length > 0) {
					//단계 추가하기
					$(d).each(function (index, item) {
						let docStepLabel = `<div class="stepShell">
												<div class="card p-2 mb-3">
													<div class="p-2 d-flex justify-content-between align-items-center">
														<div class="steps">${item.appStep+1}단계</div>
														<button class="btn del_step" tabindex="-1"><i class="bi-x-lg"></i></button>
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
													<button class="btn ps-1 d-flex" data-bs-toggle="dropdown" tabindex="-1">
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
											</div>`;
						let eachStepNum = item.appStep + 1 + "단계";
						console.log(eachStepNum);
						if (!$("#makeDoc .steps").text().match(eachStepNum)) {
                            $("#makeDoc .stepForm").append(docStepLabel);
                        }
					})
					// 안에 승인자 추가하기
					$('#makeDoc .stepForm').find('.stepShell').each(function (index, item) {
						let finalTargetAdd = "";
						$(d).each(function (ind, it) {
							if (index == it.appStep) {
								let targetAdd3 = targetAdd1 + it.empName + targetAdd2;
								finalTargetAdd += targetAdd3;
							}
						})
						$(item).find('.person_list').append(finalTargetAdd);
					})
				}
			}, error:function() {
				console.log('승인조회 실패!!');
			}
		})
	});


	// ====== 작성한 문서 데이터 담기 ======
	//필수입력 포함하여 obj에 넣는 함수
	function pushToDocObj(obj, str0, ind0, it0) {
		if ($(it0).find('label>i.bi-stars').hasClass('hide')) {
			obj = {
				cusType: str0,
				cusLabel: $(it0).find('label').text(),
				eachData: "",
				cusReq: 'N',
                cusOrder: ind0,
				// cusOp: new Array()
			};
		} else {
			obj = {
				cusType: str0,
				cusLabel: $(it0).find('label').text(),
				eachData: "",
				cusReq: 'Y',
                cusOrder: ind0,
				// cusOp: new Array()
			};
			// arr.push(obj);
			// obj.push([ind0, $(it0).find(".label_name").val(), 1]);
		}
		return obj;
	}


	$(document).on("click", ".sendDocTo", function () {
		// 폼 정보
		let formTitle = $('#makeDoc').find('.title_cus1').text();
		let formNo1 = $("#makeDoc").find(".f_no1").text();

		// 태그 정보
		// let selTag = $("#makeDoc").find(".fTag").text();

		// 내용 정보
		let cusCon = '0';
		if (!$('.wofCon1').hasClass('hide')) {
			cusCon = $(".wofCon1 iframe").get(0).contentWindow.document.body.innerHTML;
		}

		// 작성자
		let docWriter = $(".docWriter").text();

		// 양식첨부

		//첨부파일

		// 승인 정보
		let appArr = [];
		let appObj = {};
		if ($('#makeDoc').find('.per_name').length > 0) {
			$('#makeDoc').find('.stepShell').each(function (index, item) {
				let perArr = [];
				$(item).find('.my_per').each(function (ind, it) {
					perArr.push($(it).find('.per_name').text().trim());
				})
				appObj = {
					stepOrder: index,
					stepArr: perArr
				}
				appArr.push(appObj);
			})
		}
		console.log(appArr);

		// 커스텀 정보
		let formArr = [];
		let formObj = {};
		let reObj = {};
		//몇번째 group인지 확인하고 넣기
		$('#makeDoc div[class*="_mygroup"]').each(function (ind, it){
			if ($(it).hasClass('char_mygroup')) {
				reObj = pushToDocObj(formObj, "문자", ind, it);
				reObj.eachData = $(it).find(".label_name").val();
			}
			else if ($(it).hasClass('num_mygroup')) {
				reObj = pushToDocObj(formObj, "숫자", ind, it);
				reObj.eachData = $(it).find(".label_name").val();
			}
			else if ($(it).hasClass('date_mygroup')) {
				reObj = pushToDocObj(formObj, "날짜", ind, it);
				reObj.eachData = $(it).find(".picker").val();;
			}
			else if ($(it).hasClass('multiSel_mygroup')) {
				reObj = pushToDocObj(formObj, "복수 선택", ind, it);
				reObj.eachData = $(it).find(".js-select2").val().join(", ");
			}
			else if ($(it).hasClass('oneSel_mygroup')) {
				reObj = pushToDocObj(formObj, "선택 입력", ind, it);
				reObj.eachData = $(it).find("select").val();
			}
			formArr.push(reObj);
		})

		console.log(formArr);

		let errorCnt = 0;
		// 승인대상을 선택하지 않으면
		if(appArr.length == 0){
			Swal.fire({
				title: 'ERROR',
				text:'문서를 보낼 대상을 선택하세요.',
				icon:'error'
			})
			errorCnt++;
		}
		if(1==1){
			// 중요표시에 입력 안하면
			$(formArr).each(function (index, item) {
				if ((item.cusReq == "Y" && item.eachData == "") || (/선택/.test(item.cusType) && item.cusReq == "Y" && item.eachData == "미선택")) {
					Swal.fire({
						title: 'ERROR',
						text:'필수입력창에 값을 넣지 않았습니다.',
						icon:'error'
					})
					errorCnt++;
				}
			})
			console.log('ssssssssssssssssssss');
		}
		console.log(errorCnt);
		if (errorCnt == 0) {
			$.ajax({
                url: "wfForm/makeDoc",
                method: "POST",
                data: JSON.stringify({
					formName: formTitle,
					formNo: formNo1,
                    objArr: formArr,
                    conDb: cusCon,
					approveArr: appArr,
					docMaker: docWriter
                }),
                contentType: "application/json",
                success: function (d) {
					console.log("문서추가 success :: ");
					// console.log(d);
                    Swal.fire({
                        title: "SUCCESS",
                        text: "문서를 성공적으로 생성하였습니다.",
                        icon: "success",
                    }).then(function () {
                        location.reload();
                    });
                },
                error: function () {
                    console.log("문서추가 에러");
                },
            });
		}

	})


});


