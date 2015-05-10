require 'rails_helper'

RSpec.describe 'Home Page', type: :feature do
  subject { page }

  before :each do
    visit root_path
  end

  it { should have_link 'About', href: page_path(:about) }
  it { should have_link 'Contact', href: page_path(:contact) }
  it { should have_link 'Stats', href: page_path(:stats) }
  it { should have_link 'Works', href: projects_path }
end
