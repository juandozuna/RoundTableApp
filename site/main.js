// Stepper ("Cómo funciona") and the mobile menu. No dependencies.
const steps = [
  { src: 'img/manual/org-form.png', alt: 'Formulario para crear una organización' },
  { src: 'img/manual/table-form.png', alt: 'Formulario para crear una mesa' },
  { src: 'img/manual/invite-share.png', alt: 'Pantalla para compartir una invitación con QR y código' },
  { src: 'img/manual/facil-attendance.png', alt: 'El facilitador pasa lista en la sesión en vivo' },
];
const tabs = [...document.querySelectorAll('.stepper [role="tab"]')];
const img = document.getElementById('step-img');

function select(index) {
  tabs.forEach((tab, i) => tab.setAttribute('aria-selected', String(i === index)));
  img.style.opacity = '0';
  setTimeout(() => {
    img.src = steps[index].src;
    img.alt = steps[index].alt;
    img.style.opacity = '1';
  }, 150);
}
tabs.forEach((tab, i) => {
  tab.addEventListener('click', () => select(i));
  tab.addEventListener('keydown', (event) => {
    if (event.key !== 'ArrowRight' && event.key !== 'ArrowLeft') return;
    const next = (i + (event.key === 'ArrowRight' ? 1 : tabs.length - 1)) % tabs.length;
    tabs[next].focus();
    select(next);
  });
});

const menu = document.querySelector('.menu');
const links = document.getElementById('nav-links');
menu.addEventListener('click', () => {
  const open = links.classList.toggle('open');
  menu.setAttribute('aria-expanded', String(open));
});
links.addEventListener('click', (event) => {
  if (event.target.tagName === 'A') {
    links.classList.remove('open');
    menu.setAttribute('aria-expanded', 'false');
  }
});
