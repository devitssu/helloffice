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

	.float_r{
		float: right;
	}

	.modal_head{
		padding: 2rem 1rem;
	}

	.modal_head_title{
		font-size: xx-large;
		font-weight: 600;
		padding-bottom: 10px;
	}

	.modal_head_subtitle{
		font-size: medium;
		color: darkgray;
	}

	.modal_mid_button{
		padding: 1.5rem 1rem;
		font-size: larger;
		font-weight: 500;
		color: #0d6efd;
		background-color: rgba(100, 148, 237, 0.07);
	}

	.modal_mid_button  :hover{
		background-color: rgba(100, 148, 237, 0.5);
	}

	.modal_body{
		padding: 2rem 1rem;
		background-color: azure;
	}

	/* tree 구조 */

	.tree_main{
		font-size: large;
	}
	
	.tree_sub{
		padding: 0.5rem 1rem;
	}







	/* 본문 */

	.insa_text_title{
		font-size: larger;
		font-weight: 600;
		padding: 1rem;
	}

	.insa_textarea{
		line-height: 1.55;
		width: 100%;
		border: 0px solid rgb(99, 114, 131);
		border-radius: 10px;
		padding: 12px;
		background-color: rgba(99, 114, 131, 0.02);
		font-size: 14px;
		box-sizing: border-box;
		font-weight: 500;
		box-shadow: rgb(29 56 83 / 8%) 0px 0px 0px 1px inset, rgb(0 0 0 / 4%) 0px 1px 1px 0px inset;
		outline: none;
		resize: none;
	}

	/* 개인 페이지 */

	.a_tag{
		text-decoration: none;
		text-decoration-line: none;
		color: white;
	}

	.margin-div{
		margin: 1rem;
	}


    .title_mid{
        padding: 1.5rem 0rem 0.5rem;
        font-size: larger;
    }
	
    .button_none_deco{
        text-decoration: none;
        border: none;
        background-color: transparent;
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
									<h1 style="padding-bottom: 0.5rem">초대</h1>
									<nav>
										<ol class="breadcrumb">
											<li class="breadcrumb-item"><a href="teamList">구성원</a></li>
											<li class="breadcrumb-item"><a href="teamReport">팀리포트</a></li>
											<li class="breadcrumb-item active">초대</li>
											<li class="breadcrumb-item"><a href="contract">계약</a></li>
										</ol>
									</nav>
								</div>
								<div class="navbar_content_r">
									<button type="button" class="btn btn-primary">
										<a href="sendingInvite" class="a_tag"><i class="bi bi-plus-circle"></i> 구성원 추가하기</a>
									</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 상단 navbar 끝 -->

			<!-- 페이지 내용 -->
			<div class="body">
				<section class="section">
					<div class="row">
						<div class="col-lg-12">
							<div class="card card_radius">
								<div class="card_header">
									ㅎㅇㅎㅇ
								</div>
								<div class="card-body">
									ㅎㅇㅎㅇㅎㅇㅎㅇ
								</div>
							</div>
						</div>
					</div>
				</section>
			</div>
		</section>
	</main>
	
	<%@ include file = "../common/footer.jsp" %>
</body>
</html>