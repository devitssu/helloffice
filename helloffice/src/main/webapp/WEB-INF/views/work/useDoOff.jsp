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
				                    <a class="nav-link" href="workMain" style="color: black; vertical-align: middle;">
										<span class="material-icons" style="vertical-align: middle;">undo</span>
										관리자 페이지 돌아가기
									</a>
				                </li>
				                <li class="nav-item active">
				                    <a class="nav-link" href="adminOff" style="color: black; vertical-align: middle;">
										<span class="material-icons" style="vertical-align: middle;">undo</span>
										휴가 관리 페이지 돌아가기
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
				            		<a class="nav-link" href="offPayBack">
									💰연차 정산 조회
									</a>
					          	</li>
				            </ul>
				        </div>
				    </div>
				</nav>
			</div>
		</div>
        
        
		<!-- 연차 촉구 메인 -->
	<div class="col-lg-12">
		<div class="card week-wrap">
			<div class="container-fluid">
				<div style="margin-left: 7px; margin-bottom: 100px; margin-top: 25px;">
					<form action="${path}/helloffice/useDoOff" method="post">
					  		<div style="float: left;">
					  		<select class="form-select form-select-sm" style="width: 105px" name="searchOption">
					  			<option value="all" <c:out value="${map.searchOption == 'all'?'selected':''}"/> > 전체</option>
					  			<option value="urgeNo" <c:out value="${map.searchOption == 'urgeNo'?'selected':''}"/> >촉구서 번호</option>
					  			<option value="empNo" <c:out value="${map.searchOption == 'empNo'?'selected':''}"/> >사원 번호</option>
					  			<option value="urgeConfirm" <c:out value="${map.searchOption == 'urgeConfirm'?'selected':''}"/> >확인 여부</option>
					  			<option value="urgeType" <c:out value="${map.searchOption == 'urgeType'?'selected':''}"/> >촉구 타입</option>
					  			<option value="urgeDate" <c:out value="${map.searchOption == 'urgeDate'?'selected':''}"/> >촉구 발송일</option>
					  		</select>
					  		</div>
					  		<div class="input-group mb-3 input-group input-group-sm mb-3" style="width: 230px; float: left;">
							  <input type="text" name="keyword" value="${map.keyword}" class="form-control" aria-label="Recipient's username" aria-describedby="button-addon2">
							  <button class="btn btn-outline-secondary" type="submit" id="button-addon2">검색</button>
							  <div style="vertical-align: middle; margin-left: 5px; margin-top: 6px; font-size: 1em"> (${map.count})</div>
							</div>
					  	</form>
					  		<button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#exampleModal" style="float: right; margin-bottom: 20px;">연차 촉구서 작성/발송</button>
					<table class="table table-striped border border-3 table-bordered" style="text-align: center;">
					  <thead>
					    <tr>
					      <th scope="col">촉구서 번호</th>
					      <th scope="col">촉구 타입</th>
					      <th scope="col">사원 번호</th>
					      <th scope="col">확인 여부</th>
					      <th scope="col">작성 일</th>
					    </tr>
					  </thead>
					  <tbody>
					  <c:forEach var="row" items="${map.list}">
					    <tr>
					      <td scope="row"><a href="${path}/helloffice/urgeView.do?urgeNo=${row.urgeNo}">${row.urgeNo}</a></td>
					      <td>${row.urgeType}</td>
					      <td>${row.empNo}</td>
					      <td>${row.urgeConfirm}</td>
					      <td>
							<fmt:parseDate var="weekInDate" value="${row.urgeDate}" pattern="yyyyMMdd"></fmt:parseDate>
							<fmt:formatDate value="${weekInDate}" pattern="yyyy-MM-dd(EE)"></fmt:formatDate>
					      </td>
					    </tr>
					  </c:forEach>
					  </tbody>
					</table>
					
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
</div>
    
    
    
    
    <!-- 연차 촉구서 작성 Modal -->
		<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		    <form action="urgeInsert.do" method="post">
			      <div class="modal-header">
			        <h3 class="modal-title" id="exampleModalLabel"  style="margin-bottom: 30px;">연차 촉구서 발송</h3>
			        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" style="margin-bottom: 30px;"></button>
			      </div>
			      <div class="modal-body">
			          <div class="input-group mb-3">
						<span class="input-group-text" id="inputGroup-sizing-default">사원 번호</span>
						<input size="20" name="empNo" id="empNo" type="text" placeholder="사원 번호를 입력해주세요" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
					  </div>
					  <div class="input-group mb-3">
						<select name="urgeType" class="form-select" id="offOx inputGroupSelect01">
							<option selected disabled="disabled">[필수] 촉구 타입 선택</option>
							<option value="1차">1차 촉구서(6개월전)</option>
							<option value="2차">2차 촉구서(2개월전)</option>
					    </select>
					  </div>
					  <figure class="text-end" style="margin: 20px; margin-top: 40px;">
					  <figcaption class="blockquote-footer">
					    나머지 정보들은 자동으로 입력되어 발송됩니다. 
					  </figcaption>
					</figure>
			      </div>
			      <div class="modal-footer">
			      	<button type="submit" class="btn btn-primary">요청</button>
			        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
			      </div>
		    </form>
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
		location.href ="${path}/helloffice/useDoOff?curPage="+page+"&searchType-${map.searchType}" + "&searchValue=${map.searchValue}";
	}
    
    </script>
    
    
    </section>
    
		
	</main>
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>