module Admin
  class RubyGemsController < ApplicationController
    before_action :authenticate_admin

    def destroy
      @ruby_gem = RubyGem.find(params[:id])
      @ruby_gem.delete
      redirect_to ruby_gems_path
    end
  end
end
