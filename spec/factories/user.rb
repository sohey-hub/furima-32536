FactoryBot.define do
  factory :user do
    nickname           {Faker::Name.initials(number: 2)}
    email              {Faker::Internet.free_email}
    password           {"1a"+Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    kanji_first_name   {Faker::Name.first_name}
    kanji_last_name    {Faker::Name.last_name}
    kana_first_name    {"タナカ"}
    kana_last_name     {"タロウ"}
    birth_date         {Faker::Date.birthday(min_age: 18, max_age: 80)}

  end
end