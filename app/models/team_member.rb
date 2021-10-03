class TeamMember < ApplicationRecord
    belongs_to :team
    has_many :reports
    has_many :contacts

    has_many :messages


    has_secure_password

    validates :password, length: { minimum: 5 }
    validates :email, uniqueness: true
    validates :email, presence: true
    validates :name, presence: true
    validates :job, presence: true
    validates :password, presence: true
    validates :password_confirmation, presence: true
    validates :team_id, presence: true
    

end
