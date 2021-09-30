class TeamMember < ApplicationRecord
    has_many :team_members
    has_many :reports
    has_many :contacts

    has_secure_password

    validates :password, length: { minimum: 5 }
    validates :email, uniqueness: true
    
end
