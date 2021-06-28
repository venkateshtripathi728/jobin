function votes(){
   
   
    const downvotes = document.querySelectorAll(".downvote")
    const  count = document.getElementById("countvote")
    const upvotes = document.querySelectorAll(".upvote")
    



upvotes.forEach((upvote) => {
    upvote.addEventListener('click', (event) => {
 event.currentTarget.style.color = "red"
    });
})

downvotes.forEach((downvote) => {
    downvote.addEventListener('click', (event) => {
event.currentTarget.style.color = "red"
    });
})
}


 export { votes };


 function togglevotes(){
    const votes = document.querySelectorAll(".votes")
    votes.forEach((vote) => {
        vote.addEventListener('click', (event) => {
            const downvote = document.querySelector(".downvote");
            const upvote = document.querySelector(".upvote");
            downvote.disabled = true
            downvote.disabled = true

            
        });
    })
            
}


 export { togglevotes };