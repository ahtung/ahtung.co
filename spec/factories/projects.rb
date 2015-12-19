FactoryGirl.define do
  factory :project do
    title { Faker::Lorem.word }
    subtitle { Faker::Lorem.sentence(1) }
    url { Faker::Internet.url }
  end
end
