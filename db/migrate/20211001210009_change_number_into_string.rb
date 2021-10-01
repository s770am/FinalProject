class ChangeNumberIntoString < ActiveRecord::Migration[6.1]
  def change
    change_column :contacts, :number, :string
  end
end
