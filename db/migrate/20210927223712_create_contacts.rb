class CreateContacts < ActiveRecord::Migration[6.1]
  def change
    create_table :contacts do |t|

      t.string :name
      t.string :email
      t.integer :number
      t.date :birthdate
      t.string :address
      t.integer :team_id
      t.integer :team_member_id
      
      t.timestamps
    end
  end
end
