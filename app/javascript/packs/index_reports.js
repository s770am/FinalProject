document.addEventListener('DOMContentLoaded',(e)=>{

    console.log("loaded")

    // get objs from page
    const hiddenField = document.getElementById("hiddenfield");
    const reportsBox = document.querySelector(".reports-box");
    // const myForm = document.querySelector(".myForm");
    const startTime = document.getElementById("start_time");
    const endTime = document.getElementById("end_time");
    const taskSubmit = document.getElementById("task-submit");
    const contactsSubmit = document.getElementById("contacts-submit");
    const membersSubmit = document.getElementById("members-submit");

      //our send method
      const filterPosts = (reportsType) => {
        //   need to add end time
        let startTimeP = `?startTime=${startTime.value}`;
        let endTimeP = `endTime=${endTime.value}`;

        let actionUrl = `http://localhost:3000/teams/${hiddenField.innerText}/reports/${startTimeP}&${endTimeP}`;
    
        fetch(actionUrl, {
            method: 'GET',
            headers: {
                'X-CSRF-Token':     document.getElementsByName('csrf-token')[0].getAttribute('content'),
                'X-Requested-With': 'XMLHttpRequest',
                'Content-Type':     'application/html',
                'Accept':           'application/html'
              },
              credentials: 'same-origin'
        }).then((response)=>response.json())
        .then(data => {

            console.log( data);
            // switch (reportsType) {
            //     case 'tasks':
            //         createGraph(newHashMaker("tName", "nComplete"));
            //     break;
            //     case 'contacts':
            //         createGraph(newHashMaker("tName", "nContacts"));
            //     break;
            //     case 'members':
            //         createGraph(newHashMaker("Mname", "nHourTask"));
            //     break;
            
            //     default:
            //         break;
            // }
        })
        .catch((err) => console.log(err));
      }

      //our trigger methods
      taskSubmit.onclick = () => { filterPosts('tasks'); }
      contactsSubmit.onclick = () => { filterPosts('contacts'); }
      membersSubmit.onclick = () => { filterPosts('members'); }

});

newHashMaker = (x, y) => {

};