const displaycategory = () => {
  const lists = document.querySelectorAll(".category-btn")
  const arrayLists = Array.from(lists)
  lists.forEach((list) => {
    list.addEventListener('click', (event) => {
      lists.forEach((list) => {
        if (list !== event.currentTarget) {
          list.classList.remove("active")
        };
      });
      event.currentTarget.classList.toggle("active")
      const applies = document.querySelectorAll(".card-application")
      if (!event.currentTarget.classList.contains("active")) {
        applies.forEach((apply) => {
          apply.classList.remove('d-none')
        })
      }
      else {
        applies.forEach((apply) => {
                    console.log("apply filter: ",apply.dataset)
                    console.log("event filter: ", event.currentTarget.dataset.filter)
        if (event.currentTarget.dataset.filter != apply.dataset.filter) {
          apply.classList.add('d-none')
        }
        else {
          apply.classList.remove('d-none')
        }
      })
      }
    })
  })
}


export { displaycategory };
