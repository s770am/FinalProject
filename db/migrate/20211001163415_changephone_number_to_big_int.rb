class ChangephoneNumberToBigInt < ActiveRecord::Migration[6.1]
  def change
    change_column :contacts, :number, :integer, limit: 8
  end
end
