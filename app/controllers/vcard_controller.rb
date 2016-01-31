class VcardController < ApplicationController
  before_action :authenticate_user!

  def new
    @vcard = Vcard.new(body: 'Hi!')
  end

  def create
    @vcard = Vcard.new(vcard_params)
    if @vcard.send_card
      redirect_to vcard_path, notice: 'Sent'
    else
      redirect_to vcard_path, notice: 'Not sent'
    end
  end

  def dunya
    send_file "#{Rails.public_path}/dunya_kirkali.vcard", type: 'text/vcard'
  end

  def onur
    send_file "#{Rails.public_path}/onur_kucukkece.vcard", type: 'text/vcard'
  end

  private

  def vcard_params
    params[:vcard]
  end
end
