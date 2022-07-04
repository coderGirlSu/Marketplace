FactoryBot.define do
  factory :message do
    message { "MyText" }
    product { nil }
    date { "2022-07-04" }
    sender { nil }
    receiver { nil }
  end
end
