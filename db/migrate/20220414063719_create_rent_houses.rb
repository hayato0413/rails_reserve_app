class CreateRentHouses < ActiveRecord::Migration[6.1]
  def change
    create_table :rent_houses do |t|
      t.string :roomname
      t.text :roomtext
      t.integer :price
      t.string :adress
      t.string :img

      t.timestamps
    end
  end
end
