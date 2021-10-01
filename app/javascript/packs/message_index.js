document.addEventListener('DOMContentLoaded',(e)=>{
    let current=-1
    let msg_index=document.querySelectorAll('.not-msg-show')
    let show=document.querySelectorAll('.msg-show')
    for (let index = 0; index < msg_index.length; index++) {
        let each=document.querySelectorAll('.not-msg-show')[index];
        each.addEventListener('click',(e)=>{
            // close open 'show'
            if(current>=0){
                show[current].style.display="none"
            }
            // unhide 'show' for that message
            show[index].style.display='unset'
            // if that 'show' is open
            if(current===index){
                // close 'show'
                show[index].style.display='none'
                current=-1
            }else{
                // keep track of open 'show'
                current=index
            }
        })
    }
})