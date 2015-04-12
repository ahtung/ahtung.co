require 'rails_helper'

RSpec.describe 'Home Page' do
  before do
    visit root_path
  end

  it { should have_link('About', href: page_path(:about)) }
  it { should have_link('Contact', href: page_path(:contact)) }
  it { should have_link('Stats', href: page_path(:stats)) }
  xit { should have_link('Works', href: page_path(:about)) }
end