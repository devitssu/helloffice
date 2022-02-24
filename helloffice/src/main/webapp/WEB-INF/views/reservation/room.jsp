<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/common/head.jsp" %>
<!-- timetable.js -->
<link rel="stylesheet" href="${root}/resources/assets/vendor/timetable.js-master/dist/styles/timetablejs.css">

<script src="${root}/resources/assets/vendor/timetable.js-master/dist/scripts/timetable.js"></script>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>

	<main id="main" class="main">
		
		<div class="row mb-3">
			<div class="col-md-8 timetable"></div>
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
    
	</script>
</body>
</html>