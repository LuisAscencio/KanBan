class UpdateCompletedColumns < ActiveRecord::Migration[5.2]
  def change
    change_column :milestones, :completed?, :boolean, :default => false
    change_column :tasks, :completed?, :boolean, :default => false
    change_column :subtasks, :completed?, :boolean, :default => false
  end
end
