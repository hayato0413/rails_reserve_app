class AddRoomIdReservedRoom < ActiveRecord::Migration[6.1]
  def change
    add_column :reserved_rooms, :room_id, :integer
  end
end
