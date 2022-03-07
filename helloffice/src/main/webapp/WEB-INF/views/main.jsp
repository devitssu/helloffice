<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="common/head.jsp" %>
<style>
  .done{
    text-decoration: line-through;
  }
</style>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
<link rel="stylesheet"href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
<body>
	<%@ include file="common/header.jsp" %>

	<main id="main" class="main">
	<c:if test="${empty loginEmp}">
		<div class="pagetitle">
      <h1>반갑습니다. 어서오세요!</h1>
    	</div>
    </c:if>
    <c:if test="${not empty loginEmp}">
    	<div class="pagetitle">
      <h1>${loginEmp.empName}님 안녕하세요</h1>
    	</div>
    </c:if>
<!-- End Page Title -->

    <section class="section dashboard">
      <div class="row">

        <!-- Left side columns -->
        <div class="col-lg-8">
          <div class="col-12"><!-- 할일 & 투두 -->
              <div class="row">
            
              <!-- 할 일 -->
              <div class="col-6">
                <div class="card">
                  <div class="card-body">
                    <h5 class="card-title">요청</h5>
                    <input class="form-control me-1" type="text" value="" placeholder="보낼 요청을 입력하세요">
                    <div class="activity">
                    
                    <!-- Bordered Tabs -->
                    <ul class="nav nav-tabs nav-tabs-bordered" id="borderedTab" role="tablist">
                      <li class="nav-item" role="presentation">
                        <button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#bordered-home" type="button" role="tab" aria-controls="home" aria-selected="true">받은 요청</button>
                      </li>
                      <li class="nav-item" role="presentation">
                        <button class="nav-link" id="profile-tab" data-bs-toggle="tab" data-bs-target="#bordered-profile" type="button" role="tab" aria-controls="profile" aria-selected="false">보낸 요청</button>
                      </li>
                      <li class="nav-item" role="presentation">
                        <button class="nav-link" id="contact-tab" data-bs-toggle="tab" data-bs-target="#bordered-contact" type="button" role="tab" aria-controls="contact" aria-selected="false">완료된 요청</button>
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
              <div class="col-6"><!--투두리스트-->
                <div class="card">
                  <div class="card-body">
                    <h5 class="card-title">To Do</h5>
                    <input class="form-control me-1" type="text" id="inputToDo" placeholder="할일을 입력하세요">
                    <!-- List group With Checkboxes and radios -->
                    <ul class="list-group" id="todoList">
                      <li class="list-group-item">
                        <div class="d-flex">
                          <input class="form-check-input me-1 align-self-center todo-check" type="checkbox">
                          <span class="align-self-center">프로젝트 시연 준비</span>
                          <button class="btn ms-auto"><i class="bi bi-x"></i></button>
                        </div>
                      </li>
                      <li class="list-group-item">
                        <div class="d-flex">
                          <input class="form-check-input me-1 align-self-center todo-check" type="checkbox" checked>
                          <span class="align-self-center done">할일 끝!!</span>
                          <button class="btn ms-auto"><i class="bi bi-x"></i></button>
                        </div>
                      </li>

                    </ul><!-- End List Checkboxes and radios -->
      
                  </div>
                </div>
              </div><!--end 투두리스트-->
           </div><!--end 할일 & 투두 -->
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
              <div class="list-group">
              	<c:forEach items="${notices}" var="n">              	
	                <a href="board/1/${n.postNo}" class="list-group-item list-group-item-action" aria-current="true">
	                  <div class="d-flex w-100 justify-content-between">
	                    <p class="mb-1">${n.title}</p>
	                    <small>${n.dateString}</small>
	                  </div>
	                  <small>${n.empName}</small>
	                </a>
              	</c:forEach>
              </div>
            </div>
          </div><!-- End 공지 -->

        </div><!-- End Left side columns -->

        <!-- Right side columns -->
        <div class="col-lg-4">

          <!-- 근무 Card -->
          <c:if test="${empty loginEmp}">
			 <div class="col-12">
              <div class="card info-card sales-card">
                <div class="card-body">
                  <h5 class="card-title" style="font-size: 1.5em; font-weight: bolder; color: #617181;">오늘 근무</h5>
                  <form action="work.do" method="post">
                  <div class="d-flex flex-column align-items-center">
                    <div id="current_date" style="font-size: 1.5em;"></div>
                    <div id="current_time" style="font-size: 2.3em; margin-top: 10px;"><span id="dpTime"></span></div>
                    <div>
                    	<input type="hidden" value="${loginEmp.empNo}" name="empNo">
                      <button type="button" class="btn btn-success" style="margin-top: 20px;" onclick="loginX()">지금 출근하기</button>
                      <a class="btn btn-outline-secondary" role="button" style="margin-left: 20px; margin-top: 20px;" onclick="loginX()">근무 기록 확인</a>
                    </div>
                  </div>
                  </form>
                </div>
              </div>
            </div>	
		  </c:if>
          <c:if test="${not empty loginEmp}">
            <div class="col-12">
              <div class="card info-card sales-card">
                <div class="card-body">
                  <h5 class="card-title" style="font-size: 1.5em; font-weight: bolder; color: #617181;">오늘 근무</h5>
                      <div class="d-flex flex-column align-items-center">
                        <div id="current_date" style="font-size: 1.5em;"></div>
                          <div id="current_time" style="font-size: 2.3em; margin-top: 10px;"><span id="dpTime"></span></div>
                            <div>
	                    	    <form action="work.do" method="post">
	                    	    <c:if test="${empty workEmp.inDate}">
	                    	      <input type="hidden" value="${loginEmp.empNo}" name="empNo">
	                              <button type="submit" class="btn btn-success" style="margin-top: 20px;">지금 출근하기</button>
	                            </c:if>
	                            </form>
	                            <c:if test="${not empty workEmp.inDate }">
			                      <c:if test="${null eq workEmp.outTime}">
									<form action="out.do" method="post">
									  <button type="submit" class="btn btn-danger" style="margin-top: 20px;" onclick="alert('고생했습니다')">지금 퇴근하기</button>
									</form>
								  </c:if>
						       </c:if>
                        <a class="btn btn-outline-secondary" role="button" href="workMain" style="margin-left: 0px; margin-top: 20px;">근무 기록 확인</a>
                      </div>
                    </div>
                </div>
              </div>
            </div>
		  </c:if>
		<!-- End 근무 Card -->
			
			
				
				
					



          
          
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
        
        function loginX() {
        	swal("로그인이 필요합니다!","화면의 오른쪽 상단을 확인해주세요.","info");
		}
        
        function outO() {
        	
		}
      
      let empNo = ${loginEmp.empNo};

      $('#inputToDo').keypress(function(key){
        if(key.keyCode == 13){
          let content = $(this).val();
          $(this).val("");
          $.ajax({
            type: 'POST',
            url: '/helloffice/todo/' + empNo,
            dataType: 'json',
            contentType: 'application/json; charset=utf-8',
				    data: content
          }).done(function(data){
            renderToDoList(data);
          }).fail(function(){
              Swal.fire(
              'error',
              '할일 추가중 오류가 발생했습니다.'
            )
          });
        }
      });
	  
      function delToDo(no){
          $.ajax({
            type: 'DELETE',
            url: '/helloffice/todo/' + empNo + '/' + no,
            dataType: 'json'
          }).done(function(data){
            renderToDoList(data);
          }).fail(function(){
            Swal.fire(
                'error',
                '할일 삭제중 오류가 발생했습니다.'
              )
          });
        };

        function updateStatus(no, input){
          let isComplete = '';
          if($(input).is(':checked')){
            isComplete = 'Y';
          }else {
            isComplete = 'N';
          }

          $.ajax({
            type: 'PUT',
            url: '/helloffice/todo/' + empNo + '/' + no,
            dataType: 'json',
            contentType: 'application/json; charset=utf-8',
				    data: isComplete
          }).done(function(data){
            renderToDoList(data);
          }).fail(function(){
            Swal.fire(
                'error',
                '할일 업데이트중 오류가 발생했습니다.'
              )
          });
        }
      
      function renderToDoList(data){
        $('#todoList').empty();
            
        for (const key in data) {
          let isComplete = "";
          let checked = "";
          if(data[key]["isComplete"] == "Y") {
            isComplete = "done";
            checked = "checked";  
          };

          let template = 
            `<li class="list-group-item">
              <div class="d-flex">
                <input class="form-check-input me-1 align-self-center" type="checkbox" onChange="updateStatus(${ '${key}' }, $(this))" ${ '${checked}' }>
                <span class="align-self-center ${ '${isComplete}' }">${ '${data[key]["content"]}' }</span>
                <button onClick="delToDo(${ '${key}' })" class="btn ms-auto"><i class="bi bi-x"></i></button>
              </div>
            </li>`;
          $('#todoList').append(template);
        }
      }

      
      $(document).ready(function(){
        $.ajax({
          type: 'GET',
          url: '/helloffice/todo/' + empNo,
          dataType: 'json'
        }).done(function(data){
          renderToDoList(data);
        });
      });
        
        
      </script>



    </section>
		
	</main>
	<%@ include file="common/footer.jsp" %>
</body>
</html>