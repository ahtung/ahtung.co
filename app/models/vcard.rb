class Vcard
  extend ActiveModel::Naming
  include ActiveModel::Model
  include ActiveModel::Validations
  include ActiveModel::Serialization
  include Rails.application.routes.url_helpers
  attr_accessor :phone_number, :body, :contact

  def send_card
    @client = Twilio::REST::Client.new ENV['TWILLO_SID'], ENV['TWILLO_TOKEN']
    @client.account.messages.create(from: ENV['TWILIO_FROM'], to: phone_number, body: body, media_url: contact_vcard(contact))
  end

  private

  def contact_vcard(contact)
    return vcard_download_url(filename: 'dunya_kirkali', host: ENV['HOST']) if contact == 'Dunya'
    return vcard_download_url(filename: 'onur_kucukkece', host: ENV['HOST']) if contact == 'Onur'
  end
end
