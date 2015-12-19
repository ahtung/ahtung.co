FactoryGirl.define do
  factory :project do
    title { Faker::Lorem.word }
    subtitle { Faker::Lorem.sentence }
    url { Faker::Internet.url }
  end
end
