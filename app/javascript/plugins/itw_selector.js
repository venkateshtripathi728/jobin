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
           if (i > 0 ) {
            card.style.display ="block";
            card.innerHTML = `<p>${event.currentTarget.dataset.date} ${event.currentTarget.dataset.start_time} ${event.currentTarget.dataset.end_time}</p>
            <p>${event.currentTarget.dataset.description}<a class="btn" data-toggle="modal" data-target="#EditItwModal" data-itwid="${event.currentTarget.dataset.itwid}" ><i class="fas fa-plus-circle"></i></a> </p>`
          } 


        })
          })
        }


function growDiv() {
  const growDiv = document.getElementById('grow');
  const buttons = document.querySelectorAll('.itwselector')

  buttons.forEach((button) => {
  button.addEventListener('click', (event) => {
          if (growDiv.clientHeight) {

            let i = 0 
          buttons.forEach((button) => {
          
           if (button.classList.contains("itwactive")) {
                i += 1
            }
           });
           if (i == 0 ) {
            growDiv.style.height = 0;
          }


      
          } else {
            const wrapper = document.querySelector('.measuringWrapper');
            growDiv.style.height = wrapper.clientHeight + "px";
          }
        })
      })
        }


function modalopen() {
  const modal = document.querySelector("#EditItwModal")      
  modal.addEventListener('show.bs.modal', function (event) {
  const iwtidmodal = document.querySelector(".simpleformid")
  var itwid = button.data('itwid')
  iwtidmodal.innerHTML = ` <%= simple_form_for([apply, ${itwid}], html: {method: :patch}) do |f| %>
  

    
      <div class="modal-body">
      <hr>
      <%= f.input :notes, as: :text, input_html: { autocomplete: "notes" }%>
      </div>
      <div class="modal-footer">
           <%= f.button :submit, "Edit", class: "btn button-cta" %>
      </div>
    <% end %>`
  });
}

export { itw_selector };
export { growDiv };
export { modalopen };
