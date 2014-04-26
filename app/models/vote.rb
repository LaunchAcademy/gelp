class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :review

  validates :review_id, presence: true
  validates :user_id, presence: true
  validates :vote_type, presence: true, inclusion: {in: (%w(upvote downvote))}
  validates :user_id, uniqueness: {scope: :review_id}
  
end
