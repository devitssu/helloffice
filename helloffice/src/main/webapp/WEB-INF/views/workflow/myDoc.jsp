<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/common/head.jsp" %>
<head>
	<style>
	.hide{
		display: none;
	}
	</style>

</head>
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
						<div class="d-flex mt-3">
							<div class="col-4"><h3>받은 문서함</h3></div>
							<div class="col-6" style="visibility: hidden;">
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
							<div class="col-2" style="visibility: hidden;">전체 NN개</div>
							<div class="col-2 form-check form-switch" style="visibility: hidden;">
								승인 필요 <input class="form-check-input" type="checkbox" id="flexSwitchCheckDefault">
							</div>
						</div>
						<table class="table table-hover mt-2 get_doc_list">
							<thead>
							<tr class="text-center">
								<th scope="col"><input class="form-check-input" type="checkbox" id="gridCheck"></th>
								<th scope="col">중요</th>
								<th scope="col">부서</th>
								<th scope="col">작성자</th>
								<th scope="col" class="hide">문서번호</th>
								<th scope="col">제목</th>
								<th scope="col">상태</th>
								<th scope="col">작성날짜</th>
							</tr>
							</thead>
							<tbody>
							<c:forEach items="${myGetList}" var="d">
							<c:if test="${d.docStatus == '대기'}">
								<%-- <c:if test="${d.depName eq loginEmp.depName or loginEmp.empRank eq '대표'}"> --%>
								<tr>
									<th scope="row" class="text-center"><input class="form-check-input" type="checkbox" id=""></th>
									<c:choose>
										<c:when test="${d.docImpor == 'N'}">
										<td class="text-center"><i class="bi-star btn btn-sm" style="color:gold;"></i></td>
										</c:when>
										<c:otherwise>
										<td class="text-center"><i class="bi-star-fill btn btn-sm text-center" style="color:gold;"></i></td>
										</c:otherwise>
									</c:choose>
									<td class="text-center">${d.depName}</td>
									<td class="text-center">${d.empName}</td>
									<td class="text-center doc_docTNo hide">${d.docTNo}</td>
									<td class="doc_formName" data-bs-toggle="modal" data-bs-target="#hereIsDoc" style="cursor:pointer;">${d.formName}</td>
									<%-- <c:choose> --%>
										<%-- <c:when test="${d.docStatus == '대기'}"> --%>
										<td class="text-center"><span class="badge rounded-pill bg-secondary">대기</span></td>
										<%-- </c:when>
										<c:otherwise> --%>
										<%-- <td class="text-center"><span class="badge rounded-pill bg-success">완료</span></td>
										</c:otherwise>
									</c:choose> --%>
									<td class="text-center">${d.wd}</td>
								</tr>
								<%-- </c:if> --%>
							</c:if>
							</c:forEach>
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

						<div class="d-flex pt-3">
							<div class="col-4"><h3>보낸 문서함</h3></div>
							<div class="col-6" style="visibility: hidden;">
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
							<div class="col-2" style="visibility: hidden;">전체 NN개</div>
							<div class="col-2 form-check form-switch" style="visibility: hidden;">
								승인 필요 <input class="form-check-input" type="checkbox" id="flexSwitchCheckDefault">
							</div>
						</div>
						<table class="table table-hover mt-2 send_doc_list">
							<thead>
							<tr class="text-center">
								<th scope="col"><input class="form-check-input" type="checkbox" id="gridCheck"></th>
								<th scope="col">중요</th>
								<th scope="col">부서</th>
								<th scope="col">작성자</th>
								<th scope="col" class="hide">문서번호</th>
								<th scope="col">제목</th>
								<th scope="col">상태</th>
								<th scope="col">작성날짜</th>
							</tr>
							</thead>
							<tbody>
							<c:forEach items="${mySendList}" var="d">
							<c:if test="${d.docStatus == '대기'}">
								<%-- <c:if test="${d.depName eq loginEmp.depName or loginEmp.empRank eq '대표'}"> --%>
								<tr>
									<th scope="row" class="text-center"><input class="form-check-input" type="checkbox" id=""></th>
									<c:choose>
										<c:when test="${d.docImpor == 'N'}">
										<td class="text-center"><i class="bi-star btn btn-sm" style="color:gold;"></i></td>
										</c:when>
										<c:otherwise>
										<td class="text-center"><i class="bi-star-fill btn btn-sm text-center" style="color:gold;"></i></td>
										</c:otherwise>
									</c:choose>
									<td class="text-center">${d.depName}</td>
									<td class="text-center">${d.empName}</td>
									<td class="text-center doc_docTNo hide">${d.docTNo}</td>
									<td class="doc_formName" data-bs-toggle="modal" data-bs-target="#hereIsDoc" style="cursor:pointer;">${d.formName}</td>
									<%-- <c:choose> --%>
										<%-- <c:when test="${d.docStatus == '대기'}"> --%>
										<td class="text-center"><span class="badge rounded-pill bg-secondary">대기</span></td>
										<%-- </c:when>
										<c:otherwise> --%>
										<%-- <td class="text-center"><span class="badge rounded-pill bg-success">완료</span></td>
										</c:otherwise>
									</c:choose> --%>
									<td class="text-center">${d.wd}</td>
								</tr>
								<%-- </c:if> --%>
							</c:if>
							</c:forEach>
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
					<div class="tab-pane fade show" id="v-pills-complete" role="tabpanel" aria-labelledby="v-pills-complete-tab">
						<div class="d-flex mb-3">
							<div class="col-4"><h3>받은 문서함</h3></div>
							<div class="col-6" style="visibility: hidden;">
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
							<div class="col-2" style="visibility: hidden;">전체 NN개</div>
							<div class="col-2 form-check form-switch" style="visibility: hidden;">
								승인 필요 <input class="form-check-input" type="checkbox" id="flexSwitchCheckDefault">
							</div>
						</div>
						<table class="table table-hover mt-2 get_doc_list">
							<thead>
							<tr class="text-center">
								<th scope="col"><input class="form-check-input" type="checkbox" id="gridCheck"></th>
								<th scope="col">중요</th>
								<th scope="col">부서</th>
								<th scope="col">작성자</th>
								<th scope="col" class="hide">문서번호</th>
								<th scope="col">제목</th>
								<th scope="col">상태</th>
								<th scope="col">작성날짜</th>
							</tr>
							</thead>
							<tbody>
							<c:forEach items="${myGetList}" var="d">
							<c:if test="${d.docStatus == '완료' or d.docStatus == '거절'}">
								<%-- <c:if test="${d.depName eq loginEmp.depName or loginEmp.empRank eq '대표'}"> --%>
								<tr>
									<th scope="row" class="text-center"><input class="form-check-input" type="checkbox" id=""></th>
									<c:choose>
										<c:when test="${d.docImpor == 'N'}">
										<td class="text-center"><i class="bi-star btn btn-sm" style="color:gold;"></i></td>
										</c:when>
										<c:otherwise>
										<td class="text-center"><i class="bi-star-fill btn btn-sm text-center" style="color:gold;"></i></td>
										</c:otherwise>
									</c:choose>
									<td class="text-center">${d.depName}</td>
									<td class="text-center">${d.empName}</td>
									<td class="text-center hide doc_docTNo">${d.docTNo}</td>
									<td class="doc_formName" data-bs-toggle="modal" data-bs-target="#hereIsDoc" style="cursor:pointer;">${d.formName}</td>
									<c:choose>
										<c:when test="${d.docStatus == '완료'}">
										<td class="text-center"><span class="badge rounded-pill bg-success">완료</span></td>
										</c:when>
										<c:otherwise>
										<td class="text-center"><span class="badge rounded-pill bg-danger">거절</span></td>
										</c:otherwise>
									</c:choose>
									<td class="text-center">${d.wd}</td>
								</tr>
								<%-- </c:if> --%>
							</c:if>
							</c:forEach>
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

						<div class="d-flex pt-3">
							<div class="col-4"><h3>보낸 문서함</h3></div>
							<div class="col-6" style="visibility: hidden;">
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
							<div class="col-2" style="visibility: hidden;">전체 NN개</div>
							<div class="col-2 form-check form-switch" style="visibility: hidden;">
								승인 필요 <input class="form-check-input" type="checkbox" id="flexSwitchCheckDefault">
							</div>
						</div>
						<table class="table table-hover mt-2 send_doc_list">
							<thead>
							<tr class="text-center">
								<th scope="col"><input class="form-check-input" type="checkbox" id="gridCheck"></th>
								<th scope="col">중요</th>
								<th scope="col">부서</th>
								<th scope="col">작성자</th>
								<th scope="col" class="hide">문서번호</th>
								<th scope="col">제목</th>
								<th scope="col">상태</th>
								<th scope="col">작성날짜</th>
							</tr>
							</thead>
							<tbody>
							<c:forEach items="${mySendList}" var="d">
							<c:if test="${d.docStatus == '완료' or d.docStatus == '거절'}">
								<%-- <c:if test="${d.depName eq loginEmp.depName or loginEmp.empRank eq '대표'}"> --%>
								<tr>
									<th scope="row" class="text-center"><input class="form-check-input" type="checkbox" id=""></th>
									<c:choose>
										<c:when test="${d.docImpor == 'N'}">
										<td class="text-center"><i class="bi-star btn btn-sm" style="color:gold;"></i></td>
										</c:when>
										<c:otherwise>
										<td class="text-center"><i class="bi-star-fill btn btn-sm text-center" style="color:gold;"></i></td>
										</c:otherwise>
									</c:choose>
									<td class="text-center">${d.depName}</td>
									<td class="text-center">${d.empName}</td>
									<td class="text-center hide doc_docTNo">${d.docTNo}</td>
									<td class="doc_formName" data-bs-toggle="modal" data-bs-target="#hereIsDoc" style="cursor:pointer;">${d.formName}</td>
									<c:choose>
										<c:when test="${d.docStatus == '완료'}">
										<td class="text-center"><span class="badge rounded-pill bg-success">완료</span></td>
										</c:when>
										<c:otherwise>
										<td class="text-center"><span class="badge rounded-pill bg-danger">거절</span></td>
										</c:otherwise>
									</c:choose>
									<td class="text-center">${d.wd}</td>
								</tr>
								<%-- </c:if> --%>
							</c:if>
							</c:forEach>
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


					<%-- 중요--%>
					<div class="tab-pane fade show mb-3" id="v-pills-important" role="tabpanel" aria-labelledby="v-pills-important-tab">
						<div class="d-flex mb-3">
							<div class="col-4"><h3>받은 문서함</h3></div>
							<div class="col-6" style="visibility: hidden;">
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
							<div class="col-2" style="visibility: hidden;">전체 NN개</div>
							<div class="col-2 form-check form-switch" style="visibility: hidden;">
								승인 필요 <input class="form-check-input" type="checkbox" id="flexSwitchCheckDefault">
							</div>
						</div>
						<table class="table table-hover mt-2 get_doc_list">
							<thead>
							<tr class="text-center">
								<th scope="col"><input class="form-check-input" type="checkbox" id="gridCheck"></th>
								<th scope="col">중요</th>
								<th scope="col">부서</th>
								<th scope="col">작성자</th>
								<th scope="col" class="hide">문서번호</th>
								<th scope="col">제목</th>
								<th scope="col">상태</th>
								<th scope="col">작성날짜</th>
							</tr>
							</thead>
							<tbody>
							<c:forEach items="${myGetList}" var="d">
							<c:if test="${d.docImpor == 'Y'}">
								<c:if test="${d.depName eq loginEmp.depName or loginEmp.empRank eq '대표'}">
								<tr>
									<th scope="row" class="text-center"><input class="form-check-input" type="checkbox" id=""></th>
									<c:choose>
										<c:when test="${d.docImpor == 'N'}">
										<td class="text-center"><i class="bi-star btn btn-sm" style="color:gold;"></i></td>
										</c:when>
										<c:otherwise>
										<td class="text-center"><i class="bi-star-fill btn btn-sm" style="color:gold;"></i></td>
										</c:otherwise>
									</c:choose>
									<td class="text-center">${d.depName}</td>
									<td class="text-center">${d.empName}</td>
									<td class="text-center hide doc_docTNo">${d.docTNo}</td>
									<td class="doc_formName" data-bs-toggle="modal" data-bs-target="#hereIsDoc" style="cursor:pointer;">${d.formName}</td>
									<c:choose>
										<c:when test="${d.docStatus == '대기'}">
										<td class="text-center"><span class="badge rounded-pill bg-secondary">대기</span></td>
										</c:when>
										<c:when test="${d.docStatus == '완료'}">
										<td class="text-center"><span class="badge rounded-pill bg-success">완료</span></td>
										</c:when>
										<c:otherwise>
										<td class="text-center"><span class="badge rounded-pill bg-danger">거절</span></td>
										</c:otherwise>
									</c:choose>
									<td class="text-center">${d.wd}</td>
								</tr>
								</c:if>
							</c:if>
							</c:forEach>
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

						<div class="d-flex pt-3">
							<div class="col-4"><h3>보낸 문서함</h3></div>
							<div class="col-6" style="visibility: hidden;">
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
							<div class="col-2" style="visibility: hidden;">전체 NN개</div>
							<div class="col-2 form-check form-switch" style="visibility: hidden;">
								승인 필요 <input class="form-check-input" type="checkbox" id="flexSwitchCheckDefault">
							</div>
						</div>
						<table class="table table-hover mt-2 send_doc_list">
							<thead>
							<tr class="text-center">
								<th scope="col"><input class="form-check-input" type="checkbox" id="gridCheck"></th>
								<th scope="col">중요</th>
								<th scope="col">부서</th>
								<th scope="col">작성자</th>
								<th scope="col" class="hide">문서번호</th>
								<th scope="col">제목</th>
								<th scope="col">상태</th>
								<th scope="col">작성날짜</th>
							</tr>
							</thead>
							<tbody>
							<c:forEach items="${mySendList}" var="d">
							<c:if test="${d.docImpor == 'Y'}">
								<%-- <c:if test="${d.depName eq loginEmp.depName or loginEmp.empRank eq '대표'}"> --%>
								<tr>
									<th scope="row" class="text-center"><input class="form-check-input" type="checkbox" id=""></th>
									<c:choose>
										<c:when test="${d.docImpor == 'N'}">
										<td class="text-center"><i class="bi-star btn btn-sm" style="color:gold;"></i></td>
										</c:when>
										<c:otherwise>
										<td class="text-center"><i class="bi-star-fill btn btn-sm" style="color:gold;"></i></td>
										</c:otherwise>
									</c:choose>
									<td class="text-center">${d.depName}</td>
									<td class="text-center">${d.empName}</td>
									<td class="text-center hide doc_docTNo">${d.docTNo}</td>
									<td class="doc_formName" data-bs-toggle="modal" data-bs-target="#hereIsDoc" style="cursor:pointer;">${d.formName}</td>
									<c:choose>
										<c:when test="${d.docStatus == '대기'}">
										<td class="text-center"><span class="badge rounded-pill bg-secondary">대기</span></td>
										</c:when>
										<c:when test="${d.docStatus == '완료'}">
										<td class="text-center"><span class="badge rounded-pill bg-success">완료</span></td>
										</c:when>
										<c:otherwise>
										<td class="text-center"><span class="badge rounded-pill bg-danger">거절</span></td>
										</c:otherwise>
									</c:choose>
									<td class="text-center">${d.wd}</td>
								</tr>
								<%-- </c:if> --%>
							</c:if>
							</c:forEach>
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


					<%-- 중요--%>
					<div class="tab-pane fade show" id="v-pills-important" role="tabpanel" aria-labelledby="v-pills-important-tab">
						<div class="d-flex mb-3">
							<div class="col-4"><h3>받은 문서함</h3></div>
							<div class="col-6" style="visibility: hidden;">
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
							<div class="col-2" style="visibility: hidden;">전체 NN개</div>
							<div class="col-2 form-check form-switch" style="visibility: hidden;">
								승인 필요 <input class="form-check-input" type="checkbox" id="flexSwitchCheckDefault">
							</div>
						</div>
						<table class="table table-hover mt-2 doc_list">
							<thead>
							<tr class="text-center">
								<th scope="col"><input class="form-check-input" type="checkbox" id="gridCheck"></th>
								<th scope="col">중요</th>
								<th scope="col">부서</th>
								<th scope="col">작성자</th>
								<th scope="col" class="hide">문서번호</th>
								<th scope="col">제목</th>
								<th scope="col">상태</th>
								<th scope="col">작성날짜</th>
							</tr>
							</thead>
							<tbody>
							<c:forEach items="${myGetList}" var="d">
							<c:if test="${d.docImpor == 'Y'}">
								<%-- <c:if test="${d.depName eq loginEmp.depName or loginEmp.empRank eq '대표'}"> --%>
								<tr>
									<th scope="row" class="text-center"><input class="form-check-input" type="checkbox" id=""></th>
									<c:choose>
										<c:when test="${d.docImpor == 'N'}">
										<td class="text-center"><i class="bi-star btn btn-sm" style="color:gold;"></i></td>
										</c:when>
										<c:otherwise>
										<td class="text-center"><i class="bi-star-fill btn btn-sm" style="color:gold;"></i></td>
										</c:otherwise>
									</c:choose>
									<td class="text-center">${d.depName}</td>
									<td class="text-center">${d.empName}</td>
									<td class="text-center hide doc_docTNo">${d.docTNo}</td>
									<td class="doc_formName" data-bs-toggle="modal" data-bs-target="#hereIsDoc" style="cursor:pointer;">${d.formName}</td>
									<c:choose>
										<c:when test="${d.docStatus == '대기'}">
										<td class="text-center"><span class="badge rounded-pill bg-secondary">대기</span></td>
										</c:when>
										<c:when test="${d.docStatus == '완료'}">
										<td class="text-center"><span class="badge rounded-pill bg-success">완료</span></td>
										</c:when>
										<c:otherwise>
										<td class="text-center"><span class="badge rounded-pill bg-danger">거절</span></td>
										</c:otherwise>
									</c:choose>
									<td class="text-center">${d.wd}</td>
								</tr>
								<%-- </c:if> --%>
							</c:if>
							</c:forEach>
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

						<div class="d-flex pt-3">
							<div class="col-4"><h3>보낸 문서함</h3></div>
							<div class="col-6" style="visibility: hidden;">
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
							<div class="col-2" style="visibility: hidden;">전체 NN개</div>
							<div class="col-2 form-check form-switch" style="visibility: hidden;">
								승인 필요 <input class="form-check-input" type="checkbox" id="flexSwitchCheckDefault">
							</div>
						</div>
						<table class="table table-hover mt-2 doc_list">
							<thead>
							<tr class="text-center">
								<th scope="col"><input class="form-check-input" type="checkbox" id="gridCheck"></th>
								<th scope="col">중요</th>
								<th scope="col">부서</th>
								<th scope="col">작성자</th>
								<th scope="col" class="hide">문서번호</th>
								<th scope="col">제목</th>
								<th scope="col">상태</th>
								<th scope="col">작성날짜</th>
							</tr>
							</thead>
							<tbody>
							<c:forEach items="${mySendList}" var="d">
							<c:if test="${d.docImpor == 'Y'}">
								<%-- <c:if test="${d.depName eq loginEmp.depName or loginEmp.empRank eq '대표'}"> --%>
								<tr>
									<th scope="row" class="text-center"><input class="form-check-input" type="checkbox" id=""></th>
									<c:choose>
										<c:when test="${d.docImpor == 'N'}">
										<td class="text-center"><i class="bi-star btn btn-sm" style="color:gold;"></i></td>
										</c:when>
										<c:otherwise>
										<td class="text-center"><i class="bi-star-fill btn btn-sm" style="color:gold;"></i></td>
										</c:otherwise>
									</c:choose>
									<td class="text-center">${d.depName}</td>
									<td class="text-center">${d.empName}</td>
									<td class="text-center hide doc_docTNo">${d.docTNo}</td>
									<td class="doc_formName" data-bs-toggle="modal" data-bs-target="#hereIsDoc" style="cursor:pointer;">${d.formName}</td>
									<c:choose>
										<c:when test="${d.docStatus == '대기'}">
										<td class="text-center"><span class="badge rounded-pill bg-secondary">대기</span></td>
										</c:when>
										<c:when test="${d.docStatus == '완료'}">
										<td class="text-center"><span class="badge rounded-pill bg-success">완료</span></td>
										</c:when>
										<c:otherwise>
										<td class="text-center"><span class="badge rounded-pill bg-danger">거절</span></td>
										</c:otherwise>
									</c:choose>
									<td class="text-center">${d.wd}</td>
								</tr>
								<%-- </c:if> --%>
							</c:if>
							</c:forEach>
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
				</div>
            </div>

		</div><%-- card-body end --%>
	</div> <!--d-flex end-->

	<!-- showDoc Modal -->
	<div class="modal fade" id="hereIsDoc" style="overflow:hidden;">
		<div class="modal-dialog modal-xl modal-dialog-scrollable" id="mwfDialog">
			<div class="modal-content px-3 my95size">
				<div class="modal-header d-flex">
					<div class="col-8"><h6 class="modal-title"><span class="badge bg-light text-black-50 title_cus1"></span></h6></div>
					<div class="col-auto d-flex justify-content-end align-items-center ">
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" tabindex="-1"></button>
					</div>
				</div>
				<div class="modal-body d-flex justify-content-between">
					<div class="col-8 shell_mfc">
						<div class="">
							<div class="btn btn-lg btn-light title_cus1" id="" href="#" style="cursor:default">
							</div>
						</div>
						<div class="text-muted mb-5 pt-3">
							<table class="table table-borderless">
								<colgroup>
									<col style="width: 20%">
									<col style="width: 80%">
								</colgroup>
								<tr>
									<td class="small">작성자</td>
									<td class="small doc_writer1"></td>
								</tr>
								<tr>
									<td class="small">작성 일시</td>
									<td class="small doc_writeDate1"></td>
								</tr>
								<tr>
									<td class="small">문서 번호</td>
									<td class="small doc_docName1"></td>
								</tr>
								<tr class="hide">
									<td class="small">문서진짜번호</td>
									<td class="small doc_docTNo1"></td>
								</tr>
							</table>
						<hr>
						</div>
						<%-- 내용양식 --%>
						<div class="mb-5 hide wofCon1" id="">
							<textarea class="tinymce-editor my_editor1" readonly>
							</textarea>
							<div class="" id="">
								<input class="form-control" multiple type="file" tabindex="-1">
							</div>
						</div>
						<div class="myDcontainer" id="formIn1">
							<table class="table table-borderless hide">
								<colgroup>
									<col style="width: 30%">
									<col style="width: 70%">
								</colgroup>
							</table>
						</div>

					</div>
					<div class="col-3 p-4 me-5 ms-3 mt-3 right_step h-100">
						<div class="mb-4">승인 단계</div>
						<div class="stepForm">
							<div class="stepShell">

							</div>
							<!--stepShell end-->
						</div>
					</div><%-- 오른쪽 승인,참조대상 감싸는 div end --%>

				</div>

				<div class="modal-footer d-flex justify-content-between">
					<div class="col-7">
						<span class="">승인자: </span>&nbsp;
						<div class="btn btn-light" style="cursor:default">
							<span class="docApprover">${loginEmp.empName}</span>
						</div>
					</div>
					<div class="col-auto isMine">
						<button type="button" class="btn btn-secondary closeForm" data-bs-dismiss="modal" tabindex="-1">닫기</button>
						<%-- <button type="button" class="btn btn-danger no_app" tabindex="-1">거절</button>
						<button type="button" class="btn btn-success yes_app" tabindex="-1"><i class="bi-check-lg"></i>&nbsp;승인하기</button> --%>
					</div>
				</div>
			</div>
		</div>
	</div><!-- End showDoc Modal-->
</div>
	</main>

	<script type="text/javascript" src="${root}/resources/assets/js/workflowJs/myDoc.js"></script>

	<%@ include file="/WEB-INF/views/common/footer.jsp" %>

</body>
</html>
