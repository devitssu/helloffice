<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/common/head.jsp" %>

<body>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>

	<main id="main" class="main">

	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
		<div class="container-fluid">
			<ul class="navbar-nav">
				<li class="nav-item">
					<a class="nav-link active" href="${root}/workflow"><i class="ri-folder-5-line"></i>내 문서함</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="${root}/workflow/allWf"> <i class="ri-file-zip-line"></i>모든 문서함</a>
				</li>
				<li class="nav-item">
					<a class="nav-link disabled" href="#">자동 워크플로우</a>
				</li>
			</ul>
			<button type="button" class="btn btn-light btn-sm"><i class="bi-pencil-fill"></i> 워크플로우 작성, 요청</button>
		</div>
	</nav>


	<div class="d-flex">
		<div class="card col-3 me-3 p-1">
            <div class="card-body">
				<h5 class="card-title">ㅇㅇㅇ님의 문서함</h5>
				<!-- Large Modal -->
				<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#largeModal">
					검색
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
					<div class="nav flex-column nav-pills  " id="v-pills-tab" role="tablist" aria-orientation="vertical">
						<h5 class="card-title">문서 상태</h5>
						<button class="nav-link active" id="v-pills-progress-tab" data-bs-toggle="pill" data-bs-target="#v-pills-progress" type="button" role="tab" aria-controls="v-pills-progress" aria-selected="true">진행 중</button>
						<button class="nav-link" id="v-pills-complete-tab" data-bs-toggle="pill" data-bs-target="#v-pills-complete" type="button" role="tab" aria-controls="v-pills-complete" aria-selected="false">완료</button>
						<button class="nav-link" id="v-pills-important-tab" data-bs-toggle="pill" data-bs-target="#v-pills-important" type="button" role="tab" aria-controls="v-pills-important" aria-selected="false">중요</button>
						<button class="nav-link" id="v-pills-department-tab" data-bs-toggle="pill" data-bs-target="#v-pills-department" type="button" role="tab" aria-controls="v-pills-department" aria-selected="false">부서별</button>
						<hr>
						<h5 class="card-title">필터</h5>
						<div class="row mb-2">
							<label class="col-sm-3 col-form-label">양식</label>
							<div class="col-sm-9">
								<select class="form-select" aria-label="multiple select example">
								<option selected>Open this select menu</option>
								<option value="1">One</option>
								<option value="2">Two</option>
								<option value="3">Three</option>
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

		<%-- 오른쪽 카드 --%>

		<div class="card col-9 p-2 pt-3">
			<div class="card-body">
				<div class="tab-content" id="v-pills-tabContent col-7 col-sm-9">
					<%-- 진행 중 --%>
					<div class="tab-pane fade show active" id="v-pills-progress" role="tabpanel" aria-labelledby="v-pills-progress-tab">
						<div class="d-flex mt-1">
							<div class="col-2">??개 선택</div>
							<div class="col-6">
								<button type="button" class="btn btn-light btn-sm">
									<i class="bi-check-circle-fill"></i>
								</button>
								<button type="button" class="btn btn-light btn-sm">
									<i class="bi-x-circle-fill"></i>
								</button>
								<button type="button" class="btn btn-light btn-sm">
									<i class="ri-mail-check-fill"></i>
								</button>
							</div>
							<div class="col-2">전체 NN개</div>
							<div class="col-2 form-check form-switch">
								승인 필요 <input class="form-check-input" type="checkbox" id="flexSwitchCheckDefault">
							</div>
						</div>
						<table class="table table-hover mt-2">
							<thead>
							<tr>
								<th scope="col"><input class="form-check-input" type="checkbox" id="gridCheck1"></th>
								<th scope="col">중요</th>
								<th scope="col">부서</th>
								<th scope="col">작성자</th>
								<th scope="col">제목</th>
								<th scope="col">진행</th>
								<th scope="col">마지막 업데이트</th>
							</tr>
							</thead>
							<tbody>
							<tr>
								<th scope="row"><input class="form-check-input" type="checkbox" id="gridCheck1"></th>
								<td><i class="bi-star"></i></td>
								<td>개발부</td>
								<td>Brandon Jacob</td>
								<td>제목ㄱㄱㄱㄱㄱr</td>
								<td><span class="badge rounded-pill bg-success">단계 0/1</span></td>
								<td>2016-05-25</td>
							</tr>
							<tr>
								<th scope="row"><input class="form-check-input" type="checkbox" id="gridCheck1"></th>
								<td><i class="bi-star-fill"></i></td>
								<td>ㅇㅇ부</td>
								<td>Bridie Kessler</td>
								<td>제목ㄱㄱㄱ</td>
								<td><span class="badge rounded-pill bg-primary">완료</span></td>
								<td>2014-12-05</td>
							</tr>
							<tr>
								<th scope="row"><input class="form-check-input" type="checkbox" id="gridCheck1"></th>
								<td><i class="bi-star"></i></td>
								<td>ㅎㅎ부</td>
								<td>Ashleigh Langosh</td>
								<td>제목ㄱㄱㄱ</td>
								<td><span class="badge rounded-pill bg-success">단계 1/2</span></td>
								<td>2011-08-12</td>
							</tr>
							<tr>
								<th scope="row"><input class="form-check-input" type="checkbox" id="gridCheck1"></th>
								<td><i class="bi-star"></i></td>
								<td>ㅍㅍ부</td>
								<td>Angus Grady</td>
								<td>제목ㄱㄱㄱㄱㄱㄱ</td>
								<td><span class="badge rounded-pill bg-success">단계 1/2</span></td>
								<td>2012-06-11</td>
							</tr>
							<tr>
								<th scope="row"><input class="form-check-input" type="checkbox" id="gridCheck1"></th>
								<td><i class="bi-star"></i></td>
								<td>ㄹㄹ부</td>
								<td>Raheem Lehner</td>
								<td>제ㅔㅔㅔㅔㅔ목ㄱㄱㄱㄱ</td>
								<td><span class="badge rounded-pill bg-success">단계 0/3</span></td>
								<td>2011-04-19</td>
							</tr>
							</tbody>
						</table>
						<!-- End Table with hoverable rows -->

						<!-- Pagination with icons -->
						<nav aria-label="Page navigation example">
							<ul class="pagination justify-content-center">
							<li class="page-item">
								<a class="page-link" href="#" aria-label="Previous">
								<span aria-hidden="true">&laquo;</span>
								</a>
							</li>
							<li class="page-item"><a class="page-link" href="#">1</a></li>
							<li class="page-item"><a class="page-link" href="#">2</a></li>
							<li class="page-item"><a class="page-link" href="#">3</a></li>
							<li class="page-item">
								<a class="page-link" href="#" aria-label="Next">
								<span aria-hidden="true">&raquo;</span>
								</a>
							</li>
							</ul>
						</nav><!-- End Pagination with icons -->


					</div>
					<%-- 완료 --%>
					<div class="tab-pane fade" id="v-pills-complete" role="tabpanel" aria-labelledby="v-pills-complete-tab">
						<div class="d-flex mt-1">
							<div class="col-2">??개 선택</div>
							<div class="col-6">
								<button type="button" class="btn btn-light btn-sm">
									<i class="bi-check-circle-fill"></i>
								</button>
								<button type="button" class="btn btn-light btn-sm">
									<i class="bi-x-circle-fill"></i>
								</button>
								<button type="button" class="btn btn-light btn-sm">
									<i class="ri-mail-check-fill"></i>
								</button>
							</div>
							<div class="col-2">전체 NN개</div>
							<div class="col-2 form-check form-switch">
								승인 필요 <input class="form-check-input" type="checkbox" id="flexSwitchCheckDefault">
							</div>
						</div>
						<table class="table table-hover mt-2">
							<thead>
							<tr>
								<th scope="col"><input class="form-check-input" type="checkbox" id="gridCheck1"></th>
								<th scope="col">중요</th>
								<th scope="col">부서</th>
								<th scope="col">작성자</th>
								<th scope="col">제목</th>
								<th scope="col">진행</th>
								<th scope="col">마지막 업데이트</th>
							</tr>
							</thead>
							<tbody>
							<tr>
								<th scope="row"><input class="form-check-input" type="checkbox" id="gridCheck1"></th>
								<td><i class="bi-star"></i></td>
								<td>개발부</td>
								<td>Brandon Jacob</td>
								<td>제목ㄱㄱㄱㄱㄱr</td>
								<td><span class="badge rounded-pill bg-success">단계 0/1</span></td>
								<td>2016-05-25</td>
							</tr>
							<tr>
								<th scope="row"><input class="form-check-input" type="checkbox" id="gridCheck1"></th>
								<td><i class="bi-star-fill"></i></td>
								<td>ㅇㅇ부</td>
								<td>Bridie Kessler</td>
								<td>제목ㄱㄱㄱ</td>
								<td><span class="badge rounded-pill bg-primary">완료</span></td>
								<td>2014-12-05</td>
							</tr>
							<tr>
								<th scope="row"><input class="form-check-input" type="checkbox" id="gridCheck1"></th>
								<td><i class="bi-star"></i></td>
								<td>ㅎㅎ부</td>
								<td>Ashleigh Langosh</td>
								<td>제목ㄱㄱㄱ</td>
								<td><span class="badge rounded-pill bg-success">단계 1/2</span></td>
								<td>2011-08-12</td>
							</tr>
							<tr>
								<th scope="row"><input class="form-check-input" type="checkbox" id="gridCheck1"></th>
								<td><i class="bi-star"></i></td>
								<td>ㅍㅍ부</td>
								<td>Angus Grady</td>
								<td>제목ㄱㄱㄱㄱㄱㄱ</td>
								<td><span class="badge rounded-pill bg-success">단계 1/2</span></td>
								<td>2012-06-11</td>
							</tr>
							<tr>
								<th scope="row"><input class="form-check-input" type="checkbox" id="gridCheck1"></th>
								<td><i class="bi-star"></i></td>
								<td>ㄹㄹ부</td>
								<td>Raheem Lehner</td>
								<td>제ㅔㅔㅔㅔㅔ목ㄱㄱㄱㄱ</td>
								<td><span class="badge rounded-pill bg-success">단계 0/3</span></td>
								<td>2011-04-19</td>
							</tr>
							</tbody>
						</table>
						<!-- End Table with hoverable rows -->

						<!-- Pagination with icons -->
						<nav aria-label="Page navigation example">
							<ul class="pagination justify-content-center">
							<li class="page-item">
								<a class="page-link" href="#" aria-label="Previous">
								<span aria-hidden="true">&laquo;</span>
								</a>
							</li>
							<li class="page-item"><a class="page-link" href="#">1</a></li>
							<li class="page-item"><a class="page-link" href="#">2</a></li>
							<li class="page-item"><a class="page-link" href="#">3</a></li>
							<li class="page-item">
								<a class="page-link" href="#" aria-label="Next">
								<span aria-hidden="true">&raquo;</span>
								</a>
							</li>
							</ul>
						</nav><!-- End Pagination with icons -->
					</div>
					<%-- 중요 --%>
					<div class="tab-pane fade" id="v-pills-important" role="tabpanel" aria-labelledby="v-pills-important-tab">
						<div class="tab-pane fade show active" id="v-pills-progress" role="tabpanel" aria-labelledby="v-pills-progress-tab">
						<div class="d-flex mt-1">
							<div class="col-2">??개 선택</div>
							<div class="col-6">
								<button type="button" class="btn btn-light btn-sm">
									<i class="bi-check-circle-fill"></i>
								</button>
								<button type="button" class="btn btn-light btn-sm">
									<i class="bi-x-circle-fill"></i>
								</button>
								<button type="button" class="btn btn-light btn-sm">
									<i class="ri-mail-check-fill"></i>
								</button>
							</div>
							<div class="col-2">전체 NN개</div>
							<div class="col-2 form-check form-switch">
								승인 필요 <input class="form-check-input" type="checkbox" id="flexSwitchCheckDefault">
							</div>
						</div>
						<table class="table table-hover mt-2">
							<thead>
							<tr>
								<th scope="col"><input class="form-check-input" type="checkbox" id="gridCheck1"></th>
								<th scope="col">중요</th>
								<th scope="col">부서</th>
								<th scope="col">작성자</th>
								<th scope="col">제목</th>
								<th scope="col">진행</th>
								<th scope="col">마지막 업데이트</th>
							</tr>
							</thead>
							<tbody>
							<tr>
								<th scope="row"><input class="form-check-input" type="checkbox" id="gridCheck1"></th>
								<td><i class="bi-star"></i></td>
								<td>개발부</td>
								<td>Brandon Jacob</td>
								<td>제목ㄱㄱㄱㄱㄱr</td>
								<td><span class="badge rounded-pill bg-success">단계 0/1</span></td>
								<td>2016-05-25</td>
							</tr>
							<tr>
								<th scope="row"><input class="form-check-input" type="checkbox" id="gridCheck1"></th>
								<td><i class="bi-star-fill"></i></td>
								<td>ㅇㅇ부</td>
								<td>Bridie Kessler</td>
								<td>제목ㄱㄱㄱ</td>
								<td><span class="badge rounded-pill bg-primary">완료</span></td>
								<td>2014-12-05</td>
							</tr>
							<tr>
								<th scope="row"><input class="form-check-input" type="checkbox" id="gridCheck1"></th>
								<td><i class="bi-star"></i></td>
								<td>ㅎㅎ부</td>
								<td>Ashleigh Langosh</td>
								<td>제목ㄱㄱㄱ</td>
								<td><span class="badge rounded-pill bg-success">단계 1/2</span></td>
								<td>2011-08-12</td>
							</tr>
							<tr>
								<th scope="row"><input class="form-check-input" type="checkbox" id="gridCheck1"></th>
								<td><i class="bi-star"></i></td>
								<td>ㅍㅍ부</td>
								<td>Angus Grady</td>
								<td>제목ㄱㄱㄱㄱㄱㄱ</td>
								<td><span class="badge rounded-pill bg-success">단계 1/2</span></td>
								<td>2012-06-11</td>
							</tr>
							<tr>
								<th scope="row"><input class="form-check-input" type="checkbox" id="gridCheck1"></th>
								<td><i class="bi-star"></i></td>
								<td>ㄹㄹ부</td>
								<td>Raheem Lehner</td>
								<td>제ㅔㅔㅔㅔㅔ목ㄱㄱㄱㄱ</td>
								<td><span class="badge rounded-pill bg-success">단계 0/3</span></td>
								<td>2011-04-19</td>
							</tr>
							</tbody>
						</table>
						<!-- End Table with hoverable rows -->

						<!-- Pagination with icons -->
						<nav aria-label="Page navigation example">
							<ul class="pagination justify-content-center">
							<li class="page-item">
								<a class="page-link" href="#" aria-label="Previous">
								<span aria-hidden="true">&laquo;</span>
								</a>
							</li>
							<li class="page-item"><a class="page-link" href="#">1</a></li>
							<li class="page-item"><a class="page-link" href="#">2</a></li>
							<li class="page-item"><a class="page-link" href="#">3</a></li>
							<li class="page-item">
								<a class="page-link" href="#" aria-label="Next">
								<span aria-hidden="true">&raquo;</span>
								</a>
							</li>
							</ul>
						</nav><!-- End Pagination with icons -->
					</div>
					<%-- 부서별 --%>
					<div class="tab-pane fade" id="v-pills-department" role="tabpanel" aria-labelledby="v-pills-department-tab">
						모든 문서함(관리자)일 때만 나타나기
					</div>
				</div>
            </div>	<%-- card-body end --%>

		</div>
	</div> <!--d-flex end-->

	</main>
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>
