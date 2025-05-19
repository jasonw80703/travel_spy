class CreateMissions < ActiveRecord::Migration[8.0]
  def change
    create_table :missions do |t|
      t.references :user, null: false, foreign_key: true
      t.references :city, null: false, foreign_key: true
      t.string :state, null: false, default: 'pending'
      t.string :name, null: false

      t.timestamps
    end
  end
end
