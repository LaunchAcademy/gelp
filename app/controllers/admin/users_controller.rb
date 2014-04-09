module Admin
  class UsersController < ApplicationController
    before_action :authenticate_admin
    def index
      @user = User.all
    end

    protected
    def authenticate_admin
      if !current_user || current_user.admin? != true
        render 'public/404.html'
      end
    end
  end
end
