<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/common/head.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<body>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>

	<main id="main" class="main">
	<h1>근무 수정 / 삭제</h1>
		<form method="post">
			<hr>
			<div>
				출근 날짜 : <input type="text" name="inDate" value="${data.inDate}" readonly="readonly"> 
			</div>
			<div>
				출근 시간 : <input type="text" name="inTime" value="${data.inTime}">  
			</div>
			<div>
				퇴근 시간 : <input type="text" name="outTime" value="${data.inTime}"> 
			</div>
			<br>
			<hr>
			<input type="submit" value="수정하기" formaction="<%=request.getContextPath()%>/edit">
			<input type="submit" value="삭제하기" formaction="<%=request.getContextPath()%>/delete">
		</form>
		
		
	</main>
	
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>