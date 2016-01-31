class Vcard
  extend ActiveModel::Naming
  include ActiveModel::Model
  include ActiveModel::Validations
  include ActiveModel::Serialization

  attr_accessor :phone_number, :body

  def send_card
    @client = Twilio::REST::Client.new ENV['TWILLO_SID'], ENV['TWILLO_TOKEN']
    @client.account.messages.create(from: ENV['TWILIO_FROM'], to: phone_number, body: 'vcard')
  end
end
