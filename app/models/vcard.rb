class Vcard
  extend ActiveModel::Naming
  include ActiveModel::Model
  include ActiveModel::Validations
  include ActiveModel::Serialization

  attr_accessor :phone_number

  def send_card
    @client = Twilio::REST::Client.new ENV['TWILLO_SID'], ENV['TWILLO_TOKEN']
    return true if @client.account.messages.create(from: '+12053154072', to: phone_number, body: 'hello').nil?
    false
  end
end
