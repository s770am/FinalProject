document.addEventListener('DOMContentLoaded',(e)=>{
    
    let fakeButton=document.getElementById("fake-delete");
    let realButton=document.getElementById("button-delete");

    fakeButton.addEventListener('click', (e)=>{
        if(fakeButton.innerHTML==='Delete Contact'){
            fakeButton.innerHTML='Cancel';
            realButton.style.display='unset';
        }else if(fakeButton.innerHTML==='Cancel'){
            fakeButton.innerHTML='Delete Contact';
            realButton.style.display='none';
        };
    });
    
});