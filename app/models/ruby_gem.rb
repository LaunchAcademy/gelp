class RubyGem < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true

  # validates :github_url, format: /www\.github\.com[.]/
end
