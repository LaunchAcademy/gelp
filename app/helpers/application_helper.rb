module ApplicationHelper

  def user_vote_on(user, review)
    Vote.find_by(user: user, review: review)
  end

  def user_has_upvoted?(user, review)
    if user_vote_on(user, review).nil? || user_vote_on(user, review).vote_type != "upvote"
      false
    else
      true
    end
  end
end
