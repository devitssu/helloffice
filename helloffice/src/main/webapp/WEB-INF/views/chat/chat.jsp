<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/common/head.jsp" %>
<style>
	.member-profile{
		border-radius: 20%;
		width: 2rem;
		height: 2rem;
	}

	.dept{
		font-size: small;
		color: gray;
	}
</style>

<body>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>

	<main id="main" class="main">
	
		<h3>메신저</h3>
		<div class="row">
			<div class="col-md-4">
				<h5>사람</h5>
				<div class="form-floating mb-3">
					<input type="text" class="form-control" id="searchPerson" placeholder="대화 상대">
					<label for="searchPerson">대화 상대</label>
				</div>
				<ul class="list-group">
					<li class="list-group-item member-list" data-empNo="1"><img src="resources/assets/img/favicon.png" class="member-profile me-2"> 이수진 대리<span class="dept"> - 개발 1팀</span></li>
					<li class="list-group-item member-list" data-empNo="2"><img src="resources/assets/img/favicon.png" class="member-profile me-2"> 김수진 대리<span class="dept"> - 개발 1팀</span></li>
					<li class="list-group-item member-list" data-empNo="12"><img src="resources/assets/img/favicon.png" class="member-profile me-2"> 이수진 대리<span class="dept"> - 개발 1팀</span></li>
					<li class="list-group-item member-list" data-empNo="13"><img src="resources/assets/img/favicon.png" class="member-profile me-2"> 이수진 대리<span class="dept"> - 개발 1팀</span></li>
				</ul><!-- End List group With Icons -->
			</div>
			<div class="col-md-8">
				<h5>채팅방</h5>
				<!-- List group with Advanced Contents -->
				<div id="roomList" class="list-group">
					
				</div><!-- End List group Advanced Content -->
			</div>
		</div>

		
	</main>
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	<script src="https://www.gstatic.com/firebasejs/8.10.0/firebase-app.js"></script>
	<script src="https://www.gstatic.com/firebasejs/8.10.0/firebase-firestore.js"></script>
	<script>
		function popUp(id){
			window.open('/helloffice' + '/chat' + '/room'+ '/'+ id, 'room', 'width=550px,height=800px,scrollbars=yes')
		}
	</script>
	<script type="module">
		import { initializeApp } from "https://www.gstatic.com/firebasejs/9.6.8/firebase-app.js";

		const firebaseConfig = {

		};
	  
		// Initialize Firebase
		firebase.initializeApp(firebaseConfig);

		let db = firebase.firestore();
		let userRef = db.collection("users");
		let roomRef = db.collection("rooms");

		let userNo = `${loginEmp.empNo}`;
		let userName = `${loginEmp.empName}`;

		const makeUsersString = (no) => {
			let users = userNo > no ? no + ',' +userNo : userNo + ',' + no;
			return users;
		}

		const checkUser = () => {
			userRef.doc(userNo).get()
			.then((doc) => {
				if(doc.exists){
					console.log(doc.data());
				} else{
					console.log('empty');
					addUser();
				}
			})
			.catch((e) => {
				alert('error: ' + e);
			});
		}

		const addUser = () => {
			userRef.doc(userNo).set({
				name: userName
			})
			.then(() => {
				console.log('add Success!')
			})
			.catch((e) => {
				console.log('error on writing: ' + e);
			});
		}

		const getUserDetails = async (no) => {
			let userDetail = {}
			await userRef.doc(no).get()
			.then((doc)=> {
				if(doc.exists){
					let data = doc.data().details;
					userDetail = {
						name: data.name,
						rank: data.rank,
						dept: data.dept
					}
				}else{
					console.log('no data')
				}
			})
			.catch((e) => {
				console.log('::: ERROR on getUserDetails :::' + e);
			})
			return userDetail;
		}

		const checkRoomExist = (no) => {
			let users = makeUsersString(no);
			roomRef
			.where("users", 'array-contains', users)
			.get()
			.then((querySnapshot) => {
				if(querySnapshot.empty){
					makeRoom(no);
				}else{
					openChat(no);
				}
			})
		}

		const makeRoom = (no) => {
			roomRef.doc().set({

				lastChatTime: firebase.firestore.Timestamp.fromDate(new Date()),
				users: [no, userNo, makeUsersString(no)]

			})
			.then(() => {
				openChat(no);
			})
			.catch((e) => {
				console.log('::: ERROR on makeRoom ::: ' + e);
			})
		}


		const renderRoomList = () => {
			$('#roomList').empty();
			roomRef.where("users", 'array-contains', userNo)
			.onSnapshot((querySnapshot) => {
				$('#roomList').empty();
				querySnapshot.forEach((doc) => {
					let id = doc.id;
					let data = doc.data();
					let time = data.lastChatTime.toDate();
					time = renderTime(time);
					let msg = data.lastMsg;
					let users = data.users[2].split(',');
					let no = '';
					if(users[0] == userNo){
						no = users[1];
					}else{
						no = users[0]
					}
					
					getUserDetails(no).then((detail) => {
						let roomName = detail.dept + " " + detail.name + " " + detail.rank;
						let template = `<div data-id="${ '${id}' }" class="list-group-item list-group-item-action room-list">
											<div class="d-flex w-100 justify-content-between">
												<h6 class="mb-1">${ '${roomName}' }</h6>
											</div>
											<div class="d-flex w-100 justify-content-between">
												<div class="mb-1">${ '${msg}' }.</div>
												<small>${ '${time}' }</small>
											</div>
										</div>`;
						$('#roomList').append(template);
					});

				});
			});
		}

		$(window).on('load', renderRoomList);

		$('.member-list').click(function(){
			let no = $(this).attr('data-empNo');
			checkRoomExist(no);
		});

		$(document).on('click','.room-list',function(){
			let id = $(this).attr('data-id');
			window.open('/helloffice' + '/chat' + '/room'+ '/' + id, 'room', 'width=550px,height=800px,scrollbars=yes')
		});

		const openChat = (no) => {
			let id = 0;
			let users = makeUsersString(no);
			roomRef
			.where("users", 'array-contains', users)
			.get()
			.then((querySnapshot) => {
				querySnapshot.forEach((doc) => {
					id = doc.id; 
				})
			window.open('/helloffice' + '/chat' + '/room'+ '/' + id, 'room', 'width=550px,height=800px,scrollbars=yes')
			})
			.catch((e) => {
				console.log(e);
			})
		}

		const renderTime = (time) => {
			if(isToday(time)){
				let hour = time.getHours().toString().padStart(2,'0');
				let minute = time.getMinutes().toString().padStart(2,'0');
				let result = hour + ":" + minute;
				return result;
			}else{
				let today = new Date();
				let result = Math.floor((today.getTime() - time.getTime())/(1000*60*60*24));
				return result;
			}
		}

		const isToday = (date) => {
			let today = new Date();
			return today.getFullYear() === date.getFullYear() 
				&& today.getMonth() === date.getMonth()
				&& today.getDate() === date.getDate()
		}

		

	  </script>
</body>
</html>