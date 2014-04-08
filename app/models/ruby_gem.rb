class RubyGem < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true

  has_many :reviews, dependent: :destroy

  # validates :github_url, format: /www\.github\.com[.]/
end
