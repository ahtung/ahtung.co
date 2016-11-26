# VcardController
class VcardController < ApplicationController
  before_action :authenticate_user!, except: [:download]

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

  def download
    respond_to do |format|
      format.vcf do
        send_file "#{Rails.public_path}/#{params[:filename]}.vcf", type: 'text/vcard'
      end
    end
  end

  private

  def vcard_params
    params[:vcard]
  end
end
