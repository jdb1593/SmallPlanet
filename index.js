$(document).ready(function(){
  $('.slider').bxSlider();
});

var target = document.querySelectorAll('.btn_open');
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
  });
}

// 팝업 닫기
for(var j = 0; j < target.length; j++){
  btnPopClose[j].addEventListener('click', function(){
    this.parentNode.parentNode.style.visibility = 'hidden';
    //this.parentNode.parentNode.hide();
    //$('#pop_info').hide();
  });
}