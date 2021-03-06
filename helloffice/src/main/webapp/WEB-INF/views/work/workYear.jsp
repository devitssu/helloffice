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
				    <div class="container-fluid" style="; margin: 4px;">
				        <div class="navbar-collapse collapse w-100 order-1 order-md-0 dual-collapse2">
				            <ul class="navbar-nav me-auto">
				                <li class="nav-item active">
				                    <a class="nav-link" href="workMain">
									๐๋น์ผ ๊ทผ๋ฌด ์กฐํ
									</a>
				                </li>
				                <li class="nav-item">
				                    <a class="nav-link" href="workMonth">
				          			๐์ด๋ฒ ๋ฌ ๊ทผ๋ฌด ์กฐํ
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
        

		<!-- 1๋ ๋จ์ ๊ทผํ ์กฐํ -->
		<div class="col-lg-12">
	        <div class="card week-wrap">
	        	<div class="container-fluid">
	        		<figure style="margin: 20px; margin-top: 40px;">
	        		<figcaption class="blockquote-footer">
					    <cite title="Source Title">2022๋</cite> ๊ทผ๋ฌด์กฐํ 
					  </figcaption>
					  </figure>
	        		<form action="${path}/helloffice/workYear" method="post">
					  		<div style="float: left;">
					  		<select class="form-select form-select-sm" style="width: 105px" name="searchType">
					  			<option value="inDate" <c:out value="${map.searchType == 'inDate'?'selected':''}"/> >๊ทผ๋ฌด ์ผ์ (YYYYMMDD)</option>
					  		</select>
					  		</div>
					  		<div class="input-group mb-3 input-group input-group-sm mb-3" style="width: 230px; float: left;">
							  <input type="text" name="searchValue" value="${map.searchValue}" class="form-control" aria-label="Recipient's username" aria-describedby="button-addon2" placeholder="YYYYMMDD">
							  <button class="btn btn-outline-secondary" type="submit" id="button-addon2">๊ฒ์</button>
							</div>
					  	</form>
					  
					
					  <c:forEach items="${map.yearList }" var="w">
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
					  <!-- ํ์ด์ง ์ด๋ -->
					<div class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups" style="align-items: center; width: 100%; ">
						<div class="btn-group me-2" role="group" aria-label="Second group" style="display: inline-block;">
							<!-- ์ฒ์ํ์ด์ง๋ก ์ด๋ : ํ์ฌ ํ์ด์ง๊ฐ 1๋ณด๋ค ํฌ๋ฉด ์ฒ์ ํ์ดํผ๋งํฌ๋ฅผ ํ๋ฉด์ ์ถ๋ ฅ -->
							<c:if test="${map.pageVo.curBlock > 1}">
					    		<a href="javascript:list('1')">
					    			<button type="button" class="btn btn-outline-dark">์ฒ์</button>&nbsp;
					    		</a>
					    	</c:if>
					    	<!-- ์ด์ ํ์ด์ง ๋ธ๋ก์ผ๋ก ์ด๋ : ํ์ฌ ํ์ด์ง ๋ธ๋ญ์ด 1๋ณด๋ค ํฌ๋ฉด ์ด์  ํ์ดํผ๋งํฌ๋ฅผ ํ๋ฉด์ ์ถ๋ ฅ -->
					    	<c:if test="${map.pageVo.curBlock > 1}">
					    		<a href="javascript:list('${map.pageVo.prevPage}')">
					    			<button type="button" class="btn btn-outline-dark">์ด์ </button>&nbsp;
					    		</a>
					    	</c:if>
					    	
					    	<!-- ํ๋์ ๋ธ๋ญ์์ ๋ฐ๋ณต๋ฌธ ์ํ (์์ํ์ด์ง์์ ๋ํ์ด์ง๊น์ง) -->
					    	<c:forEach var="num" begin="${map.pageVo.blockBegin}" end="${map.pageVo.blockEnd}">
					    		<!-- ํ์ฌํ์ด์ง์ด๋ฉด ํ์ดํผ๋งํฌ ์ ๊ฑฐ -->
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
					    	
					    	<!-- ๋ค์ํ์ด์ง ๋ธ๋ก์ผ๋ก ์ด๋ : ํ์ฌ ํ์ด์ง ๋ธ๋ญ์ด ์ ์ฒด ํ์ด์ง ๋ธ๋ญ๋ณด๋ค ์๊ฑฐ๋ ๊ฐ์ผ๋ฉด [๋ค์] ํ์ดํผ๋งํฌ๋ฅผ ํ๋ฉด์ ์ถ๋ ฅ -->
					    	<c:if test="${map.pageVo.curBlock <= map.pageVo.totBlock}">
					    		<a href="javascript:list('${map.pageVo.nextPage}')">
					    			<button type="button" class="btn btn-outline-dark">๋ค์</button>&nbsp;
					    		</a>
					    	</c:if>
					    	
					    	<!-- ๋ํ์ด์ง๋ก ์ด๋ : ํ์ฌ ํ์ด์ง๊ฐ ์ ์ฒด ํ์ด์ง๋ณด๋ค ์๊ฑฐ๋ ๊ฐ์ผ๋ฉด [๋] ํ์ดํผ๋งํฌ๋ฅผ ํ๋ฉด์ ์ถ๋ ฅ -->
					    	<c:if test="${map.pageVo.curPage <= map.pageVo.totPage}">
					    		<a href="javascript:list('${map.pageVo.totPage}')">
					    			<button type="button" class="btn btn-outline-dark">๋</button>&nbsp;
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
    
  //์ํ๋ ํ์ด์ง๋ก ์ด๋์ ๊ฒ์์กฐ๊ฑด, ํค์๋ ๊ฐ์ ์ ์งํ๊ธฐ ์ํด
    function list(page) {
		location.href ="${path}/helloffice/workYear?curPage="+page+"&searchType-${map.searchType}" + "&searchValue=${map.searchValue}";
	}
    
    </script>
    
    
    </section>
    
		
	</main>
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>