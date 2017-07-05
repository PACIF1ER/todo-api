class AddAlertAtToTasks < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :alert_at, :datetime
  end
end
