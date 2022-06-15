// 비밀번호 숨김
$(document).ready(function(){
    $('.login-pw i').on('click',function(){
        $('input').toggleClass('active');
        if($('input').hasClass('active')){
            $(this).attr('class',"fa fa-eye-slash fa-lg")
            .prev('input').attr('type',"text");
        }else{
            $(this).attr('class',"fa fa-eye fa-lg")
            .prev('input').attr('type','password');
        }
    });
});



// 비밀번호 확인
$('.pw').focusout(function () {   
    let pwd1 = $("#password_1").val();
    let pwd2 = $("#password_2").val();
    if ( pwd1 != '' && pwd2 == '' ) {
        null;
    } else if (pwd1 != "" || pwd2 != "") {
        if (pwd1 == pwd2) {
            $("#alert-success").css('display', 'block');
            $("#alert-danger").css('display', 'none');
        } else {
            $("#alert-success").css('display', 'none');
            $("#alert-danger").css('display', 'block');
        }
    }
});


// 비밀번호 유효성 검사 문법
function checkPassword(){
    // 비밀번호 확인
    let pwd1 = $("#password_1").val();
    let pwd2 = $("#password_2").val();
    if(pwd1 !== pwd2) {
        $('#password_1').val('').focus();
        $('#password_2').val('').focus();
        return false;
    }
    // 정규식
    if(!/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,20}$/.test(pwd1)){
        if(!/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,20}$/.test(pwd2)){  
        $("#password-danger").css('display', 'block');
        $("#password-danger3").css('display', 'none');
        $('#password_1').val('').focus();
        $('#password_2').val('').focus();
        setTimeout(function() {
            $("#password-danger").css('display', 'none');
        },5000)
        return false;
        }
    }    
    // 생년월일 검사
    let date = $("#year").val();
    let date1 = $("#mon").val();
    let date2 = $("#day").val();
    
    if(date < 1900 || date > 2022 ){
        $("#password-danger2").css('display', 'block');
        $('#year').val('').focus();
        setTimeout(function() {
            $("#password-danger2").css('display', 'none');
        },5000)
        return false;
    }
    if(/(\w)\1\1\1/.test(pwd1)){
        if(/(\w)\1\1\1/.test(pwd2)){
            $("#password-danger3").css('display', 'block');
            $("#password-danger").css('display', 'none');
            $('#password_1').val('').focus();
            $('#password_2').val('').focus();
            return false;
        }
    }
}



