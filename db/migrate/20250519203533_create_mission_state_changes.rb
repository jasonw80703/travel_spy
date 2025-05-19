class CreateMissionStateChanges < ActiveRecord::Migration[8.0]
  def change
    create_table :mission_state_changes do |t|
      t.references :mission, null: false, foreign_key: true
      t.string :from_state, null: false
      t.string :to_state, null: false

      t.timestamps
    end
  end
end
