class Contact < ApplicationRecord
    belongs_to :team
    belongs_to :team_member
    has_many :tasks
    has_many :notes


    validates :name, presence: true
    
    scope :filtered, ->(query_params) { Contact::Filter.new.filter(self, query_params) }
end

