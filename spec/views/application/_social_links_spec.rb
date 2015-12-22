require 'rails_helper'

RSpec.describe 'application/_social_links.slim', type: :view do
  I18n.available_locales.each do |locale|
    context "in #{locale}" do
      before :each do
        I18n.locale = locale
        render
      end
      it 'should have ul#contact' do
        rendered.should have_selector('ul#contact')
      end
    end
  end
end
