<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/common/head.jsp" %>

<body>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>

	<main id="main" class="main">
	
		<h2>예약 관리</h2>

        <ul class="nav nav-tabs nav-tabs-bordered d-flex" id="borderedTabJustified" role="tablist">
          <li class="nav-item flex-fill" role="presentation">
            <button class="nav-link w-100 active" id="home-tab" data-bs-toggle="tab" data-bs-target="#bordered-justified-home" type="button" role="tab" aria-controls="home" aria-selected="true">자산 관리</button>
          </li>
          <li class="nav-item flex-fill" role="presentation">
            <button class="nav-link w-100" id="profile-tab" data-bs-toggle="tab" data-bs-target="#bordered-justified-profile" type="button" role="tab" aria-controls="profile" aria-selected="false">예약 신청 관리</button>
          </li>
          <li class="nav-item flex-fill" role="presentation">
            <button class="nav-link w-100" id="contact-tab" data-bs-toggle="tab" data-bs-target="#bordered-justified-contact" type="button" role="tab" aria-controls="contact" aria-selected="false">관리자 설정</button>
          </li>
        </ul>
        <div class="tab-content pt-2" id="borderedTabJustifiedContent">
          <div class="tab-pane fade show active" id="bordered-justified-home" role="tabpanel" aria-labelledby="home-tab">
              <table class="table table-borderless table-hover">
                <thead>
                  <tr>
                    <th scope="col">자산 번호</th>
                    <th scope="col">이름</th>
                    <th scope="col">설정</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <th scope="row">1</th>
                    <td>Brandon Jacob</td>
                    <td>Designer</td>
                  </tr>
                  <tr>
                    <th scope="row">2</th>
                    <td>Bridie Kessler</td>
                    <td>Developer</td>
                  </tr>
                </tbody>
              </table>
          </div>
          <div class="tab-pane fade" id="bordered-justified-profile" role="tabpanel" aria-labelledby="profile-tab">
            <table class="table table-borderless table-hover">
                <thead>
                  <tr>
                    <th scope="col">예약 번호</th>
                    <th scope="col">예약 자산</th>
                    <th scope="col">예약자</th>
                    <th scope="col">예약일자</th>
                    <th scope="col">예약시간</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <th scope="row">1</th>
                    <td>Brandon Jacob</td>
                    <td>Designer</td>
                    <td>28</td>
                    <td>2016-05-25</td>
                  </tr>
                  <tr>
                    <th scope="row">2</th>
                    <td>Bridie Kessler</td>
                    <td>Developer</td>
                    <td>35</td>
                    <td>2014-12-05</td>
                  </tr>
                </tbody>
              </table>
          </div>
          <div class="tab-pane fade" id="bordered-justified-contact" role="tabpanel" aria-labelledby="contact-tab">
          	<button class="btn btn-primary">관리자 추가</button>
          
            <table class="table table-borderless table-hover">
                <thead>
                  <tr>
                    <th scope="col">이름</th>
                    <th scope="col">직급</th>
                    <th scope="col">부서</th>
                    <th scope="col">권한</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td>Brandon Jacob</td>
                    <td>Designer</td>
                    <td>28</td>
                    <td>2016-05-25</td>
                  </tr>
                  <tr>
                    <td>Bridie Kessler</td>
                    <td>Developer</td>
                    <td>35</td>
                    <td>2014-12-05</td>
                  </tr>
                </tbody>
              </table>
          </div>
        </div>
		
		
	</main>
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>