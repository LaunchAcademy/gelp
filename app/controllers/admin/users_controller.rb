module Admin
  class UsersController < ApplicationController
    before_action :authenticate_admin
    def index
      @user = User.all
    end

    def destroy
      @user = User.find(params[:id])
      if @user.delete
        DeleteConfirmation.confirm(@user).deliver
      end
      redirect_to admin_users_path
    end

    protected
    def authenticate_admin
      if !current_user || current_user.admin? != true
        render 'public/404.html'
      end
    end
  end
end
