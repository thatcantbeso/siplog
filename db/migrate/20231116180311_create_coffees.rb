class CreateCoffees < ActiveRecord::Migration[7.0]
  def change
    create_table :coffees do |t|
      t.integer :owner_id
      t.string :species
      t.string :varietal
      t.string :process
      t.integer :elevation
      t.string :region
      t.string :subregion
      t.integer :roast_level
      t.date :roast_date
      t.integer :cup_score
      t.string :tasting_notes
      t.string :name
      t.string :roaster
      t.string :producer
      t.boolean :favorite
      t.text :notes

      t.timestamps
    end
  end
end
