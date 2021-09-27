class Task < ApplicationRecord
    belongs_to :team_member
    belongs_to :contact
end
