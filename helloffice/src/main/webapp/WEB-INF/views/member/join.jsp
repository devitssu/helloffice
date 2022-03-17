<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Helloffice 회원가입</title>


  <!-- Favicons -->
  <link href="../resources/assets/img/favicon.png" rel="icon">
  <link href="../resources/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.gstatic.com" rel="preconnect">
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="../resources/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="../resources/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="../resources/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="../resources/assets/vendor/quill/quill.snow.css" rel="stylesheet">
  <link href="../resources/assets/vendor/quill/quill.bubble.css" rel="stylesheet">
  <link href="../resources/assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="../resources/assets/vendor/simple-datatables/style.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="../resources/assets/css/style.css" rel="stylesheet">

  <style>
    .hint {
      font-size: x-small;
      color: grey;
    }

    .confirmMsg {
      font-size: x-small;
    }

    .pwdformMsg {
      font-size: x-small;
    }

    /* .imgAlign {
      margin-left: 50;
    } */

  </style>

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>

<body>

  <main>
    <div class="container">

      <section class="section register min-vh-100 d-flex flex-column align-items-center justify-content-center py-4">
        <div class="container">
          <div class="row justify-content-center">
            <div class="col-lg-4 col-md-6 d-flex flex-column align-items-center justify-content-center">

              <div class="d-flex justify-content-center py-4">
                <a href="/helloffice/" class="logo d-flex align-items-center w-auto">
                  <img src="../resources/assets/img/logo.png" alt="">
                </a>
              </div><!-- End Logo -->

              <div class="card mb-3">

              <form class="row g-3 needs-validation" action="" method="post" enctype="multipart/form-data">
                <div class="card-body">

                  <div class="pt-4 pb-2">
                    <h5 class="card-title text-center pb-0 fs-4">회원가입</h5>
                    <p class="text-center small">계정 정보를 입력해주세요</p>
                  </div>


                    <div class="col-12">
                      <label class="form-label">이름</label>
                      <div class="input-group has-validation">
                        <c:if test="${empName ne null}">
                          <input type="text" class="form-control" value="${empName}" name="empName" readonly>
                        </c:if>
                        <c:if test="${empName eq null}">
                          <input type="text" name="empName" class="form-control" id="empName" required>
                        </c:if>  
                      </div>
                    </div>
                    
                    <div class="col-12">
                      <label class="form-label">이메일</label>
                      <div class="input-group has-validation">
                        <input type="email" name="email" class="form-control" id="email" required>
                        <button class="emailCheck btn btn-primary" id="emailCheck" type="button" onclick="fn_emailCheck();" value="N">중복확인</button>
                      </div>
                    </div>
                    
                    <div class="col-12">
                      <label class="form-label">비밀번호</label>
                      <input type="password" name="empPwd" class="form-control" id="empPwd" required onkeyup="pwdform();">
                      <label class="hint">영문자, 숫자, 특수문자 포함하여 8자 이상 입력하시오.</label><br>
                      <span id ="pwdformMsg" class="pwdformMsg"></span>
                    </div>
                    
                    <div class="col-12">
                      <label class="form-label">비밀번호 확인</label>
                      <input type="password" name="empPwdCheck" class="form-control" id="empPwdCheck" required onkeyup="validate();">
                      <span id ="confirmMsg" class="confirmMsg"></span>
                    </div>
                    
                    <hr>
                    <div class="pt-4 pb-2">
                      <p class="text-center small">회원 정보를 입력해주세요</p>
                    </div>

                    <div class="col-12">
                      <label class="form-label">직급</label>
                      <c:if test="${empRank ne null}">
                          <input type="text" class="form-control" value="${empRank}" name="empRank" readonly>
                      </c:if>
                      <c:if test="${empRank eq null}">
                      <select name="empRank" class="form-select" aria-label="Default select example">
                        <option value="" selected>직급</option>
                        <option value="인턴">인턴</option>
                        <option value="사원">사원</option>
                        <option value="대리">대리</option>
                        <option value="과장">과장</option>
                        <option value="부장">부장</option>
                      </select>
                      </c:if>
                    </div>

                    <div class="col-12">
                      <label class="form-label">관리레벨</label>
                      <c:if test="${adminLevel ne null}">
                          <input type="text" class="form-control" value="${adminLevel}" name="adminLevel" readonly>
                      </c:if>
                      <c:if test="${adminLevel eq null}">
                      <select name="adminLevel" class="form-select" aria-label="Default select example">
                        <option value="" selected>직급</option>
                        <option value="인턴">인턴</option>
                        <option value="사원">사원</option>
                        <option value="대리">대리</option>
                        <option value="과장">과장</option>
                        <option value="부장">부장</option>
                      </select>
                      </c:if>
                    </div>

                    <div class="col-12">
                      <label class="form-label">부서번호</label>
                      <c:if test="${depNo ne null}">
                          <input type="text" class="form-control" value="${depNo}" name="depNo" readonly>
                      </c:if>
                      <c:if test="${depNo eq null}">
                        <input type="text" name="depNo" class="form-control" id="depNo" placeholder="회사에서 받은 부서번호를 입력하세요.">
                      </c:if>
                    </div>
                    
                    <div class="col-12">
                      <label class="form-label">부서이름</label>
                      <c:if test="${depName ne null}">
                          <input type="text" class="form-control" value="${depName}" name="depName" readonly>
                      </c:if>
                      <c:if test="${depName eq null}">
                        <input type="text" name="depName" class="form-control" id="depName" placeholder="회사에서 받은 부서이름을 입력하세요.">
                      </c:if>
                    </div>

                    <div class="col-12">
                      <label class="form-label">직무</label>
                      <c:if test="${empPosition ne null}">
                          <input type="text" class="form-control" value="${empPosition}" name="empPosition" readonly>
                      </c:if>
                      <c:if test="${empPosition eq null}">
                        <input type="text" name="empPosition" class="form-control" id="empPosition">
                      </c:if>
                    </div>

                    <div class="col-12">
                      <label class="form-label">전화번호</label>
                      <input type="text" name="phone" class="form-control" id="phone" placeholder="010-0000-0000">
                      <!-- String으로 넘어가니 형변환 -->
                    </div>

                    <div class="col-12">
                      <label class="form-label">주민등록번호</label>
                      <input type="text" name="resiNo" class="form-control" id="resiNo" placeholder="000000-0000000">
                    </div>

                    <div class="col-12">
                      <label class="form-label">주소</label>
                      <input type="text" name="address" class="form-control" id="address">
                    </div>

                    <div class="col-12">
                      <label class="form-label">은행명</label>
                      <select name="bank" class="form-select" aria-label="Default select example">
                        <option value="" selected>은행 선택</option>
                        <option value="NH농협">NH농협</option>
                        <option value="KB국민">KB국민</option>
                        <option value="카카오뱅크">카카오뱅크</option>
                        <option value="신한">신한</option>
                        <option value="우리">우리</option>
                        <option value="IBK기업">IBK기업</option>
                        <option value="하나">하나</option>
                        <option value="새마을">새마을</option>
                        <option value="대구">대구</option>
                        <option value="부산">부산</option>
                        <option value="케이뱅크">케이뱅크</option>
                        <option value="우체국">우체국</option>
                        <option value="SC제일">SC제일</option>
                        <option value="경남">경남</option>
                        <option value="수협">수협</option>
                        <option value="광주">광주</option>
                        <option value="전북">전북</option>
                        <option value="토스뱅크">토스뱅크</option>
                        <option value="저축은행">저축은행</option>
                        <option value="중국공상">중국공상</option>
                        <option value="JP모간">JP모간</option>
                        <option value="BNF파리바">BNF파리바</option>
                        <option value="씨티">씨티</option>
                        <option value="제주">제주</option>
                        <option value="KDB산업">KDB산업</option>
                        <option value="SBI저축은행">SBI저축은행</option>
                        <option value="산림조합">산림조합</option>
                        <option value="BOA">BOA</option>
                        <option value="HSBC">HSBC</option>
                        <option value="중국">중국</option>
                        <option value="도이치">도이치</option>
                        <option value="중국건설">중국건설</option>
                        
                      </select>
                    </div>

                    <div class="col-12">
                      <label class="form-label">계좌번호</label>
                      <input type="text" name="bankAcc" class="form-control" id="bankAcc">
                    </div>

                    <div class="col-12">
                      <label class="form-label">소개</label>
                      <input type="text" name="empInfo" class="form-control" id="empInfo">
                    </div>

                    <div class="col-12">
                      <label class="form-label">입사일</label>
                      <input type="date" name="entryDate" class="form-control" id="entryDate">
                    </div>

                    <!-- <div class="col-12">
                      <label class="form-label">퇴사 여부</label><br>
                      <div class="form-control">
                        예 <input type="checkbox" name="resignYn" id="resignY" value="Y"> &nbsp;&nbsp;&nbsp;&nbsp;
                        아니오 <input type="checkbox" name="resignYn" id="resignN" value="N" checked>
                      </div>
                    </div> -->

                    <!-- <div class="col-12">
                      <label class="form-label">피부양자수</label>
                      <select name="dependent" class="form-select" aria-label="Default select example">
                        <option value="" selected>자녀 수</option>
                        <option value="0">0명</option>
                        <option value="1">1명</option>
                        <option value="2">2명</option>
                        <option value="3">3명</option>
                        <option value="4">4명</option>
                        <option value="5">5명</option>
                        <option value="6">6명</option>
                        <option value="7">7명</option>
                      </select>
                    </div> -->
                    <!-- <div class="col-12">
                      <label class="form-label">프로필 사진</label>
                      <input type="file" name="f" accept=".jpeg, .jpg, .png, .jfif" class="form-control" id="f">
                      <img id="profileImg" class="imgAlign">
                    </div> -->
                    <br>
                    <div class="col-12">
                      <input class="btn btn-primary w-100" type="submit" value="회원가입"></input>
                    </div>
                  </form>
                </div>
              </div>
            </div>
          </div>
        </div>  
	      </section>
        </div>
  </main><!-- End #main -->

  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Vendor JS Files -->
  <script src="../resources/assets/vendor/apexcharts/apexcharts.min.js"></script>
  <script src="../resources/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="../resources/assets/vendor/chart.js/chart.min.js"></script>
  <script src="../resources/assets/vendor/echarts/echarts.min.js"></script>
  <script src="../resources/assets/vendor/quill/quill.min.js"></script>
  <script src="../resources/assets/vendor/simple-datatables/simple-datatables.js"></script>
  <script src="../resources/assets/vendor/tinymce/tinymce.min.js"></script>
  <script src="../resources/assets/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="../resources/assets/js/main.js"></script>

  <script>
  let fileTag = document.querySelector("input[name=f]");

  fileTag.onchange = function() {
    let imgTag = document.querySelector("#profileImg");

    if(fileTag.files.length > 0) {
      // 미리보기 작업 실행
      let reader = new FileReader();
      reader.onload = function(data) {
          console.log(data);
          
          imgTag.src = data.target.result;
          imgTag.width = 130;
          imgTag.height = 173;
      }
      reader.readAsDataURL(fileTag.files[0]);
    } else {
      imgTag.src = "";
    }
  }

  
  function fn_emailCheck() {
    $.ajax({
        url: 'emailCheck',
        type: 'POST',
        dataType: 'JSON',
        data: {"email" : $("#email").val()},
        success: function(data){
            if(data == 1){
              alert("중복된 이메일입니다.");
            }else if(data == 0) {
              $("#emailCheck").attr("value", "Y");
              alert("사용 가능한 이메일입니다.");
            }
        }
      })
  }

  function pwdform() {
    var empPwd= document.getElementById('empPwd').value;
    var wrongColor ="#ff0000";

    // 비밀번호 형식
    if(!/^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/.test(empPwd)) {
      pwdformMsg.style.color = wrongColor;
		  pwdformMsg.innerHTML = "비밀번호를 다시 입력해 주세요.";
    } else {
      pwdformMsg.innerHTML = "";
    }
  }

  function validate() {
    var empPwd= document.getElementById('empPwd').value;
    var empPwdCheck = document.getElementById('empPwdCheck').value;
    var confrimMsg = document.getElementById('confirmMsg');
    var correctColor = "#0000ff";
    var wrongColor ="#ff0000";

            

    // 비밀번호 확인 검사
    if(empPwd == empPwdCheck) {
    confirmMsg.style.color = correctColor;
		confirmMsg.innerHTML ="비밀번호 일치";
    } else{
		confirmMsg.style.color = wrongColor;
		confirmMsg.innerHTML ="비밀번호 불일치";
		}
  }
  </script>
</body>


</html>