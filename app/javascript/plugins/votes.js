function votes(){
   
   
    const downvotes = document.querySelectorAll(".downvote")
    const upvotes = document.querySelectorAll(".upvote")
    



upvotes.forEach((upvote) => {
    upvote.addEventListener('click', (event) => {
    const id = event.currentTarget.dataset.reviewId
    const counter = document.querySelector(`#countvote-${id}`)
    if  (event.currentTarget.style.color != "red") {
    counter.innerText = parseInt(counter.innerText ,10) +1
    event.currentTarget.style.color = "red"
    } else {
    event.currentTarget.style.color = ""
    counter.innerText = parseInt(counter.innerText ,10) -1

    }
    });
})

downvotes.forEach((downvote) => {
    downvote.addEventListener('click', (event) => {
        const id = event.currentTarget.dataset.reviewId
        const counter = document.querySelector(`#countvote-${id}`)
        if  (event.currentTarget.style.color != "red") {
        counter.innerText = parseInt(counter.innerText ,10) -1
        event.currentTarget.style.color = "red"
        } else {
            event.currentTarget.style.color = ""
            counter.innerText = parseInt(counter.innerText ,10) +1
        
            }
    });
})
}


 export { votes };


 function togglevotes(){
    const votes = document.querySelectorAll(".votes")
    votes.forEach((vote) => {
        vote.addEventListener('click', (event) => {
    
console.log("ok")
            
        });
    })
            
}


 export { togglevotes };