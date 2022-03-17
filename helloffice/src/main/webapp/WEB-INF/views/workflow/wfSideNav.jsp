<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>





	<div class="d-flex" style="width: 99%;">
		<div class="card col-3 me-3 p-1">
            <div class="card-body pt-2">
				<h5 class="card-title">${loginEmp.empName}님의 문서함</h5>
				<!-- Large Modal -->
				<button type="button" class="btn btn-primary w-100" data-bs-toggle="modal" data-bs-target="#largeModal">
					<i class="bi-search"></i>&nbsp; 검색
				</button><br><br>

				<div class="modal fade" id="largeModal" tabindex="-1">
					<div class="modal-dialog modal-lg">
						<div class="modal-content">
							<div class="modal-header">
								<div class="search-bar">
									<form class="search-form d-flex align-items-center" method="POST" action="#">
										<input type="text" name="query" placeholder="Search" title="Enter search keyword">
										<button type="submit" title="Search"><i class="bi bi-search"></i></button>
									</form>
								</div><!-- End Search Bar -->
								<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							</div>
							<div class="modal-body">
								검색 결과
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
							</div>
						</div>
					</div>
				</div><!-- End Large Modal-->
				<hr>
				<!-- Vertical Pills Tabs -->
				<div class="d-flex align-items-start ">
					<div class="nav flex-column nav-pills w-100 " id="v-pills-tab" role="tablist" aria-orientation="vertical">
						<h5 class="card-title">문서 상태</h5>
						<button class="nav-link active" id="v-pills-progress-tab" data-bs-toggle="pill" data-bs-target="#v-pills-progress" type="button" role="tab" aria-controls="v-pills-progress" aria-selected="true">진행 중</button>
						<button class="nav-link" id="v-pills-complete-tab" data-bs-toggle="pill" data-bs-target="#v-pills-complete" type="button" role="tab" aria-controls="v-pills-complete" aria-selected="false">완료</button>
						<button class="nav-link" id="v-pills-important-tab" data-bs-toggle="pill" data-bs-target="#v-pills-important" type="button" role="tab" aria-controls="v-pills-important" aria-selected="false">중요</button>
						<%-- <button class="nav-link" id="v-pills-department-tab" data-bs-toggle="pill" data-bs-target="#v-pills-department" type="button" role="tab" aria-controls="v-pills-department" aria-selected="false">부서별</button> --%>
						<hr>
						<h5 class="card-title">필터</h5>
						<div class="row mb-2">
							<label class="col-sm-3 col-form-label">양식</label>
							<div class="col-sm-9">
								<select class="form-select" aria-label="select example">
									<option >선택 없음</option>
								<c:forEach items="${wfFormList}" var="fl">
									<option value="${fl.formNo}">${fl.formName}</option>
								</c:forEach>
								</select>
							</div>
						</div>
						<div class="row ">
							<label class="col-sm-3 col-form-label">기간</label>
							<div class="col-sm-9">
								<select class="form-select" aria-label="multiple select example">
								<option selected>Open this select menu</option>
								<option value="1">One</option>
								<option value="2">Two</option>
								<option value="3">Three</option>
								</select>
							</div>
						</div>

					</div>
				</div>
					<%-- d-flex end --%>

				<!-- End Vertical Pills Tabs -->

			</div>
        </div>	<%-- card end --%>
