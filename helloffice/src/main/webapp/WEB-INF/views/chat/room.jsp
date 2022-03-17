<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Room</title>  
<style>      
body {
    font-family: Roboto,sans-serif;
    font-size: 13px;
    line-height: 1.42857143;
    color: #767676;
    background-color: #edecec;
}

#messages-main {
    position: relative;
    margin: 0 auto;
    box-shadow: 0 2px 2px 0 rgba(0, 0, 0, 0.14), 0 3px 1px -2px rgba(0, 0, 0, 0.2), 0 1px 5px 0 rgba(0, 0, 0, 0.12);
}
#messages-main:after, #messages-main:before {
    content: " ";
    display: table;
}
#messages-main .ms-menu {
    position: absolute;
    left: 0;
    top: 0;
    border-right: 1px solid #eee;
    padding-bottom: 50px;
    height: 100%;
    width: 240px;
    background: #fff;
}

@media (max-width:767px) {
    #messages-main .ms-menu {
    height: calc(100% - 58px);
    display: none;
    z-index: 1;
    top: 58px;
}
#messages-main .ms-menu.toggled {
    display: block;
}
#messages-main .ms-body {
    overflow: hidden;
}
}
#messages-main .ms-user {
    padding: 15px;
    background: #f8f8f8;
}
#messages-main .ms-user>div {
    overflow: hidden;
    padding: 3px 5px 0 15px;
    font-size: 11px;
}
#messages-main #ms-compose {
    position: fixed;
    bottom: 120px;
    z-index: 1;
    right: 30px;
    box-shadow: 0 0 4px rgba(0, 0, 0, .14), 0 4px 8px rgba(0, 0, 0, .28);
}
#ms-menu-trigger {
    user-select: none;
    position: absolute;
    left: 0;
    top: 0;
    width: 50px;
    height: 100%;
    padding-right: 10px;
    padding-top: 19px;
}
#ms-menu-trigger i {
    font-size: 21px;
}
#ms-menu-trigger.toggled i:before {
    content: '\f2ea'
}
.fc-toolbar:before, .login-content:after {
    content: ""
}
.message-feed {
    padding: 20px;
}
#footer, .fc-toolbar .ui-button, .fileinput .thumbnail, .four-zero, .four-zero footer>a, .ie-warning, .login-content, .login-navigation, .pt-inner, .pt-inner .pti-footer>a {
    text-align: center;
}
.message-feed.right>.pull-right {
    margin-left: 15px;
}
.message-feed:not(.right) .mf-content {
    background: #03a9f4;
    color: #fff;
    box-shadow: 0 2px 2px 0 rgba(0, 0, 0, 0.14), 0 3px 1px -2px rgba(0, 0, 0, 0.2), 0 1px 5px 0 rgba(0, 0, 0, 0.12);
}
.message-feed.right .mf-content {
    background: #eee;
}
.mf-content {
    padding: 12px 17px 13px;
    border-radius: 2px;
    display: inline-block;
    max-width: 80%
}
.mf-date {
    display: block;
    color: #B3B3B3;
    margin-top: 7px;
}
.mf-date>i {
    font-size: 14px;
    line-height: 100%;
    position: relative;
    top: 1px;
}
.msb-reply {
    box-shadow: 0 -20px 20px -5px #fff;
    position: relative;
    margin-top: 30px;
    border-top: 1px solid #eee;
    background: #f8f8f8;
}
.four-zero, .lc-block {
    box-shadow: 0 1px 11px rgba(0, 0, 0, .27);
}
.msb-reply textarea {
    width: 100%;
    font-size: 13px;
    border: 0;
    padding: 10px 15px;
    resize: none;
    height: 60px;
    background: 0 0;
    background-color: rgb(180 203 237 / 25%);
}
.msb-reply button {
    position: absolute;
    top: 0;
    right: 0;
    border: 0;
    height: 100%;
    width: 60px;
    font-size: 25px;
    color: #2196f3;
    background: 0 0;
}
.img-avatar {
    height: 37px;
    border-radius: 2px;
    width: 37px;
}
.list-group.lg-alt .list-group-item {
    border: 0;
}
.p-15 {
    padding: 15px!important;
}
.btn:not(.btn-alt) {
    border: 0;
}
.action-header {
    position: relative;
    background: #f8f8f8;
    padding: 15px 13px 15px 17px;
}
.ah-actions {
    z-index: 3;
    float: right;
    margin-top: 7px;
    position: relative;
}
.actions {
    list-style: none;
    padding: 0;
    margin: 0;
}
.actions>li {
    display: inline-block;
}

.actions:not(.a-alt)>li>a>i {
    color: #939393;
}
.actions>li>a>i {
    font-size: 20px;
}
.actions>li>a {
    display: block;
    padding: 0 10px;
}
.ms-body{
    background:#fff;    
}
#ms-menu-trigger {
    user-select: none;
    position: absolute;
    left: 0;
    top: 0;
    width: 50px;
    height: 100%;
    padding-right: 10px;
    padding-top: 19px;
    cursor:pointer;
}
#ms-menu-trigger, .message-feed.right {
    text-align: right;
}
#ms-menu-trigger, .toggle-switch {
    -webkit-user-select: none;
    -moz-user-select: none;
}
</style>
</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
<body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<div class="container bootstrap snippets bootdey">
    <div class="tile tile-alt" id="messages-main">
        
        <div class="ms-body">
            <div class="action-header clearfix">               
                <div class="pull-left hidden-xs">
                    <h3 id="roomName">방제목</h3>
                </div>
            </div>
            <div id="msgs">

            </div>
            
            <div class="msb-reply">
                <textarea id="msg" placeholder="메시지를 입력하세요..."></textarea>
                <button id="sendMsgBtn"><i class="fa fa-paper-plane-o"></i></button>
            </div>
        </div>
    </div>
