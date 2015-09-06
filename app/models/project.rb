# Project
class Project < ActiveRecord::Base
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }

  # Validations
  validates :title, presence: true
  validates_attachment :image, presence: true,
    content_type: { content_type: /\Aimage\/.*\Z/ },
    size: { in: 0..2.megabytes }

  # Rails admin
  rails_admin do
    edit do
      field :title, :string
      field :content, :text
    end
  end
end
