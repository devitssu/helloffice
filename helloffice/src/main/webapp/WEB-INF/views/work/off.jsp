<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/head.jsp" %>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="resources/assets/css/workCss/off.css" type="text/css">
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>

	<main id="main" class="main">

	<!-- 메뉴바 -->
	<div class="col-lg-12" id="menubar">
		<div class="card">
			<div class="container-fluid">
			<div class="menuwrap">
				<div class="menu_l">
					<a href="workMain">
					<button class="menu_l_1">
						<span class="material-icons">
							arrow_back
							</span>
					</button>
					</a>
					<div class="menu_l_2">휴가 신청 내역</div>
				</div>
				<div class="menu_r">
					<a href="workMain">
						<button class="menu_r_1">
							<div class="menu_r_1_1">
								<div class="menu_r_c">근무기록 보기</div>
							</div>
						</button>
					</a>
					<button class="menu_r1" type="button">
						<div class="menu_r1_1">
							<div class="menu_r1_1_1">
								<span class="material-icons md-18" style="vertical-align: middle">beach_access</span>
							</div>
							<div class="menu_r1_1_2">
								휴가사용
							</div>
						</div>
					</button>
				</div>
			</div>
			</div>
		</div>
	</div>

	<!-- 예정휴가 -->
	<div class="off_t1">
		<div class="off_c1">
			<div class="off_c1_1">예정 휴가</div>
		</div>
	</div>
	<div class="col-lg-12">
		<div class="card">
			<div class="container-fluid">
				<div class="off_c2">
					<div class="off_c2_1">
						<div class="off_c2_2">
							<img src="https://static.flex.team/time-tracking/man-on-float-tube.svg" class="sc-8grlmu eabhLn" style="">
							<p class="off_c2_2_1">신청한 휴가가 없습니다.</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 지난휴가 -->
	<div class="off_t1">
		<div class="off_c1">
			<div class="off_c1_1">지난 휴가</div>
		</div>
	</div>
	<div class="col-lg-12">
		<div class="card">
			<div class="container-fluid">
				<div class="off_c2">
					<div class="off_c2_1">
						<div class="off_c2_2">
							<img src="https://static.flex.team/time-tracking/woman-on-float-tube.svg" class="sc-8grlmu eabhLn">
							<p class="off_c2_2_1">사용한 휴가 기록이 없습니다.</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	</main>
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>