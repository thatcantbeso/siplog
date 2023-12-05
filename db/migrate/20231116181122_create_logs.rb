class CreateLogs < ActiveRecord::Migration[7.0]
  def change
    create_table :logs do |t|
      t.integer :owner_id
      t.integer :coffee_id
      t.integer :grinder_id
      t.integer :brewer_id
      t.text :notes
      t.string :filter_paper
      t.integer :dosage
      t.integer :water_temperature
      t.string :water_type
      t.string :photo
      t.integer :grind_size
      t.integer :bloom_time_seconds
      t.integer :brew_time_seconds
      t.integer :bloom_water
      t.integer :total_water
      t.datetime :date_time
      t.integer :rating
      t.boolean :favorite

      t.timestamps
    end
  end
end
