# Project
class Project < ActiveRecord::Base
  # Validations
  validates :title, presence: true

  # Rails admin
  rails_admin do
    edit do
      field :title, :string
      field :content, :text
    end
  end
end
