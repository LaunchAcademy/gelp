class ReviewsController < ApplicationController

  before_action :find_ruby_gem

  def index
    @reviews = @ruby_gem.reviews
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

  def show
    @review = Review.find(params[:id])
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
     @review = Review.find(params[:id])
     if @review.update(review_params)
      redirect_to ruby_gem_path(@ruby_gem),
      notice: 'Review Successfully Updated'
    else
      render action: 'edit'
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
