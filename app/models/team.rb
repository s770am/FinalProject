class Team < ApplicationRecord
    belongs_to :team
    has_many :contacts
    has_many :tasks


end
