require 'barby'
require 'barby/barcode/code_128'
require 'barby/outputter/html_outputter'

# Project
class Project < ActiveRecord::Base
  # Validations
  validates :title, presence: true

  # Scopes
  scope :published, -> { where(published: true) }

  def barcode
    Barby::Code128B.new(title).to_html
  end

  # :nocov:
  # Rails admin
  rails_admin do
    edit do
      field :title, :string
      field :subtitle, :string
      field :url, :string
      field :published, :boolean
    end
  end
  # :nocov:
end
