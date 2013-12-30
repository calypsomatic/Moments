class Moment < ActiveRecord::Base

  belongs_to :user, inverse_of: :moments
  has_one :art, inverse_of: :moments

  validates :user, presence: true

  class << self
    def makeMomentMonth(user)
      day = -> { Date.today.beginning_of_month }.call
      day_array = []

      while (day != day.end_of_month) do
        calDay = CalendarDay.new(day)
        calDay.find_moment(user)
        day_array << calDay
        day = day.tomorrow
      end

      day_array
    end
  end

end
