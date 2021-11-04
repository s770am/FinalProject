class Changetaskstoincludeteamid < ActiveRecord::Migration[6.1]
  def change    
      add_column :tasks, :team_id,:integer
  end
end
