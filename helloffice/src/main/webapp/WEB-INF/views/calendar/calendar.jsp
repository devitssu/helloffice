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
        <h5>예약하기</h5>
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
            <button type="button" id="addEvent" class="btn btn-primary">등록하기</button>
            <button type="reset" class="btn btn-secondary">취소하기</button>
          </div>
        </form>
      </div>

      <div class="col-md-8">
        <div id='calendar'></div>
      </div>

    </div>
	
		
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
        console.log(data);
        let events = []
        data.forEach((e) => {
          if(e.allday === 'T'){
            let event = {};
            event['eventNo'] = e.eventNo;
            event['title'] = e.title;
            event['start'] = e.startTime.split(" ")[0];
            console.log(event);
            events.push(event);
          }else{
            let event = {};
            event['eventNo'] = e.eventNo;
            event['title'] = e.title;
            event['start'] = e.startTime.split(" ")[0] + "T" + e.startTime.split(" ")[1];
            event['end'] = e.endTime.split(" ")[0] + "T" + e.endTime.split(" ")[1];
            console.log(event);
            events.push(event);
          }
        });
        console.log(events);
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
        eventAdd: function(obj) { // 이벤트가 추가되면 발생하는 이벤트
          console.log(obj);
        },
        eventChange: function(obj) { // 이벤트가 수정되면 발생하는 이벤트
          console.log(obj);
        },
        eventRemove: function(obj){ // 이벤트가 삭제되면 발생하는 이벤트
          console.log(obj);
        },
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
        events: list
      });
  
      calendar.render();
    }

    $('#addEvent').click(function(){
        addEvent();
      });

    const addEvent = () => {
      let data = makeData();
      console.log(data);
      $.ajax({
        type: 'POST',
        url: currentUrl,
        contentType: 'application/json',
        data: JSON.stringify(data),
        dataType: 'text'
      }).done(function(data){
        clearForm();
        console.log("good");
      }).fail(function(e){
        console.log(e)
      });
    }

    const makeData = () => {
      let startDate = $('#start').val();
      let endDate = $('#end').val();
      let startTime = $('#startTime').val();
      let endTime = $('#endTime').val();

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