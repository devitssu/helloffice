<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/common/head.jsp" %>
<link rel="stylesheet"href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.2/main.min.css" />
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.2/main.min.js"></script>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>

	<main id="main" class="main">
    <div class="row">
      <h1>Calendar</h1>
      <div class="col-md-4">
        <h5>일정 등록</h5>
        <form id="eventForm" class="row g-3">
            <div class="col-12">
              <label for="title" class="form-label">일정</label>
              <input type="text" class="form-control" id="title">
            </div>
            <div class="col-md-6">
            <label for="inputDate" class="form-label">시작일</label>
              <input type="date" class="form-control" id="start">
            </div>
            <div class="col-md-6">
            <label for="inputDate" class="form-label">종료일</label>
              <input type="date" class="form-control" id="end">
            </div>
          
            <div class="col-md-6">
            <label for="startTime" class="form-label">시작시간</label>
              <input type="time" class="form-control" id="startTime">
            </div>
            <div class="col-md-6">
            <label for="startTime" class="form-label">종료시간</label>
              <input type="time" class="form-control" id="endTime">
            </div>

          <div class="text-center">
            <button type="button" id="addBtn" class="btn btn-primary">등록하기</button>
            <button type="reset" class="btn btn-secondary">취소하기</button>
          </div>
        </form>
      </div>

      <div class="col-md-8">
        <div id='calendar'></div>
      </div>

    </div>

    <!-- 예약 설정 모달 -->
    <div class="modal fade" id="detailModal" tabindex="-1">
      <div class="modal-dialog modal-lg">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title">일정 상세</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
            <form id="detailForm" class="row g-3">
              <div class="col-12">
                <label for="title" class="form-label">일정</label>
                <input type="text" class="form-control" id="title">
                <input type="hidden" class="form-control" id="eventNo">
              </div>
              <div class="col-md-6">
              <label for="inputDate" class="form-label">시작일</label>
                <input type="date" class="form-control" id="start">
              </div>
              <div class="col-md-6">
              <label for="inputDate" class="form-label">종료일</label>
                <input type="date" class="form-control" id="end">
              </div>
            
              <div class="col-md-6">
              <label for="startTime" class="form-label">시작시간</label>
                <input type="time" class="form-control" id="startTime">
              </div>
              <div class="col-md-6">
              <label for="startTime" class="form-label">종료시간</label>
                <input type="time" class="form-control" id="endTime">
              </div>
  
              <div class="text-center">
                <button type="button" id="updateBtn" class="btn btn-primary">수정하기</button>
                <button type="button" id="deleteBtn" class="btn btn-secondary">삭제하기</button>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div><!-- 예약 설정 모달 end-->		
	
		
	</main>
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
  <script>
    let currentUrl = document.location.pathname;
    const getEventList = () => {
      $.ajax({
        type: 'GET',
        url: currentUrl + "/" + `${loginEmp.empNo}`,
        dataType: 'json'
      }).done(function(data){
        let events = []
        data.forEach((e) => {
          let event = {};
          event['eventNo'] = e.eventNo;
          event['title'] = e.title;
          event['id'] = e.eventNo;
          if(e.allday === 'T'){
            event['start'] = e.startTime.split(" ")[0];
            event['end'] = e.endTime.split(" ")[0];
          }else{
            event['start'] = e.startTime.split(" ")[0] + "T" + e.startTime.split(" ")[1];
            event['end'] = e.endTime.split(" ")[0] + "T" + e.endTime.split(" ")[1];
          }
          events.push(event);
        });
        renderCal(events);
      });

    };

    const renderCal = (list) => {
      var calendarEl = document.getElementById('calendar');
      var calendar = new FullCalendar.Calendar(calendarEl, {
        slotMinTime: '08:00', // Day 캘린더에서 시작 시간
        headerToolbar: {
          left: 'prev,next today',
          center: 'title',
          right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
        },
        initialView: 'dayGridMonth',
        locale: 'ko',
        navLinks: true, // 날짜를 선택하면 Day 캘린더나 Week 캘린더로 링크
        editable: true, // 수정 가능?
        selectable: true, // 달력 일자 드래그 설정가능
        nowIndicator: true, // 현재 시간 마크
        dayMaxEvents: true, // 이벤트가 오버되면 높이 제한 (+ 몇 개식으로 표현)

        selectAllow: function(arg){
          let start = new Date(arg.start);
          let today = new Date(formatDate(new Date()) + " 00:00");
          if(start < today){
            return false;
          }else{
            return true;
          }
        },
        select: function(arg) { // 캘린더에서 드래그로 이벤트를 생성할 수 있다.
          let data = {
            start: arg.start,
            end: arg.end,
            allDay: arg.allDay
          };
          setDate(data);
          calendar.unselect();
        },
        eventClick: function(info) {
          eventDetail(info);
        },
        events: list,
        googleCalendarApiKey : '',
        eventSources : [
          {
                googleCalendarId : "ko.south_korea#holiday@group.v.calendar.google.com"
              , className : "koHolidays"
              , color : "#FF0000"
              , textColor : "#FFFFFF"
          }
        ]
      });
  
      calendar.render();
    }

    const eventDetail = (info) => {
      let event = info.event;
      console.log(event.title);
      $('#detailForm #title').val(event.title);
      $('#detailForm #eventNo').val(event.id);
      if(event.allDay){
        $('#detailForm #start').val(event.startStr);
        $('#detailForm #end').val(event.endStr);
      }else{
        $('#detailForm #start').val(formatDate(event.start));
        $('#detailForm #end').val(formatDate(event.end));
        $('#detailForm #startTime').val(formatTime(event.start));
        $('#detailForm #endTime').val(formatTime(event.end));
      }
      $('#detailModal').modal('show');
    }

    $('#addBtn').click(function(){
      addEvent();
      });

    $('#updateBtn').click(function(){
      updateEventByForm();
    })
    
    $('#deleteBtn').click(function(){
      deleteEvent();
    })

    const deleteEvent = () => {
      $.ajax({
        type: 'DELETE',
        url: currentUrl + "/" + $('#detailForm #eventNo').val(),
        dataType: 'text'
      }).done(function(data){
        Swal.fire({					
					icon: 'success',
					text: '일정이 삭제되었습니다.',
					confirmButtonText: '확인'
				}).then((result) => {
					if(result.isConfirmed){
						$('#detailModal').modal('hide');
						getEventList();
					}
				});
      }).fail(function(){

      });
    }

    const updateEventByForm = () => {
      let data = makeDataForUpdate();
      console.log(data);
      $.ajax({
        type: 'PUT',
        url: currentUrl + "/" + $('#detailForm #eventNo').val(),
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify(data),
        dataType: 'text'
      }).done(function(data){
        Swal.fire({					
					icon: 'success',
					text: '일정이 수정되었습니다.',
					confirmButtonText: '확인'
				}).then((result) => {
					if(result.isConfirmed){
						$('#detailModal').modal('hide');
						getEventList();
					}
				});
      }).fail(function(e){
        console.log(e)
      });
    }

    const addEvent = () => {
      let data = makeDataForAdd();
      $.ajax({
        type: 'POST',
        url: currentUrl,
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify(data),
        dataType: 'text'
      }).done(function(data){
        Swal.fire({					
					icon: 'success',
					text: '일정이 등록되었습니다.',
					confirmButtonText: '확인'
				}).then((result) => {
					if(result.isConfirmed){
            getEventList();
            clearForm();
					}
				});
      }).fail(function(e){
        console.log(e)
      });
    }

    const updateEvent = (obj) => {
      let updateData = {};
      let event = obj.event;
      console.log(event);
      updateData["title"] = event.title;
      if(event.allDay){
   	    updateData['startTime'] = event.startStr;
    	  updateData['endTime'] = event.endStr;
        updateData['allday'] = 'T';
      }else{
        let start = formatDate(event.start) + " " + formatTime(event.start);
        let end = formatDate(event.end) + " " + formatTime(event.end);
        updateData['startTime'] = start;
        updateData['endTime'] = end;
        updateData['allday'] = 'F';
      }

      $.ajax({
        type: 'PUT',
        url: currentUrl + "/" + event.id,
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify(updateData),
        dataType: 'text'
      }).done(function(data){
      }).fail(function(e){
        console.log(e)
      });
    }

    const makeDataForAdd = () => {
      let startDate = $('#eventForm #start').val();
      let endDate = $('#eventForm #end').val();
      let startTime = $('#eventForm #startTime').val();
      let endTime = $('#eventForm #endTime').val();

      let title = $('#title').val();
      let start = startDate + " " + startTime;
      let end = endDate + " " + endTime;
      let allday = "T";
      if(startTime != '') allday = "F";
      return {
        "empNo": `${loginEmp.empNo}`,
        "title": title,
        "startTime": start.trim(),
        "endTime": end.trim(),
        "allday": allday
      };
    }

    const makeDataForUpdate = () => {
      let startDate = $('#detailForm #start').val();
      let endDate = $('#detailForm #end').val();
      let startTime = $('#detailForm #startTime').val();
      let endTime = $('#detailForm #endTime').val();

      let title = $('#detailForm #title').val();
      let start = startDate + " " + startTime;
      let end = endDate + " " + endTime;
      let allday = "T";
      if(startTime != '') allday = "F";
      return {
        "empNo": `${loginEmp.empNo}`,
        "title": title,
        "startTime": start.trim(),
        "endTime": end.trim(),
        "allday": allday
      };
    }

    const formatDate = (date) => {
      let year = date.getFullYear();
      let month = (date.getMonth() + 1).toString().padStart(2,'0');
      let day = date.getDate().toString().padStart(2,'0');
      let dayFormat = year + '-' + month  + '-' + day;
      return dayFormat;
    }

    const formatTime = (date) => {
      let hour = date.getHours().toString().padStart(2,'0');
      let minute = date.getMinutes().toString().padStart(2,'0');
      let time = hour + ":" + minute;
      return time;
    }

    const setDate = (data) => {
      let start = new Date(data.start);
      let end = new Date(data.end);
      if(data.allDay){
        end.setDate(end.getDate() -1);
        $('#start').val(formatDate(start));
        $('#end').val(formatDate(end));
      }else{
        $('#start').val(formatDate(start));
        $('#end').val(formatDate(start));
        $('#startTime').val(formatTime(start));
        $('#endTime').val(formatTime(end));
      }
    }

    const clearForm = () => {
      $('#title').val("");
      $('#start').val("");
      $('#end').val("");
      $('#startTime').val("");
      $('#endTime').val("");
    }

    $(document).ready(getEventList);
  
  </script>
</body>
</html>