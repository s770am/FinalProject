class CreateTeamMembers < ActiveRecord::Migration[6.1]
  def change
    create_table :team_members do |t|

      t.string :name
      t.string :password
      t.string :email
      t.integer :team_id
      t.string :job
      t.boolean :admin
      
      t.timestamps
    end
  end
end
