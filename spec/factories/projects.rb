FactoryGirl.define do
  factory :project do
    title { Faker::Book.title }
    content { Faker::Lorem.paragraph(3) }
    image { Faker::Avatar.image }
  end
end
