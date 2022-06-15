function test() {
    var p1 = document.getElementById('password1').value;
    var p2 = document.getElementById('password2').value;
    if( p1 != p2 ) {
    alert("비밀번호가 일치 하지 않습니다");
    return false;
    } else{
    alert("비밀번호가 일치합니다");
    return true;
    }

}

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

// 비밀번호 유효성 검사 문법
$("#password").change(function(){
    checkPassword($('#password').val(),$('id').val());
});
function checkPassword(password,id){
    
    if(!/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,20}$/.test(password)){            
        alert('숫자+영문자+특수문자 조합으로 8자리 이상 사용해야 합니다.');
        $('#password').val('').focus();
        return false;
    }    
    var checkNumber = password.search(/[0-9]/g);
    var checkEnglish = password.search(/[a-z]/ig);
    if(checkNumber <0 || checkEnglish <0){
        alert("숫자와 영문자를 혼용하여야 합니다.");
        $('#password').val('').focus();
        return false;
    }
    if(/(\w)\1\1\1/.test(password)){
        alert('같은 문자를 4번 이상 사용하실 수 없습니다.');
        $('#password').val('').focus();
        return false;
    }
        
    if(password.search(id) > -1){
        alert("비밀번호에 아이디가 포함되었습니다.");
        $('#password').val('').focus();
        return false;
    }
    let signupfrm = document.signUp;
    let birthyear =  signupfrm.birthyear.value;
    let birthmonth =  signupfrm.birthmonth.value;
    let birthdate =  signupfrm.birthdate.value;
    
    let concat_birthday = CONCAT(birthyear,'-',birthmonth,'-',birthdate);
    signupfrm.birthday.value = concat_birthday;
    
    signupfrm.submit();
}




