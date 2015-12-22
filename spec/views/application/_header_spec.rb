require 'rails_helper'

RSpec.describe 'application/_header.slim', type: :view do
  I18n.available_locales.each do |locale|
    context "in #{locale}" do
      before :each do
        I18n.locale = locale
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
      it 'should render _navigation partial' do
        expect(view).to render_template(partial: '_navigation')
      end
    end
  end
end
