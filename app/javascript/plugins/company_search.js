
const companysearch = (type) => {

    fetch(`https://autocomplete.clearbit.com/v1/companies/suggest?query=:${type}`)
      .then(response => response.json())
      .then((data) => {
        console.log(data)
        data.forEach((result) => {
        const input = document.querySelector('#companyresults'); 
        const search = `<li class="list-group-item"> <p>${result.name}</p> </li>`;
        input.insertAdjacentHTML("beforeend", search);
    });  
    });
  };


export { companysearch };

  

