FactoryBot.define do
  factory :post do
    title { "MyString" }
    description { "MyString" }
    status { 1 }
    create_user_id { 1 }
    updated_user_id { 1 }
    deleted_user_id { 1 }
    deleted_at { "2022-05-27 08:57:57" }
  end
end
