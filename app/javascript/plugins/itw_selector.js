function itw_selector(){

    const buttons = document.querySelectorAll('.itwselector')
    const card = document.getElementById("itwcard")

      buttons.forEach((button) => {
        button.addEventListener('click', (event) => {
            console.log(event.currentTarget.dataset.description)
            buttons.forEach((button) => {

            if (button !== event.currentTarget) {
                button.classList.remove("itwactive")
            };
          });
          
          event.currentTarget.classList.toggle("itwactive")
          let i = 0 
          buttons.forEach((button) => {
          
           if (button.classList.contains("itwactive")) {
                i += 1
            }
           });
          console.log(i)
           if (i > 0 ) {
            card.style.display ="block";
            card.innerHTML = `${event.currentTarget.dataset.start_date}
            ${event.currentTarget.dataset.end_date}
            ${event.currentTarget.dataset.description}`
          } else {
            card.style.display ="none";
          }


        })
          })
        }

export { itw_selector };