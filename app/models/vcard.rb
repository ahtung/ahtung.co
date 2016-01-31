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

  def contact_vcard( contact )
    return "#{root_url(host: ENV['HOST'])}/dunya_kirkali.vcard" if contact == 'Dunya'
    return "#{root_url(host: ENV['HOST'])}/onur_kucukkece.vcard" if contact == 'Onur'
  end

end
