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
      expect(calDay.moments.first).to be_a(Moment)
      expect(calDay.moments.first.day).to eq(calDay.date)
    end
  end

  context 'without a moment' do
    it 'returns an empty collection' do
      user = FactoryGirl.create(:user)
      calDay.find_moment(user)
      expect(calDay.moments).to be_empty
    end
  end

  context 'with multiple moments' do
    it 'contains a collection of moments' do
      moment = FactoryGirl.create(:moment, day: today, sentence: "first sentence")
      moment2 = FactoryGirl.create(:moment, day: today, sentence: "second sentence")
      calDay.find_moment
      expect(calDay.moments.first).to be_a(Moment)
      expect(calDay.moments.first.sentence).to eq("first sentence")
    end
  end

end