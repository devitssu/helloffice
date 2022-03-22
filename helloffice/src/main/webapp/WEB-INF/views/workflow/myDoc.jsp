<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/common/head.jsp" %>

<body>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>

	<main id="main" class="main">

	<%@ include file="/WEB-INF/views/workflow/wfNav.jsp" %>
	<%@ include file="/WEB-INF/views/workflow/wfSideNav.jsp" %>


		<%-- 오른쪽 카드 --%>

		<div class="card col-9 p-2 pt-3">
			<div class="card-body pt-2">
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
					<%-- <div class="tab-pane fade" id="v-pills-department" role="tabpanel" aria-labelledby="v-pills-department-tab">
						모든 문서함(관리자)일 때만 나타나기
					</div> --%>
				</div>
            </div>

		</div><%-- card-body end --%>
	</div> <!--d-flex end-->
</div>
	</main>
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>
