class Team < ApplicationRecord
    belongs_to :team
    has_many :contacts
    has_many :tasks

    has_secure_password
end
