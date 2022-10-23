document.addEventListener('DOMContentLoaded',(e)=>{

// JS for contact buttons

    // Confirm deleting contact
    
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
    

// JS for notes

    // List of all notes
    let notes = document.querySelectorAll('.note-listing');

    // Switch between pinned and unpinned in frontend

    const displayPin = (pinButton,note) => {
        let pinnedNotes = document.querySelector('#pinned-notes');
        let unPinnedNotes = document.querySelector('#unpinned-notes');
        if (!pinnedLi) {
            pinnedNotes.appendChild(note)
            note.style.backgroundColor = "#00B4D8"
            pinButton.commit.value = "unpin"
            pinnedLi = note
        } else if (pinnedLi === note){
            unPinnedNotes.appendChild(note)
            note.style.backgroundColor = "white"
            pinButton.commit.value = "pin"
            pinnedLi = null
        } else if (pinnedLi != note){
            unPinnedNotes.appendChild(pinnedLi)
            pinnedNotes.appendChild(note)
            note.style.backgroundColor = "#00B4D8"
            pinnedLi.style.backgroundColor = "white"
            pinButton.commit.value = "unpin"
            pinnedLi.querySelector('.edit_note').commit.value = "pin"
            pinnedLi = note
        }
      };

    // Send request for pinned and unpinned

    let pinForms = document.querySelectorAll('.edit_note');
    let pinnedLi = document.getElementsByClassName('pinned')[0];
    for (let index = 0; index < pinForms.length; index++) {
        let form = pinForms[index]
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
            .then(() => displayPin(form,notes[index]))
            .catch((err) => console.log(err));
        });
    };



    let deleteForms = document.querySelectorAll('#note-buttons > .button_to');
    for (let index = 0; index < deleteForms.length; index++) {
        let form = deleteForms[index]
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
            .then(() => removeNote(notes[index]))
            .catch((err) => console.log(err));
        });
    };

    const removeNote = (note) => {
        note.style.display = 'none';
    }

});