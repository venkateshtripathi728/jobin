import flatpickr from "flatpickr";
import rangePlugin from "flatpickr/dist/plugins/rangePlugin";

require("flatpickr/dist/flatpickr.css")

import monthSelectPlugin from 'flatpickr/dist/plugins/monthSelect'
require('flatpickr/dist/plugins/monthSelect/style.css')


  const initFlatpickr = () => {
    flatpickr("#month_date", {
        static: true,
        altInput: true,
        plugins: [new monthSelectPlugin({shorthand: false, dateFormat: "Y-m-d", altFormat: "M Y"})]
      });
  }
  
export { initFlatpickr };