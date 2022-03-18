<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/common/head.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<body>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>

	<main id="main" class="main">
	
	<div class="row">

        
		<!-- 휴가 수정, 삭제 -->
	<div class="col-lg-8" style="margin-left: auto; margin-right: auto;">
		<div class="card week-wrap">
			<div class="container-fluid">
				<div style="margin-left: 7px; margin-bottom: 30px; margin-top: 30px;">
					<div style="text-align: center; font-size: 2em; margin-bottom: 30px;">근무 수정 / 삭제</div>
					<form name="form1" method="post">
								<div class="input-group mb-3">
								  <span class="input-group-text" id="inputGroup-sizing-default">근무 날짜 : </span>
								  <input readonly size="20" name="inDate" id="inDate" type="text" value="${data.inDate}" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
								</div>
								<div>
							    	<div class="input-group mb-3">
									  <span class="input-group-text" id="inputGroup-sizing-default">출근 시간 : </span>
									  <input size="20" name="inTime" id="inTime" type="text" value="${data.inTime}" placeholder="YYYYMMDD" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
									  <span class="input-group-text" id="inputGroup-sizing-default">퇴근 시간 : </span>
									  <input size="20" name="outTime" id="outTime" type="text" value="${data.outTime}" placeholder="YYYYMMDD" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
									</div>
								</div>
							<div style="width: 100%; text-align: center; margin-top: 30px;">
							<input hidden="" name="editDate" id="editDate" value="${data.inDate}">
							<input type="submit" value="수정하기" formaction="<%=request.getContextPath()%>/edit">
							<input type="submit" value="삭제하기" formaction="<%=request.getContextPath()%>/delete">
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
		
	
</div>
		
		
	</main>
	
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>