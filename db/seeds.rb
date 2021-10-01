# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Team.delete_all
TeamMember.delete_all
Contact.delete_all
Note.delete_all
Message.delete_all

team1=Team.create(name: "team1", team_code: "123456")
team2=Team.create(name: "team2", team_code: "234567")

user1 = TeamMember.create(email: 's770am@gmail.com', password: 'asdfg', team_id:team1.id, name: "dovid rabinowitz", job: "ninja", admin: true)
member1=TeamMember.create(name:"member1",password:"123456",email:"",team_id:team1.id,job:"admin",admin: true)
member2=TeamMember.create(name:"member2",password:"234567",email:"",team_id:team1.id,job:"tech support",admin: false)
member3=TeamMember.create(name:"member3",password:"345678",email:"",team_id:team1.id,job:"plumber",admin: false)
member4=TeamMember.create(name:"member4",password:"456789",email:"",team_id:team1.id,job:"secretary",admin: false)

contact1=Contact.create(name: "contact1", email:"fake@gmail.com", number: 12345678910, birthdate:"",address: "",team_id:team1.id,team_member_id:member1.id)
contact2=Contact.create(name: "contact2", email:"fake@gmail.com", number: 12345678910, birthdate:"",address: "",team_id:team1.id,team_member_id:member1.id)

note1=Note.create(text:"jhwdbcljqhbvfljqdhvbcqwljfbhdslkjbfaljfb",pinned:true,contact_id:contact1.id)
note2=Note.create(text:"dfbagdljdsfhbajldhfbajhdfvbajhdfvbj",pinned:false,contact_id:contact1.id)
note3=Note.create(text:"fghwlejbrfq;eifbvlqevf;wevb;wefblwevbrflwevrflwervf",pinned:false,contact_id:contact1.id)
note4=Note.create(text:"jadhfbkaehdfkejhdf",pinned:false,contact_id:contact1.id)
message1=Message.create(subject:"hi",text:"something you should know",sender:"member1",team_id:team1.id,team_member_id:user1.id,read:false)
message2=Message.create(subject:"hi",text:"something you should know",sender:"member1",team_id:team1.id,team_member_id:user1.id,read:true)
message3=Message.create(subject:"hi",text:"something you should know",sender:"member1",team_id:team1.id,team_member_id:user1.id,read:false)
message4=Message.create(subject:"hi",text:"something you should know",sender:"member1",team_id:team1.id,team_member_id:user1.id,read:true)