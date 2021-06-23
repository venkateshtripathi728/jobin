
const companysearch = () => {

const searchDico = (event) => {
    fetch(`https://autocomplete.clearbit.com/v1/companies/suggest?query=:${event.currentTarget.value}`)
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
  


  const input = document.querySelector("#organization_name");
  input.addEventListener("keyup", (event) => {
    event.preventDefault();
    const res = document.querySelector('#companyresults');
    res.innerHTML = '';
    searchDico(event);
  });
}

export { companysearch };

  

