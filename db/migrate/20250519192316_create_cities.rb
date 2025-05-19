class CreateCities < ActiveRecord::Migration[8.0]
  def change
    create_table :cities do |t|
      t.string :name, null: false
      t.references :country, null: false, foreign_key: true

      t.index %i[name country_id], unique: true

      t.timestamps
    end
  end
end
