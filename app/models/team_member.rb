class TeamMember < ApplicationRecord
    has_many :team_members
    has_many :reports
    has_many :contacts
end
