
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

			<li class="nav-item dropdown"><a class="nav-link nav-icon"
				href="#" data-bs-toggle="dropdown"> <i class="bi bi-bell"></i> <span
					class="badge bg-primary badge-number">4</span>
			</a>
			<!-- End Notification Icon -->

				<ul
					class="dropdown-menu dropdown-menu-end dropdown-menu-arrow notifications">
					<li class="dropdown-header">You have 4 new notifications <a
						href="#"><span class="badge rounded-pill bg-primary p-2 ms-2">View
								all</span></a>
					</li>
					<li>
						<hr class="dropdown-divider">
					</li>

					<li class="notification-item"><i
						class="bi bi-exclamation-circle text-warning"></i>
						<div>
							<h4>Lorem Ipsum</h4>
							<p>Quae dolorem earum veritatis oditseno</p>
							<p>30 min. ago</p>
						</div></li>

					<li>
						<hr class="dropdown-divider">
					</li>

					<li class="notification-item"><i
						class="bi bi-x-circle text-danger"></i>
						<div>
							<h4>Atque rerum nesciunt</h4>
							<p>Quae dolorem earum veritatis oditseno</p>
							<p>1 hr. ago</p>
						</div></li>

					<li>
						<hr class="dropdown-divider">
					</li>

					<li class="notification-item"><i
						class="bi bi-check-circle text-success"></i>
						<div>
							<h4>Sit rerum fuga</h4>
							<p>Quae dolorem earum veritatis oditseno</p>
							<p>2 hrs. ago</p>
						</div></li>

					<li>
						<hr class="dropdown-divider">
					</li>

					<li class="notification-item"><i
						class="bi bi-info-circle text-primary"></i>
						<div>
							<h4>Dicta reprehenderit</h4>
							<p>Quae dolorem earum veritatis oditseno</p>
							<p>4 hrs. ago</p>
						</div></li>

					<li>
						<hr class="dropdown-divider">
					</li>
					<li class="dropdown-footer"><a href="#">Show all
							notifications</a></li>

				</ul>
				<!-- End Notification Dropdown Items --></li>
			<!-- End Notification Nav -->

			<li class="nav-item dropdown"><a class="nav-link nav-icon"
				href="#" data-bs-toggle="dropdown"> <i
					class="bi bi-chat-left-text"></i> <span
					class="badge bg-success badge-number">3</span>
			</a>
			<!-- End Messages Icon -->

				<ul
					class="dropdown-menu dropdown-menu-end dropdown-menu-arrow messages">
					<li class="dropdown-header">You have 3 new messages <a
						href="#"><span class="badge rounded-pill bg-primary p-2 ms-2">View
								all</span></a>
					</li>
					<li>
						<hr class="dropdown-divider">
					</li>

					<li class="message-item"><a href="#"> <img
							src="/helloffice/resources/assets/img/messages-1.jpg" alt=""
							class="rounded-circle">
							<div>
								<h4>Maria Hudson</h4>
								<p>Velit asperiores et ducimus soluta repudiandae labore
									officia est ut...</p>
								<p>4 hrs. ago</p>
							</div>
					</a></li>
					<li>
						<hr class="dropdown-divider">
					</li>

					<li class="message-item"><a href="#"> <img
							src="/helloffice/resources/assets/img/messages-2.jpg" alt=""
							class="rounded-circle">
							<div>
								<h4>Anna Nelson</h4>
								<p>Velit asperiores et ducimus soluta repudiandae labore
									officia est ut...</p>
								<p>6 hrs. ago</p>
							</div>
					</a></li>
					<li>
						<hr class="dropdown-divider">
					</li>
					
					<li class="message-item"><a href="#"> <img
							src="/helloffice/resources/assets/img/messages-3.jpg" alt=""
							class="rounded-circle">
							<div>
								<h4>David Muldon</h4>
								<p>Velit asperiores et ducimus soluta repudiandae labore
									officia est ut...</p>
								<p>8 hrs. ago</p>
							</div>
					</a></li>
					<li>
						<hr class="dropdown-divider">
					</li>

					<li class="dropdown-footer"><a href="#">Show all messages</a>
					</li>

				</ul>
				<!-- End Messages Dropdown Items --></li>
			<!-- End Messages Nav -->

			<c:if test="${empty loginEmp}">
				<span class="d-none d-md-block dropdown-toggle ps-2"><a
					href="${pageContext.request.contextPath}/member/login">로그인</a></span>
			</c:if>
			<c:if test="${not empty loginEmp}">
				<li class="nav-item dropdown pe-3"><a
					class="nav-link nav-profile d-flex align-items-center pe-0"
					href="#" data-bs-toggle="dropdown"> <img
						src="${pageContext.request.contextPath}/resources/assets/img/profile/${loginEmp.changeName}"
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

						<li><a class="dropdown-item d-flex align-items-center"
							href="users-profile.html"> <i class="bi bi-gear"></i> <span>계정 설정</span>
						</a></li>


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
				<c:if test="${loginEmp.adminLevel eq 2}">
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
			href="${root}/workflow"> <i class="bi bi-file-earmark-text"></i>
				<span>워크플로우</span>
		</a></li>
		<!-- End Register Page Nav -->

		<li class="nav-item"><a class="nav-link collapsed"
			href="${root}/chat"> <i class="bi bi-chat"></i>
				<span>메신저</span>
		</a></li>
		<!-- End 메신저 Page Nav -->
		
		<li class="nav-item"><a class="nav-link collapsed"
			href="/helloffice/resources/pages-login.html"> <i
				class="bi bi-wrench"></i> <span>관리자</span>
		</a></li>
		<!-- End Login Page Nav -->

	</ul>

</aside>
<!-- End Sidebar-->
