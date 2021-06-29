const isWeekend = day => {
  return day%7===0 || day%6===0;
}

export {isWeekend}