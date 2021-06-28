function votes(){
   
   
    const downvotes = document.querySelectorAll(".downvote")
    const upvotes = document.querySelectorAll(".upvote")
    



upvotes.forEach((upvote) => {
    upvote.addEventListener('click', (event) => {
    const id = event.currentTarget.dataset.reviewId
    const counter = document.querySelector(`#countvote-${id}`)
    counter.innerText = parseInt(counter.innerText ,10) +1
    event.currentTarget.style.color = "red"
    });
})

downvotes.forEach((downvote) => {
    downvote.addEventListener('click', (event) => {
        const id = event.currentTarget.dataset.reviewId
        const counter = document.querySelector(`#countvote-${id}`)
        counter.innerText = parseInt(counter.innerText ,10) -1
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
