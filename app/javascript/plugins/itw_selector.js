export const getAuthenticityToken = () => {
  const token = document.querySelector('meta[name="csrf-token"]').content;
  return token;
}



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
            card.innerHTML = `<p>  <strong>${event.currentTarget.dataset.date} at ${event.currentTarget.dataset.start_time} </strong></p>
            <p>${event.currentTarget.dataset.description}<a class="btn" data-toggle="modal" data-target="#EditItwModal" data-itwdesc="${event.currentTarget.dataset.description}" data-applyid="${event.currentTarget.dataset.applyid}" data-itwid="${event.currentTarget.dataset.itwid}" id="iwtedit" ><i class="fas fa-edit"></i></a> </p>`
          } 


        })
          })
        }


function growDiv() {
  const div = document.getElementById('grow');
  const buttons = document.querySelectorAll('.itwselector')

  buttons.forEach((button) => {
  button.addEventListener('click', (event) => {
          if (div.clientHeight) {

            let i = 0 
          buttons.forEach((button) => {
          
           if (button.classList.contains("itwactive")) {
                i += 1
            }
           });
           if (i == 0 ) {
            div.style.height = 0;
          }


      
          } else {
            const wrapper = document.querySelector('.measuringWrapper');
            div.style.height = wrapper.clientHeight + "px";
                        const modal = document.querySelector("#iwtedit")      
            modal.addEventListener('click', function (event) {
            const iwtidmodal = document.querySelector(".simpleformid")
            const itwid = event.currentTarget.dataset.itwid
            const applyid = event.currentTarget.dataset.applyid
            const itwdesc = event.currentTarget.dataset.itwdesc
            iwtidmodal.insertAdjacentHTML('afterbegin',`

            <form class="simple_form edit_interview" id="edit_interview_${itwid}" novalidate="novalidate" action="/applies/${applyid}/interviews/${itwid}" accept-charset="UTF-8" method="post"><input type="hidden" name="_method" value="patch">
            <input type="hidden" name="authenticity_token" value="${getAuthenticityToken()}">
      

            <div class="modal-body">
  
            <div class="form-group text optional interview_notes form-group-valid"><label class="text optional" for="interview_notes">Notes</label><textarea class="form-control is-valid text optional" autocomplete="notes" name="interview[notes]" id="interview_notes">${itwdesc}</textarea></div>
            </div>
            <div class="modal-footer">
                 <input type="submit" name="commit" value="Edit" class="btn btn button-cta" data-disable-with="Edit">
                 </div>
</form>`)

            });
          }
        })
      })
        }



export { itw_selector,growDiv };

