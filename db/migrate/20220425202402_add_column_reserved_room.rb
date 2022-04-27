class AddColumnReservedRoom < ActiveRecord::Migration[6.1]
  def change
    add_column :reserved_rooms, :sum_price, :integer
    add_column :reserved_rooms, :roomname, :string
    add_column :reserved_rooms, :roomtext, :text
    add_column :reserved_rooms, :img, :string
  end
end
