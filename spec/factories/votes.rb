# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :vote do
    vote_type "downvote"
    user
    review
  end
end
