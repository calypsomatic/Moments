require 'spec_helper'

describe Art do
  it { should belong_to(:moment) }
  it { should belong_to(:user) }

  it "returns true if currently in progress" do
    user = FactoryGirl.create(:user)
    art = FactoryGirl.create(:art, user: user)
    expect(Art.in_progress?(user)).to be_true
  end

  it "returns false if completed" do
    user = FactoryGirl.create(:user)
    arts = Art.where(user: user)
    arts.each do |art|
      art.in_progress = false
    end
    expect(Art.in_progress?(user)).to be_false
  end

end
