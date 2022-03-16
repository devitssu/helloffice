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

        
		<!-- 촉구서 수정, 삭제 -->
	<div class="col-lg-8" style="margin-left: auto; margin-right: auto;">
		<div class="card week-wrap">
			<div class="container-fluid">
				<div style="margin-left: 7px; margin-bottom: 30px; margin-top: 30px;">
					<div style="text-align: center; font-size: 2em; margin-bottom: 30px;">정산 수정 및 삭제</div>
					<form name="form1" method="post">
						    	<div class="input-group mb-3">
								  <span class="input-group-text" id="inputGroup-sizing-default">정산 번호</span>
								  <input readonly size="20" name="calNo" id="calNo" type="text" value="${dto.calNo}" placeholder="" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
								</div>
						    	<div class="input-group mb-3">
								  <span class="input-group-text" id="inputGroup-sizing-default">사원 번호</span>
								  <input readonly name="empNo" id="empNo" type="text" value="${dto.empNo}" placeholder="" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
								</div>
						    	<div class="input-group mb-3">
								  <span class="input-group-text" id="inputGroup-sizing-default">정산 금액</span>
								  <input name="calAmount" id="calAmount" type="text" value="${dto.calAmount}" placeholder="" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
								</div>
								<div class="input-group mb-3">
								  <label class="input-group-text" for="inputGroupSelect01">승인 여부</label>
								  <select name="calYn" value="${dto.calYn}" class="form-select" id="urgeType inputGroupSelect01">
								    <option selected disabled="disabled">승인 여부 선택</option>
									<option value="Y">승인</option>
									<option value="N">반려</option>
								  </select>
								</div>
								<div class="input-group mb-3">
								  <label class="input-group-text" for="inputGroupSelect01">지급 여부</label>
								  <select name="calPayYn" value="${dto.calPayYn}" class="form-select" id="urgeType inputGroupSelect01">
								    <option selected disabled="disabled">지급 여부 선택</option>
									<option value="Y">지급</option>
									<option value="N">미지급</option>
								  </select>
								</div>
								<div class="input-group mb-3">
									<span class="input-group-text">반려 사유</span>
									<textarea name="calReason" id="calReason"  class="form-control" aria-label="With textarea">${dto.calReason}</textarea>
								</div>
								<h4 style="text-align: center;"> 발송일 : <fmt:parseDate var="weekInDate" value="${dto.calDate}" pattern="yyyyMMdd"></fmt:parseDate>
							<fmt:formatDate value="${weekInDate}" pattern="yyyy-MM-dd(EE)"></fmt:formatDate> </h4>
									
							<div style="width: 100%; text-align: center; margin-top: 30px;">
							<!-- 게시물번호를 hidden으로 처리 -->
							<input type="hidden" name="calNo" value="${dto.calNo}">
							<button type="button" id="btnUpdate">수정</button>
							<button type="button" id="btnDelete">삭제</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
		
	
</div>
    
    
    <script type="text/javascript">
    
    $(document).ready(function(){
    	$("#btnDelete").click(function() {
    		if (confirm("정말 삭제하시겠습니까?")) {
				document.form1.action = "calDelete.do";
				document.form1.submit();
			}
		});
    
    
    $("#btnUpdate").click(function(){
    	document.form1.action="calUpdate.do"
    	//폼에 입력한 데이터를 서버로 전송
    	document.form1.submit();
    });
});
    </script>
    
    
    </section>
    
		
	</main>
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>