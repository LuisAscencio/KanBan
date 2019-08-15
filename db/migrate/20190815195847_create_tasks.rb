class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :title
      t.string :priority
      t.string :due_date
      t.boolean :completed?
      t.references :milestone, foreign_key: true

      t.timestamps
    end
  end
end
