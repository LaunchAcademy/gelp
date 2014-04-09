class Review < ActiveRecord::Base

  validates :title, presence: true
  validates :body, presence: true
  validates :rating, presence: true, inclusion: {:in => 1..5}
  validates :user_id, presence: true
  validates :ruby_gem_id, presence: true

  belongs_to :user
  belongs_to :ruby_gem

end
