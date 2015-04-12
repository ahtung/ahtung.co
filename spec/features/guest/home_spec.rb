require 'rails_helper'

RSpec.describe 'Home Page' do
  before do
    visit root_path
  end

  it { should have_link('About', href: pages_path(:about)) }
end