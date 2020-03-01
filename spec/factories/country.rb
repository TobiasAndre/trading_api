FactoryBot.define do
  factory :country do
    code { FFaker::Address.country_code }
    name { FFaker::Address.country }
  end
end