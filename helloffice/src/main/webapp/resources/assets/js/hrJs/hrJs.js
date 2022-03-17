$(document).ready(function() {

    // 부서리스트 추가
    $("#dept_add").click(function() {
        (async () => {
            const addDept = await swal({
                title: "부서 추가하기",
                content: "input",
                button:{
                    text: "추가하기",
                    closeModal : true
                },
            });

            if (addDept) {
                $.ajax({
                    method: 'POST',
                    url: 'teamList/deptDupCheck',
                    data: {depName: addDept},
                    success: function(result){
                        if(result > 0){
                            swal({
                                title: "Error",
                                text : "'"+addDept+"' (은)는 이미 존재하는 부서입니다."
                            });
                        }else{
                            $.ajax({
                                method: 'POST',
                                url: 'teamList/deptAdd',
                                data: {depName: addDept},
                                success: function(result){
                                    console.log("result : " + result);
                                    $('#showDept_box').load(location.href+' #showDept_box');
                                    $('#deptManaging_box').load(location.href+' #deptManaging_box');
                                },
                                error: function(){
                                    console.log("부서추가에서 에러발생");
                                }
                            })
                            swal({
                                title: "",
                                text: "'"+ addDept +"' (이)가 추가되었습니다.",
                                icon: "success"
                            });
                        }
                    },
                    error: function(){
                        console.log("중복체크에서 에러발생");
                    }
                })
            }
        })();
    });

    // 부서리스트 수정
    $(document).on("click","#dept_udt", function(){
        let originalDeptName = $(this).parent().parent().children(0).text();
        // swal(originalDept);
        // console.log(originalDept);

        (async() => {
            const updDept = await swal({
                title: "부서명 수정하기",
                content: "input",
                buttons: true
            });

            if(updDept){
                $.ajax({
                    method: 'POST',
                    url: 'teamList/deptDupCheck',
                    data: {depName : updDept},
                    success: function(result){
                        if(result>0){
                            swal({
                                title: "Error",
                                text : "'"+updDept+"' (은)는 이미 존재하는 부서입니다."
                            });
                        }else{
                            let data = {depName:originalDeptName, depChange:updDept}
                            $.ajax({
                                method:'POST',
                                url: 'teamList/updDeptName',
                                contentType : 'application/json; charset=UTF-8',
                                data: JSON.stringify(data),
                                success: function(result){
                                    console.log("result : " + result);
                                    $('#showDept_box').load(location.href+' #showDept_box');
                                    $('#deptManaging_box').load(location.href+' #deptManaging_box');
                                },
                                error: function(){
                                    console.error("부서이름수정에서 에러발생");
                                }
                            })
                            swal({
                                title: "",
                                text: "'"+ updDept +"' (으)로 수정되었습니다.",
                                icon: "success"
                            });
                        }
                    },
                    error: function(){
                        console.error("부서이름수정에서 에러발생");
                    }
                })
            }
        })();
    });

    // 부서리스트 삭제 
    $(document).on("click","#dept_del", function(){
        let originalDeptName = $(this).parent().parent().children().text();
        
        swal({
            title: "정말 삭제하시겠어요?",
            text: "다시 복구할 수 없습니다.",
            icon: "warning",
            buttons: true,
            dangerMode: true,
        })
            .then((willDelete) => {
            if (willDelete) {
                swal("삭제되었습니다.");
                
                $.ajax({
                    method:'POST',
                    url:'teamList/delDeptName',
                    data: {depName : originalDeptName},
                    success: function(success){
                        console.log("result : " + success);
                        $('#showDept_box').load(location.href+' #showDept_box');
                        $('#deptManaging_box').load(location.href+' #deptManaging_box');
                    },
                    error: function(){
                        console.error("부서삭제에서 에러발생");
                    }
                })
            
            } else {
                swal("취소되었습니다.");
            }
        });
    });

    // 부서이름으로 멤버리스트 가져오기 
    $(document).on("click",".deptListName", function(){
        let deptName = $(this).children().eq(0).html();
        console.log(deptName);
        
        $.ajax({
            url: 'teamList/getMemberByDept',
            method: 'GET',
            data: {deptName: deptName},
            contentType : 'application/json; charset=UTF-8',
            // dataType: 'JSON',
            success: function (success) {
                console.log(success);
                // var data = JSON.parse(success);
                let result = '';
                $('.area_reset').remove();
                $(success).each(function(index, item){
                    // result = '<div class="area_reset tab-pane fade show active" id="v-pills-all" role="tabpanel" aria-labelledby="v-pills-all-tab">'
                    //         +'<table class="table table-hover"><div class="getMemberByDept">'
                    //         +'<tbody><tr>'
                    //         +'<th class="col-sm-3" scope="row" hidden="hidden">'+item.empNo+'</th><td class="col-sm-3">'+item.empName+'</td>'
                    //         +'<td class="col-sm-3">'+item.depName+'</td><td class="col-sm-3">'+item.empPosition+'</td><td class="col-sm-3">'+item.phone+'</td>'
                    //         +'</tr></tbody></div></table></div>';

                    result = '<div onclick="goMemberPage('+item.empNo+')" class="area_reset each_member row list-group-item-action"><div class="memberNo" hidden="hidden">'+item.empNo+'</div>'
                            +'<div class="col-sm-3">'+item.empName+'</div><div class="col-sm-2">'+item.empRank+'</div><div class="col-sm-4">'+item.empPosition+'</div>'
                            +'<div class="col-sm-3">'+item.phone+'</div></div>'

                    $(".getMemberByDept").after(result);
                })
                console.log(result);
                $('#memberListByDept').load(location.href+' #memberListByDept');

                // result = $.each(success, function (index, item) {
                // 	$("#memberListByDept").append(index + "");
                // 	$("#memberListByDept").append(item.empNo + "");
                // 	$("#memberListByDept").append(item.empName + "");
                // 	$("#memberListByDept").append(item.empPosition + "");
                // 	$("#memberListByDept").append(item.phone + "");
                // 	$("#memberListByDept").append(item.depNo + "");
                // 	// $("#memberListByDept").append(item.depName + "");
                // });
            },
            error: function (xhr, status, error) {
                console.log("ERROR!!!!!!!!!!!!!!!!");

            }
        });
    });

    // 팀리스트에서 검색하는 기능 
    $(document).on("click", ".getSearchList", function(){
        let keyword = $("#keyword").val();
        console.log("keyword::: " + keyword);
        $.ajax({
            type: 'GET',
            url : "hr/teamList",
            data : {keyword:keyword},
            success: function (success) {
                console.log(success);
                let result = '';
                $('.area_reset').remove();
                $(success).each(function(index, item){
                    result = '<div onclick="goMemberPage('+item.empNo+')" class="area_reset each_member row list-group-item-action"><div class="memberNo" hidden="hidden">'+item.empNo+'</div>'
                            +'<div class="col-sm-3">'+item.empName+'</div><div class="col-sm-2">'+item.empRank+'</div><div class="col-sm-4">'+item.empPosition+'</div>'
                            +'<div class="col-sm-3">'+item.phone+'</div></div>'

                    $(".getMemberByDept").after(result);
                })
                console.log(result);
                $('#memberListByDept').load(location.href+' #memberListByDept');

            },
            error: function (xhr, status, error) {
                console.log("ERROR!!!!!!!!!!!!!!!!");
            }
        })
    })


    // 인사노트 삭제하기 
    $(document).on("click","#insanote_del", function(){
        let delNo = $(this).parent().parent().children().eq(2).text();
        console.log("delNo::" + delNo);
        let empNo = $(this).parents().children().eq(4).text();
        console.log("empNo::" + empNo);
        
        swal({
            title: "정말 삭제하시겠어요?",
            text: "다시 복구할 수 없습니다.",
            icon: "warning",
            buttons: true,
            dangerMode: true,
        })
            .then((willDelete) => {
            if (willDelete) {
                swal("삭제되었습니다.");
                
                $.ajax({
                    method:'Delete',
                    url:'/helloffice/hr/teamList/memberPage/' + delNo,
                    success: function(success){
                        console.log("result : " + success);
                        $('#note_area').load(location.href+' #note_area');
                        // $('#deptManaging_box').load(location.href+' #deptManaging_box');
                    },
                    error: function(){
                        console.error("삭제에서 에러발생");
                    }
                })
            
            } else {
                swal("취소되었습니다.");
            }
        });
    });


})
