class AddUserIdToRentHouse < ActiveRecord::Migration[6.1]
  def change
    add_column :rent_houses, :user_id, :integer
  end
end
