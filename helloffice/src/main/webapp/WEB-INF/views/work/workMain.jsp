<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/common/head.jsp" %>
<style>
.nav-link{
color: black;
}
</style>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>

	<main id="main" class="main">
	
	<section class="section dashboard">
	
      <div class="row">

		<!-- 메뉴바 -->
		<div class="col-lg-12" id="menubar">
			<div class="card">
				<nav class="navbar navbar-expand-md navbar-white bg-white">
				    <div class="container-fluid">
				        <div class="navbar-collapse collapse w-100 order-1 order-md-0 dual-collapse2">
				            <ul class="navbar-nav me-auto">
				                <li class="nav-item active">
				                    <a class="nav-link" href="#">
									<i class="bi bi-person-fill"></i>
									내 스케줄
									</a>
				                </li>
				                <li class="nav-item">
				                    <a class="nav-link" href="#">
				                    <i class="bi bi-people-fill"></i>
				          			구성원 스케줄
									</a>
				                </li>
				            </ul>
				        </div>
				        <div class="nav-link mx-auto order-0">
				            <a class="navbar-brand mx-auto" href="#"><i class="bi bi-chevron-left"></i></a>
				            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target=".dual-collapse2">
				                <span class="navbar-toggler-icon"></span>
				            </button>
				        </div>
				        <div class="nav-link mx-auto order-0">
				            <a class="navbar-brand mx-auto" href="#"> 2.21 - 2.27 </a>
				            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target=".dual-collapse2">
				                <span class="navbar-toggler-icon"></span>
				            </button>
				        </div>
				        <div class="nav-link mx-auto order-0">
				            <a class="navbar-brand mx-auto" href="#"><i class="bi bi-chevron-right"></i></a>
				            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target=".dual-collapse2">
				                <span class="navbar-toggler-icon"></span>
				            </button>
				        </div>
				        <div class="nav-link mx-auto order-0">
				            <a class="navbar-brand mx-auto" href="#">오늘</a>
				            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target=".dual-collapse2">
				                <span class="navbar-toggler-icon"></span>
				            </button>
				        </div>
				        <div class="navbar-collapse collapse w-100 order-3 dual-collapse2">
				            <ul class="navbar-nav ms-auto">
				            <li class="nav-item dropdown">
				          <a class="nav-link dropdown-toggle btn btn-primary" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false" role="button" style="color: white">
				           휴가 사용
				          </a>
				          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
				            <li><a class="dropdown-item" href="#">여름(바캉스)</a></li>
				            <li><a class="dropdown-item" href="#">연차</a></li>
				            <li><hr class="dropdown-divider"></li>
				            <li><a class="dropdown-item" href="#">가족돌봄</a></li>
				            <li><a class="dropdown-item" href="#">결혼, 본인</a></li>
				            <li><a class="dropdown-item" href="#">병가</a></li>
				            <li><a class="dropdown-item" href="#">비상</a></li>
				            <li><a class="dropdown-item" href="#">조의-부모/배우자/자녀</a></li>
				          </ul>
				        </li>
				                <li class="nav-item">
				          <a class="nav-link" href="#">&nbsp;&nbsp;&nbsp;휴가 신청 내역</a>
				        </li>
				        
				            </ul>
				        </div>
				    </div>
				</nav>
			</div>
		</div>
          
          
        <!-- 간편 조회 -->
	<div class="col-lg-12">
        <div class="card">
        	<div class="container-fluid"  style="width: 100%;">
			  <div class="row" style="margin : 40px;">
    <div class="col">
      총 예정 근무 
      <a class="btn btn-success" role="button" style="border-radius: 20px">GOOD</a>
    </div>
    <div class="col-6">
      근무 상세
    </div>
    <div class="col">
      유급 휴가 
      <a><i class="bi bi-question-circle"></i></a>
    </div>
  </div>
  <div class="row" style="margin : 40px;">
    <div class="col">
      <a style="font-size: 50px; font-weight: 1.5em">40</a><a>시간</a>
    </div>
    <div class="col-6">
      <a>기본근무 : <span style="font-size: 50px; font-weight: 1.5em; color: gray">40</span></a> <a> 초과근무 : <span style="font-size: 50px; font-weight: 1.5em; color: gray">없음</span></a>
    </div>
    <div class="col" style="font-size: 50px; font-weight: 1.5em; color: gray">
      없음
    </div>
  </div>
  <div class="row" style="margin : 40px;">
    <div class="col"><div class="progress progress-bar bg-info" role="progressbar" style="width: 25%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div></div>
    <div class="col-3"><div class="progress progress-bar bg-info" role="progressbar" style="width: 25%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div></div>
  </div>
  <div class="row"  style="margin : 40px;">
    <div class="col-8">
    <a>* 자동 근무 기록</a>
    <a>오전 10:00 ~ 오후 07:00</a>
    </div>
    <div class="col-4"></div>
  </div>
			</div>
		</div>
	</div>
        
        
        <!-- 주단위 조회 -->
	<div class="col-lg-12">
        <div class="card week-wrap">
        	<div class="container-fluid" style="margin:40px">
        		<div class="row">
				    <div class="col">
				      <button type="button" class="btn btn-light">고정 출・퇴근 ></button>
				    </div>
				    <div class="col-md-auto">
				    </div>
				    <div class="col col-lg-2" style="">
				      <button type="button" class="btn btn-light" style="border: 1px solid black"><i class="bi bi-calendar-check"></i> 반복 일정 등록</button>
				    </div>
				  </div>
        	</div>
        	<div class="container-fluid" style="margin-left:40px; margin-bottom: 40px">
			  <div class="row" style="margin-bottom: 40px">
			    <div class="col">
			      이번 주 근무
			    </div>
			    <div class="col-6">
			    </div>
			    <div class="col">
			    </div>
			  </div>
			  <div class="row" style="margin-bottom: 40px">
			    <div class="col">
			    	2.21 (월) <button class="btn btn-outline-warning btn-sm" style="border-radius: 10px">오늘</button>
			    </div>
			    <div class="col-6">
			    	<i class="bi bi-wifi"></i>
			    	<button class="btn btn-outline-secondary btn-sm" style="border-radius: 10px">근무</button>
			    	오전 10:00 ~ 오후 07:00
			    </div>
			    <div class="col">
					  <button type="button" class="btn btn-outline-success btn-sm" style="border-radius: 10px">8H</button>
			    	<button class="btn btn-outline-secondary btn-sm" style="border-radius: 10px">1H<i class="bi bi-cup-straw"></i></button>
			    </div>
			  </div>
			  <div class="row" style="margin-bottom: 40px">
			    <div class="col">
			    	2.21 (화)
			    </div>
			    <div class="col-6">
			    	<i class="bi bi-wifi"></i>
			    	<button class="btn btn-outline-secondary btn-sm" style="border-radius: 10px">근무</button>
			    	오전 10:00 ~ 오후 07:00
			    </div>
			    <div class="col">
					  <button type="button" class="btn btn-outline-success btn-sm" style="border-radius: 10px">8H</button>
			    	<button class="btn btn-outline-secondary btn-sm" style="border-radius: 10px">1H<i class="bi bi-cup-straw"></i></button>
			    </div>
			  </div>
			  <div class="row" style="margin-bottom: 40px">
			    <div class="col">
			    	2.21 (수)
			    </div>
			    <div class="col-6">
			    	<i class="bi bi-wifi"></i>
			    	<button class="btn btn-outline-secondary btn-sm" style="border-radius: 10px">근무</button>
			    	오전 10:00 ~ 오후 07:00
			    </div>
			    <div class="col">
					  <button type="button" class="btn btn-outline-success btn-sm" style="border-radius: 10px">8H</button>
			    	<button class="btn btn-outline-secondary btn-sm" style="border-radius: 10px">1H<i class="bi bi-cup-straw"></i></button>
			    </div>
			  </div>
			  <div class="row" style="margin-bottom: 40px">
			    <div class="col">
			    	2.21 (목)
			    </div>
			    <div class="col-6">
			    	<i class="bi bi-wifi"></i>
			    	<button class="btn btn-outline-secondary btn-sm" style="border-radius: 10px">근무</button>
			    	오전 10:00 ~ 오후 07:00
			    </div>
			    <div class="col">
					  <button type="button" class="btn btn-outline-success btn-sm" style="border-radius: 10px">8H</button>
			    	<button class="btn btn-outline-secondary btn-sm" style="border-radius: 10px">1H<i class="bi bi-cup-straw"></i></button>
			    </div>
			  </div>
			  <div class="row" style="margin-bottom: 40px">
			    <div class="col">
			    	2.21 (금)
			    </div>
			    <div class="col-6">
			    	<i class="bi bi-wifi"></i>
			    	<button class="btn btn-outline-secondary btn-sm" style="border-radius: 10px">근무</button>
			    	오전 10:00 ~ 오후 07:00
			    </div>
			    <div class="col">
					  <button type="button" class="btn btn-outline-success btn-sm" style="border-radius: 10px">8H</button>
			    	<button class="btn btn-outline-secondary btn-sm" style="border-radius: 10px">1H<i class="bi bi-cup-straw"></i></button>
			    </div>
			  </div>
			  <div class="row"  style="margin-bottom: 40px">
			    <div class="col">
			      2.21 (토)
			    </div>
			    <div class="col-6">
			    	<i class="bi bi-wifi-off"></i>
			    	쉬는 날
			    </div>
			    <div class="col">
			    </div>
			  </div>
			  <div class="row"  style="margin-bottom: 40px">
			    <div class="col">
			      2.21 (일)
			    </div>
			    <div class="col-6">
			    	<i class="bi bi-wifi-off"></i>
			    	쉬는 날
			    </div>
			    <div class="col">
			    </div>
			  </div>
			  
			</div>
        </div>
	</div>
	
	
        
        
            </div>
          


    </section>
		
	</main>
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>