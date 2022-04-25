document.addEventListener('DOMContentLoaded',(e)=>{
    
    let fakeButton=document.getElementById("fake-delete");
    let realButton=document.getElementById("button-delete");

    fakeButton.addEventListener('click', (e)=>{
        fakeButton.innerHTML='Cancel';
        realButton.style.display='unset';
        fakeButton.addEventListener('click', (e)=>{
            fakeButton.innerHTML='Delete Contact';
            realButton.style.display='none';
            fakeButton.addEventListener('click', (e)=>{
                fakeButton.innerHTML='Cancel';
                realButton.style.display='unset';
                fakeButton.addEventListener('click', (e)=>{
                    fakeButton.innerHTML='Delete Contact';
                    realButton.style.display='none';
                    fakeButton.addEventListener('click', (e)=>{
                        fakeButton.innerHTML='Cancel';
                        realButton.style.display='unset';
                        fakeButton.addEventListener('click', (e)=>{
                            fakeButton.innerHTML='Delete Contact';
                            realButton.style.display='none';
                            fakeButton.addEventListener('click', (e)=>{
                                fakeButton.innerHTML='Cancel';
                                realButton.style.display='unset';
                                fakeButton.addEventListener('click', (e)=>{
                                    fakeButton.innerHTML='Delete Contact';
                                    realButton.style.display='none';
                                    fakeButton.addEventListener('click', (e)=>{
                                        fakeButton.innerHTML='Cancel';
                                        realButton.style.display='unset';
                                        fakeButton.addEventListener('click', (e)=>{
                                            fakeButton.innerHTML='Delete Contact';
                                            realButton.style.display='none';
                                        });
                                    });
                                });
                            });
                        });
                    });
                });
            });
        });
    });
    
});