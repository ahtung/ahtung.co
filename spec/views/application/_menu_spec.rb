require 'rails_helper'

RSpec.describe 'application/_navigation.slim', type: :view do
  before :each do
    render
  end

  xit 'should have link to top' do
    rendered.should have_link(href: '#top')
  end
  it 'should have link to work' do
    rendered.should have_link('Work', href: '#work')
  end
  it 'should have link to about' do
    rendered.should have_link('About', href: '#about')
  end
  it 'should have link to contact' do
    rendered.should have_link('Contact', href: '#contact')
  end
end
