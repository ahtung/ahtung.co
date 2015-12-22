require 'rails_helper'

RSpec.describe 'application/_footer.slim', type: :view do
  I18n.available_locales.each do |locale|
    context "in #{locale}" do
      before :each do
        I18n.locale = locale
        render
      end

      it 'should have footer' do
        rendered.should have_selector('footer')
      end
      it 'should have footer .footer-copyright' do
        rendered.should have_selector('footer .valign-wrapper')
      end

      it 'should show copyright' do
        rendered.should have_content(t('footer.copyright'))
      end
    end
  end
end
