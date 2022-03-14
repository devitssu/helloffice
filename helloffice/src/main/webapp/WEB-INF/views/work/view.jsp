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

        
		<!-- 휴가 수정, 삭제 -->
	<div class="col-lg-8" style="margin-left: auto; margin-right: auto;">
		<div class="card week-wrap">
			<div class="container-fluid">
				<div style="margin-left: 7px; margin-bottom: 30px; margin-top: 30px;">
					<div style="text-align: center; font-size: 2em; margin-bottom: 30px;">휴가 수정 및 삭제</div>
					<form name="form1" method="post">
						    	<div class="input-group mb-3">
								  <span class="input-group-text" id="inputGroup-sizing-default">사원 번호</span>
								  <input size="20" name="empNo" id="empNo" type="text" value="${dto.empNo}" placeholder="사원 번호를 입력해주세요" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
								</div>
						    	<div class="input-group mb-3">
								  <span class="input-group-text" id="inputGroup-sizing-default">부서 이름</span>
								  <input name="depName" id="depName" type="text" value="${dto.depName}" placeholder="부서 이름을 입력해주세요" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
								</div>
						    	<div class="input-group mb-3">
								  <span class="input-group-text" id="inputGroup-sizing-default">휴가 유형</span>
								  <input name="offType" id="offType" type="text" value="${dto.offType}" placeholder="휴가 유형을 입력해주세요" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
								</div>
							<div style="width: 100%; text-align: center; margin-top: 30px;">
							<!-- 게시물번호를 hidden으로 처리 -->
							<input type="hidden" name="offNo" value="${dto.offNo}">
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
				document.form1.action = "delete.do";
				document.form1.submit();
			}
		});
    
    
    $("#btnUpdate").click(function(){
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
    	document.form1.action="update.do"
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