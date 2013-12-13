require 'spec_helper'

describe "arts/show" do
  before(:each) do
    @art = assign(:art, stub_model(Art,
      :user_id => 1,
      :moment_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
  end
end
