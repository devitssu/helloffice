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
					<div style="text-align: center; font-size: 2em; margin-bottom: 30px;">촉구서 수정 및 삭제</div>
					<form name="form1" method="post">
						    	<div class="input-group mb-3">
								  <span class="input-group-text" id="inputGroup-sizing-default">촉구서 번호</span>
								  <input readonly="readonly" size="20" name="urgeNo" id="urgeNo" type="text" value="${dto.urgeNo}" placeholder="사원 번호를 입력해주세요" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
								</div>
						    	<div class="input-group mb-3">
								  <span class="input-group-text" id="inputGroup-sizing-default"> &nbsp; 사원 번호&nbsp;&nbsp;</span>
								  <input readonly="readonly" name="empNo" id="empNo" type="text" value="${dto.empNo}" placeholder="부서 이름을 입력해주세요" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
								</div>
								<div class="input-group mb-3">
								  <label class="input-group-text" for="inputGroupSelect01">촉구서 유형</label>
								  <select name="urgeType" value="${dto.urgeType}" class="form-select" id="urgeType inputGroupSelect01">
								    <option selected disabled="disabled">촉구서 타입 선택</option>
									<option value="1차">1차 촉구</option>
									<option value="2차">2차 촉구</option>
								  </select>
								</div>
						    	<div class="input-group mb-3">
								  <label class="input-group-text" for="inputGroupSelect01">&nbsp; 확인 여부&nbsp;&nbsp;</label>
								  <select name="urgeConfirm" value="${dto.urgeConfirm}" class="form-select" id="urgeConfirm inputGroupSelect01">
								    <option selected disabled="disabled">확인 여부 선택</option>
									<option value="Y">확인</option>
									<option value="N">미확인</option>
								  </select>
								</div>
								<div class="input-group mb-3">
								  <span class="input-group-text" id="inputGroup-sizing-default"> &nbsp;&nbsp;&nbsp; 발송 일 &nbsp;&nbsp;&nbsp;</span>
								  <input readonly="readonly" name="urgeDate" id="urgeDate" type="text" value="${dto.urgeDate}" placeholder="" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
								</div>
							<div style="width: 100%; text-align: center; margin-top: 30px;">
							<!-- 게시물번호를 hidden으로 처리 -->
							<input type="hidden" name="urgeNo" value="${dto.urgeNo}">
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
				document.form1.action = "urgeDelete.do";
				document.form1.submit();
			}
		});
    
    
    $("#btnUpdate").click(function(){
    	document.form1.action="urgeUpdate.do"
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