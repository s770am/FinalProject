class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|

      t.string :status
      t.integer :total_hours
      t.string :product
      t.integer :contact_id
      t.integer :team_member_id

      t.timestamps
    end
  end
end
