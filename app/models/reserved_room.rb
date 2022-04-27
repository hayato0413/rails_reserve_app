class ReservedRoom < ApplicationRecord
  validates :startday, presence: true
  validates :endday, presence: true
  validates :number_of_person, presence: true
  
  validate :date_before_start
  validate :date_before_finish



  def date_before_start
    return if startday.blank?
    errors.add(:startday, "は今日以降のものを選択してください") if startday < Date.today
  end

  def date_before_finish
    return if endday.blank? || startday.blank?
    errors.add(:endday, "は開始日以降のものを選択してください") if endday < startday
  end

end
