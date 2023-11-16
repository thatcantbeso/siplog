class CreateBrewers < ActiveRecord::Migration[7.0]
  def change
    create_table :brewers do |t|
      t.integer :owner_id
      t.string :brand
      t.string :name
      t.string :material
      t.string :geometry

      t.timestamps
    end
  end
end
