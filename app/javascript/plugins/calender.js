let date = new Date();

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

  document.querySelector(".date h1").innerHTML = months[date.getMonth()];

  document.querySelector(".date p").innerHTML = new Date().toDateString();

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
      days += `<div id=1 class="number" data-calendar="${date.getFullYear()}-${date.getMonth()+1}-${i}">${i}</div>`;
    }
  }

  for (let j = 1; j <= nextDays; j++) {
    days += `<div class="next-date" data-calendar="${date.getFullYear()}-${date.getMonth()+2}-${j}" >${j}</div>`;
  }
  monthDays.innerHTML = days;
};


const prevbtn = document.querySelector(".prev")
if (prevbtn) {
prevbtn.addEventListener("click", () => {
  date = new Date(date.setMonth(date.getMonth() - 1));
  renderCalendar();
});
}

const nextbtn = document.querySelector(".next")
if (nextbtn) {
nextbtn.addEventListener("click", () => {
  date = new Date(date.setMonth(date.getMonth() + 1));
  renderCalendar();
});
}


export { renderCalendar }
 
const days1 = document.querySelectorAll(".prev-date")
const days2 = document.querySelectorAll(".number")
const days3 = document.querySelectorAll(".next-date")
const days4 = document.querySelector(".today")
let final_days_array = []
final_days_array = final_days_array.concat(days1, days2, days3, days4) 


const btn = document.querySelectorAll(".btn.interview_button.itwselector")
 console.log(btn)
const btn_last = btn[btn.length-1]


// const add_interview = () =>{
//   const days = document.querySelector(".days")
//   const array_final = Array.prototype.slice.call( days.getElementsByClassName("number") );
//   console.log(array_final)
//   btn.forEach((b) => {
//     b.addEventListener("click", (event) => {
//       console.log(days)
//     days.forEach( (date) => {
//     if (event.currentTarget.dataset.date.split(" ")[0] ===date.dataset.calendar.split("-")[2])
//     {
//       date.classList.toogle("red")
//       console.log(event)
//     }
//   })
//   })
// })
// }

 const func = () => {
   final_days_array.forEach(element => {
   if (element.textContent === btn_last.dataset.date.split(" ")[0]) {
     element.classList.toggle("blue")
    }
   })
 }

 var add_interview = () => {
  document.addEventListener("load", func)
}

export {add_interview}