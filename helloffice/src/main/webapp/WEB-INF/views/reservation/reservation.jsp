<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/common/head.jsp" %>
<!-- timetable.js -->
<link rel="stylesheet" href="${root}/resources/assets/vendor/timetable.js-master/dist/styles/timetablejs.css">
<script src="${root}/resources/assets/vendor/timetable.js-master/dist/scripts/timetable.js"></script>

<%-- <script type="text/javascript" src="${root}/resources/assets/js/jquery.timepicker.min.js" ></script><!-- 타이머js -->
<link type="text/css" rel="stylesheet" href="${root}/resources/assets/css/jquery.timepicker.min.css" media=""/> --%>
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<style>
	small{
	    font-size: 0.6rem;
	}
</style>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>

	<main id="main" class="main">

    <div class="row mb-3 justify-content-md-center">
      <div class="col-md-1 text-center">
        <button type="button" id="previousDate" class="btn"><i class="bi bi-caret-left"></i></button>
      </div>
      <div class="col-md-3 text-center">
        <h4 id="date">2022-03-01</h4>
      </div>
      <div class="col-md-1 text-center">
        <button type="button" id="nextDate" class="btn"><i class="bi bi-caret-right"></i></button>
      </div>
    </div>
		
		<div class="row mb-3">
			<div class="col-md-12 timetable"></div>
		</div>
		
		<div class="row mb-3">
			<div class="col-md-6"><!-- 예약 폼 start -->
			<h5>예약하기</h5>
              <form id="reservForm" class="row g-3">
                <div class="col-md-12">
             	<label for="asset" class="form-label">예약 항목</label>
                  <select class="form-select" id="assetList" name="assetNo">
                    <option selected>예약 항목 선택</option>
                    <c:forEach items="${assetList}" var="a">
                     <option value="${a.assetNo}">${a.assetName}</option>
                    </c:forEach>
                  </select>
                </div>
                <div class="col-md-12 asset-detail">
                  <label for="assetDetail" class="form-label">상세 정보</label>
                  <textarea class="form-control" id="assetDetail" readonly></textarea>
                </div>
                <div class="col-md-12">
                  <label for="empName" class="form-label">예약자</label>
                  <input type="hidden" class="form-control" id="empNo" name="empNo" value="${loginEmp.empNo}">
                  <input type="text" class="form-control" id="empName" value="${loginEmp.empName}" readonly>
                </div>
                
                  <div class="col-md-6">
	                <label for="inputDate" class="form-label">날짜</label>
                    <input type="date" class="form-control" id="inputDate">
                  </div>
                
                  <div class="col-md-3">
	                <label for="startTime" class="form-label">시간</label>
                    <input type="time" class="form-control" id="startTime">
                  </div>
                  <div class="col-md-3">
	                <label for="startTime" class="form-label">&nbsp</label>
                    <input type="time" class="form-control" id="endTime">
                  </div>
                <div class="col-12">
                  <label for="reason" class="form-label">예약 사유</label>
                  <input type="text" class="form-control" id="reason">
                </div>
                <div class="text-center">
                  <button type="button" id="reservSubmit" class="btn btn-primary">예약하기</button>
                  <button type="reset" class="btn btn-secondary">취소하기</button>
                </div>
              </form>
			</div><!-- 예약 폼 end -->
			
			<div class="col-md-6"> <!-- 내 예약 목록 start -->
			  <h5>내 예약 목록</h5>
              <ul class="list-group" id="personalList">
                
              </ul>
			</div><!-- 내 예약 목록 end -->
			
		</div> 
		
		
	</main>
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	<script type="text/javascript">
      let currentUrl = document.location.pathname;

      let locations = [];
      let details = new Object();
      <c:forEach items="${assetList}" var="a">
        locations.push("${a.assetName}");
        details["${a.assetNo}"] = `${a.assetDetail}`;
      </c:forEach>

      let date = new Date();
      function formatDay(date){
        let year = date.getFullYear();
        let month = ('0' + (date.getMonth() + 1)).slice(-2);
        let day = ('0' + date.getDate()).slice(-2);
        let dayFormat = year + '-' + month  + '-' + day;
        return dayFormat;
      };
      $("#date").text(formatDay(date));
      $('#inputDate').val(formatDay(date));

      $(document).ready(renderTimetable());
      
      let reserveData = [];
	
      /* 타임테이블 렌더링 */
      function renderTimetable(){
        $.ajax({

          type: 'GET',
          url: currentUrl + '/date?date=' + $('#date').text(),
          dataType: 'json'

        }).done(function(data){
          let timetable = new Timetable();
          timetable.setScope(8, 23); 
          timetable.useTwelveHour(); 

          timetable.addLocations(locations);
          let renderer = new Timetable.Renderer(timetable);
          
          reserveData = data;
          
          reserveData.forEach(reserv => {
            timetable.addEvent(reserv['empName'], reserv['assetName'], new Date(reserv['startTime']), new Date(reserv['endTime']));
          });
          renderer.draw('.timetable'); 
        }).fail(function(){
          Swal.fire(
            'error',
            '예약 목록을 불러오는 중 문제가 발생했습니다.'
          );
        });
      }
      
      // 날짜 표시
      $('#inputDate').change(function(){
    	 let date = $(this).val();
    	 $("#date").text(date);
    	 renderTimetable();
    	 
      });

      $('#previousDate').click(function(){
        date.setDate(date.getDate() - 1);
        $("#date").text(formatDay(date));
        $('#inputDate').val(formatDay(date));
        renderTimetable();
      });

      $('#nextDate').click(function(){
        date.setDate(date.getDate() + 1);
        $("#date").text(formatDay(date));
        $('#inputDate').val(formatDay(date));
        renderTimetable();
      });

      // 예약 유효 체크
      let reservForCheck = [];
      $('#assetList').change(function(){
        reservForCheck = [];
        let assetNo = $('#assetList').val();
        
        reserveData.forEach(res => {
          if(res['assetNo'] == assetNo){
            reservForCheck.push(res)
          }
        });
      });

      function checkValidate(start, end){
        start = new Date(start).valueOf();
        end = new Date(end).valueOf();

        if(start >= end){
          return false;
        }

        if(reservForCheck.length == 0) return true;

        for (let i = 0; i < reservForCheck.length; i++) {
          let resStart = new Date(reservForCheck[i]['startTime']).valueOf();
          let resEnd = new Date(reservForCheck[i]['endTime']).valueOf();
          if(resStart <= start && start <= resEnd){
            return false;
          }else if(resStart <= end && end <= resEnd){
            return false;
          }else if(start <= resStart && resEnd <= end){
            return false;
          }else{
            return true;
          }
          
        }
      }

      /* 예약 폼 제출 */
      $('#reservSubmit').click(function(){

        let inputDate = $('#inputDate').val();
        let startTime = inputDate + " " +  $('#startTime').val() + ":00";
        let endTime = inputDate + " " + $('#endTime').val() + ":00";

        if(checkValidate(startTime, endTime)){

          let reservData = {

            'assetNo' : $('#assetList').val(),
            'empNo' : $('#empNo').val(),
            'startTime' : startTime,
            'endTime' : endTime,
            'reason' : $('#reason').val() 
          };

          $.ajax({

            type: 'POST',
            url: currentUrl,
            data: reservData

          }).done(function(data){
            Swal.fire(
            'success',
            '예약이 완료되었습니다.'
            );
            $("#assetList option:eq(0)").prop("selected", true);
            renderTimetable();
            getPersonalReserve();
          }).fail(function(){
            Swal.fire(
            'error',
            '서버와 연결중 오류가 발생했습니다.'
            );
          });
        }else{
          Swal.fire(
            'error',
            '예약할 수 없는 시간입니다.'
            );
        }
    });  

    function formatTime(date){
      let hour = date.getHours().toString().padStart(2,'0');
      let minute = date.getMinutes().toString().padStart(2,'0');
      let time = hour + ":" + minute;
      return time;
    }

    // 내 예약 목록 불러오기 
    function getPersonalReserve(){
      $.ajax({

        type:'GET',
        url: currentUrl + "/" + '${loginEmp.empNo}',
        dataType: 'json'

      }).done(function(data){
    	  $("#personalList").empty();

        data.forEach(res => {
          let start = new Date(res['startTime']);
          let end = new Date(res['endTime']);
          let day = formatDay(start);
          let startTime = formatTime(start);
          let endTime = formatTime(end);

          let template = `<li class="list-group-item d-flex justify-content-between align-items-start">
                          <div class="ms-2 me-auto">
                            <div class="fw-bold"> ${ '${res["assetName"]}' } </div>
                            ${ '${day}' } ${ '${startTime}' } - ${ '${endTime}' }
                          </div>
                          <span class="badge bg-primary rounded-pill">${ '${res["status"]}' }</span>
                        </li>`;
          $('#personalList').append(template);
        });

      }).fail(function(){
        Swal.fire(
            'error',
            '예약 목록을 불러올 수 없습니다.'
            );
      });
    };
    
	  $(document).ready(function() {
	   getPersonalReserve(); 	
	   $("#startTime, #endTime").timepicker({
	    'minTime' : '8',
	    'maxTime' : '21',
	    'timeFormat' : 'HH:mm',
	    'interval' : 30
	   });
	  });
	    
	  /* 상세정보 */
	  $("#assetList").change(function(){
        let no = $(this).val();
        $("#assetDetail").val(details[no]);
      });
	    
	    
	</script>
</body>
</html>