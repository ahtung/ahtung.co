require "rails_helper"

RSpec.describe "layouts/application.slim", type: :view do
  before :each do
    view.lookup_context.prefixes = %w(application)
    render
  end

  it "should render header partial" do
    response.should render_template(partial: '_header')
  end
  it "should render menu partial" do
    response.should render_template(partial: '_menu')
  end
  it "should render footer partial" do
    response.should render_template(partial: '_footer')
  end
end
