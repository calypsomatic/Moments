class CalendarDay

  attr_reader :date, :moment

  def initialize(date)
    @date = date
  end

  def find_moment(user)
    @moment = Moment.find_by(user_id: user.id, day: @date)
  end

end