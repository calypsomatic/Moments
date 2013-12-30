require 'spec_helper'

describe Moment do
  describe "displaying moments in a month" do
    let(:user) { FactoryGirl.create(:user) }
    let(:month) { Moment.makeMomentMonth(user) }
    let(:first) { month.first }

    it 'returns an array of calendar-days' do
      expect(month).to be_a(Array)
      expect(first).to be_a(CalendarDay)
    end

    it 'returns a calendar-day with correct date' do
      expect(first.date).to eq(Date.today.beginning_of_month)
    end

    context 'one of the calendar-days has a moment' do
      it 'returns a calendar-day that has a moment' do
        moment = FactoryGirl.create(:moment, user: user, day: Date.today.beginning_of_month)
        firstDay = Moment.makeMomentMonth(user).first
        expect(firstDay.moment).to be_a(Moment)
      end
    end

    context 'one of the calendar-days does not have a moment' do
      it 'returns a calendar-day with nil for a moment' do
        expect(first.moment).to be_nil
      end
    end

  end

end