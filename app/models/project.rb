class Project < ActiveRecord::Base
  rails_admin do
    edit do
      field :title, :string
      field :content, :text
    end
  end
end
