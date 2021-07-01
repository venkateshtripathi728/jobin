
function accept_decline() {
const accept = document.querySelectorAll(".acceptedbtn")
const decline = document.querySelectorAll(".declinedbtn")
const acceptmdl = document.getElementById("accept-id")
const declinemdl = document.getElementById("decline-id")

decline.forEach((button) => {
    button.addEventListener('click', (event) => {
    declinemdl.innerHTML=`<a rel="nofollow" data-method="patch" href="/applies/${event.currentTarget.dataset.declineid}/decline">
    <p class="btn button-cta">Archive offer</p>
</a>`   
    })    
  })


  accept.forEach((button) => {
    button.addEventListener('click', (event) => {
    acceptmdl.innerHTML=`<a rel="nofollow" data-method="patch" href="/applies/${event.currentTarget.dataset.acceptid}/accept">
    <p class="btn button-cta">Archive offer</p>
</a>`   
    })    
  })
}
    
export { accept_decline };
    
    