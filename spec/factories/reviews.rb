# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :review do
     title "Ruby Gem"
     body "review here"
     rating 5
     user_id 1
     ruby_gem_id 1
  end
end
