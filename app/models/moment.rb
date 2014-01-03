class Moment < ActiveRecord::Base

  belongs_to :user, inverse_of: :moments
  has_one :art, inverse_of: :moments

  validates :user, presence: true

  class << self
    def makeMomentMonth(options = {})
      start_day = options[:date]

      start_day ||= -> { Date.today.beginning_of_month }.call
      day_array = []

      (start_day.beginning_of_month..start_day.end_of_month).each do |day|
        calDay = CalendarDay.new(day)
        if options[:user].present?
          calDay.find_moment(options[:user])
        else
          calDay.find_moment
        end
        day_array << calDay
      end

      day_array
    end
  end

end
