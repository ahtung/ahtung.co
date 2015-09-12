require 'rails_helper'

RSpec.describe 'application/_menu.slim', type: :view do
  before :each do
    render
  end

  it 'should have link to work' do
    rendered.should have_link('Work', href: root_path)
  end
  it 'should have link to about' do
    rendered.should have_link('About', href: page_path('about'))
  end
  it 'should have link to contact' do
    rendered.should have_link('Contact', href: page_path('contact'))
  end
end