</div>
<script src="https://www.gstatic.com/firebasejs/8.10.0/firebase-app.js"></script>
<script src="https://www.gstatic.com/firebasejs/8.10.0/firebase-firestore.js"></script>
<script>
    $(function(){
   if ($('#ms-menu-trigger')[0]) {
        $('body').on('click', '#ms-menu-trigger', function() {
            $('.ms-menu').toggleClass('toggled'); 
        });
    }
});
</script>
<script>
    function popUp(){
        window.open('/helloffice' + '/chat' + '/room'+ id, 'room', 'width=550px,height=800px,scrollbars=yes')
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

    let path = window.location.pathname.split('/');
    let id = path[path.length -1];

    const sendMsg = (msg) => {

        let time = firebase.firestore.Timestamp.fromDate(new Date());

        roomRef.doc(id).collection('messages').doc().set({
            msg: msg,
            sender: userNo,
            sendTime: time
        })
        .then(() => {
            console.log('Successfully added msg')
        })
        .catch(e => {
            console.log('::: ERROR on sendMsg ::: ' + e)
        });

        roomRef.doc(id).update({
            lastChatTime: time,
            lastMsg: msg
        }).then(()=> {
            console.log('update success')
        });
    }

    const getRoomName = async (no) => {
        let userDetail = {}
        userRef.doc(no).get()
        .then((doc)=> {
            if(doc.exists){
                let data = doc.data();
                let roomName = data.dept + " " + data.name + " " + data.rank;
                $('#roomName').text(roomName);
            }else{
                console.log('no data')
            }
        })
        .catch((e) => {
            console.log('::: ERROR on getUserDetails :::' + e);
        })
    }

    const renderMsg = (id) => {
        roomRef.doc(id).get()
        .then((doc)=> {
            let users = doc.data().users[2].split(',');
            let no = '';
            if(users[0] == userNo){
                no = users[1];
            }else{
                no = users[0]
            }
            getRoomName(no);
        })

        roomRef.doc(id).collection('messages').orderBy("sendTime", "asc")
        .get()
        .then((querySnapshot) => {
            $('#msgs').empty()
            querySnapshot.forEach((doc) => {
                renderTempalte(doc);
            });
            renderNewMsg(id)
        })
        .catch((e) => {
            console.log(e);
        });
    }
    let initState = true;
    const renderNewMsg = (id) => {
        roomRef.doc(id).collection('messages').orderBy("sendTime", "desc").limit(1)
        .onSnapshot((querySnapshot) => {
            if(initState){
                initState = false;
            }else{
                if(!querySnapshot.docChanges().empty){
                    querySnapshot.forEach((doc) => {
                        renderTempalte(doc);
                    });
                }
            }
        })
    }

    const renderTempalte = (doc) => {
        let data = doc.data();
        let msg = data.msg;
        let time = data.sendTime.toDate();
        time = renderTime(time);
        let template = '';
        if(data.sender == userNo){
            template = `<div class="message-feed right">
                                <div class="pull-right">
                                    <img src="/helloffice/resources/assets/img/favicon.png" alt="" class="img-avatar">
                                </div>
                                <div class="media-body">
                                    <div class="mf-content">
                                        ${ '${msg}' }
                                    </div>
                                    <small class="mf-date"><i class="fa fa-clock-o"></i> ${ '${time}' }</small>
                                </div>
                            </div>`;

        }else{
            template = `<div class="message-feed media">
                                <div class="pull-left">
                                    <img src="/helloffice/resources/assets/img/favicon.png" alt="" class="img-avatar">
                                </div>
                                <div class="media-body">
                                    <div class="mf-content">
                                        ${ '${msg}' }
                                    </div>
                                    <small class="mf-date"><i class="fa fa-clock-o"></i> ${ '${time}' }</small>
                                </div>
                            </div>`;
        }
        $('#msgs').append(template);
        scrollDown();
    }
    
    const scrollDown = () => {
        document.documentElement.scrollTop = document.documentElement.scrollHeight;
    }

    $('#sendMsgBtn').on('click', function(){
        sendMsg($('#msg').val())
        $('#msg').val(" ");
    });

    $('#msg').on('keypress', function(key){
        if(key.keyCode === 13) {
            event.preventDefault();
            let msg = $(this).val();
            sendMsg(msg);
            $(this).val("");
        }
    });

    const renderTime = (time) => {
        if(isToday(time)){
            let hour = time.getHours().toString().padStart(2,'0');
            let minute = time.getMinutes().toString().padStart(2,'0');
            let result = hour + ":" + minute;
            return result;
        }else{
            let result = time.getMonth() + "월" + time.getDate().toString().padStart(2,'0') + "일";
            return result;
        }
    }

    const isToday = (date) => {
        let today = new Date();
        return today.getFullYear() === date.getFullYear() 
            && today.getMonth() === date.getMonth()
            && today.getDate() === date.getDate()
    }

    $(window).on('load', renderMsg(id));

</script>
</body>
</html>