module Admin
  class UsersController < ApplicationController
    before_action :authenticate_admin
    def index
      @users = User.all
    end

    def destroy
      @user = User.find(params[:id])
      @user.delete
      redirect_to admin_users_path
    end
  end
end
