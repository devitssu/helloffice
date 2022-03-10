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
		  apiKey: "AIzaSyBfGfK86fLU2po47gQBtb61JIMr6M5D78g",
		  authDomain: "helloffice-chat.firebaseapp.com",
		  databaseURL: "https://helloffice-chat-default-rtdb.firebaseio.com",
		  projectId: "helloffice-chat",
		  storageBucket: "helloffice-chat.appspot.com",
		  messagingSenderId: "485821737834",
		  appId: "1:485821737834:web:4495bb9ce58a1a0011d313",
		  measurementId: "G-YK0C3SGJMW"
		};
	  
		// Initialize Firebase
		// const firebase = require("firebase");
		// require("firebase/firestore");
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

		const getRoomList = () => {
			let roomList = {};			
			roomRef.where("details.users", 'array-contains', `userNo`)
			.get().then((querySnapshot) => {
				querySnapshot.forEach((doc) => {
					roomList[doc.id] = doc.data();
					console.log(doc.id, "=>", doc.data());
					console.log(roomList)
				});
			});
		}

		const checkRoomExist = (no) => {
			let users = makeUsersString(no);
			roomRef
			.where("details.users", 'array-contains', users)
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
				details: {
					lastChatTime: firebase.firestore.Timestamp.fromDate(new Date()),
					users: [no, userNo, makeUsersString(no)]
				}
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
			roomRef.where("details.users", 'array-contains', userNo)
			.get().then((querySnapshot) => {
				querySnapshot.forEach((doc) => {
					let id = doc.id;
					let details = doc.data().details;
					let time = details.lastChatTime.toDate();
					let name = details.name;
					
					let template = `<div data-id="${ '${id}' }" class="list-group-item list-group-item-action room-list">
										<div class="d-flex w-100 justify-content-between">
											<h6 class="mb-1">${ '${name}' }</h6>
											<small>${ '${time}' }</small>
										</div>
										<div class="d-flex w-100 justify-content-between">
											<div class="mb-1">Some placeholder content in a paragraph.</div>
											<span class="badge bg-primary">14</span>
										</div>
									</div>`;
					$('#roomList').append(template);
				});
			}).catch(e=>{
				console.log(e)
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
			.where("details.users", 'array-contains', users)
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

	  </script>
</body>
</html>