class CalendarDay

  attr_reader :date, :moment

  def initialize(date)
    @date = date
  end

  def find_moment(user = nil)
    if user.present?
      @moment = Moment.find_by(user_id: user.id, day: @date)
    else
      @moment = Moment.where(day: @date)
    end
  end

end