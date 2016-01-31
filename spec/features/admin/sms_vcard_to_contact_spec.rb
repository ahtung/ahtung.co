require 'rails_helper'

RSpec.describe 'SMS VCard to Contact', type: :feature do
  let(:user) { create(:user) }

  it 'by entering contact phone number' do
    visit vcard_path
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    click_on 'Log in'
    fill_in 'vcard_phone_number', with: '+31626689471'
    fill_in 'vcard_body', with: 'Hello World'
    click_on 'Send'
    expect(page).to have_content('Sent')
  end
end
