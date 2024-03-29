document.addEventListener('DOMContentLoaded',(e)=>{
    let current=-1;
    let currentMail=-1;
    let showlinks=document.querySelectorAll('.team-member-list');
    hidden=document.querySelectorAll('.hidden');
    for (let index = 0; index < showlinks.length; index++) {
        let member=showlinks[index];
        member.addEventListener('click',(e)=>{
            // close open 'show'
            if(current>=0){
                hidden[current].style.display="none";
            };
            // close open 'new message'
            if(currentMail>=0){
                hiddenMail[currentMail].style.display="none";
            };
            // unhide 'show' for that team member
            hidden[index].style.display='unset';
            // if that 'show' is open
            if(current===index){
                // close 'show'
                hidden[index].style.display='none';
                current=-1;
            }else{
                // keep track of open 'show'
                current=index;
            };
        });
    };
    let messageBtn=document.querySelectorAll('#mail-button');
    hiddenMail=document.querySelectorAll('.hidden-add');
    for (let index = 0; index < messageBtn.length; index++) {
        let message=messageBtn[index];
        message.addEventListener('click',(e)=>{
            // close open 'new message'
            if(currentMail>=0){
                hiddenMail[currentMail].style.display="none";
            };
            // close open 'show'
            if(current>=0){
                hidden[current].style.display="none";
            };
            // unhide 'new message' for that team member
            hiddenMail[index].style.display='unset';
            // if that 'new message' is open
            if(currentMail===index){
                // close 'new message'
                hiddenMail[index].style.display='none';
                currentMail=-1;
            }else{
                // keep track of open 'new message'
                currentMail=index;
            };
        });
    };


    // Sending message
    let sendButton = document.querySelectorAll('#new_message');
    for (let index = 0; index < sendButton.length; index++) {
        let form = sendButton[index]
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
            .then(() => confirmSend(form))
            .catch((err) => console.log(err));
        });
    };

    // Reset form and give confirmation
    const confirmSend = (form) => {
        form.reset()
        form.style.backgroundColor = 'rgb(29, 170, 29)'
        form.addEventListener('click', (e) => {
            form.style.backgroundColor = '#90e1ef2d'
        });
    };
});