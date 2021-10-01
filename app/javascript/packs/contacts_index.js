fetch(URL)
    .then(responce => responce.json())
    .then(printContacts)

   const contactsBox = document.querySelector(".contacts-box");

   function printContacts(contacts) {
    contacts.forEach(contact => {
           const li = document.createElement('li');
           
           const cName = document.createElement('p');
           cName.innerText = contact.name;

           const cEmail = document.createElement('p');
           cEmail.innerText = contact.email;

           const cNumber = document.createElement('p');
           cNumber.innerText = contact.number;

           const link = document.createElement('a');
           link.href = /localhost3000/teams/current_team_member/contacts/:id
       });
   }