require "rails_helper"

RSpec.describe "application/_footer.slim", type: :view, focus: true do
  before :each do
    render
  end

  it "should show copyright" do
    rendered.should have_content("© 2015 All rights reserved.")
  end
end
