# Project
class Project < ActiveRecord::Base
  # Validations
  validates :title, presence: true

  # Scopes
  scope :published, -> { where(published: true) }

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
