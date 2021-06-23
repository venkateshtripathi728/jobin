const showModal = () => {

    const modal = document.querySelector("#ExperienceModal")
    const button = document.querySelector("#addexp")

   if  (modal.dataset.display == "show") {
    button.click();

   }
   
   }  
   
   
   export { showModal };
   
   
   