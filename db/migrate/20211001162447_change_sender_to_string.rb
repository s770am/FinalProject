class ChangeSenderToString < ActiveRecord::Migration[6.1]
  def change
    change_column :messages, :sender, :string
  end
end
