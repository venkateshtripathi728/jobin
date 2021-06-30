function slider() {


let
  rangei = document.getElementById('review_rating'),
  rangeV = document.getElementById('rangeV'),
  setValue = ()=>{
    const
      newValue = Number( (rangei.value - rangei.min) * 100 / (rangei.max - rangei.min) ),
      newPosition = 10 - (newValue * 0.2);
    rangeV.innerHTML = `<span>${rangei.value}</span>`;
    rangeV.style.left = `calc(${newValue}% + (${newPosition*2.2}px))`;
  };
document.addEventListener("DOMContentLoaded", setValue);
rangei.addEventListener('input', setValue);

}

export { slider };