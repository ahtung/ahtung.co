require 'rails_helper'

RSpec.describe Project, type: :model do
  # Validations
  it { should validate_presence_of(:title) }
end
