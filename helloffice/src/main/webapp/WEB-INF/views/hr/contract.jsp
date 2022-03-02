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
			<!-- 상단 navbar -->
			<div class="col-lg-12">
				<div class="card">
					<div class="container-fluid">
						<div class="pagetitle navbar_pagetitle">
							<div class="navbar_content">
								<div class="navbar_content_l">
									<h1 style="padding-bottom: 0.5rem">계약</h1>
									<nav>
										<ol class="breadcrumb">
											<li class="breadcrumb-item"><a href="teamList">구성원</a></li>
											<li class="breadcrumb-item"><a href="teamReport">팀리포트</a></li>
											<li class="breadcrumb-item"><a href="invite">초대</a></li>
											<li class="breadcrumb-item active">계약</li>
										</ol>
									</nav>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 상단 navbar 끝-->

		</section>
		
	</main>
	
	<%@ include file = "../common/footer.jsp" %>
</body>
</html>