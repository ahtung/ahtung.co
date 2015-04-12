require 'rails_helper'

RSpec.describe 'About Page', type: :feature do
  subject { page }

  before :each do
    visit page_path(:about)
  end

  it { should have_link('x', href: root_path) }
end