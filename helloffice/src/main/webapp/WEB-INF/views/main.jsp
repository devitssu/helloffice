<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="common/head.jsp" %>

<body>
	<%@ include file="common/header.jsp" %>

	<main id="main" class="main">
	
	<div class="pagetitle">
      <h1>사원님 안녕하세요</h1>
    </div><!-- End Page Title -->

    <section class="section dashboard">
      <div class="row">

        <!-- Left side columns -->
        <div class="col-lg-8">
          <div class="row">
          
          <!-- 할 일 -->
          <div class="col-12">
          
          <div class="card">
            <div class="filter">
              <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
              <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                <li class="dropdown-header text-start">
                  <h6>Filter</h6>
                </li>

                <li><a class="dropdown-item" href="#">Today</a></li>
                <li><a class="dropdown-item" href="#">This Month</a></li>
                <li><a class="dropdown-item" href="#">This Year</a></li>
              </ul>
            </div>

            <div class="card-body">
              <div class="activity">
              
              <!-- Bordered Tabs -->
              <ul class="nav nav-tabs nav-tabs-bordered" id="borderedTab" role="tablist">
                <li class="nav-item" role="presentation">
                  <button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#bordered-home" type="button" role="tab" aria-controls="home" aria-selected="true">할 일</button>
                </li>
                <li class="nav-item" role="presentation">
                  <button class="nav-link" id="profile-tab" data-bs-toggle="tab" data-bs-target="#bordered-profile" type="button" role="tab" aria-controls="profile" aria-selected="false">요청한 일</button>
                </li>
                <li class="nav-item" role="presentation">
                  <button class="nav-link" id="contact-tab" data-bs-toggle="tab" data-bs-target="#bordered-contact" type="button" role="tab" aria-controls="contact" aria-selected="false">완료한 일</button>
                </li>
              </ul>
              
              <div class="tab-content pt-2" id="borderedTabContent">
                <div class="tab-pane fade show active" id="bordered-home" role="tabpanel" aria-labelledby="home-tab">
					<div class="activity-item d-flex">
	                  <div class="activite-label">
		                <img src="resources/assets/img/favicon.png" class="rounded-circle">
	                  	이수진
	                  </div>
	                  <div class="activity-content">
		                    휴가 승인 요청 <span style="color: gray;"> - 2월 19일 (토)</span>
	                  </div>
	                  <div class="activity-button">
	                  	<a href="#"><i class="bi bi-chevron-right"></i></a>
	                  </div>
               		 </div><!-- End activity item-->
               	 <div class="activity-item d-flex">
                  <div class="activite-label">
                  <img src="resources/assets/img/favicon.png" class="rounded-circle">
                  	유진이
                  </div>
                  <div class="activity-content">
                    휴가 승인 요청 <span style="color: gray;"> - 2월 19일 (토)</span>
                  </div>
                  <div class="activity-button">
                  	<a href="#"><i class="bi bi-chevron-right"></i></a>
                  </div>
                </div><!-- End activity item-->

                <div class="activity-item d-flex">
                  <div class="activite-label">
                  <img src="resources/assets/img/favicon.png" class="rounded-circle">
                  이승연
                  </div>
                  <div class="activity-content">
                    휴가 승인 요청 <span style="color: gray;"> - 2월 19일 (토)</span>
                  </div>
                  <div class="activity-button">
                  	<a href="#"><i class="bi bi-chevron-right"></i></a>
                  </div>
                </div><!-- End activity item-->
                </div>
                
                <div class="tab-pane fade" id="bordered-profile" role="tabpanel" aria-labelledby="profile-tab">
					<div class="activity-item d-flex">
	                  <div class="activite-label">
		                <img src="resources/assets/img/favicon.png" class="rounded-circle">
	                  	서성환
	                  </div>
	                  <div class="activity-content">
		                    휴가 승인 요청 <span style="color: gray;"> - 2월 19일 (토)</span>
	                  </div>
	                  <div class="activity-button">
	                  	<a href="#"><i class="bi bi-chevron-right"></i></a>
	                  </div>
               		 </div><!-- End activity item-->

                </div>
                
                <div class="tab-pane fade" id="bordered-contact" role="tabpanel" aria-labelledby="contact-tab">
					<div class="activity-item d-flex">
	                  <div class="activite-label">
		                <img src="resources/assets/img/favicon.png" class="rounded-circle">
	                  	장재욱
	                  </div>
	                  <div class="activity-content">
		                    휴가 승인 요청 <span style="color: gray;"> - 2월 19일 (토)</span>
	                  </div>
	                  <div class="activity-button">
	                  	<a href="#"><i class="bi bi-chevron-right"></i></a>
	                  </div>
               		 </div><!-- End activity item-->

                </div>
                
              </div><!-- End Bordered Tabs -->

              </div>

            </div>
          </div><!-- End 할 일 -->
          </div>
          
          <!-- 메시지 -->
          <div class="col-12">
          <div class="card">
            <div class="filter">
              <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
              <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                <li class="dropdown-header text-start">
                  <h6>Filter</h6>
                </li>

                <li><a class="dropdown-item" href="#">Today</a></li>
                <li><a class="dropdown-item" href="#">This Month</a></li>
                <li><a class="dropdown-item" href="#">This Year</a></li>
              </ul>
            </div>

            <div class="card-body">
              <h5 class="card-title"> 받은 메시지</h5>

              <div class="activity">

					<div class="activity-item d-flex">
	                  <div class="activite-label">
		                <img src="resources/assets/img/favicon.png" class="rounded-circle">
	                  	이수진
	                  </div>
	                  <div class="activity-content">
		                    점심 뭐먹을까 <span style="color: gray;"> - 오전 11:53</span>
	                  </div>
               		 </div><!-- End activity item-->

					<div class="activity-item d-flex">
	                  <div class="activite-label">
		                <img src="resources/assets/img/favicon.png" class="rounded-circle">
	                  	이승연
	                  </div>
	                  <div class="activity-content">
		                    내일 회의 자료 보냈어요! <span style="color: gray;"> - 2월 17일 (목)</span>
	                  </div>
               		 </div><!-- End activity item-->
              </div>

            </div>
          </div>
          </div> <!-- End 메시지 -->
          
                   
          <!-- 공지 -->
          <div class="card">
            <div class="filter">
              <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
              <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                <li class="dropdown-header text-start">
                  <h6>Filter</h6>
                </li>

                <li><a class="dropdown-item" href="#">Today</a></li>
                <li><a class="dropdown-item" href="#">This Month</a></li>
                <li><a class="dropdown-item" href="#">This Year</a></li>
              </ul>
            </div>

            <div class="card-body pb-0">
              <h5 class="card-title"> 공지사항 <span>| 전체</span></h5>

              <div class="news">
                <div class="post-item clearfix">
                  <img src="resources/assets/img/news-1.jpg" alt="">
                  <h4><a href="#">Nihil blanditiis at in nihil autem</a></h4>
                  <p>Sit recusandae non aspernatur laboriosam. Quia enim eligendi sed ut harum...</p>
                </div>

                <div class="post-item clearfix">
                  <img src="resources/assets/img/news-2.jpg" alt="">
                  <h4><a href="#">Quidem autem et impedit</a></h4>
                  <p>Illo nemo neque maiores vitae officiis cum eum turos elan dries werona nande...</p>
                </div>

                <div class="post-item clearfix">
                  <img src="resources/assets/img/news-3.jpg" alt="">
                  <h4><a href="#">Id quia et et ut maxime similique occaecati ut</a></h4>
                  <p>Fugiat voluptas vero eaque accusantium eos. Consequuntur sed ipsam et totam...</p>
                </div>

                <div class="post-item clearfix">
                  <img src="resources/assets/img/news-4.jpg" alt="">
                  <h4><a href="#">Laborum corporis quo dara net para</a></h4>
                  <p>Qui enim quia optio. Eligendi aut asperiores enim repellendusvel rerum cuder...</p>
                </div>

                <div class="post-item clearfix">
                  <img src="resources/assets/img/news-5.jpg" alt="">
                  <h4><a href="#">Et dolores corrupti quae illo quod dolor</a></h4>
                  <p>Odit ut eveniet modi reiciendis. Atque cupiditate libero beatae dignissimos eius...</p>
                </div>

              </div><!-- End sidebar recent posts-->

            </div>
          </div><!-- End 공지 -->

          </div>
        </div><!-- End Left side columns -->

        <!-- Right side columns -->
        <div class="col-lg-4">

          <!-- 근무 Card -->
            <div class="col-12">
              <div class="card info-card sales-card">
                <div class="card-body">
                  <h5 class="card-title" style="font-size: 1.5em; font-weight: bolder; color: #617181;">오늘 근무</h5>
                  <form action="work.do" method="post">
                  <div class="d-flex flex-column align-items-center">
                    <div id="current_date" style="font-size: 1.5em;"></div>
                    <div id="current_time" style="font-size: 2.3em; margin-top: 10px;"><span id="dpTime"></span></div>
                    <div>
                      <button type="submit" class="btn btn-success" style="margin-top: 20px;">지금 출근하기</button>
                      <a class="btn btn-outline-secondary" role="button" href="workMain" style="margin-left: 20px; margin-top: 20px;">근무 기록 확인</a>
                    </div>
                  </div>
                  </form>
                </div>
              </div>
            </div><!-- End 근무 Card -->


          
          
           <!-- 일정 -->
          <div class="card">
            <div class="filter">
              <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
              <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                <li class="dropdown-header text-start">
                  <h6>Filter</h6>
                </li>

                <li><a class="dropdown-item" href="#">Today</a></li>
                <li><a class="dropdown-item" href="#">This Month</a></li>
                <li><a class="dropdown-item" href="#">This Year</a></li>
              </ul>
            </div>

            <div class="card-body">
              <h5 class="card-title">일정 <span>| 이번 달</span></h5>

              <div class="activity">

                <div class="activity-item d-flex">
                  <div class="activite-label">2월 21일</div>
                  <i class='bi bi-circle-fill activity-badge text-success align-self-start'></i>
                  <div class="activity-content">
                    회사 창립 기념일
                  </div>
                </div><!-- End activity item-->

                <div class="activity-item d-flex">
                  <div class="activite-label">2월 27일</div>
                  <i class='bi bi-circle-fill activity-badge text-danger align-self-start'></i>
                  <div class="activity-content">
                    팀 회의
                  </div>
                </div><!-- End activity item-->

              </div>

            </div>
          </div><!-- End 일정 -->
          

        </div><!-- End Right side columns -->

      </div>

      <!-- 근무 script-->
      <script>

        date = new Date();
        year = date.getFullYear();
        month = date.getMonth() + 1;
        day = date.getDate();
        
        function getweek() {
        var week = new Array('일', '월', '화', '수', '목', '금', '토');
        var today = new Date().getDay();
        var todayLabel = week[today];
        return todayLabel;
        }
        document.getElementById("current_date").innerHTML = year + "년 " + month + "월 " + day + "일 " + "(" + getweek() + ")";


        setInterval("dpTime()",1000);
        function dpTime(){
          var now = new Date();
          hours = now.getHours();
          minutes = now.getMinutes();
          seconds = now.getSeconds();
          
          if (hours > 12){
            hours -= 12;
            ampm = "오후 "; 
          }else{
            ampm = "오전 "; 
          }
          if (hours < 10){ 
            hours = "0" + hours; 
          } if (minutes < 10){
            minutes = "0" + minutes; 
          } if (seconds < 10){ 
            seconds = "0" + seconds; 
          } 
          document.getElementById("dpTime").innerHTML = ampm + hours + ":" + minutes + ":" + seconds; }
      </script>



    </section>
		
	</main>
	<%@ include file="common/footer.jsp" %>
</body>
</html>