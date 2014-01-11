require 'spec_helper'
include Warden::Test::Helpers

describe Moment do

  it { should have_one(:art) }
  it { should belong_to(:user) }

  describe "displaying moments in a month" do
    let(:user) { FactoryGirl.create(:user) }
    let(:month) { Moment.makeMomentMonth(user: user) }
    let(:first) { month.first }

    before :each do
      Warden.test_mode!
      login_as(user, scope: :user)
    end

    after :each do
      Warden.test_reset!
    end

    it 'returns an array of calendar-days' do
      expect(month).to be_a(Array)
      expect(first).to be_a(CalendarDay)
    end

    context 'no date is passed in' do
      it 'returns a calendar-day with dates in current month' do
        expect(first.date).to eq(Date.today.beginning_of_month)
      end
    end

    context 'a date is passed in' do
      it 'returns a calendar-day with dates in parameter month' do
        lastmonth = Date.today.prev_month.beginning_of_month
        lastmontharray = Moment.makeMomentMonth(user: user, date: lastmonth)
        arrayfirst = lastmontharray.first
        expect(arrayfirst.date).to eq(lastmonth.beginning_of_month)
      end
    end

    context 'one of the calendar-days has a moment' do
      it 'returns a calendar-day that has a moment' do
        moment = FactoryGirl.create(:moment, user: user, day: Date.today.beginning_of_month)
        firstDay = Moment.makeMomentMonth(user: user).first
        expect(firstDay.moments.first).to be_a(Moment)
      end
    end

    context 'one of the calendar-days does not have a moment' do
      it 'returns a calendar-day with an empty collection' do
        expect(first.moments).to be_empty
      end
    end

    context 'no user is passed in' do
      let(:test_date) { Date.today.beginning_of_month }
      let(:test_sentence) { "danced all night" }
      let(:user1) { FactoryGirl.create(:user) }
      let(:user2) { FactoryGirl.create(:user) }

      it "returns an array with other user's moments" do
        user2_moment = FactoryGirl.create(:moment, user: user2, day: test_date, sentence: test_sentence)
        universal_month = Moment.makeMomentMonth
        calendar_day = universal_month.first
        expect(calendar_day.date).to eq(test_date)
        expect(calendar_day).to be_a(CalendarDay)
        expect(calendar_day.moments.first).to be_a(Moment)
        expect(calendar_day.moments.first.sentence).to eq(test_sentence)
      end
    end

  end

  let(:moment) { FactoryGirl.create(:moment) }

  it 'returns false if art is not claimed' do
    expect(moment.art_claimed?).to eq(false)
  end

  it 'returns true if art is claimed' do
    art = FactoryGirl.create(:art, moment_id: moment.id)
    expect(moment.art_claimed?).to eq(true)
  end

end