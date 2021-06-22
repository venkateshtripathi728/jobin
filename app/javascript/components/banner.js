import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["marketing", "communication", "finance", "consulting"],
    typeSpeed: 50,
    loop: true
  });
}

export { loadDynamicBannerText };
