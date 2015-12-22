require 'rails_helper'

RSpec.describe 'application/_navigation.slim', type: :view do
  I18n.available_locales.each do |locale|
    context "in #{locale}" do
      before :each do
        I18n.locale = locale
        render
      end
      
      xit 'should have link to top' do
        rendered.should have_link(href: '#top')
      end
      it 'should have link to work' do
        rendered.should have_link(t('site.work'), href: '#work')
      end
      it 'should have link to about' do
        rendered.should have_link(t('site.about'), href: '#about')
      end
      it 'should have link to contact' do
        rendered.should have_link(t('site.contact'), href: '#contact')
      end
    end
  end
end
