class ChangePassword < ActiveRecord::Migration[6.1]
  change_table :team_members do |t|
    t.rename :password, :password_digest 
  end
end
