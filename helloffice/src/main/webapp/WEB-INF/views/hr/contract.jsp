<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../common/head.jsp" %>

<style>

</style>

<body>
	<%@ include file = "../common/header.jsp" %>
	
	<main id="main" class="main">
		<div class="social-links mt-2">
			<!-- a태그 클릭하면 각 정보들 클립보드에 복사하는 스크립트 작업 해야됨 -->
			<button onclick="copyToClipBoard()">
				<a class="click-copy" data-bs-toggle="tooltip" data-bs-placement="bottom" title="" data-bs-original-title="010-0100-1010">
				<i class="bi bi-telephone"></i>
				</a>
			</button> &nbsp;
			<a onclick="copyToClipBoard()" class="click-copy" data-bs-toggle="tooltip" data-bs-placement="bottom" title="" data-bs-original-title="testipnida@gmail.com"><i class="bi bi-envelope"></i></a>
		</div>
	</main>

	<script>
		function copyToClipBoard(){
			var content = document.getElementsByClassName('click-copy');
			
			content.select();
			document.exeCommand('copy');
			
			alert("Copied");
		}
	</script>
	
	<%@ include file = "../common/footer.jsp" %>
</body>
</html>