$(document).ready(function () {

	// ====== 중요표시 설정하기(내문서함) ======
	$(document).on('click', "i[class*='bi-star']", function () {
		let docTNo1 = $(this).parent().parent().find(".doc_docTNo").text();
		if ($(this).hasClass('bi-star')) {
			$(this).removeClass('bi-star');
			$(this).addClass('bi-star-fill');
		} else if ($(this).hasClass('bi-star-fill')) {
			$(this).removeClass('bi-star-fill');
			$(this).addClass('bi-star');
		}
		console.log(docTNo1);
		$.ajax({
            url: "myWf/changeImpor",
			method: "GET",
			data: { docTNo: docTNo1 },
			success: function (d) {
				console.log('중요표시 성공ㅇㅇㅇㅇㅇ');
				console.log(d);
				$(".tab-content").load(location.href + " .tab-content");
			}, error: function () {
				console.log('통신(중요표시 변경) 실패');
			}
        });
	});

	// ====== 문서 상세조회 ======
	let targetAdd1 = '<div class="my_per justify-content-between align-items-center p-2 d-flex"><img src="/helloffice/resources/assets/img/favicon.png" width="25px"><div class="per_name">&nbsp; ';
	let targetAdd2wait = '</div><div data-bs-toggle="tooltip" data-bs-placement="top" title="승인 대기"><i class="bi-clock-history" style="color: grey;"></i></div></div>';
	let targetAdd2ok = '</div><div data-bs-toggle="tooltip" data-bs-placement="top" title="승인"><i class="bi-check2" style="color: green;"></i></div></div>';
	let targetAdd2no = '</div><div data-bs-toggle="tooltip" data-bs-placement="top" title="거절"><i class="bi-x" style="color: red;"></i></div></div>';

	$(document).on("click", ".doc_formName", function () {
		let docTNo1 = $(this).parent().find(".doc_docTNo").text();
		// console.log(docTNo1);

		$.ajax({
            url: "myWf/getEachDoc",
            method: "GET",
			data: { docTNo: docTNo1 },
			success: function (d) {
				console.log(d);
				$(".wofCon1").addClass('hide');
				$(".myDcontainer").empty();
				$(".title_cus1").text(d[0].formName);
				$(".doc_writer1").text(d[0].empName);
				$(".doc_writeDate1").text(d[0].writeDate);
				$('.doc_docName1').text(d[0].docName);
				$('.doc_docTNo1').text(d[0].docTNo);
				if (d[0].conDb != '0') {
					$(".wofCon1").removeClass('hide');
					$(".wofCon1 iframe").get(0).contentWindow.document.body.innerHTML = d[0].conDb;
				}
				const tbSet = `<table class="table table-borderless hide">
								<colgroup>
									<col style="width: 30%">
									<col style="width: 70%">
								</colgroup>
							</table>`;
				$(".myDcontainer").append(tbSet);
				$(d).each(function (index, item) {
					$(".myDcontainer table").removeClass('hide');
					if (item.eachData != null) {
						let trtd = `<tr>
						<td class="pb-3">${item.cusLabel}</td>
						<td class="pb-3">${item.eachData}</td>
						</tr>`;
						$(".myDcontainer table").append(trtd);
					}
				})
			}, error: function () {
				console.log('통신(상세조회) 실패');
			}
		});
		$.ajax({
			url: 'myWf/getDocStep',
			method: 'GET',
			data: { docTNo: docTNo1 },
			success: function (d) {
				console.log(d);
				$("#hereIsDoc .stepForm").empty();
				const waitLabel = `<span class="every_app badge rounded-pill bg-secondary">대기</span>`;
				const endLabel = `<span class="every_app badge rounded-pill bg-success">완료</span>`;
				const noLabel = `<span class="every_app badge rounded-pill bg-danger">거절</span>`;
				$(d).each(function (index, item) {
                    //단계 단순 추가하기
					let docStepLabel1 = `<div class="stepShell">
											<div class="card p-2 mb-3">
												<div class="p-2 d-flex justify-content-between align-items-center">
													<div class="steps">${item.appStep + 1}단계</div>
													<div class="doc_status">`;
					let docStepLabel2 =	`			</div>
												</div>
												<div class="person_list">
												</div>
											</div>
										</div>`;
					let eachStepNum = item.appStep + 1 + "단계";
					let docStepLabel = docStepLabel1 + docStepLabel2;
					if (!$("#hereIsDoc .steps").text().match(eachStepNum)) {
                        $("#hereIsDoc .stepForm").append(docStepLabel);
                    }
				});
				//안에 승인자 추가하기
				$('#hereIsDoc .stepForm').find('.stepShell').each(function (index, item) {
					let finalTargetAdd = "";
					$(d).each(function (ind, it) {
						if (index == it.appStep) {
							if (it.appStatus == '승인대기') {
								let targetAdd3 = targetAdd1 + it.empName + targetAdd2wait;
								finalTargetAdd += targetAdd3;
							} else if (it.appStatus == '승인') {
								let targetAdd3 = targetAdd1 + it.empName + targetAdd2ok;
								finalTargetAdd += targetAdd3;
							} else {
								let targetAdd3 = targetAdd1 + it.empName + targetAdd2no;
								finalTargetAdd += targetAdd3;
							}
						}
					})
					$(item).find('.person_list').append(finalTargetAdd);
				})
				//단계 상태별로 배지(대기/완료/거절) 달기
				$("#hereIsDoc .person_list").each(function (index, item) {
					let okCnt = 0;
					let noCnt = 0;
					$(item).find('.my_per').each(function (ind, it) {
						if ($(it).find('i').eq(0).hasClass('bi-check2')) {
							okCnt++;
						} else if($(it).find('i').eq(0).hasClass('bi-x')){
							noCnt++;
						}
					})
					console.log(okCnt);
					console.log(noCnt);
					console.log('=====');
					// 다 승인하면
					if ($(item).find('.my_per').length == okCnt) {
						$(item).parent().find(".doc_status").eq(0).html(endLabel);
					} else {
						// 하나라도 거절하면
						if (noCnt > 0) {
							$(item).parent().find(".doc_status").eq(0).html(noLabel);
						} else {
							$(item).parent().find(".doc_status").eq(0).html(waitLabel);
						}
					}
				})

				// 승인자에 내가 있으면(받은 문서함이면) 승인/거절버튼 활성화
				const closeForm = `<button type="button" class="btn btn-secondary closeForm mx-1" data-bs-dismiss="modal" tabindex="-1">닫기</button>`;
				const noApp = `<button type="button" class="btn btn-danger no_app mx-1" tabindex="-1">거절</button>`;
				const yesApp = `<button type="button" class="btn btn-success yes_app mx-1" tabindex="-1"><i class="bi-check-lg"></i>&nbsp;승인하기</button>`;
				$(".isMine").empty();
				$(".isMine").append(closeForm);
				$(d).each(function (index, item) {
					let aa = $(".docApprover").text()
					if (aa == item.empName) {
						$(".isMine").append(noApp);
						$(".isMine").append(yesApp);
						return false;
					}
				})

				// 내 차례 됐는지 확인
				$('.per_name').each(function (index, item) {
					console.log($(".docApprover").text().trim());
					if ($(item).text().match($(".docApprover").text().trim())) {
						console.log(index + "여기");
						console.log($(item).parent().parent().parent().find('.steps').text());
						let stepName = $(item).parent().parent().parent().parent().prev();
						console.log(stepName);
						if (stepName.length > 0) {
							console.log($(stepName).find(".every_app").text());
							if ($(stepName).find('.every_app').text() != '완료') {
								$(".no_app").css({ 'pointer-events': 'none', opacity: 0.5 });
								$(".yes_app").css({ 'pointer-events': 'none', opacity: 0.5 });
							}
						}
					}
				})
			}, error: function () {
				console.log('통신(승인단계조회) 실패');
			}
		})
	});

	// ====== 승인하기 ======
	// console.log(($('.doc_docTNo1').text()));
	$(document).on('click', '.yes_app', function () {
		// console.log($(".doc_docTNo1").text());
		// console.log($('.docApprover').text());
		const chooseDocNo = $(".doc_docTNo1").text();
		const approver = $(".docApprover").text();
		$.ajax({
			url: 'myWf/approve',
			method: 'POST',
			data: JSON.stringify({ docNo: chooseDocNo, empName: approver }),
			contentType: 'application/json',
			success: function (d) {
				console.log(d);
				Swal.fire({
					title: 'SUCCESS',
					text:'성공적으로 승인하였습니다.',
					icon:'success'
				}).then(function () {
					location.reload();
				});
				// location.reload();
			}, error: function () {
				console.log('승인 통신 실패');
			}
		})
	})
	// ====== 거절하기 ======
	// console.log(($('.doc_docTNo1').text()));
	$(document).on('click', '.no_app', function () {
		// console.log($(".doc_docTNo1").text());
		// console.log($('.docApprover').text());
		const chooseDocNo = $(".doc_docTNo1").text();
		const approver = $(".docApprover").text();
		$.ajax({
			url: 'myWf/decline',
			method: 'POST',
			data: JSON.stringify({ docNo: chooseDocNo, empName: approver }),
			contentType: 'application/json',
			success: function (d) {
				console.log(d);
				Swal.fire({
					title: 'SUCCESS',
					text:'성공적으로 거절하였습니다.',
					icon: 'success',
				}).then(function () {
					location.reload();
				});
				// location.reload();
			}, error: function () {
				console.log('승인 통신 실패');
			}
		})
	})


})
