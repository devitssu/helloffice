$(document).ready(function () {

	// ====== 중요표시 설정하기 ======
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
            url: "allWf/changeImpor",
			method: "GET",
			data: { docTNo: docTNo1 },
			success: function (d) {
				console.log('중요표시 성공ㅇㅇㅇㅇㅇ');
				console.log(d);
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
		console.log(docTNo1);
		$.ajax({
            url: "allWf/getEachDoc",
            method: "GET",
			data: { docTNo: docTNo1 },
			success: function (d) {
				console.log(d);
				$(".wofCon1").addClass('hide');
				$(".myDcontainer").empty();
				$(".title_cus1").text(d[0].formName);
				$(".doc_writer1").text(d[0].empName);
				$(".doc_writeDate1").text(d[0].writeDate);
				$('.doc_docTNo1').text(d[0].docName);
				if (d[0].conDb != '0') {
					$(".wofCon1").removeClass('hide');
					$(".wofCon1 iframe").get(0).contentWindow.document.body.innerHTML = d[0].formCon;
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
			url: 'allWf/getDocStep',
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
				let okCnt = 0;
				let noCnt = 0;
				$("#hereIsDoc .person_list").each(function (index, item) {
					$(item).find('.my_per').each(function (ind, it) {
						if ($(it).find('i').eq(0).hasClass('bi-check2')) {
							okCnt++;
						} else if($(it).find('i').eq(0).hasClass('bi-x')){
							noCnt++;
						}
					})
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
			}, error: function () {
				console.log('통신(승인단계조회) 실패');
			}
		})

	});

})
