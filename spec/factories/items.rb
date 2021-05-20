FactoryBot.define do
  factory :item do
    name { 'テスト' }
    explain { Faker::Lorem.sentence }
    category_id { '2' }
    status_id { '2' }
    deli_change_id { '2' }
    pref_id { '2' }
    deli_days_id { '2' }
    price { 300 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
