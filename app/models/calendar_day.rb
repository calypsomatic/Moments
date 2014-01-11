class CalendarDay

  attr_reader :date, :moments

  def initialize(date)
    @date = date
  end

  def find_moment(user = nil)
    if user.present?
      @moments = Moment.where(user_id: user.id, day: @date)
    else
      @moments = Moment.where(day: @date)
    end
  end

end