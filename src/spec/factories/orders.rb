FactoryBot.define do
  factory :order do
    product { nil }
    buyer { nil }
    seller { nil }
    date { "2022-06-30" }
    paid { false }
  end
end
