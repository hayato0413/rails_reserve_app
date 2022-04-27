class RentHouse < ApplicationRecord
  validates :roomname, presence: true
  validates :roomtext, presence: true
  validates :price, presence: true
  validates :adress, presence: true, length: { in: 2..30 }
  validates :img, presence: true
end
