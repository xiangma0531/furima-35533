FactoryBot.define do
  factory :purchase_record_delivery_address do
    postal_code { '123-4567' }
    pref_id { 2 }
    city { '東京都' }
    address { '1-1' }
    building { '東京ハイツ' }
    phone_num { '09012345678' }
    token { "tok_abcdefghijk00000000000000000" }
  end
end
