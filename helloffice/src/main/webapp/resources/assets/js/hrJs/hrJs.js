$(document).ready(function() {
    $("#dept_add").click(function() {

        (async () => {
            const addDept = await swal({
                title: "부서 추가하기",
                content: "input",
                button:{
                    text: "추가하기",
                    closeModal : false
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

    $("#test").on("click",function(){
        swal("얍");
        })




})
