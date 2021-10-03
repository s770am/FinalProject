class AddContactNameToTasks < ActiveRecord::Migration[6.1]
  def change
    add_column :tasks,:contact_name,:string
  end
end
