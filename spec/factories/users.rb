FactoryBot.define do
  factory :user do
    first_name {"鈴木"}
    last_name {"太郎"}
    first_name_kana {"スズキ"}
    last_name_kana {"タロウ"}
    nationality {"日本"}
    post_code {"1100000"}
    phone_number {"09012345678"}
    address {"東京都港区1−1−１"}
    sequence(:email) { |n| "susuki#{n}@cat.com" }
    password {"password"}
  end
end
