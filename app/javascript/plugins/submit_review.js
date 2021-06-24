function submit_review(){

    const button = document.getElementById("submitreview")
    button.addEventListener('click', (event) => {
   //event.preventDefault();
    document.getElementById("ItwModal").classList.add("show");
    document.getElementById("ItwModal").style.display = "block"
    document.getElementById("ReviewModal").classList.remove("show");
    document.getElementById("ReviewModal").style.display = ""
    });
 }

 export { submit_review };