class Team < ApplicationRecord
    has_many :team_members
    has_many :contacts
    has_many :tasks
    has_many :messages
    has_many :tasks
end
