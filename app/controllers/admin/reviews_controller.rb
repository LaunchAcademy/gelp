module Admin
  class ReviewsController < ApplicationController
    before_action :authenticate_admin
    def index
      @review = Review.all
    end

    def destroy
      @review = Review.find(params[:id])
      @review.delete
      redirect_to admin_reviews_path
  end

    protected
    def authenticate_admin
      if !current_user || current_user.admin? != true
        render 'public/404.html'
      end
    end
  end
end
