class CreateReports < ActiveRecord::Migration[6.1]
  def change
    create_table :reports do |t|

      t.string :title
      t.integer :team_id
      t.integer :contact_id
      t.integer :team_member_id
      t.text :form
      
      t.timestamps
    end
  end
end
