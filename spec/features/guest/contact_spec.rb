require 'rails_helper'

RSpec.describe 'Contact Page', type: :feature do
  subject { page }

  before :each do
    visit page_path(:contact)
  end

  it { should have_link('x', href: root_path) }
end
