
const companysearch = (event) => {

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


  const input = document.querySelector("#search");
  input.addEventListener("keyup", companysearch);

export { companysearch };

  