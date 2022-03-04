$(document).ready(function() {
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
        })()
    })

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




})
