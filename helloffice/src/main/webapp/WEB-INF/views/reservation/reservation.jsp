<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/common/head.jsp" %>
<!-- timetable.js -->
<link rel="stylesheet" href="${root}/resources/assets/vendor/timetable.js-master/dist/styles/timetablejs.css">
<script src="${root}/resources/assets/vendor/timetable.js-master/dist/scripts/timetable.js"></script>

<script type="text/javascript" src="${root}/resources/assets/js/jquery.timepicker.min.js" ></script><!-- 타이머js -->
<link type="text/css" rel="stylesheet" href="${root}/resources/assets/css/jquery.timepicker.css" media=""/>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>

	<main id="main" class="main">
		
		<div class="row mb-3">
			<div class="col-md-8 timetable"></div>
		</div>
		
		<div class="row mb-3">
			<div class="col-md-6"><!-- 예약 폼 start -->
			<h5>예약하기</h5>
              <form class="row g-3">
                  <div class="col-md-12">
	              	<label for="inputName5" class="form-label">예약 항목</label>
                    <select class="form-select" id="target">
                      <option selected>예약 항목 선택</option>
                      <option value="1">회의실 1</option>
                      <option value="2">회의실 2</option>
                      <option value="3">회의실 3</option>
                    </select>
                  </div>
                <div class="col-md-12">
                  <label for="inputName5" class="form-label">예약자</label>
                  <input type="text" class="form-control" id="inputName5">
                </div>
                
                  <div class="col-md-6">
	                <label for="inputDate" class="form-label">날짜</label>
                    <input type="date" class="form-control" id="inputDate">
                  </div>
                
                  <div class="col-md-3">
	                <label for="startTime" class="form-label">시간</label>
                    <input type="time" class="form-control" id="startTime" min="8:00" max="22:30" step="1800">
                  </div>
                  <div class="col-md-3">
	                <label for="startTime" class="form-label">&nbsp</label>
                    <input type="time" class="form-control" id="endTime" min="8:30" max="23:00" step="1800">
                  </div>
                <div class="col-12">
                  <label for="inputAddress5" class="form-label">예약 사유</label>
                  <input type="text" class="form-control" id="inputAddres5s" placeholder="회의">
                </div>
                <div class="text-center">
                  <button type="submit" class="btn btn-primary">예약하기</button>
                  <button type="reset" class="btn btn-secondary">취소하기</button>
                </div>
              </form>
			</div><!-- 예약 폼 end -->
			
			<div class="col-md-6"> <!-- 내 예약 목록 start -->
			  <h5>내 예약 목록</h5>
              <ul class="list-group">
                <li class="list-group-item d-flex justify-content-between align-items-start">
                  <div class="ms-2 me-auto">
                    <div class="fw-bold">회의실 1</div>
                    2022.02.28 11:30 - 12:30
                  </div>
                  <span class="badge bg-primary rounded-pill">승인 완료</span>
                </li>
                <li class="list-group-item d-flex justify-content-between align-items-start">
                  <div class="ms-2 me-auto">
                    <div class="fw-bold">회의실 1</div>
                    2022.02.28 11:30 - 12:30
                  </div>
                  <span class="badge bg-primary rounded-pill">승인 완료</span>
                </li>
                <li class="list-group-item d-flex justify-content-between align-items-start">
                  <div class="ms-2 me-auto">
                    <div class="fw-bold">회의실 1</div>
                    2022.02.28 11:30 - 12:30
                  </div>
                  <span class="badge bg-primary rounded-pill">승인 중</span>
                </li>
              </ul>
			</div><!-- 내 예약 목록 end -->
			
		</div> 
		
		
	</main>
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	<script type="text/javascript">

	    var timetable = new Timetable();
	    timetable.setScope(8, 23); // optional, only whole hours between 0 and 23
	    timetable.useTwelveHour(); //optional, displays hours in 12 hour format (1:00PM)
	    timetable.addLocations(['회의실 1', '회의실 2', '회의실 3', '회의실 4']);
	    timetable.addEvent('Frankadelic', '회의실 1', new Date(2015,7,17,10,45), new Date(2015,7,17,12,30));
	    
	    var options = {
	    		  url: '#', // makes the event clickable
	    		  class: 'vip', // additional css class
	    		  data: { // each property will be added to the data-* attributes of the DOM node for this event
	    		    id: 4,
	    		    ticketType: 'VIP'
	    		  },
	    		  onClick: function(event, timetable, clickEvent) {} // custom click handler, which is passed the event object and full timetable as context  
	    		};
   		timetable.addEvent('Jam Session', '회의실 3', new Date(2015,7,17,14,30), new Date(2015,7,17,15,30), options);
	    
	    
	    var renderer = new Timetable.Renderer(timetable);
	    renderer.draw('.timetable'); // any css selector
    
	    $(document).ready(function() {
	    	
	    	$("#startTime, #endTime").timepicker({
	    		'minTime' : '8:00am',
	    		'maxTime' : '21:00pm',
	    		'timeFormat' : 'H:i',
	    		'step' : 30
	    	});
	    	
	    	
	    });
	</script>
</body>
</html>