<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/head.jsp" %>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="resources/assets/css/workCss/workMember.css" type="text/css">
</head>
<body>

	<%@ include file="/WEB-INF/views/common/header.jsp" %>

	<main id="main" class="main">
	
	<!-- 메뉴바 -->
	<div class="card">
		<div class="wrap">
			<div class="title_wrap">
				<div class="title_l">
					<div style="margin-left: -8px;">
						<ul class="title_l_ul">
							<li class="title_l_li">
								<button class="title_l_li_btn">
									<a class="title_l_li_btn_a" href="workMain">
									<i class="bi bi-person-fill"></i>
									내 스케줄
									</a>
								</button>
									
							</li>
							<li class="title_l_li">
								<button class="title_l_li_btn2">
									<a class="title_l_li_btn_a2" href="workMember">
									<i class="bi bi-people-fill"></i>
									구성원 스케줄
									</a>
								</button>
							</li>
						</ul>
					</div>
				</div>
				<div class="title_c">
					<button class="title_c_b1">
						<span class="material-icons">arrow_back_ios</span>
					</button>
					<div class="title_c_d">
						<div style="display: inline-block;"> <!--date picker-->
							<button class="title_c_d_1">2022년 2월</button>
						</div>
					</div>
					<button class="title_c_b1">
						<span class="material-icons">arrow_forward_ios</span>
					</button>
					<button class="title_c_b2">
						<div class="title_c_b3_1">
							<div class="title_c_b3_1_1">
								오늘
							</div>
						</div>
					</button>
					<button class="title_c_b3">
						<div class="title_c_b3_1">
							<div class="title_c_b3_1_1">
								월
							</div>
							<div class="title_c_b3_1_2">
								<span class="material-icons">arrow_drop_down</span>
							</div>
						</div>
					</button>
				</div>
				<div class="title_r">
					<div class="title_r">
						<button class="title_r_btn1">
							<div class="title_r_btn1_1">
								<div class="title_r_btn1_1_1">
									<span class="material-icons">visibility</span>
								</div>
								<div class="title_r_btn1_1_2">
									보기
									<div class="title_r_btn1_1_2_1">
										<div class="title_r_btn1_1_2_1_1">전체</div>
									</div>
								</div>
							</div>
						</button>
						<button class="title_r_btn2">
							<div class="title_r_btn1_2">
								<div class="title_r_btn1_2_1">
									<div class="title_r_btn1_2_1_1">
										조직 :
										<span class="title_r_btn1_2_1_1_1">대표</span>
									</div>
								</div>
								<div class="title_r_btn1_2_2">
									<span class="material-icons">arrow_drop_down</span>
								</div>
							</div>
						</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	

	<!-- 간편 조회 -->
    <div class="card card_c">
		<table class="table table-hover">
			<thead>
				<tr>
					<th scope="col">날짜 ・ 구성원</th>
					<th scope="col">2</th>
					<th scope="col">3</th>
					<th scope="col">4</th>
					<th scope="col">5</th>
					<th scope="col">6</th>
					<th scope="col">7</th>
					<th scope="col">8</th>
					<th scope="col">9</th>
					<th scope="col">10</th>
					<th scope="col">11</th>
					<th scope="col">12</th>
					<th scope="col">13</th>
					<th scope="col">14</th>
					<th scope="col">15</th>
					<th scope="col">16</th>
					<th scope="col">17</th>
					<th scope="col">18</th>
					<th scope="col">19</th>
					<th scope="col">20</th>
					<th scope="col">21</th>
					<th scope="col">22</th>
					<th scope="col">23</th>
					<th scope="col">24</th>
					<th scope="col">24</th>
					<th scope="col">25</th>
					<th scope="col">26</th>
					<th scope="col">27</th>
					<th scope="col">28</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th scope="row">
						서성환
					</th>
						<td>
							<span class="d-inline-block" tabindex="0" data-bs-toggle="tooltip" title="근무" style="width: 100px">
								<button class="btn btn-primary" type="button" disabled>근무</button>
							</span>
						</td>
						<td>
							이렇게 쭈욱~
						</td>
				</tr>
			</tbody>
		</table>
	</div>


	</main>
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>