require 'rails_helper'

RSpec.describe 'Stats Page', type: :feature do
  subject { page }

  before :each do
    visit page_path(:stats)
  end

  it { should have_link('x', href: root_path) }
end