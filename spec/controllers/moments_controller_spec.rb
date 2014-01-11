require 'spec_helper'

describe MomentsController do 

  describe "GET edit" do
    context "moment is viewed by its owner" do
      it "allows moment to be edited" do
        user = FactoryGirl.create(:user)
        login_as(user)
        test_moment = FactoryGirl.create(:moment, user: user)

      end
    end

    context "moment is viewed by another user" do
      it "does not allow moment to be edited" do
      end

      it "allows viewer to artify" do
      end
    end
  end

  
end