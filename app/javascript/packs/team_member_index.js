document.addEventListener('DOMContentLoaded',(e)=>{
    let current=-1
    let currentMail=-1
    let showlinks=document.querySelectorAll('.team-member-list')
    hidden=document.querySelectorAll('.hidden')
    for (let index = 0; index < showlinks.length; index++) {
        let member=document.querySelectorAll('.team-member-list')[index];
        member.addEventListener('click',(e)=>{
            // close open 'show'
            if(current>=0){
                hidden[current].style.display="none"
            }
            // close open 'new message'
            if(currentMail>=0){
                hiddenMail[currentMail].style.display="none"
            }
            // unhide 'show' for that team member
            hidden[index].style.display='unset'
            // if that 'show' is open
            if(current===index){
                // close 'show'
                hidden[index].style.display='none'
                current=-1
            }else{
                // keep track of open 'show'
                current=index
            }
        })
    }
    let messageBtn=document.querySelectorAll('#mail')
    hiddenMail=document.querySelectorAll('.hidden-add')
    for (let index = 0; index < messageBtn.length; index++) {
        let message=document.querySelectorAll('#mail')[index];
        message.addEventListener('click',(e)=>{
            // close open 'new message'
            if(currentMail>=0){
                hiddenMail[currentMail].style.display="none"
            }
            // close open 'show'
            if(current>=0){
                hidden[current].style.display="none"
            }
            // unhide 'new message' for that team member
            hiddenMail[index].style.display='unset'
            // if that 'new message' is open
            if(currentMail===index){
                // close 'new message'
                hiddenMail[index].style.display='none'
                currentMail=-1
            }else{
                // keep track of open 'new message'
                currentMail=index
            }
        })
    }
})