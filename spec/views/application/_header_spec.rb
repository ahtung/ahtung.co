require 'rails_helper'

RSpec.describe 'application/_header.slim', type: :view do
  before :each do
    render
  end

  it 'should have .navbar-fixed' do
    rendered.should have_selector('.navbar-fixed')
  end
  it 'should render .navbar-fixed nav' do
    rendered.should have_selector('.navbar-fixed nav')
  end
  it 'should render .navbar-fixed nav .nav-wrapper' do
    rendered.should have_selector('.navbar-fixed nav .nav-wrapper')
  end
  it 'should render .navbar-fixed nav .nav-wrapper .brand-logo' do
    rendered.should have_selector('.navbar-fixed nav .nav-wrapper .brand-logo')
  end
  it 'should display logo'
  it 'should display company name' do
    rendered.should have_content('Ahtung')
  end
end
