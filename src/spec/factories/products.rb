FactoryBot.define do
  factory :product do
    title { "MyString" }
    sold { false }
    category { nil }
    user { nil }
    description { nil }
    price { 1 }
    colour { "MyString" }
    condition { 1 }
    listed_date { "2022-06-28" }
  end
end
