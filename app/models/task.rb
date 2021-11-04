class Task < ApplicationRecord
    belongs_to :team_member
    belongs_to :contact
    belongs_to :team
end
