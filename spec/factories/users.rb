# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email "foo@foobar.com"
    first_name "foo"
    last_name "bar"
    password "foobar12345"


  end
end
