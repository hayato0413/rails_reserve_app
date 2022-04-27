class RemoveColumnReservedRoom < ActiveRecord::Migration[6.1]
  def change
    remove_column :reserved_rooms, :number_of_person, :integer
  end
end
