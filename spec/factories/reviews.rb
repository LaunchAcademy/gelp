# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :review do
     title "wicked awesome gem"
     body "review here"
     rating 5
     user
     ruby_gem
  end
end
