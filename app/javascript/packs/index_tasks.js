document.addEventListener('DOMContentLoaded',(e)=>{

    // Make entire task entry the link

    let task = document.querySelectorAll('.calendar-task')
    let link = document.querySelectorAll('.task-link')
    for (let index = 0; index < task.length; index++) {
        thisTask = task[index]
        thisTask.addEventListener('click', (e) => {
            link[index].click()
        })
    }
});