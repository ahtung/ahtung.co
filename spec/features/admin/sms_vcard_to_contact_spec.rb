require 'rails_helper'

RSpec.describe 'SMS VCard to Contact', type: :feature, focus: true do
  let(:user) { create(:user) }

  it 'by entering contact phone number' do
    visit vcard_path
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    click_on 'Log in'
    fill_in 'contact_phone', with: '0031626689471'
    click_on 'Send'
    expect(page).to have_content('Vcard sent')
  end
end
