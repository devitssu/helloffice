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
          <!-- 자산 관리 탭 -->
          <div class="tab-pane fade show active" id="bordered-justified-home" role="tabpanel" aria-labelledby="home-tab">
          	<button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addAssetModal">자산 추가</button>
              <table class="table table-borderless table-hover" style="vertical-align:middle;">
                <thead>
                  <tr>
                    <th scope="col">자산 번호</th>
                    <th scope="col">이름</th>
                    <th scope="col"></th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <th scope="row">1</th>
                    <td>회의실 1</td>
                    <td><button type="button" class="btn btn-secondary rounded-pill" data-bs-toggle="modal" data-bs-target="#assetModal">설정</button></td>
                  </tr>
                  <tr>
                    <th scope="row">2</th>
                    <td>회의실 2</td>
                    <td><button type="button" class="btn btn-secondary rounded-pill" data-bs-toggle="modal" data-bs-target="#assetModal">설정</button></td>
                  </tr>
                </tbody>
              </table>
          </div><!-- 자산 관리 탭 end -->
          <!-- 예약 신청 관리 탭 -->
          <div class="tab-pane fade" id="bordered-justified-profile" role="tabpanel" aria-labelledby="profile-tab">
            <table class="table table-borderless table-hover" style="vertical-align:middle;">
                <thead>
                  <tr>
                    <th scope="col">예약 번호</th>
                    <th scope="col">예약 자산</th>
                    <th scope="col">예약자</th>
                    <th scope="col">예약일자</th>
                    <th scope="col">예약시간</th>
                    <th scope="col">상태</th>
                    <th scope="col"></th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <th scope="row">1</th>
                    <td>회의실 2</td>
                    <td>이수진</td>
                    <td>2022-03-02</td>
                    <td>13:00 - 13:30</td>
                    <td>승인 대기</td>
                    <td><button type="button" class="btn btn-secondary rounded-pill" data-bs-toggle="modal" data-bs-target="#reservModal">설정</button></td>
                  </tr>
                  <tr>
                    <th scope="row">2</th>
                    <td>회의실 1</td>
                    <td>이수진</td>
                    <td>2022-03-03</td>
                    <td>13:00 - 13:30</td>
                    <td>승인 완료</td>
                    <td><button type="button" class="btn btn-secondary rounded-pill" data-bs-toggle="modal" data-bs-target="#reservModal">설정</button></td>
                  </tr>
                </tbody>
              </table>
          </div><!-- 예약 신청 관리 탭 end -->
          <!-- 관리자 설정 탭 -->
          <div class="tab-pane fade" id="bordered-justified-contact" role="tabpanel" aria-labelledby="contact-tab">
          	<button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addAdminModal">관리자 추가</button>
          
            <table class="table table-borderless table-hover" style="vertical-align:middle;">
                <thead>
                  <tr>
                    <th scope="col">이름</th>
                    <th scope="col">직급</th>
                    <th scope="col">부서</th>
                    <th scope="col">권한</th>
                    <th scope="col"></th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td>Brandon Jacob</td>
                    <td>Designer</td>
                    <td>28</td>
                    <td>2016-05-25</td>
                    <td><button type="button" class="btn btn-secondary rounded-pill" data-bs-toggle="modal" data-bs-target="#adminModal">설정</button></td>
                  </tr>
                  <tr>
                    <td>Bridie Kessler</td>
                    <td>Developer</td>
                    <td>35</td>
                    <td>2014-12-05</td>
                    <td><button type="button" class="btn btn-secondary rounded-pill" data-bs-toggle="modal" data-bs-target="#adminModal">설정</button></td>
                  </tr>
                </tbody>
              </table>
          </div><!-- 관리자 설정 탭 end -->
        </div>
        
        <!-- modal -->
		<!-- 자산 설정 모달 -->
        <div class="modal fade" id="assetModal" tabindex="-1">
          <div class="modal-dialog modal-lg">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title">자산 설정</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              <div class="modal-body">
	              <form class="row g-3">
	                <div class="col-md-12">
	                  <div class="form-floating">
	                    <input type="text" class="form-control" id="floatingName" placeholder="Your Name">
	                    <label for="floatingName">자산 이름</label>
	                  </div>
	                </div>
	                <div class="col-12">
	                  <div class="form-floating">
	                    <textarea class="form-control" placeholder="Address" id="floatingTextarea" style="height: 100px;"></textarea>
	                    <label for="floatingTextarea">자산 설명</label>
	                  </div>
	                </div>
	                <div class="col-md-6">
	                  <div class="form-floating mb-3">
	                    <select class="form-select" id="approveSelect" aria-label="state">
	                      <option value="1">자동 승인</option>
	                      <option value="2">수동 승인</option>
	                    </select>
	                    <label for="approveSelect">승인 방식</label>
	                  </div>
	                </div>
	                <div class="col-md-6">
	                  <div class="form-floating mb-3">
	                    <select class="form-select" id="returnSelect" aria-label="state">
	                      <option value="1">자동 반납</option>
	                      <option value="2">수동 반납</option>
	                    </select>
	                    <label for="returnSelect">반납 방식</label>
	                  </div>
	                </div>
	                <div class="text-center">
	                  <button type="submit" class="btn btn-primary">설정하기</button>
	                  <button type="reset" class="btn btn-secondary">취소하기</button>
	                </div>
	              </form>
              </div>
            </div>
          </div>
        </div><!-- 자산 설정 모달 end-->
        
		<!-- 예약 설정 모달 -->
        <div class="modal fade" id="reservModal" tabindex="-1">
          <div class="modal-dialog modal-lg">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title">예약 설정</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              <div class="modal-body">
	              <form class="row g-3">
	                <div class="col-md-12">
	                  <div class="form-floating">
	                    <input type="text" class="form-control" id="floatingName" placeholder="Your Name">
	                    <label for="floatingName">자산 이름</label>
	                  </div>
	                </div>
	                <div class="col-12">
	                  <div class="form-floating">
	                    <textarea class="form-control" id="floatingTextarea" style="height: 100px;"></textarea>
	                    <label for="floatingTextarea">예약 사유</label>
	                  </div>
	                </div>
	                <div class="col-12">
	                 <div class="row">
		                 <div class="col-md-6">
		                  <div class="form-floating">
		                    <input type="date" class="form-control" id="reservDate">
		                    <label for="reservDate">예약 일자</label>
		                  </div>
		                 </div>
		                 <div class="col-md-3">
		                  <div class="form-floating">
		                    <input type="time" class="form-control" id="startTime">
		                    <label for="startTime">시작 시간</label>
		                  </div>
		                 </div>
		                 <div class="col-md-3">
		                  <div class="form-floating">
		                    <input type="time" class="form-control" id="endTime">
		                    <label for="endTime">종료 시간</label>
		                  </div>
		                 </div>
		                </div>
	                 </div>
	                <div class="col-md-6">
	                  <div class="col-md-12">
	                    <div class="form-floating">
	                      <input type="text" class="form-control" id="floatingCity" placeholder="City">
	                      <label for="floatingCity">예약자</label>
	                    </div>
	                  </div>
	                </div>
	                <div class="col-md-6">
	                  <div class="form-floating mb-3">
	                    <select class="form-select" id="floatingSelect" aria-label="State">
	                      <option value="1">승인 대기</option>
	                      <option value="1">승인 보류</option>
	                      <option value="2">승인 완료</option>
	                    </select>
	                    <label for="floatingSelect">상태</label>
	                  </div>
	                </div>
	                <div class="text-center">
	                  <button type="submit" class="btn btn-primary">설정하기</button>
	                  <button type="reset" class="btn btn-secondary">취소하기</button>
	                </div>
	              </form>
              </div>
            </div>
          </div>
        </div><!-- 예약 설정 모달 end-->		

		<!-- 관리자 설정 모달 -->
        <div class="modal fade" id="adminModal" tabindex="-1">
          <div class="modal-dialog modal-lg">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title">관리자 설정</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              <div class="modal-body">
	              <form class="row g-3">
	                <div class="col-md-4">
	                  <div class="form-floating">
	                    <input type="text" class="form-control" id="floatingName" placeholder="Your Name">
	                    <label for="floatingName">관리자 이름</label>
	                  </div>
	                </div>
	                <div class="col-md-4">
	                  <div class="form-floating">
	                    <input type="text" class="form-control" id="floatingName" placeholder="Your Name">
	                    <label for="floatingName">직급</label>
	                  </div>
	                </div>
	                <div class="col-md-4">
	                  <div class="form-floating">
	                    <input type="text" class="form-control" id="floatingName" placeholder="Your Name">
	                    <label for="floatingName">부서</label>
	                  </div>
	                </div>
	                <fieldset class="row mb-3 mt-3">
	                  <legend class="col-form-label col-sm-2 pt-0">권한</legend>
	                  <div class="col-sm-10">
	                    <div class="form-check">
	                      <input class="form-check-input" type="radio" name="gridRadios" id="gridRadios1" value="option1">
	                      <label class="form-check-label" for="gridRadios1">
	                        Level 1. 예약
	                      </label>
	                    </div>
	                    <div class="form-check">
	                      <input class="form-check-input" type="radio" name="gridRadios" id="gridRadios2" value="option2">
	                      <label class="form-check-label" for="gridRadios2">
	                        Level 2. 예약, 자산
	                      </label>
	                    </div>
	                    <div class="form-check disabled">
	                      <input class="form-check-input" type="radio" name="gridRadios" id="gridRadios3" value="option3">
	                      <label class="form-check-label" for="gridRadios3">
	                        Level 3. 예약, 자산, 관리자
	                      </label>
	                    </div>
	                  </div>
                	</fieldset>
	                <div class="text-center">
	                  <button type="submit" class="btn btn-primary">설정하기</button>
	                  <button type="reset" class="btn btn-secondary">취소하기</button>
	                </div>
	              </form>
              </div>
            </div>
          </div>
        </div><!-- 관리자 설정 모달 end-->
        
		<!-- 자산 추가 모달 -->
        <div class="modal fade" id="addAssetModal" tabindex="-1">
          <div class="modal-dialog modal-lg">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title">자산 추가</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              <div class="modal-body">
	              <form class="row g-3">
	                <div class="col-md-12">
	                  <div class="form-floating">
	                    <input type="text" class="form-control" id="floatingName" placeholder="Your Name">
	                    <label for="floatingName">자산 이름</label>
	                  </div>
	                </div>
	                <div class="col-12">
	                  <div class="form-floating">
	                    <textarea class="form-control" placeholder="Address" id="floatingTextarea" style="height: 100px;"></textarea>
	                    <label for="floatingTextarea">자산 설명</label>
	                  </div>
	                </div>
	                <div class="col-md-6">
	                  <div class="form-floating mb-3">
	                    <select class="form-select" id="approveSelect" aria-label="state">
	                      <option value="1">자동 승인</option>
	                      <option value="2">수동 승인</option>
	                    </select>
	                    <label for="approveSelect">승인 방식</label>
	                  </div>
	                </div>
	                <div class="col-md-6">
	                  <div class="form-floating mb-3">
	                    <select class="form-select" id="returnSelect" aria-label="state">
	                      <option value="1">자동 반납</option>
	                      <option value="2">수동 반납</option>
	                    </select>
	                    <label for="returnSelect">반납 방식</label>
	                  </div>
	                </div>
	                <div class="text-center">
	                  <button type="submit" class="btn btn-primary">설정하기</button>
	                  <button type="reset" class="btn btn-secondary">취소하기</button>
	                </div>
	              </form>
              </div>
            </div>
          </div>
        </div><!-- 자산 추가 모달 end-->  
        
        <!-- 관리자 추가 모달 -->
        <div class="modal fade" id="addAdminModal" tabindex="-1">
          <div class="modal-dialog modal-lg">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title">관리자 추가</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              <div class="modal-body">
	              <form class="row g-3">
	                <div class="col-md-4">
	                  <div class="form-floating">
	                    <input type="text" class="form-control" id="floatingName" placeholder="Your Name">
	                    <label for="floatingName">관리자 이름</label>
	                  </div>
	                </div>
	                <div class="col-md-4">
	                  <div class="form-floating">
	                    <input type="text" class="form-control" id="floatingName" placeholder="Your Name">
	                    <label for="floatingName">직급</label>
	                  </div>
	                </div>
	                <div class="col-md-4">
	                  <div class="form-floating">
	                    <input type="text" class="form-control" id="floatingName" placeholder="Your Name">
	                    <label for="floatingName">부서</label>
	                  </div>
	                </div>
	                <fieldset class="row mb-3 mt-3">
	                  <legend class="col-form-label col-sm-2 pt-0">권한</legend>
	                  <div class="col-sm-10">
	                    <div class="form-check">
	                      <input class="form-check-input" type="radio" name="gridRadios" id="gridRadios1" value="option1">
	                      <label class="form-check-label" for="gridRadios1">
	                        Level 1. 예약
	                      </label>
	                    </div>
	                    <div class="form-check">
	                      <input class="form-check-input" type="radio" name="gridRadios" id="gridRadios2" value="option2">
	                      <label class="form-check-label" for="gridRadios2">
	                        Level 2. 예약, 자산
	                      </label>
	                    </div>
	                    <div class="form-check disabled">
	                      <input class="form-check-input" type="radio" name="gridRadios" id="gridRadios3" value="option3">
	                      <label class="form-check-label" for="gridRadios3">
	                        Level 3. 예약, 자산, 관리자
	                      </label>
	                    </div>
	                  </div>
                	</fieldset>
	                <div class="text-center">
	                  <button type="submit" class="btn btn-primary">설정하기</button>
	                  <button type="reset" class="btn btn-secondary">취소하기</button>
	                </div>
	              </form>
              </div>
            </div>
          </div>
        </div><!-- 관리자 추가 모달 end-->      
		
	</main>
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>