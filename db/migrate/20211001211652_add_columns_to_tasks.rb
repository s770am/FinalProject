class AddColumnsToTasks < ActiveRecord::Migration[6.1]
  def change
    add_column :tasks,:progress,:string
    add_column :tasks,:goal,:string
    add_column :tasks,:note,:string
  end
end
