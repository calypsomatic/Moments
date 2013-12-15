class ChangeDayToDateInMoments < ActiveRecord::Migration
  def up
    change_column(:moments, :day, :date)
  end

  def down
    change_column(:moments, :day, :datetime)
  end
end
