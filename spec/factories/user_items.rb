FactoryBot.define do
Faker::Config.locale = 'ja'
  factory :user_item do
    postal_code     {Faker::Address.zip}
    prefecture_id   {Faker::Number.between(from:2, to: 4)}
    city_name       {Faker::Address.city}
    house_number    {Faker::Address.building_number}
    tel_number      {Faker::PhoneNumber.phone_number}
  end
end
