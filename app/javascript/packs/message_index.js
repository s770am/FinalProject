document.addEventListener('DOMContentLoaded',(e)=>{
    let current=-1;
    let msg_index=document.querySelectorAll('.not-msg-show');
    let show=document.querySelectorAll('.msg-show');
    for (let index = 0; index < msg_index.length; index++) {
        let each=document.querySelectorAll('.not-msg-show')[index];
        each.addEventListener('click',(e)=>{
            // close open 'show'
            if(current>=0){
                show[current].style.display="none";
            };
            // unhide 'show' for that message
            show[index].style.display='grid';
            // if that 'show' is open
            if(current===index){
                // close 'show'
                show[index].style.display='none';
                current=-1;
            }else{
                // keep track of open 'show'
                current=index;
            };
        });
    };

    // JS for opening messages
    let markRead = document.querySelectorAll('.edit_message');
    let msgButton = document.querySelectorAll('.not-msg-show');
    for (let index = 0; index < msgButton.length; index++) {
        let link = msgButton[index]
        let form = markRead[index]
        link.addEventListener('click', (e) => { 
            let body = new FormData(form);
            fetch(form.action, {
                method: form.method,
                body: body,
                headers: {
                    Accept: 'text/html'
                }
            })
            .then(() => messageUpdate(link))
            .catch((err) => console.log(err));
        });
    };

    const messageUpdate = (link) => {
        link.style.backgroundColor = '#90e1ef2d'
    };

    // JS for deleting messages
    let deleteMsg = document.querySelectorAll('#delete-msg > .button_to');
    for (let index = 0; index < deleteMsg.length; index++) {
        let form = deleteMsg[index]
        form.addEventListener('submit', (e) => {
            e.preventDefault();
            let body = new FormData(form);
            fetch(form.action, {
                method: form.method,
                body: body,
                headers: {
                    Accept: 'text/html'
                }
            })
            .then(() => removeNote(index))
            .catch((err) => console.log(err));
        });
    };

    const removeNote = (index) => {
        let notMsgShow = document.querySelectorAll('.not-msg-show');
        let msgShow = document.querySelectorAll('.msg-show');
        notMsgShow[index].style.display = 'none';
        msgShow[index].style.display = 'none';
    }
});