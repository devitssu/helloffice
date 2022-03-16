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

        
		<!-- 휴가 생성 -->
	<div class="col-lg-8" style="margin-left: auto; margin-right: auto;">
		<div class="card week-wrap">
			<div class="container-fluid">
				<div style="margin-left: 7px; margin-bottom: 30px; margin-top: 30px;">
					<div style="text-align: center; font-size: 2em; margin-bottom: 30px;">휴가를 생성해주세요</div>
					<form action="insert.do" name="form1" method="post">
						    	<div class="input-group mb-3">
								  <span class="input-group-text" id="inputGroup-sizing-default">사원 번호</span>
								  <input size="20" name="empNo" id="empNo" type="text" value="${dto.empNo}" placeholder="사원 번호를 입력해주세요" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
								</div>
						    	<div class="input-group mb-3">
								  <span class="input-group-text" id="inputGroup-sizing-default">부서 이름</span>
								  <input name="depName" id="depName" type="text" value="${dto.depName}" placeholder="부서 이름을 입력해주세요" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
								</div>
						    	<div class="input-group mb-3">
						    	  <label class="input-group-text" for="inputGroupSelect01">휴가 유형</label>
								  <select name="offType" value="${dto.offType}" class="form-select" id="offPay inputGroupSelect01">
								    <option selected disabled="disabled">휴가 유형을 선택해주세요.</option>
									<option value="개근 연차 휴가">개근 연차 휴가</option>
									<option value="정기 연차 휴가">정기 연차 휴가</option>
									<option value="생리 휴가">생리 휴가</option>
									<option value="여름 휴가">여름 휴가</option>
									<option value="가족 돌봄 휴가">가족 돌봄 휴가</option>
									<option value="출산 휴가">출산 휴가</option>
									<option value="배우자 출산 휴가">배우자 출산 휴가</option>
									<option value="조의 휴가">조의 휴가</option>
								  </select>
								</div>
								<div class="input-group mb-3">
								  <label class="input-group-text" for="inputGroupSelect01">유급 여부</label>
								  <select name="offPay" value="${dto.offPay}" class="form-select" id="offPay inputGroupSelect01">
								    <option selected disabled="disabled">유급 여부를 선택해주세요.</option>
									<option value="Y">유급 휴가</option>
									<option value="N">무급 휴가</option>
								  </select>
								</div>
								<div>
							    	<div class="input-group mb-3">
									  <span class="input-group-text" id="inputGroup-sizing-default">사용 가능 날짜</span>
									  <input name="offStart" id="offStart" type="date" value="${dto.offStart}" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
									  <span class="input-group-text" id="inputGroup-sizing-default">사용 기한 날짜</span>
									  <input  name="offEnd" id="offEnd" type="date" value="${dto.offEnd}" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
									</div>
								</div>
								<div class="input-group">
								  <span class="input-group-text">추가 내용</span>
								  <textarea name="offContent" id="offContent"  class="form-control" aria-label="With textarea">${dto.offContent}</textarea>
								</div>
						<div style="width: 100%; text-align: center; margin-top: 30px;">
							<button type="button" id="btnSave">생성</button>
							<button type="reset" onclick="history.back()">취소</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	
	
</div>
    
    
    <script type="text/javascript">
    
    $(document).ready(function(){
    	$("#btnSave").click(function() {
    		var empNo = $("#empNo").val();
        	var depName = $("#depName").val();
        	var offType = $("#offType").val();
        	var offPay = $("#offPay").val();
        	var offOx = $("#offOx").val();
        	var offStart = $("#offStart").val();
        	var offEnd = $("#offEnd").val();
        	var offContent = $("#offContent").val();
        	if(empNo == ""){
        		alert("empNo을 입력하세요");
        		document.form1.empNo.focus();
        		return;
        	}
        	if(depName == ""){
        		alert("depName을 입력하세요");
        		document.form1.depName.focus();
        		return;
        	}
        	if(offType == ""){
        		alert("offType을 입력하세요");
        		document.form1.offType.focus();
        		return;
        	}
        	if(offPay == ""){
        		alert("offPay을 입력하세요");
        		document.form1.offPay.focus();
        		return;
        	}
        	if(offOx == ""){
        		alert("offOx을 입력하세요");
        		document.form1.offOx.focus();
        		return;
        	}
        	if(offStart == ""){
        		alert("offStart을 입력하세요");
        		document.form1.offStart.focus();
        		return;
        	}
        	if(offEnd == ""){
        		alert("offEnd을 입력하세요");
        		document.form1.offEnd.focus();
        		return;
        	}
        	if(offContent == ""){
        		alert("offContent을 입력하세요");
        		document.form1.offContent.focus();
        		return;
        	}
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