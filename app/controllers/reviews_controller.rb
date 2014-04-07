class ReviewsController < ApplicationController

  before_action :find_ruby_gem

  def index

  end

  def new
    @review = Review.new
  end

  def create
    @review = @ruby_gem.reviews.build(review_params)
    if @review.save
      redirect_to ruby_gems_path,
      notice: "Successfully Submitted Review"
    else
      render new,
      notice: "Something went wrong"
    end

  end


  protected

  def find_ruby_gem
    @ruby_gem = RubyGem.find(params[:ruby_gem_id])
  end

  def review_params
    params.require(:review).permit(:title, :body, :rating, :user_id, :ruby_gem_id)
  end

end
