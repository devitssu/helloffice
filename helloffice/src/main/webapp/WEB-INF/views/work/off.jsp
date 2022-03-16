<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/head.jsp" %>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="resources/assets/css/workCss/off.css" type="text/css">
<link rel="stylesheet" href="resources/assets/css/workCss/workMain.css" type="text/css">
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>

	<main id="main" class="main">

	<!-- 메뉴바 -->
		<div class="col-lg-12" id="menubar" style="color: black;">
			<div class="card">
				<nav class="navbar navbar-expand-md navbar-white bg-white">
				    <div class="container-fluid" style="; margin: 4px;">
				        <div class="navbar-collapse collapse w-100 order-1 order-md-0 dual-collapse2">
				            <ul class="navbar-nav me-auto">
				                <li class="nav-item active">
				                    <a class="nav-link" href="workMain" style="color: black; vertical-align: middle;">
										<span class="material-icons" style="vertical-align: middle;">undo</span>
										돌아가기
									</a>
				                </li>
				            </ul>
				        </div>
				        <div class="nav-link mx-auto order-0" title="현재 날짜">
								  <div class="navbar-brand mx-auto" id="current_date" style="color: black;"></div>
				            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target=".dual-collapse2">
				                <span class="navbar-toggler-icon"></span>
				            </button>
				        </div>
				        <div class="navbar-collapse collapse w-100 order-3 dual-collapse2">
				            <ul class="navbar-nav ms-auto">
				            	<li>
					         	 <a class="nav-link btn btn-primary" href="/helloffice/workflow"  style="color: white; margin-top: 7px;"> <!--id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false" role="button">-->
						           <span class="material-icons md-18" style="vertical-align: middle;">beach_access</span> 
									휴가 사용
					          	</a>
					          	</li>
					            <li class="nav-item" style="margin-left: 20px; margin-right: 10px">
					            	<!-- Example single danger button -->
									<div class="nav-link btn-group" style="vertical-align: middle">
									  <button type="button" class="nav-link btn btn-success dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false" style="color:white;">
									     🔍
									     연차/휴가
									  </button>
									  <ul class="dropdown-menu">
									    <li><a class="dropdown-item" type="button" data-bs-toggle="modal" data-bs-target="#routine_off" href="#">잔여 연차 조회</a></li>
									    <li><a class="dropdown-item" type="button" data-bs-toggle="modal" data-bs-target="#vacation_off" href="#">잔여 휴가 조회</a></li>
									    <li><a class="dropdown-item" type="button" data-bs-toggle="modal" data-bs-target="#usedo_off" href="#">연차 촉구서 조회</a></li>
									    <li><hr class="dropdown-divider"></li>
									    <li><hr class="dropdown-divider"></li>
									    <li><a class="dropdown-item" type="button" href="offPayBack">잔여 연차 정산</a></li>
									  </ul>
									</div>
					        	</li>
				            </ul>
				        </div>
				    </div>
				</nav>
			</div>
		</div>
		
	<!-- 예정휴가 -->
	<div class="off_t1">
		<div class="off_c1">
			<div class="off_c1_1" style="width: 100%; text-align: center;">🌊예정 휴가</div>
		</div>
	</div>
	<div class="col-lg-12">
		<div class="card">
			<div class="container-fluid" style="overflow: auto;">
				<div class="off_c2">
					<div class="off_c2_1">
						<div class="off_c2_2">
							<c:if test="${empty map['useDoOffList']}">
							<img src="https://static.flex.team/time-tracking/man-on-float-tube.svg" class="sc-8grlmu eabhLn" style="">
							<p class="off_c2_2_1">신청한 휴가가 없습니다.</p>
							</c:if>
							<c:if test="${not empty map['useDoOffList']}">
							<c:forEach items="${map.useDoOffList}" var="row">
					      		<ul class="modal-contentzone-ul">
									<li class="bodyli">
										<div class="bodyli-1">
											<div class="balls"></div>
												연차 번호 : ${row.offNo} [${row.offType}] 
										</div>
										<div style="margin-left: 50px;">
											사용일 : ${row.offDay} | 사용 기한 : ${row.offStart}~ ${row.offEnd}
										</div>
									</li>
								</ul>
							</c:forEach>
						</c:if>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 지난휴가 -->
	<div class="off_t1">
		<div class="off_c1">
			<div class="off_c1_1">🌋지난 휴가</div>
		</div>
	</div>
	<div class="col-lg-12">
		<div class="card">
			<div class="container-fluid" style="overflow: auto;">
				<div class="off_c2">
					<div class="off_c2_1">
						<div class="off_c2_2">
						<c:if test="${empty map['usedOffList']}">
							<img src="https://static.flex.team/time-tracking/woman-on-float-tube.svg" class="sc-8grlmu eabhLn">
							<p class="off_c2_2_1">사용한 휴가 기록이 없습니다.</p>
						</c:if>
						<c:if test="${not empty map['usedOffList']}">
							<c:forEach items="${map.usedOffList}" var="row">
					      		<ul class="modal-contentzone-ul">
									<li class="bodyli">
										<div class="bodyli-1">
											<div class="balls"></div>
												연차 번호 : ${row.offNo} [${row.offType}] 
										</div>
										<div style="margin-left: 50px;">
											사용일 : ${row.offDay} | 사용 기한 : ${row.offStart}~ ${row.offEnd}
										</div>
									</li>
								</ul>
							</c:forEach>
						</c:if>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>



		<!-- 잔여 연차 Modal -->
	<div class="modal fade" id="routine_off" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<div class="modal-hc">
						<div class="modal-hcc1">
							<div class="modal-hl">
								<div class="modal-hll" style="min-width: 0px; margin: 0px; position: relative">
									<div class="modal-hll-wrap" >
										<div style="margin-right: 12px">
										🔍
										</div>
										<div class="modal-title">
										잔여 연차 조회
										</div>
									</div>
								</div>
							<div class="modal-hlr" style="margin-left: 8px">
							</div>
							</div>
							<div class="modal-hr">
								<div class="modal-hr1">
									<div class="modal-hr1-1">유급</div>
								</div>
								<div class="modal-hr3">
									<div class="modal-hr3-1">00일 가능</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-body" style="height: 600px; overflow: auto;">
				<c:forEach items="${map.mainOffList}" var="row">
		      		<ul class="modal-contentzone-ul">
						<li class="bodyli">
							<div class="bodyli-1">
								<div class="balls"></div>
									[${row.offType}]
							</div>
							<div class="bodyli-2">
								<div class="bodyli-2-1">연차 번호 : ${row.offNo} | 사용 기한 : ${row.offStart}~ ${row.offEnd}
								</div>
							</div>
						</li>
					</ul>
				</c:forEach>
				</div>
				<div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>



		<!-- 잔여 휴가 Modal -->
	<div class="modal fade" id="vacation_off" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<div class="modal-hc">
						<div class="modal-hcc1">
							<div class="modal-hl">
								<div class="modal-hll" style="min-width: 0px; margin: 0px; position: relative">
									<div class="modal-hll-wrap" >
										<div style="margin-right: 12px">
										🔍
										</div>
										<div class="modal-title">
										잔여 휴가 조회
										</div>
									</div>
								</div>
							<div class="modal-hlr" style="margin-left: 8px">
							</div>
							</div>
							<div class="modal-hr">
								<div class="modal-hr1">
									<div class="modal-hr1-1">유급</div>
								</div>
								<div class="modal-hr3">
									<div class="modal-hr3-1">00일 가능</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-body" style="height: 600px; overflow: auto;">
				<c:forEach items="${map.subOffList}" var="row">
		      		<ul class="modal-contentzone-ul">
						<li class="bodyli">
							<div class="bodyli-1">
								<div class="balls"></div>
									[${row.offType}]
							</div>
							<div class="bodyli-2">
								<div class="bodyli-2-1">연차 번호 : ${row.offNo} | 사용 기한 : ${row.offStart}~ ${row.offEnd}
								</div>
							</div>
						</li>
					</ul>
				</c:forEach>
				</div>
				<div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>

	
