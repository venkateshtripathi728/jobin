function itw_selector(){

    const buttons = document.querySelectorAll('.itwselector')
    const card = document.getElementById("itwcard")

      buttons.forEach((button) => {
        button.addEventListener('click', (event) => {
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
            card.innerHTML = `<p>${event.currentTarget.dataset.date} ${event.currentTarget.dataset.start_time} ${event.currentTarget.dataset.end_time}</p>
            <p>${event.currentTarget.dataset.description}</p>`
          } else {
            card.style.display ="none";
          }


        })
          })
        }

export { itw_selector };