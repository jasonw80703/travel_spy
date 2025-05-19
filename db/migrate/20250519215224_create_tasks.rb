class CreateTasks < ActiveRecord::Migration[8.0]
  def change
    create_table :tasks do |t|
      t.string :name, null: false
      t.string :description
      t.references :mission, null: false, foreign_key: true
      t.integer :task_type, null: false, default: 0

      t.timestamps
    end
  end
end
