require 'rails_helper'

RSpec.describe 'application/_footer.slim', type: :view do
  before :each do
    render
  end

  it 'should have footer' do
    rendered.should have_selector('footer')
  end
  it 'should have footer .footer-copyright' do
    rendered.should have_selector('footer .footer-copyright')
  end

  it 'should show copyright' do
    rendered.should have_content('We would love to hear from youtfgpm © 2015 Ahtung - All rights reserved - Design by Madco')
  end
end
