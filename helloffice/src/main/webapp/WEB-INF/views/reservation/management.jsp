<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/common/head.jsp" %>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<body>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>

	<main id="main" class="main">
	
		<h2>예약 관리</h2>

        <ul class="nav nav-tabs nav-tabs-bordered d-flex" id="borderedTabJustified" role="tablist">
          <li class="nav-item flex-fill" role="presentation">
            <button class="nav-link w-100 active" id="home-tab" data-bs-toggle="tab" data-bs-target="#bordered-justified-home" type="button" role="tab" aria-controls="home" aria-selected="true">자산 관리</button>
          </li>
          <li class="nav-item flex-fill" role="presentation">
            <button class="nav-link w-100" id="reserv-tab" data-bs-toggle="tab" data-bs-target="#bordered-justified-profile" type="button" role="tab" aria-controls="profile" aria-selected="false">예약 신청 관리</button>
          </li>
          <li class="nav-item flex-fill" role="presentation">
            <button class="nav-link w-100" id="contact-tab" data-bs-toggle="tab" data-bs-target="#bordered-justified-contact" type="button" role="tab" aria-controls="contact" aria-selected="false">관리자 설정</button>
          </li>
        </ul>
        <div class="tab-content pt-2" id="borderedTabJustifiedContent">
          <!-- 자산 관리 탭 -->
          <div class="tab-pane fade show active" id="bordered-justified-home" role="tabpanel" aria-labelledby="home-tab">
          	<button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addAssetModal">자산 추가</button>
              <table class="table table-borderless table-hover" style="vertical-align:middle;">
                <thead>
                  <tr>
                    <th scope="col">자산 번호</th>
                    <th scope="col">이름</th>
                    <th scope="col"></th>
                  </tr>
                </thead>
                <tbody>
	                <c:forEach items="${assetList}" var="a">
	                  <tr>
	                    <th scope="row">${a.assetNo}</th>
	                    <td>${a.assetName}</td>
	                    <td><button type="button" class="btn btn-secondary rounded-pill asset-setting" onClick="assetDetail(${a.assetNo})" data-bs-toggle="modal" data-bs-target="#assetModal">설정</button></td>
	                  </tr>
	                </c:forEach>
                </tbody>
              </table>
          </div><!-- 자산 관리 탭 end -->
          <!-- 예약 신청 관리 탭 -->
          <div class="tab-pane fade" id="bordered-justified-profile" role="tabpanel" aria-labelledby="profile-tab">
            <table class="table table-borderless table-hover" style="vertical-align:middle;">
                <thead>
                  <tr>
                    <th scope="col">예약 번호</th>
                    <th scope="col">예약 자산</th>
                    <th scope="col">예약자</th>
                    <th scope="col">예약일자</th>
                    <th scope="col">예약시간</th>
                    <th scope="col">상태</th>
                    <th scope="col"></th>
                  </tr>
                </thead>
                <tbody id="reservList">
                  
                </tbody>
              </table>
          </div><!-- 예약 신청 관리 탭 end -->
          <!-- 관리자 설정 탭 -->
          <div class="tab-pane fade" id="bordered-justified-contact" role="tabpanel" aria-labelledby="contact-tab">
          	<button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addAdminModal">관리자 추가</button>
          
            <table class="table table-borderless table-hover" style="vertical-align:middle;">
                <thead>
                  <tr>
                    <th scope="col">이름</th>
                    <th scope="col">직급</th>
                    <th scope="col">부서</th>
                    <th scope="col">권한</th>
                    <th scope="col"></th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td>Brandon Jacob</td>
                    <td>Designer</td>
                    <td>28</td>
                    <td>2016-05-25</td>
                    <td><button type="button" class="btn btn-secondary rounded-pill" data-bs-toggle="modal" data-bs-target="#adminModal">설정</button></td>
                  </tr>
                  <tr>
                    <td>Bridie Kessler</td>
                    <td>Developer</td>
                    <td>35</td>
                    <td>2014-12-05</td>
                    <td><button type="button" class="btn btn-secondary rounded-pill" data-bs-toggle="modal" data-bs-target="#adminModal">설정</button></td>
                  </tr>
                </tbody>
              </table>
          </div><!-- 관리자 설정 탭 end -->
        </div>
        
        <!-- modal -->
		<!-- 자산 설정 모달 -->
        <div class="modal fade" id="assetModal" tabindex="-1">
          <div class="modal-dialog modal-lg">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title">자산 설정</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              <div class="modal-body">
	              <form class="row g-3">
	                <div class="col-md-12">
	                  <div class="form-floating">
	                    <input type="hidden" class="form-control" id="assetNo" name="assetNo" >
	                    <input type="text" class="form-control" id="assetName" name="assetName" >
	                    <label for="floatingName">자산 이름</label>
	                  </div>
	                </div>
	                <div class="col-12">
	                  <div class="form-floating">
	                    <textarea class="form-control" id="assetDetail" name="assetDetail" style="height: 100px;"></textarea>
	                    <label for="floatingTextarea">자산 설명</label>
	                  </div>
	                </div>
	                <div class="col-md-6">
	                  <div class="form-floating mb-3">
	                    <select class="form-select" id="approval" name="approval">
	                      <option value="auto">자동 승인</option>
	                      <option value="manual">수동 승인</option>
	                    </select>
	                    <label for="approveSelect">승인 방식</label>
	                  </div>
	                </div>
	                <div class="col-md-6">
	                  <div class="form-floating mb-3">
	                    <select class="form-select" id="returning" name="returning">
	                      <option value="auto">자동 반납</option>
	                      <option value="manual">수동 반납</option>
	                    </select>
	                    <label for="returnSelect">반납 방식</label>
	                  </div>
	                </div>
	                <div class="text-center">
	                  <button type="button" id="updateAsset" class="btn btn-primary">설정하기</button>
	                  <button type="button" id="deleteAsset" class="btn btn-secondary">삭제하기</button>
	                </div>
	              </form>
              </div>
            </div>
          </div>
        </div><!-- 자산 설정 모달 end-->
        
		<!-- 예약 설정 모달 -->
        <div class="modal fade" id="reservModal" tabindex="-1">
          <div class="modal-dialog modal-lg">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title">예약 설정</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              <div class="modal-body">
	              <form class="row g-3">
	                <div class="col-md-12">
	                  <div class="form-floating">
	                    <input type="text" class="form-control" id="reservNo" hidden>
	                    <input type="text" class="form-control" id="res-assetName" readonly>
	                    <label for="floatingName">자산 이름</label>
	                  </div>
	                </div>
	                <div class="col-12">
	                  <div class="form-floating">
	                    <textarea class="form-control" id="reason" style="height: 100px;" readonly></textarea>
	                    <label for="floatingTextarea">예약 사유</label>
	                  </div>
	                </div>
	                <div class="col-12">
	                 <div class="row">
		                 <div class="col-md-6">
		                  <div class="form-floating">
		                    <input type="date" class="form-control" id="reservDate" readonly>
		                    <label for="reservDate">예약 일자</label>
		                  </div>
		                 </div>
		                 <div class="col-md-3">
		                  <div class="form-floating">
		                    <input type="time" class="form-control" id="startTime" readonly>
		                    <label for="startTime">시작 시간</label>
		                  </div>
		                 </div>
		                 <div class="col-md-3">
		                  <div class="form-floating">
		                    <input type="time" class="form-control" id="endTime" readonly>
		                    <label for="endTime">종료 시간</label>
		                  </div>
		                 </div>
		                </div>
	                 </div>
	                <div class="col-md-6">
	                  <div class="col-md-12">
	                    <div class="form-floating">
	                      <input type="text" class="form-control" id="res-empName" readonly>
	                      <label for="floatingCity">예약자</label>
	                    </div>
	                  </div>
	                </div>
	                <div class="col-md-6">
	                  <div class="form-floating mb-3">
	                    <select class="form-select" id="status" name="status">
	                      <option value="승인대기">승인대기</option>
	                      <option value="승인거절">승인거절</option>
	                      <option value="승인완료">승인완료</option>
	                    </select>
	                    <label for="floatingSelect">상태</label>
	                  </div>
	                </div>
	                <div class="text-center">
	                  <button type="button" id="updateReserv" class="btn btn-primary">설정하기</button>
	                  <button type="reset" class="btn btn-secondary">취소하기</button>
	                </div>
	              </form>
              </div>
            </div>
          </div>
        </div><!-- 예약 설정 모달 end-->		

		<!-- 관리자 설정 모달 -->
        <div class="modal fade" id="adminModal" tabindex="-1">
          <div class="modal-dialog modal-lg">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title">관리자 설정</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              <div class="modal-body">
	              <form class="row g-3">
	                <div class="col-md-4">
	                  <div class="form-floating">
	                    <input type="text" class="form-control" id="floatingName" placeholder="Your Name">
	                    <label for="floatingName">관리자 이름</label>
	                  </div>
	                </div>
	                <div class="col-md-4">
	                  <div class="form-floating">
	                    <input type="text" class="form-control" id="floatingName" placeholder="Your Name">
	                    <label for="floatingName">직급</label>
	                  </div>
	                </div>
	                <div class="col-md-4">
	                  <div class="form-floating">
	                    <input type="text" class="form-control" id="floatingName" placeholder="Your Name">
	                    <label for="floatingName">부서</label>
	                  </div>
	                </div>
	                <fieldset class="row mb-3 mt-3">
	                  <legend class="col-form-label col-sm-2 pt-0">권한</legend>
	                  <div class="col-sm-10">
	                    <div class="form-check">
	                      <input class="form-check-input" type="radio" name="gridRadios" id="gridRadios1" value="option1">
	                      <label class="form-check-label" for="gridRadios1">
	                        Level 1. 예약
	                      </label>
	                    </div>
	                    <div class="form-check">
	                      <input class="form-check-input" type="radio" name="gridRadios" id="gridRadios2" value="option2">
	                      <label class="form-check-label" for="gridRadios2">
	                        Level 2. 예약, 자산
	                      </label>
	                    </div>
	                    <div class="form-check disabled">
	                      <input class="form-check-input" type="radio" name="gridRadios" id="gridRadios3" value="option3">
	                      <label class="form-check-label" for="gridRadios3">
	                        Level 3. 예약, 자산, 관리자
	                      </label>
	                    </div>
	                  </div>
                	</fieldset>
	                <div class="text-center">
	                  <button type="submit" class="btn btn-primary">설정하기</button>
	                  <button type="reset" class="btn btn-secondary">취소하기</button>
	                </div>
	              </form>
              </div>
            </div>
          </div>
        </div><!-- 관리자 설정 모달 end-->
        
		<!-- 자산 추가 모달 -->
        <div class="modal fade" id="addAssetModal" tabindex="-1">
          <div class="modal-dialog modal-lg">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title">자산 추가</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              <div class="modal-body">
	              <form class="row g-3" id="assetForm">
	                <div class="col-md-12">
	                  <div class="form-floating">
	                    <input type="text" class="form-control" id="assetName" name="assetName">
	                    <label for="assetName">자산 이름</label>
	                  </div>
	                </div>
	                <div class="col-12">
	                  <div class="form-floating">
	                    <textarea class="form-control" id="assetDetail" name="assetDetail" style="height: 100px;"></textarea>
	                    <label for="assetDetail">자산 설명</label>
	                  </div>
	                </div>
	                <div class="col-md-6">
	                  <div class="form-floating mb-3">
	                    <select class="form-select" id="approveSelect" name="approval">
	                      <option value="auto" selected>자동 승인</option>
	                      <option value="manual">수동 승인</option>
	                    </select>
	                    <label for="approveSelect">승인 방식</label>
	                  </div>
	                </div>
	                <div class="col-md-6">
	                  <div class="form-floating mb-3">
	                    <select class="form-select" id="returnSelect" name="returning">
	                      <option value="auto" selected>자동 반납</option>
	                      <option value="manual">수동 반납</option>
	                    </select>
	                    <label for="returnSelect">반납 방식</label>
	                  </div>
	                </div>
	                <div class="text-center">
	                  <button type="button" class="btn btn-primary" id="assetSubmit">설정하기</button>
	                  <button type="reset" class="btn btn-secondary">취소하기</button>
	                </div>
	              </form>
              </div>
            </div>
          </div>
        </div><!-- 자산 추가 모달 end-->  
        
        <!-- 관리자 추가 모달 -->
        <div class="modal fade" id="addAdminModal" tabindex="-1">
          <div class="modal-dialog modal-lg">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title">관리자 추가</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              <div class="modal-body">
	              <form class="row g-3">
	                <div class="col-md-4">
	                  <div class="form-floating">
	                    <input type="text" class="form-control" id="floatingName" placeholder="Your Name">
	                    <label for="floatingName">관리자 이름</label>
	                  </div>
	                </div>
	                <div class="col-md-4">
	                  <div class="form-floating">
	                    <input type="text" class="form-control" id="floatingName" placeholder="Your Name">
	                    <label for="floatingName">직급</label>
	                  </div>
	                </div>
	                <div class="col-md-4">
	                  <div class="form-floating">
	                    <input type="text" class="form-control" id="floatingName" placeholder="Your Name">
	                    <label for="floatingName">부서</label>
	                  </div>
	                </div>
	                <fieldset class="row mb-3 mt-3">
	                  <legend class="col-form-label col-sm-2 pt-0">권한</legend>
	                  <div class="col-sm-10">
	                    <div class="form-check">
	                      <input class="form-check-input" type="radio" name="gridRadios" id="gridRadios1" value="option1">
	                      <label class="form-check-label" for="gridRadios1">
	                        Level 1. 예약
	                      </label>
	                    </div>
	                    <div class="form-check">
	                      <input class="form-check-input" type="radio" name="gridRadios" id="gridRadios2" value="option2">
	                      <label class="form-check-label" for="gridRadios2">
	                        Level 2. 예약, 자산
	                      </label>
	                    </div>
	                    <div class="form-check disabled">
	                      <input class="form-check-input" type="radio" name="gridRadios" id="gridRadios3" value="option3">
	                      <label class="form-check-label" for="gridRadios3">
	                        Level 3. 예약, 자산, 관리자
	                      </label>
	                    </div>
	                  </div>
                	</fieldset>
	                <div class="text-center">
	                  <button type="submit" class="btn btn-primary">설정하기</button>
	                  <button type="reset" class="btn btn-secondary">취소하기</button>
	                </div>
	              </form>
              </div>
            </div>
          </div>
        </div><!-- 관리자 추가 모달 end-->      
	</main>
	<script type="text/javascript">
		let currentUrl = document.location.pathname;
		let reservations = {};
		
		/* 자산 설정 조회 */
		function assetDetail(no){
			$.ajax({
				type: 'GET',
				url: currentUrl + '/' + no,
			}).done(function(data){
				$('#assetModal #assetNo').val(data.assetNo);
				$('#assetModal #assetName').val(data.assetName);
				$('#assetModal #assetDetail').val(data.assetDetail);
				$('#assetModal #approval').val(data.approval).prop("selected", true);
				$('#assetModal #returning').val(data.returning).prop("selected", true);
				$('#assetModal').modal('show');

			}).fail(function(){
				Swal.fire(
					'error',
					'서버와 연결중 오류가 발생했습니다.'
				)
			});
		}
		
		/* 자산 추가 */
		$('#assetSubmit').click(function(){

			$.ajax({

				type: "POST",
				url: currentUrl, 
				data: $('#assetForm').serialize()
			
			}).done(function(data){
				Swal.fire({					
					icon: 'success',
					text: '성공적으로 추가되었습니다.',
					confirmButtonText: '확인'
				}).then((result) => {
					if(result.isConfirmed){
						$('#addAssetModal').modal('hide');
						window.location.href = currentUrl;
					}
				});
				
			}).fail(function(){
				Swal.fire(
					'error',
					'서버와 연결중 오류가 발생했습니다.'
				)
			});
			
		});

		// 자산 수정
		$('#updateAsset').click(function(){

			let updateData = {
				"assetName": $('#assetModal #assetName').val(),
				"assetDetail": $('#assetModal #assetDetail').val(),
				"approval": $('#assetModal #approval').val(),
				"returning": $('#assetModal #returning').val()
			};

			$.ajax({
				type: 'PUT',
				url: currentUrl + "/" + $('#assetModal #assetNo').val(),
				contentType: 'application/json; charset=utf-8',
				data: JSON.stringify(updateData)
			}).done(function(data){
				if(data === "ok"){
						Swal.fire({					
						icon: 'success',
						text: '설정이 완료되었습니다.',
						confirmButtonText: '확인'
					}).then((result) => {
						if(result.isConfirmed){
							$('#assetModal').modal('hide');
							window.location.href = currentUrl;
						}
					});
				}else{
					Swal.fire(
						'error',
						'업데이트 중 오류가 발생했습니다.'
					)
				}
			}).fail(function(){
				Swal.fire(
					'error',
					'업데이트 중 오류가 발생했습니다.'
				)
			});
		});

		function formatDay(date){
			let year = date.getFullYear();
			let month = (date.getMonth() + 1).toString().padStart(2,'0');
			let day = (date.getDate() + 1).toString().padStart(2,'0');
			let dayFormat = year + '-' + month  + '-' + day;
			return dayFormat;
		};

		function formatTime(date){
			let hour = date.getHours().toString().padStart(2,'0');
			let minute = date.getMinutes().toString().padStart(2,'0');
			let time = hour + ":" + minute;
			return time;
		};

		function setReserve(no){
			let res = reservations[no];
			let start = new Date(res['startTime']);
			let end = new Date(res['endTime']);
			$('#reservNo').val(no)
			$('#res-assetName').val(res['assetName']);
			$('#reason').val(res['reason']);
			$('#reservDate').val(formatDay(start));
			$('#startTime').val(formatTime(start));
			$('#endTime').val(formatTime(end));
			$('#res-empName').val(res['empName']);
			$('#status option').each(function(){
				if($(this).val() === res['status']) {
					$(this).prop("selected", true);
				}
			});
		}

		// 예약 신청 목록 조회
		$('#reserv-tab').click(function(){
			$.ajax({
				type: 'GET',
				url: currentUrl + "/reserv",
				dataType: 'json'
			}).done(function(data){
				$('#reservList').empty();
				reservations = data;
				for (const key in data) {
					let start = new Date(data[key]['startTime']);
					let end = new Date(data[key]['endTime']);
					let date = formatDay(start);
					let startTime = formatTime(start);
					let endTime = formatTime(end);
					let template = 
						`<tr>
							<th scope="row">${ '${data[key]["reservNo"]}' }</th>
							<td>${ '${data[key]["assetName"]}' }</td>
							<td>${ '${data[key]["empName"]}' }</td>
							<td>${ '${date}' }</td>
							<td>${ '${startTime}' } - ${ '${endTime}' }</td>
							<td>${ '${data[key]["status"]}' }</td>
							<td><button type="button" onClick="setReserve(${ '${key}' })" class="btn btn-secondary rounded-pill" data-bs-toggle="modal" data-bs-target="#reservModal">설정</button></td>
						</tr>`;
					$('#reservList').append(template);
				}
			}).fail(function(){
				Swal.fire(
					'error',
					'신청 목록을 불러오는 중에 오류가 발생했습니다.'
				)
			});
		});

		// 예약 상태 변경
		$('#updateReserv').click(function(){
			let sendData = {"status": $('#status').val()};
			$.ajax({
				type: 'PUT',
				url: currentUrl + "/reserv/" + $('#reservNo').val(),
				contentType: 'application/json; charset=utf-8',
				data: JSON.stringify(sendData)
			}).done(function(data){
				if(data === "ok"){
						Swal.fire({					
						icon: 'success',
						text: '설정이 완료되었습니다.',
						confirmButtonText: '확인'
					}).then((result) => {
						if(result.isConfirmed){
							$('#reservModal').modal('hide');
							window.location.href = currentUrl;
						}
					});
				}else{
					Swal.fire(
						'error',
						'업데이트 중 오류가 발생했습니다.'
					)
				}
			}).fail(function(){
				Swal.fire(
					'error',
					'업데이트 중 오류가 발생했습니다.'
				)
			});

		});
		
		// 자산 삭제
		$('#deleteAsset').click(function(){
			$.ajax({
				
				type: 'DELETE',
				url: currentUrl + "/" + $('#assetModal #assetNo').val()
				
			}).done(function(data){
				if(data === "ok"){
					Swal.fire({					
					icon: 'success',
					text: '삭제가 완료되었습니다.',
					confirmButtonText: '확인'
				}).then((result) => {
					if(result.isConfirmed){
						$('#assetModal').modal('hide');
						window.location.href = currentUrl;
					}
				});
			}else{
				Swal.fire(
					'error',
					'업데이트 중 오류가 발생했습니다.'
				)
			}
				
			}).fail(function(){
				Swal.fire(
						'error',
						'삭제 중 오류가 발생했습니다.'
					)
			});
		});
	
	</script>
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>