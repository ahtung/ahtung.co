FactoryGirl.define do
  factory :project do
    title { Faker::Lorem.word }
    subtitle { Faker::Lorem.sentence }
    content { Faker::Lorem.paragraph(3) }
    image { Faker::Avatar.image }
    color { format('#%06x', (rand * 0xffffff)) }
    icon { %w(warning polymer grade alarm_on room movie code navigation).sample }
  end
end
