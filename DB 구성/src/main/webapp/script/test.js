$(document).ready(function(){
    $('.slider').bxSlider({
        // 슬라이드 너비
        slideWidth: 450,
     });
  });

var target = document.querySelectorAll('.btn_open');
var slider_target = document.querySelectorAll('.slider li');
var btnPopClose = document.querySelectorAll('.pop_wrap .btn_close');
var targetID;



//$('#pop_info').show();

// 팝업 열기
for(var i = 0; i < target.length; i++){
  target[i].addEventListener('click', function(){
    targetID = this.getAttribute('href');
    document.querySelector(targetID).style.visibility = 'visible';
    //document.querySelector(targetID).show();
    //$('#pop_info').show();
    
    // 모달팝업시 배경 스크롤 X
    document.body.style.overflow = "hidden";
  });
}

// 팝업 닫기
for(var j = 0; j < target.length; j++){
  btnPopClose[j].addEventListener('click', function(){
    this.parentNode.parentNode.style.visibility = 'hidden';
    //this.parentNode.parentNode.hide();
    //$('#pop_info').hide();

    // 모달팝업끄면 배경 스크롤 O
    document.body.style.overflow = "unset";
  });
}
