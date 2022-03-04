<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../common/head.jsp" %>

<style>
	.navbar_pagetitle{
		margin:auto;
		padding-top:15px;
	}					

	.navbar_content_l{
		padding-left: 1rem;
		float: left;
	}

	.navbar_content_r{
		padding-top: 10px;
		padding-right: 1rem;
		float: right;
	}
	/*  상단 navbar 설정  */
	
	.card_radius{
		border-radius: 25px;
	}

	.card_header{
		border-bottom: 0.5px solid grey;
		padding: 1rem;
		display: block;
	}
</style>
<body>
	<%@ include file = "../common/header.jsp" %>
	
	<main id="main" class="main">
		<section class="section">
			
			<div class="card">
				<div class="card-body">
					<!-- <div><a class="btn btn-l btn-primary mt-3 mb-3" data-bs-toggle="modal" data-bs-target="#tagSetting" >태그 관리&nbsp; <i class="bi-gear"></i></a></div> -->
					<div><a class="btn btn-sm btn-dark rounded-pill mb-2" href="#"><i class="bi-inboxes-fill"></i> 모두 보기</a></div>
					<c:forEach items="${tagList}" var="t">
						<div><a class="btn btn-sm btn-light rounded-pill mb-2" href="#"># ${t.tagName}</a></div>
					</c:forEach>
				</div>
			
			</div>

		</section>
		
	</main>
	
	<%@ include file = "../common/footer.jsp" %>
</body>
</html>