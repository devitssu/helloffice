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


        <!-- 메뉴바 -->
		<div class="col-lg-12" id="menubar">
			<div class="card">
				<nav class="navbar navbar-expand-md navbar-white bg-white">
				    <div class="container-fluid" style="; margin: 4px;">
				        <div class="navbar-collapse collapse w-100 order-1 order-md-0 dual-collapse2">
				            <ul class="navbar-nav me-auto">
				                <li class="nav-item active">
				                    <a class="nav-link" href="workMain">
									📆당일 근무 조회
									</a>
				                </li>
				                <li class="nav-item">
				                    <a class="nav-link" href="workMonth">
				          			📚이번 달 근무 조회
									</a>
				                </li>
				            </ul>
				        </div>
				        <div class="nav-link mx-auto order-0" title="현재 날짜">
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
									휴가 사용
					          	</a>
					          	</li>
					            <li class="nav-item" style="margin-left: 20px; margin-right: 10px">
					          		<a class="nav-link" href="/helloffice/off">📚 휴가 내역</a>
					        	</li>
				            </ul>
				        </div>
				    </div>
				</nav>
			</div>
		</div>
        

		<!-- 1년 단위 근태 조회 -->
		<div class="col-lg-12">
	        <div class="card week-wrap">
	        	<div class="container-fluid">
	        		<figure style="margin: 20px; margin-top: 40px;">
	        		<figcaption class="blockquote-footer">
					    <cite title="Source Title">2022년</cite> 근무조회 
					  </figcaption>
					  </figure>
	        		<form action="${path}/helloffice/workYear" method="post">
					  		<div style="float: left;">
					  		<select class="form-select form-select-sm" style="width: 105px" name="searchType">
					  			<option value="inDate" <c:out value="${map.searchType == 'inDate'?'selected':''}"/> >근무 일자 (YYYYMMDD)</option>
					  		</select>
					  		</div>
					  		<div class="input-group mb-3 input-group input-group-sm mb-3" style="width: 230px; float: left;">
							  <input type="text" name="searchValue" value="${map.searchValue}" class="form-control" aria-label="Recipient's username" aria-describedby="button-addon2" placeholder="YYYYMMDD">
							  <button class="btn btn-outline-secondary" type="submit" id="button-addon2">검색</button>
							</div>
					  	</form>
					  
					
					  <c:forEach items="${map.yearList }" var="w">
					  <table class="table table-hover" style="margin-top: 10px; font-size: 1.5em;">
					   		<thead>
						    <tr>
						      <th scope="col">근무 일 : 
								<fmt:parseDate var="weekInDate" value="${w.inDate}" pattern="yyyyMMdd"></fmt:parseDate>
								<fmt:formatDate value="${weekInDate}" pattern="yyyy-MM-dd(EE)"></fmt:formatDate>
							  </th>
						    	<td>출근 시간 : 
						    	<fmt:parseDate var="weekInTime" value="${w.inTime}" pattern="HHmmss"></fmt:parseDate>
								<fmt:formatDate value="${weekInTime}" pattern="HH:mm(a)"></fmt:formatDate>
								</td>
						    	<td>퇴근 시간 : 
								<fmt:parseDate var="weekOutTime" value="${w.outTime}" pattern="HHmmss"></fmt:parseDate>
								<fmt:formatDate value="${weekOutTime}" pattern="HH:mm(a)"></fmt:formatDate>
								</td>
						    </tr>
						  </thead>
						</table>
					  </c:forEach>
					  <!-- 페이지 이동 -->
					<div class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups" style="align-items: center; width: 100%; ">
						<div class="btn-group me-2" role="group" aria-label="Second group" style="display: inline-block;">
							<!-- 처음페이지로 이동 : 현재 페이지가 1보다 크면 처음 하이퍼링크를 화면에 출력 -->
							<c:if test="${map.pageVo.curBlock > 1}">
					    		<a href="javascript:list('1')">
					    			<button type="button" class="btn btn-outline-dark">처음</button>&nbsp;
					    		</a>
					    	</c:if>
					    	<!-- 이전페이지 블록으로 이동 : 현재 페이지 블럭이 1보다 크면 이전 하이퍼링크를 화면에 출력 -->
					    	<c:if test="${map.pageVo.curBlock > 1}">
					    		<a href="javascript:list('${map.pageVo.prevPage}')">
					    			<button type="button" class="btn btn-outline-dark">이전</button>&nbsp;
					    		</a>
					    	</c:if>
					    	
					    	<!-- 하나의 블럭에서 반복문 수행 (시작페이지에서 끝페이지까지) -->
					    	<c:forEach var="num" begin="${map.pageVo.blockBegin}" end="${map.pageVo.blockEnd}">
					    		<!-- 현재페이지이면 하이퍼링크 제거 -->
					    		<c:choose>
					    			<c:when test="${num == map.pageVo.curPage}">
					    				<button type="button" class="btn btn-outline-secondary">${num}</button> &nbsp;
					    			</c:when>
					    			<c:otherwise>
					    				<a href="javascript:list('${num}')">
					    					<button type="button" class="btn btn-outline-secondary" >${num}</button> &nbsp;
					    				</a>
					    			</c:otherwise>
					    		</c:choose>
					    	</c:forEach>
					    	
					    	<!-- 다음페이지 블록으로 이동 : 현재 페이지 블럭이 전체 페이지 블럭보다 작거나 같으면 [다음] 하이퍼링크를 화면에 출력 -->
					    	<c:if test="${map.pageVo.curBlock <= map.pageVo.totBlock}">
					    		<a href="javascript:list('${map.pageVo.nextPage}')">
					    			<button type="button" class="btn btn-outline-dark">다음</button>&nbsp;
					    		</a>
					    	</c:if>
					    	
					    	<!-- 끝페이지로 이동 : 현재 페이지가 전체 페이지보다 작거나 같으면 [끝] 하이퍼링크를 화면에 출력 -->
					    	<c:if test="${map.pageVo.curPage <= map.pageVo.totPage}">
					    		<a href="javascript:list('${map.pageVo.totPage}')">
					    			<button type="button" class="btn btn-outline-dark">끝</button>&nbsp;
					    		</a>
					    	</c:if>
					    	
						</div>
					</div>
					
					
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
    
  //원하는 페이지로 이동시 검색조건, 키워드 값을 유지하기 위해
    function list(page) {
		location.href ="${path}/helloffice/workYear?curPage="+page+"&searchType-${map.searchType}" + "&searchValue=${map.searchValue}";
	}
    
    </script>
    
    
    </section>
    
		
	</main>
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>