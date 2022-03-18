
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- ======= Header ======= -->
<header id="header" class="header fixed-top d-flex align-items-center">

	<div class="d-flex align-items-center justify-content-between">
		<i class="bi bi-list toggle-sidebar-btn"></i> <a href="/helloffice"
			class="logo d-flex align-items-center"> <img
			src="/helloffice/resources/assets/img/logo.png" alt="">
		</a>
	</div>
	<!-- End Logo -->

	<nav class="header-nav ms-auto">
		<ul class="d-flex align-items-center">

			<c:if test="${not empty loginEmp}">
				<li class="nav-item dropdown pe-3"><a
					class="nav-link nav-profile d-flex align-items-center pe-0"
					href="#" data-bs-toggle="dropdown">
					   <img src="/helloffice/resources/assets/img/favicon.png"
						class="rounded-circle">
						<span class="d-none d-md-block dropdown-toggle ps-2">${loginEmp.empName}</span>
				</a>
				<!-- End Profile Iamge Icon -->

					<ul
						class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
						<li class="dropdown-header">
							<h6>${loginEmp.empName}</h6> <span>${loginEmp.empRank} | ${loginEmp.empPosition}</span>
						</li>
						<li>
							<hr class="dropdown-divider">
						</li>

						<li><a class="dropdown-item d-flex align-items-center"
							href="/helloffice/hr/myPage"> <i class="bi bi-person"></i> <span>내 프로필</span>
						</a></li>
						<li>
							<hr class="dropdown-divider">
						</li>

						<!-- <li><a class="dropdown-item d-flex align-items-center"
							href="users-profile.html"> <i class="bi bi-gear"></i> <span>계정 설정</span>
						</a></li> -->


						<li>
							<hr class="dropdown-divider">
						</li>

						<li><a class="dropdown-item d-flex align-items-center"
							href="/helloffice/member/logout"> <i class="bi bi-box-arrow-right"></i> <span>로그아웃</span>
						</a></li>


					</ul>
					</c:if>
					<!-- End Profile Dropdown Items --></li>
				<!-- End Profile Nav -->
		</ul>
	</nav>
	<!-- End Icons Navigation -->


</header>
<!-- End Header -->

<!-- ======= Sidebar ======= -->
<aside id="sidebar" class="sidebar">

	<ul class="sidebar-nav" id="sidebar-nav">

		<li class="nav-item"><a class="nav-link " href="/helloffice">
				<i class="bi bi-grid"></i> <span>홈</span>
		</a></li>
		<!-- End Dashboard Nav -->

		<li class="nav-item">
			<a class="nav-link collapsed" data-bs-target="#hr-nav" data-bs-toggle="collapse" href="#">
				<i class="bi bi-person"></i> <span>사람</span>
				<i class="bi bi-chevron-down ms-auto"></i>
			</a>
			<ul id="hr-nav" class="nav-content collapse" data-bs-parent="#sidebar-nav">
				<li>
					<a href="/helloffice/hr/teamList"> <i class="bi bi-circle"></i>
						<span>구성원</span>
					</a>
				</li>
				<li>
					<a href="/helloffice/hr/teamReport"> <i class="bi bi-circle"></i>
						<span>팀리포트</span>
					</a>
				</li>
				<c:if test="${loginEmp.adminLevel gt 1}">
					<li>
						<a href="/helloffice/mail/send"> <i class="bi bi-circle"></i>
							<span>초대</span>
						</a>
					</li>
				</c:if>
			</ul>
		</li>
		<!-- End Profile Page Nav -->

		<li class="nav-item"><a class="nav-link collapsed"
			href="/helloffice/workMain"> <i class="bi bi-briefcase"></i> <span>근무/휴가</span>
		</a></li>
		<!-- End F.A.Q Page Nav -->

		<li class="nav-item"><a class="nav-link collapsed"
			data-bs-target="#forms-nav" data-bs-toggle="collapse" href="#"> <i
				class="bi bi-journal-text"></i><span>게시판</span><i
				class="bi bi-chevron-down ms-auto"></i>
		</a>
			<ul id="forms-nav" class="nav-content collapse "
				data-bs-parent="#sidebar-nav">
				<li><a href="/helloffice/board/1"> <i class="bi bi-circle"></i><span>전체
							게시판</span>
				</a></li>
				<c:if test="${loginEmp.depNo ne 1}">
					<li><a href="/helloffice/board/${loginEmp.depNo}"> <i class="bi bi-circle"></i><span>${loginEmp.depName}
								게시판</span>
					</a></li>
				</c:if>
			</ul></li>
		<!-- End Forms Nav -->

		<li class="nav-item"><a class="nav-link collapsed"
			data-bs-target="#reserv-nav" data-bs-toggle="collapse" href="#"> <i
				class="bi bi-clock-history"></i><span>예약</span><i
				class="bi bi-chevron-down ms-auto"></i>
		</a>
			<ul id="reserv-nav" class="nav-content collapse "
				data-bs-parent="#sidebar-nav">
				<li>
					<div class="row">
						<div class="col-6">
							<a href="/helloffice/reserv/room"> <i class="bi bi-circle"></i>
								<span>회의실</span>
							</a>
						</div>
						<div class="col-6">
							<a href="/helloffice/reserv-manage/room">
								<i class="bi bi-gear manage-icon"></i>
							</a>
						</div>
					</div>
				</li>
				<li>
					<div class="row">
						<div class="col-6">
							<a href="/helloffice/reserv/car"> <i class="bi bi-circle"></i>
								<span>차량</span>
							</a>
						</div>
						<div class="col-6">
							<a href="/helloffice/reserv-manage/car">
								<i class="bi bi-gear manage-icon"></i>
							</a>
						</div>
					</div>
				</li>
				<li>
					<div class="row">
						<div class="col-6">
							<a href="/helloffice/reserv/supply"> <i class="bi bi-circle"></i>
								<span>비품</span>
							</a>
						</div>
						<div class="col-6">
							<a href="/helloffice/reserv-manage/supply">
								<i class="bi bi-gear manage-icon"></i>
							</a>
						</div>
					</div>
				</li>
			</ul></li>
		<!-- End Reserv Page Nav -->

		<li class="nav-item"><a class="nav-link collapsed"
			href="${root}/workflow/myWf"> <i class="bi bi-file-earmark-text"></i>
				<span>워크플로우</span>
		</a></li>
		<!-- End Register Page Nav -->

		<li class="nav-item"><a class="nav-link collapsed"
			href="${root}/chat"> <i class="bi bi-chat"></i>
				<span>메신저</span>
		</a></li>
		<!-- End 메신저 Page Nav -->

		<li class="nav-item"><a class="nav-link collapsed"
			href="${root}/calendar"> <i class="bi bi-calendar-week"></i>
				<span>일정</span>
		</a></li>
		<!-- End 일정 Page Nav -->
	</ul>

</aside>
<!-- End Sidebar-->
