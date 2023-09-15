var btnToggle = document.querySelectorAll('.toggle-menu');

var closeMenu = (event) => {
  var menu = document.querySelector('.mobile-menu');
  menu.classList.toggle('menu-slide');
};

btnToggle.forEach((btn) => {
  btn.addEventListener('click', closeMenu);
});
