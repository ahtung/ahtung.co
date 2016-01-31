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

  private

  def vcard_params
    params[:vcard]
  end
end
