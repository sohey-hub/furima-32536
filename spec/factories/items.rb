FactoryBot.define do
  factory :item do
    title             {Faker::Name.name}
    explain           {Faker::Lorem.sentence}
    category_id       {Faker::Number.between(from:2, to: 4)}
    condition_id      {Faker::Number.between(from:2, to: 4)}
    price             {Faker::Number.between(from:300, to: 9999999)}
    delivery_fee_id   {Faker::Number.between(from:2, to: 4)}
    prefecture_id     {Faker::Number.between(from:2, to: 4)}
    delivery_date_id  {Faker::Number.between(from:2, to: 4)}

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'),filename: 'test_image.png')
    end 
  end
end
