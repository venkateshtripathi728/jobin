let date = new Date();
date = new Date(date.setMonth(date.getMonth()));

const renderCalendar = () => {
  date.setDate(1);
  const monthDays = document.querySelector(".days");

  const lastDay = new Date(
    date.getFullYear(),
    date.getMonth() + 1,
    0
  ).getDate();

  const prevLastDay = new Date(
    date.getFullYear(),
    date.getMonth(),
    0
  ).getDate();

  const firstDayIndex = date.getDay();

  const lastDayIndex = new Date(
    date.getFullYear(),
    date.getMonth() + 1,
    0
  ).getDay();

  const nextDays = 7 - lastDayIndex - 1;

  const months = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December",
  ];

  document.querySelector(".date #month").innerHTML = months[date.getMonth()];

  document.querySelector("#today").innerHTML = new Date().toDateString();

  let days = "";

  for (let x = firstDayIndex; x > 0; x--) {
    days += `<div class="prev-date" data-calendar="${date.getFullYear()}-${date.getMonth()}-${prevLastDay - x + 1}" >${prevLastDay - x + 1}</div>`;
  }

  for (let i = 1; i <= lastDay; i++) {
    if (
      i === new Date().getDate() &&
      date.getMonth() === new Date().getMonth()
    ) {
      days += `<div class="today"  data-calendar="${date.getFullYear()}-${date.getMonth()+1}-${i}" >${i}</div>`;
    } else {
      days += `<div  class="number" data-calendar="${date.getFullYear()}-${date.getMonth()+1}-${i}">${i}</div>`;
    }
  }

  for (let j = 1; j <= nextDays; j++) {
    days += `<div class="next-date" data-calendar="${date.getFullYear()}-${date.getMonth()+2}-${j}" >${j}</div>`;
  }
  monthDays.innerHTML = days;
};

window.addEventListener("DOMContentLoaded", () => {
  renderCalendar();
  displayDateOnCalendar();
  console.log("loaded")
});

 const prevbtn = document.querySelector(".prev")
// if (prevbtn) {
// prevbtn.addEventListener("click", () => {
//   date = new Date(date.setMonth(date.getMonth() - 1));
//   renderCalendar();
// });
// }

 const nextbtn = document.querySelector(".next")
// if (nextbtn) {
// nextbtn.addEventListener("click", () => {
//   date = new Date(date.setMonth(date.getMonth() + 1));
//   renderCalendar();
// });
// }

const displayDateOnCalendar = () => {
  const datesSelector = document.querySelectorAll(".itwselector");
  datesSelector.forEach((dateSelector) => {
    const dateCalendar = document.querySelector(`[data-calendar="${dateSelector.dataset.date}"]`);
    if (dateCalendar) {
      dateCalendar.style.color = "red"
    }
  });
}
if (nextbtn) {
  nextbtn.addEventListener("click", () => {
    date = new Date(date.setMonth(date.getMonth() + 1));
    renderCalendar();
    displayDateOnCalendar();
  });
}
  
if (prevbtn) {
  prevbtn.addEventListener("click", () => {
    date = new Date(date.setMonth(date.getMonth() - 1));
    renderCalendar();
    displayDateOnCalendar();
  });
}
  
const navs = document.querySelectorAll(".link-nav")
console.log(navs)

navs.forEach((nav) => {
  if (nav) {
    nav.addEventListener('click', () => {
      renderCalendar();
      displayDateOnCalendar();
    });
  }
});


//  const func = () => {
//    final_days_array.forEach(element => {
//    if (element.textContent === btn_last.dataset.date.split(" ")[0]) {
//      element.classList.toggle("blue")
//     }
//    })
//  }

//  const add_interview = () => {
//   document.addEventListener("load", func)
// }

export { renderCalendar,displayDateOnCalendar }
