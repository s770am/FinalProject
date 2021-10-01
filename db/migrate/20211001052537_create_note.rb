class CreateNote < ActiveRecord::Migration[6.1]
  def change
    create_table :notes do |t|
      t.text :text
      t.boolean :pinned
      t.integer :contact_id

      t.timestamps
    end
  end
end
