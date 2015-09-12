FactoryGirl.define do
  factory :project do
    title { Faker::Book.title }
    subtitle { Faker::Lorem.sentence }
    content { Faker::Lorem.paragraph(3) }
    image { Faker::Avatar.image }
    color { "#%06x" % (rand * 0xffffff) }
  end
end
