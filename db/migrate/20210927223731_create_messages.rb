class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|

      t.string :subject
      t.text :text
      t.integer :sender
      t.integer :team_id
      t.integer :team_member_id
      
      t.timestamps
    end
  end
end
