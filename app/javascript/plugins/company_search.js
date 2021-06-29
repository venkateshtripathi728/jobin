
  const companysearch = (event,type) => {
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
           input.value = event.currentTarget.dataset.name
           res.innerHTML= '';
        })
      });
      });  
    });
    }
  }


  const input = document.querySelector("#companysearch");
  if (input){
    const companyresults = document.querySelector("#companyresults");
  input.addEventListener('keyup', (event) => {
    companysearch(event,input.value); 
  });
  }
  

 



export { companysearch };

  