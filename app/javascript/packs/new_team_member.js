document.addEventListener('DOMContentLoaded',(e)=>{
    // radio buttons
    let team=document.getElementById('admin_false')
    let notteam=document.getElementById('admin_true')
    // team code input status
    let teamcode=false

    // add a team code input
    team.addEventListener('click',(e)=>{
        if(teamcode===false){
            teamcode=true
            let form=document.querySelector('form')
            let submit=document.getElementById('submit')
            // create team code input
            let formdiv=document.createElement('div')
            let teaminput=document.createElement('input')
            formdiv.classList.add("form")
            formdiv.setAttribute('id','team_code')
            teaminput.type='text'
            teaminput.placeholder='Team code'
            formdiv.appendChild(teaminput)
            // insert input into form
            form.removeChild(submit)
            form.appendChild(formdiv)
            form.appendChild(submit)
        };
    });

    // remove team code input
    notteam.addEventListener('click',(e)=>{
        if(teamcode===true){
            teamcode=false
            let form=document.querySelector('form')
            let formdiv=document.getElementById('team_code')
            form.removeChild(formdiv)
        }
    });
});