# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "123foo#{n}@gmail.com" }
    first_name "foo"
    last_name "bar"
    password "foobar12345"
    admin false
  end
end
