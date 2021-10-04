

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

    // helper methods
    generateRows = (datahash) => {
        array = [];
        datahash.forEach(element => {
            array.push(["test", 5])
        });
        return array
    }


    createGraph = (dataHash, unit) => {
        google.charts.load('current', {'packages':['corechart']});

      // Set a callback to run when the Google Visualization API is loaded.
      google.charts.setOnLoadCallback(drawChart);

      // Callback that creates and populates a data table,
      // instantiates the pie chart, passes in the data and
      // draws it.
      function drawChart() {

        // Create the data table.
         var data = new google.visualization.DataTable();
         data.addColumn('string', "task");
         data.addColumn('number', unit);
         data.addRows(generateRows(dataHash));

        // Set chart options
        var options = {'title':'my graph',
                       'width':500,
                       'height':300};

        // Instantiate and draw our chart, passing in some options.
        var chart = new google.visualization.BarChart(document.querySelector(".reports-box"));
        chart.draw(data, options);
      }
    };


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
            switch (reportsType) {
                case 'tasks':
                    createGraph(data.tasksHash, "times completed");
                break;
                case 'contacts':
                    createGraph(data.ContactsHash, "people serviced");
                break;
                case 'members':
                    createGraph(data.teamMembersHash, "hours worked");
                break;
            
                default:
                    break;
            }
        })
        .catch((err) => console.log(err));
      }

      //our trigger methods
      taskSubmit.onclick = () => { filterPosts('tasks'); }
      contactsSubmit.onclick = () => { filterPosts('contacts'); }
      membersSubmit.onclick = () => { filterPosts('members'); }

});

