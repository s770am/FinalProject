class AddTaskToReports < ActiveRecord::Migration[6.1]
  def change
    add_column :reports,:task_id,:integer
  end
end
