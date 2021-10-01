class TeamMember < ApplicationRecord
    belongs_to :team
    has_many :reports
    has_many :contacts
    has_many :messages
end
