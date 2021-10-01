class Contact < ApplicationRecord
    belongs_to :team
    belongs_to :team_member
    has_many :tasks
    has_many :notes
end
