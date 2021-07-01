const axios = require('axios').default;

export const getAuthenticityToken = () => {
  const token = document.querySelector('meta[name="csrf-token"]').content;
  return token;
}

const input = document.querySelector("#companysearch");
const companyresults = document.querySelector("#companyresults");
if (input){
input.addEventListener('click', (event) => {
    console.log(event)
  companysearch(event,input.value); 
});
input.addEventListener('keyup', (event) => {
  console.log(event)
  companysearch(event,input.value); 
});
}



const companysearch = (event, type) => {
    if (event) {
      fetch(`https://autocomplete.clearbit.com/v1/companies/suggest?query=:${type}`)
        .then(response => response.json())
        .then((data) => {
          companyresults.innerHTML = '';
          data.forEach((result) => {

            const search = `<button type="button" class="list-group-item list-group-item-action companysuggest" data-name="${result.name}" data-logo="${result.logo}" data-domain="${result.domain}">
        <img src="${result.logo}" class="logo-search">
        ${result.name}
      </button>`;
            const res = document.querySelector("#companyresults");
            res.insertAdjacentHTML("beforeend", search);

            const lists = document.querySelectorAll(".companysuggest");
            lists.forEach((list) => {
              list.addEventListener('click', (event) => {
                const config = {
                  headers: { "X-CSRF-Token": getAuthenticityToken() }
                }
                input.value = event.currentTarget.dataset.name
                res.innerHTML = '';
                axios.post('/coforg', { name: `${event.currentTarget.dataset.name}`, logo: `${event.currentTarget.dataset.logo}`, domain: `${event.currentTarget.dataset.domain}` }, config)
  
              })
            })
          });
        });
    };
  
    }
  




export { companysearch };

  