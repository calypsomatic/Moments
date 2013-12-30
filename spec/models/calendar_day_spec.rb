require 'spec_helper'

describe CalendarDay do
  let(:today) { Date.today }
  let(:calDay) { CalendarDay.new(today) }
  
  it 'has a date' do
    expect(calDay.date).to eq(today)
  end

  context 'with a moment' do
    it 'has a moment that corresponds with its date' do
      moment = FactoryGirl.create(:moment, day: today)
      user = moment.user
      calDay.find_moment(user)
      expect(calDay.moment).to be_a(Moment)
      expect(calDay.moment.day).to eq(calDay.date)
    end
  end

  context 'without a moment' do
    it 'returns nil' do
      user = FactoryGirl.create(:user)
      calDay.find_moment(user)
      expect(calDay.moment).to be_nil
    end
  end

end