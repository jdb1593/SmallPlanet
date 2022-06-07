// querySelector: 특정 name, id, class에 제한하지 않고 CSS 선택자를 사용하여 요소를 찾습니다.
const toggleBtn = document.querySelector('.navbar_toggleBtn');
const menu = document.querySelector('.navbar_menu');
const icons = document.querySelector('.navbar_icons');

// 사용자와 상호 작용을 하면서 마우스(키보드, 터치, 펜 등)을 조작하면 그에 대한 반응하는
// 특정 이벤트가 발생되었을 때, 특정 함수를 실행할 수 있게 해주는 것이 addEventListener
toggleBtn.addEventListener('click', () => {
    menu.classList.toggle('active');
    icons.classList.toggle('active');
});

