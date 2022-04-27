class AddColumNumberOfPersonReservedRoom < ActiveRecord::Migration[6.1]
  def change
    add_column :reserved_rooms, :number_of_person, :integer
  end
end
