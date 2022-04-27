class CreateReservedRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :reserved_rooms do |t|
      t.date :startday
      t.date :endday
      t.integer :number_of_person

      t.timestamps
    end
  end
end
