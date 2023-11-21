class CreateGrinders < ActiveRecord::Migration[7.0]
  def change
    create_table :grinders do |t|
      t.integer :owner_id
      t.string :brand
      t.string :name
      t.string :power
      t.string :burr_type
      t.string :burr

      t.timestamps
    end
  end
end
