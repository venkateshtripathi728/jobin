import flatpickr from "flatpickr";
import rangePlugin from "flatpickr/dist/plugins/rangePlugin";

require("flatpickr/dist/flatpickr.css")

import monthSelectPlugin from 'flatpickr/dist/plugins/monthSelect'
require('flatpickr/dist/plugins/monthSelect/style.css')


  const initFlatpickr_date = () => {
    flatpickr("#date", {
        static: true,
        altInput: true,
        minDate: "today",
      });
  }

  const initFlatpickr_hour = () => {
    flatpickr("#hour", {
      enableTime: true,
      noCalendar: true,
      dateFormat: "H:i",
      });
  }


  
export { initFlatpickr_date };
  
export { initFlatpickr_hour};
