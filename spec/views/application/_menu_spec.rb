require 'rails_helper'

RSpec.describe 'application/_navigation.slim', type: :view do
  before :each do
    render
  end

  it 'should have link to work' do
    rendered.should have_link('Work', href: '#top')
  end
  it 'should have link to about' do
    rendered.should have_link('About', href: '#about')
  end
  it 'should have link to contact' do
    rendered.should have_link('Contact', href: '#contact')
  end
end
