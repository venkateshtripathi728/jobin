import 'bootstrap'

function showModal() {

    var myModalSchool = new bootstrap.Modal(document.getElementById("SchoolModal"));
    var myModalExp = new bootstrap.Modal(document.getElementById("ExperienceModal"));
   
    if  (myModalSchool._dialog.dataset.display == "show_school") {
     myModalSchool.show();
   }
   if  (myModalExp._dialog.dataset.display == "show_exp") {
    myModalExp.show();
   }
   
}  
   
   
   export { showModal };
   
   
   