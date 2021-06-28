
function Hideapply() {
  const x = document.getElementById("hide");
  const y = document.getElementById("myDIV");
  x.addEventListener('click', (event) => {
   if (y.style.display == "none") {
    y.style.display = "block";
  } else {
    y.style.display = "none";
  }
    });
}

   export { Hideapply };
