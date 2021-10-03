document.addEventListener('DOMContentLoaded',(e)=>{

    console.log("loaded")

    //planning to usev the other selecter for varification if i have time
    const nameField = document.querySelector(".name-field");
    const emailField = document.querySelector(".email-field");
    const numberField = document.querySelector(".number-field");
    const addressField = document.querySelector(".address-field");
    const contactBtn = document.querySelector(".contact-btn");

    nameField.addEventListener('keyup', e => {
        console.log(nameField.value)
        if (nameField.value === "") {
            contactBtn.disabled = true;
            nameField.placeholder = "Cant Leave Blank";
        } else {
            contactBtn.disabled = false;
        };
 
    });



});