<!-- 연차 촉구서 조회 Modal -->
	<div class="modal fade" id="usedo_off" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<div class="modal-hc">
						<div class="modal-hcc1">
							<div class="modal-hl">
								<div class="modal-hll" style="min-width: 0px; margin: 0px; position: relative">
									<div class="modal-hll-wrap" >
										<div style="margin-right: 12px">
										🔍
										</div>
										<div class="modal-title">
										미사용 연차 촉구서
										</div>
									</div>
								</div>
								<div class="modal-hr1" style="margin-left: 10px;">
									<div class="modal-hr1-1">1차</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-body" style="height: 600px; overflow: auto; margin: 30px;">
				<c:if test="${empty map['urgeOneList']}"> 조회 가능한 촉구서가 없습니다.</c:if>
				<c:if test="${not empty map['urgeOneList']}">
				
				상가인의 <strong>미사용 연차휴가는 ${map['mainOffList'].size()}일</strong>이며, 연차휴가 사용기간은 <p style="color: red;"></p>까지 입니다.<br>
				10일 이내에 향후 연차휴가 사용시기를 정하여 회사로 통보해주시기 바랍니다.<br><br>
				만약, 연차휴가 사용 시기를 통보하지 않는다면, 회사는 근로기준법에 근거하여 임의로 연차휴가 사용일로 지정하여 통보할 수 있습니다. <br><br>
				또한 연차휴가일을 지정하지 않고, 회사가 지정한 연차휴가일에 연차휴가를 사용하지 않는 경우, 근로기준법에 따라 해당 연차휴가는 소멸하며, 수당도 지급되지 않을 수 있음을 유의하시기 바랍니다.
				</c:if>
				</div>
				<div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
		        <button type="submit" class="btn btn-primary">등록하기</button> <!-- form 삽입 -->
				</div>
			</div>
		</div>
	</div>
	
	
	
	
	
	<script type="text/javascript">
    
    date = new Date();
    year = date.getFullYear();
    month = date.getMonth() + 1;
    day = date.getDate();
    
    function getweek() {
    var week = new Array('일', '월', '화', '수', '목', '금', '토');
    var today = new Date().getDay();
    var todayLabel = week[today];
    return todayLabel;
    }
    document.getElementById("current_date").innerHTML = year + "년 " + month + "월 " + day + "일 " + "(" + getweek() + ")";


    setInterval("dpTime()",1000);
    function dpTime(){
      var now = new Date();
      hours = now.getHours();
      minutes = now.getMinutes();
      seconds = now.getSeconds();
      
      if (hours > 12){
        hours -= 12;
        ampm = "오후 "; 
      }else{
        ampm = "오전 "; 
      }
      if (hours < 10){ 
        hours = "0" + hours; 
      } if (minutes < 10){
        minutes = "0" + minutes; 
      } if (seconds < 10){ 
        seconds = "0" + seconds; 
      } 
      document.getElementById("dpTime").innerHTML = ampm + hours + ":" + minutes + ":" + seconds; }
    
    </script>
    

	</main>
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>