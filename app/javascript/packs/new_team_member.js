document.addEventListener('DOMContentLoaded',(e)=>{
    // radio buttons
    let team=document.getElementById('team_member_admin_false')
    let notteam=document.getElementById('team_member_admin_true')
    
    let code=document.getElementById('team_member_team_id')
    
    team.addEventListener('click',()=>{
        code.value=""
        code.style.display='unset'
    })
    
    notteam.addEventListener('click',()=>{
        code.style.display='none'
        code.value="empty"
    })
});