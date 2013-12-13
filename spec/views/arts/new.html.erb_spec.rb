require 'spec_helper'

describe "arts/new" do
  before(:each) do
    assign(:art, stub_model(Art,
      :user_id => 1,
      :moment_id => 1
    ).as_new_record)
  end

  it "renders new art form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", arts_path, "post" do
      assert_select "input#art_user_id[name=?]", "art[user_id]"
      assert_select "input#art_moment_id[name=?]", "art[moment_id]"
    end
  end
end
