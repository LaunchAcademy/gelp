class Review < ActiveRecord::Base

  validates :title, presence: true
  validates :body, presence: true
  validates :rating, presence: true, inclusion: {:in => 1..5}
  validates :user_id, presence: true
  validates :ruby_gem_id, presence: true

  belongs_to :user
  belongs_to :ruby_gem
  has_many :votes, dependent: :destroy


  def up_vote_count
    votes.where(vote_type: "upvote").count
  end

  def down_vote_count
    votes.where(vote_type: "downvote").count
  end

  def calculate_votes
    if self.votes.count == 0
      0
    else
      up_vote_count - down_vote_count
    end
  end
end
