<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/head.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="resources/assets/css/workCss/workMain.css" type="text/css">
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>

	<main id="main" class="main">
	
	<section class="section dashboard">
	
	<div class="row">


        <!-- ๋ฉ๋ด๋ฐ -->
		<div class="col-lg-12" id="menubar">
			<div class="card">
				<nav class="navbar navbar-expand-md navbar-white bg-white">
				    <div class="container-fluid" style="margin: 4px;">
				        <div class="navbar-collapse collapse w-100 order-1 order-md-0 dual-collapse2">
				            <ul class="navbar-nav me-auto">
				                <li class="nav-item active">
				                    <a class="nav-link" href="workMain">
									๐๋น์ผ ๊ทผ๋ฌด ์กฐํ
									</a>
				                </li>
				                <li class="nav-item">
				                    <a class="nav-link" href="workYear">
				          			๐์ด๋ฒ ๋๋ ๊ทผ๋ฌด ์กฐํ
									</a>
				                </li>
				            </ul>
				        </div>
				        <div class="nav-link mx-auto order-0" title="ํ์ฌ ๋ ์ง">
								  <div class="navbar-brand mx-auto" id="current_date"></div>
				            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target=".dual-collapse2">
				                <span class="navbar-toggler-icon"></span>
				            </button>
				        </div>
				        <div class="navbar-collapse collapse w-100 order-3 dual-collapse2">
				            <ul class="navbar-nav ms-auto">
				            	<li>
					         	 <a class="nav-link btn btn-primary" href="/helloffice/workflow/wfForm"  style="color: white"> <!--id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false" role="button">-->
						           <span class="material-icons md-18" style="vertical-align: middle">beach_access</span> 
									ํด๊ฐ ์ฌ์ฉ
					          	</a>
					          	</li>
					            <li class="nav-item" style="margin-left: 20px; margin-right: 10px">
					          		<a class="nav-link" href="/helloffice/off">๐ ํด๊ฐ ๋ด์ญ</a>
					        	</li>
				            </ul>
				        </div>
				    </div>
				</nav>
			</div>
		</div>
        

		<!-- ์ ๋จ์ ์กฐํ -->
		<div class="col-lg-12">
	        <div class="card week-wrap">
	        	<div class="container-fluid" style="height: 700px; overflow: auto;">
	        		<figure style="margin: 20px; margin-top: 40px;">
					  <figcaption class="blockquote-footer">
					    <cite title="Source Title">2022๋ 03์ </cite>๊ทผ๋ฌด์กฐํ 
					  </figcaption>
					</figure>
					  <c:forEach items="${monthList }" var="w">
					  <table class="table table-hover" style="margin-top: 10px; font-size: 1.5em;">
					   		<thead>
						    <tr>
						      <th scope="col">๊ทผ๋ฌด ์ผ : 
								<fmt:parseDate var="weekInDate" value="${w.inDate}" pattern="yyyyMMdd"></fmt:parseDate>
								<fmt:formatDate value="${weekInDate}" pattern="yyyy-MM-dd(EE)"></fmt:formatDate>
							  </th>
						    	<td>์ถ๊ทผ ์๊ฐ : 
						    	<fmt:parseDate var="weekInTime" value="${w.inTime}" pattern="HHmmss"></fmt:parseDate>
								<fmt:formatDate value="${weekInTime}" pattern="HH:mm(a)"></fmt:formatDate>
								</td>
						    	<td>ํด๊ทผ ์๊ฐ : 
								<fmt:parseDate var="weekOutTime" value="${w.outTime}" pattern="HHmmss"></fmt:parseDate>
								<fmt:formatDate value="${weekOutTime}" pattern="HH:mm(a)"></fmt:formatDate>
								</td>
						    </tr>
						  </thead>
						</table>
					  </c:forEach>
				   </div>
				</div>
	        </div>

		
		
	</div>
    
    <script type="text/javascript">
    
    date = new Date();
    year = date.getFullYear();
    month = date.getMonth() + 1;
    day = date.getDate();
    
    function getweek() {
    var week = new Array('์ผ', '์', 'ํ', '์', '๋ชฉ', '๊ธ', 'ํ ');
    var today = new Date().getDay();
    var todayLabel = week[today];
    return todayLabel;
    }
    document.getElementById("current_date").innerHTML = year + "๋ " + month + "์ " + day + "์ผ " + "(" + getweek() + ")";


    setInterval("dpTime()",1000);
    function dpTime(){
      var now = new Date();
      hours = now.getHours();
      minutes = now.getMinutes();
      seconds = now.getSeconds();
      
      if (hours > 12){
        hours -= 12;
        ampm = "์คํ "; 
      }else{
        ampm = "์ค์  "; 
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
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>