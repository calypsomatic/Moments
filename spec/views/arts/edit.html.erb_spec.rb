require 'spec_helper'

describe "arts/edit" do
  before(:each) do
    @art = assign(:art, stub_model(Art,
      :user_id => 1,
      :moment_id => 1
    ))
  end

  it "renders the edit art form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", art_path(@art), "post" do
      assert_select "input#art_user_id[name=?]", "art[user_id]"
      assert_select "input#art_moment_id[name=?]", "art[moment_id]"
    end
  end
end
