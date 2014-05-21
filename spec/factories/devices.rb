# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :device do
    user_id 1
    token "MyString"
    platform_application_arn "MyString"
  end
end
