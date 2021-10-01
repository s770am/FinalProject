class TeamMember < ApplicationRecord
    belongs_to :team
    has_many :reports
    has_many :contacts

    has_many :messages


    has_secure_password

    validates :password, length: { minimum: 5 }
    validates :email, uniqueness: true
    

end
