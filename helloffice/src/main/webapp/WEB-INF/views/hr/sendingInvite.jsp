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


    /* 초대 메일 */
    .invite_wrapper{
        display: flex;
        padding: 1rem 1rem 4rem;
    }
    



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
            <!-- 페이지 내용 -->
			<div class="body">
				<section class="section">
					<div class="row">
						<div class="col-lg-12">
							<div class="card card_radius">
                                <div class="container-fluid">
                                    <div class="navbar_content_l">
                                        <button onclick="history.back()" class="button_none_deco">
                                            <h1 style="padding: 1.5rem 0rem"><i class="bi bi-arrow-left"></i></h1>
                                        </button>
                                    </div>
                                </div>
								<div class="invite_wrapper">
                                    <div style="margin: auto; width: 55vw;">
                                        <div class="invite_header">
                                            <div class="modal_head_title"> 구성원 추가 </div>
                                            <div class="modal_head_subtitle"> 구성원 추가하기 위한 메일을 보내세요. </div>
                                        </div>
                                        <div class="invite_contents">
                                            <div class="title_mid"> 필수정보 </div>
                                            <div class="col-sm-12">
                                                <form>
                                                    <div class="form-floating mb-3">
                                                        <input type="text" class="form-control" id="floatingName" placeholder="이름을 입력하세요">
                                                        <label for="floatingInput"> 이름을 입력하세요 </label>
                                                    </div>
                                                    <div class="form-floating mb-3">
                                                        <input type="email" class="form-control" id="floatingEmail" placeholder="Email">
                                                        <label for="floatingPassword">Email@example.com</label>
                                                    </div>
                                                    <div class="form-floating mb-3">
                                                        <input type="date" class="form-control" id="floatingName" placeholder="입사일을 설정해주세요">
                                                        <label for="floatingInput">  입사일을 설정해주세요 </label>
                                                    </div>
                                                    <div class="form-floating mb-3">
                                                        <input type="text" class="form-control" id="floatingPosition" placeholder=" 역할(직무) ">
                                                        <label for="floatingInput"> 역할(직무) </label>
                                                    </div>
                                                    <div class="form-floating mb-3">
                                                        <select type="text" class="form-control" id="floatingPosition" placeholder=" 역할(직무) ">
                                                            <option> 조직을 선택해주세요 </option>
                                                            <option value="1">대표</option>
                                                            <option value="2">마케팅</option>
                                                            <option value="3">영업팀</option>
                                                            <option value="4">디자인팀</option>
                                                        </select>
                                                        <label for="floatingInput"> 조직 </label>
                                                    </div>
                                                    
                                                    <div class="d-grid gap-2 mt-3 mb-5">
                                                        <input class="btn btn-primary" type="submit" value="전송하기">
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
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