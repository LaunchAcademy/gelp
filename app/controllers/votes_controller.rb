class VotesController < ApplicationController

  def create
    @vote = Vote.new(vote_params)
    if @vote.save
      flash[:notice] = "You voted!"
    else
      flash[:notice] = "Your vote was not saved"
    end
    redirect_to ruby_gem_path(@vote.review.ruby_gem)
  end

  def update
    @review = Review.find(params[:review_id])
    @vote = Vote.find_by(review: @review, user: current_user)
    if @vote.update(vote_params)
      flash[:notice]= "You changed your vote"
    else
      flash[:notice]= "Your vote was not saved"
    end
    redirect_to ruby_gem_path(@vote.review.ruby_gem)
  end


  private

  def vote_params
    params.permit(:vote_type).merge(user: current_user, review: Review.find(params[:review_id]))
  end
end