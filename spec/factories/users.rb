FactoryBot.define do
  factory :user do
    nickname { Faker::Name.last_name }
    email { Faker::Internet.free_email }
    password { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    first_name { '太郎' }
    last_name { '田中' }
    first_name_kana { 'タロウ' }
    last_name_kana { 'タナカ' }
    birthday { Faker::Date.backward }
  end
end
