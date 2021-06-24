function itw_selector(){

    const button = document.getElementById("itwselector")
    const card = document.getElementById("itwcard")

    button.addEventListener('click', (event) => {
    card.getElementById("ItwModal").style.display = "block"
    });
 }

 export { itw_selector };