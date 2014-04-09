FactoryGirl.define do
  factory :ruby_gem do
    sequence(:name) { |n| "#{n} THE GEM"}
    author "Laura 'Lauren' Gemwriter"
    description "Another Gem Oh wow"
    github_url "http://www.github.com/gemland"
  end
end
