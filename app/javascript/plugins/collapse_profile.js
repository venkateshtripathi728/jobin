const listenercollapseaddcompany = () => {

 const button = document.querySelector("#addcompany")

  button.addEventListener("click", (event) => {
    document.querySelector("#addcompanyform").classList.toggle("collapse");
 });

}  


export { listenercollapseaddcompany };


